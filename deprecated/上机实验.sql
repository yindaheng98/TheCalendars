#CREATE SCHEMA CalendarsDB;
#USE CalendarsDB;
create table 课程
(
课程代码 varchar(8) not null,
课程编号 smallint not null,
primary key(课程代码,课程编号),
index 课程索引(课程代码,课程编号),

课程名称 varchar(255) not null,
教师 varchar(255) not null,
教室 varchar(255) not null,
周上课日 smallint unsigned not null,
起始节数 smallint unsigned not null,
持续节数 smallint unsigned not null,
开始周 smallint unsigned not null,
结束周 smallint unsigned not null,
单双周 enum('单','双','/') not null,
课程学期 varchar(11) not null,
index 课程学期索引(课程学期),
unique(课程名称,教师,教室,周上课日,起始节数,持续节数,开始周,结束周,单双周,课程学期)
);

create table 教学班_课程
(
教学班号 varchar(255) not null,
课程代码 varchar(8) not null,
课程编号 smallint not null,
primary key(教学班号,课程代码,课程编号),
index 课程教学班索引(教学班号,课程代码),
foreign key(课程代码,课程编号)references 课程(课程代码,课程编号)
on delete cascade
on update cascade
);