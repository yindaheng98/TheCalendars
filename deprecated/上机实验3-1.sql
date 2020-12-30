delimiter |
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

delimiter ;

