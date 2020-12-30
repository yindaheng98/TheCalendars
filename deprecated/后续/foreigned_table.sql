create table 课程统计
(
课程代码 int not null,
课程性质 varchar(255) not null,
学分 float not null,
学院号 int not null,
primary key(课程代码),
foreign key(课程代码) references 课程(课程代码)
on update cascade
on delete cascade,
foreign key (学院号) references 学院(学院号)
on update cascade
on delete cascade
);

create table 成绩
(
学号 bigint not null,
课程代码 int not null,
课程编号 smallint not null,
成绩 int not null,
绩点 float not null,
primary key(学号,课程代码,课程编号),
foreign key(课程代码,课程编号) references 课程(课程代码,课程编号)
on delete cascade
on update cascade
);