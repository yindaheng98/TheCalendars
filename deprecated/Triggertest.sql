#/*
use sql_test;
insert into 用户(用户名,密码)values('test','h2tkjnehgfvuweijiuefhin24gk');
insert into 工程(工程名, 工程描述, 创建者)values('test的工程','测试用的','test');
insert into 任务(任务名, 任务描述, 创建者, 截止时间, 所属工程代码)values('test的任务1','测试用的','test',now()+100,2);
insert into 任务(任务名, 任务描述, 创建者, 截止时间, 所属工程代码)values('test的任务2','测试用的','test',now()+100,2);
insert into 工程(工程名, 工程描述, 创建者)values('test的工程1','测试用的','test');
insert into 任务(任务名, 任务描述, 创建者, 截止时间, 所属工程代码)values('test的任务1-1','测试用的','test',now()+100,3);
insert into 任务(任务名, 任务描述, 创建者, 截止时间, 所属工程代码)values('test的任务1-2','测试用的','test',now()+100,3);
insert into 用户(用户名,密码)values('yin某','19980230');
insert into 用户_任务(执行者, 任务代码, 所属工程代码, 备注)values('yin某',7,0,'');
insert into 流程(前任务代码, 后任务代码)values(7,5);
update 用户 set 用户名='修改测试' where 用户名='test';
update 用户_任务 set 任务代码=5 where 任务代码=7;
update 流程 set 后任务代码=5 where 前任务代码=7;
delete from 用户 where 用户名='修改测试';
#*/