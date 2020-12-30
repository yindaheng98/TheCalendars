/*
insert into 用户(用户名,密码)values('yin','123456');
insert into 用户(用户名,密码)values('gch','1234567');
insert into 工程(工程名, 工程描述, 创建者)values('工程a','yin的工程','yin');
insert into 任务(任务名, 任务描述, 创建者, 截止时间, 所属工程代码)values('任务a','yin的任务','yin',now()+100,1);
insert into 任务(任务名, 任务描述, 创建者, 截止时间, 所属工程代码)values('任务b','gch的任务','gch',now()+100,1);
insert into 工程(工程名, 工程描述, 创建者)values('工程b','gch的工程','gch');
insert into 任务(任务名, 任务描述, 创建者, 截止时间, 所属工程代码)values('任务c','yin的任务','yin',now()+100,2);
insert into 任务(任务名, 任务描述, 创建者, 截止时间, 所属工程代码)values('任务d','gch的任务','gch',now()+100,2);
*/
#insert into 用户_任务(执行者, 任务代码, 所属工程代码, 备注)values('gch',1,0,'');
#insert into 用户_任务(执行者, 任务代码, 所属工程代码, 备注)values('gch',0,0,'');
#update 用户_任务 set 任务代码=0,备注='已修改2' where 任务代码=1;
#update 用户 set 用户名='ydh' where 用户名='yin';
#update 工程 set 工程代码=3 where 工程代码=1;
#update 任务 set 任务代码=5 where 任务代码=1;
#delete from 用户 where 用户名='gch';
delete from 用户 where 用户名='ydh';