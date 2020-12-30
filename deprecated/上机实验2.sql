create table 作业
(
用户名 VARCHAR(10) not null,
作业 varchar(255) not null,
作业截止日期 datetime not null,
primary key(作业,用户名),
foreign key(用户名)references 用户(用户名)
on delete cascade
on update cascade
);