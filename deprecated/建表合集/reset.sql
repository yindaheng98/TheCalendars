use sql_test;

drop trigger 创建用户个人日程表;
drop trigger 更新用户个人日程表工程名;
drop trigger 创建工程默认任务;
drop trigger 检查用户_任务表插入项;
drop trigger 检查用户_任务表更新项;
drop trigger 检查流程表插入项;
drop trigger 检查流程表更新项;
drop table 用户_任务;
drop table 流程;
drop table 任务;
drop table 工程;
drop table 用户_课程;
drop table 作业;
drop table 教学班_课程;
drop table 课程;
drop table 用户;

create table 用户
(
用户名 varchar(10) not null primary key,
密码 varchar(255),

学校 varchar(255),
学号 varchar(255),
教务处密码 varchar(255),
校园vpn密码 varchar(255),
专业 varchar(255),
入学年份 int unsigned,
班级 varchar(255)
);

insert into 用户(用户名,密码)values('default','123456');

create table 课程
(
课程代码 varchar(8) not null,
课程编号 smallint not null,
primary key(课程代码,课程编号),

课程名称 varchar(255) not null,
教师 varchar(255) not null,
教室 varchar(255) not null,
周上课日 smallint unsigned not null,
起始节数 smallint unsigned not null,
持续节数 smallint unsigned not null,
开始周 smallint unsigned not null,
结束周 smallint unsigned not null,
单双周 enum('单','双','/') not null,
unique(课程名称,教师,教室,周上课日,起始节数,持续节数,开始周,结束周,单双周)
);

create table 教学班_课程
(
教学班号 varchar(255) not null,
课程代码 varchar(8) not null,
课程编号 smallint not null,
primary key(教学班号,课程代码,课程编号),
foreign key(课程代码,课程编号)references 课程(课程代码,课程编号)
on delete cascade
on update cascade
);

create table 作业
(
课程代码 varchar(8) not null,
课程编号 smallint not null,
作业 varchar(255) not null,
作业截止日期 datetime not null,
primary key(作业,课程代码,课程编号),
foreign key(课程代码,课程编号)references 课程(课程代码,课程编号)
on delete cascade
on update cascade
);

create table 用户_课程
(
用户名 varchar(10) not null,
课程代码 varchar(8) not null,
课程编号 smallint not null,
是否蹭课 enum('是','否') not null,
primary key(用户名,课程代码,课程编号),
foreign key(用户名) references 用户(用户名)
on delete cascade
on update cascade,
foreign key(课程代码,课程编号) references 课程(课程代码,课程编号)
on delete cascade
on update cascade
);

create table 工程
(
工程代码 bigint unsigned not null primary key auto_increment,
工程名 varchar(255) not null,
工程描述 varchar(255),
创建者 varchar(10) not null,
foreign key(创建者) references 用户(用户名)
on update cascade
on delete cascade
);

create table 任务
(
任务代码 bigint unsigned not null auto_increment,
任务名 varchar(255) not null,
任务描述 varchar(255),
创建者 varchar(10) not null,
截止时间 datetime not null,
所属工程代码 bigint unsigned not null,
primary key(任务代码),
foreign key(所属工程代码) references 工程(工程代码)
on update cascade
on delete cascade,
foreign key(创建者) references 用户(用户名)
on update cascade
on delete cascade
);

create table 流程
(
前任务代码 bigint unsigned not null,
后任务代码 bigint unsigned not null,
primary key (前任务代码,后任务代码),
foreign key(前任务代码) references 任务(任务代码)
on delete cascade
on update cascade,
foreign key(后任务代码) references 任务(任务代码)
on delete cascade
on update cascade
);

create table 用户_任务
(
执行者 varchar(10) not null,
任务代码 bigint unsigned not null,
所属工程代码 bigint unsigned not null,
备注 varchar(255),
primary key(执行者,任务代码),
foreign key(执行者)references 用户(用户名)
on delete cascade
on update cascade,
foreign key(任务代码) references 任务(任务代码)
on update cascade
on delete cascade,
foreign key(所属工程代码) references 工程(工程代码)
on update cascade
on delete cascade
);