delimiter |

create trigger 创建用户个人日程表 after insert on 用户
for each row
begin
insert into 工程(工程名,创建者,工程描述) values (new.用户名,'default','个人日程表');
#插个人日程表工程,创建者为特殊用户default，工程名为用户名
end|

create trigger 更新用户个人日程表工程名 before update on 用户
for each row
begin
update 工程 set 工程名=new.用户名 where 工程名=old.用户名 and 创建者='default';
#更新个人日程表工程的工程名
end|

create trigger 创建工程默认任务 after insert on 工程
for each row
begin
declare projID bigint unsigned;
declare taskID bigint unsigned;
select max(工程代码) into projID from 工程 where 创建者=new.创建者;
#找出刚刚插的工程自动生成的工程代码
insert into 任务(任务名,任务描述,创建者,截止时间,所属工程代码) values ('默认任务','默认任务','default',now(),projID);
#插默认任务，创建者为特殊用户default
select max(任务代码) into taskID from 任务 where 所属工程代码=projID;
#找出刚刚插的任务自动生成的任务代码
insert into 用户_任务(执行者,任务代码,所属工程代码) values (new.创建者,taskID,projID);
#将工程创建人包含在默认任务执行者中
end|

create trigger 级联删除用户个人日程表 after delete on 用户
for each row
begin
delete from 工程 where 工程名=old.用户名 and 创建者='default';
end|

create trigger 检查用户_任务表插入项 before insert on 用户_任务
for each row
begin
declare projID bigint unsigned default 0;
select max(所属工程代码) into projID from 任务 where 任务代码=new.任务代码 limit 1;
#找任务代码对应的工程代码
if projID>=1 then#如果有
set new.所属工程代码=projID;#无视原输入直接修改
else#如果没有
signal sqlstate '45000'
set message_text='任务不存在';#报错
end if;
end|

create trigger 检查用户_任务表更新项 before update on 用户_任务#和检查用户_任务表插入项一样
for each row
begin
declare projID bigint unsigned default 0;
select max(所属工程代码) into projID from 任务 where 任务代码=new.任务代码 limit 1;
if projID>=1 then
set new.所属工程代码=projID;
else
signal sqlstate '45000'
set message_text='任务不存在';
end if;
end|

create trigger 检查流程表插入项 before insert on 流程
for each row
begin
declare result int unsigned default 0;
declare projID bigint unsigned default 0;

select max(所属工程代码) into projID from 任务 where 任务代码=new.前任务代码 limit 1;
#找前任务代码对应的工程代码

if projID>=1 then#如果有
select count(*) into result from 任务 where 所属工程代码=projID and 任务代码=new.后任务代码 limit 1;
#再对应工程下找后任务代码
if result<1 then#如果没有
signal sqlstate '45001'
set message_text='后任务不存在或前后任务不在同一工程中';#报错
end if;
else#如果前任务没有
signal sqlstate '45000'
set message_text='前任务不存在';#报错
end if;
end|

create trigger 检查流程表更新项 before update on 流程#和检查流程表插入项一样
for each row
begin
declare result int unsigned default 0;
declare projID bigint unsigned default 0;
select max(所属工程代码) into projID from 任务 where 任务代码=new.前任务代码 limit 1;
if projID>=1 then
select count(*) into result from 任务 where 所属工程代码=projID and 任务代码=new.后任务代码 limit 1;
if result<1 then
signal sqlstate '45001'
set message_text='后任务不存在或前后任务不在同一工程中';
end if;
else
signal sqlstate '45000'
set message_text='前任务不存在';
end if;
end|

delimiter ;
