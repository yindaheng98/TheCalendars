create table 学院
(
	学院号 int auto_increment primary key,
	学院名 varchar(64) not null unique
);

create table 专业
(
	专业号 int auto_increment primary key,
	学院号 int not null,
	专业名 varchar(64) not null unique,
	foreign key (学院号) references 学院 (学院号)
	on update cascade
    on delete cascade,
    index (学院号)
);

create table 班级
(
	班级号 int auto_increment primary key,
	专业号 int null,
	班级名 varchar(20) not null unique,
	foreign key (专业号) references 专业 (专业号)
	on update cascade
    on delete cascade,
    index(专业号)
);

create table 学生
(
	学号 varchar(12) not null primary key,
    入学年份 int not null,
	班级 int null,
	排名 int null,
	foreign key (班级) references 班级 (班级号)
    on update cascade
    on delete cascade,
    index(班级)
);

create table 开课
(
	课程编号 int auto_increment primary key,
	课程名称 varchar(64) not null,
	学分 float not null,
	课程代码 varchar(16) null,
	课程性质 varchar(20) null,
	课程归属 varchar(20) null,
	开课学院 int null,
	foreign key (开课学院) references 学院 (学院号)
	on update cascade
    on delete cascade,
    index(开课学院)
);

create table 成绩
(
	学号 varchar(12) not null,
	课程 int not null,
	年份 varchar(20) not null,
	学期 varchar(2) not null,
	成绩 varchar(8) not null,
	绩点 float null,
	辅修标记 bool null,
	补考成绩 varchar(8) null,
    primary key(学号,课程),
	foreign key (学号) references 学生 (学号)
	on update cascade
    on delete cascade,
	foreign key (课程) references 开课 (课程编号)
	on update cascade
    on delete cascade,
    index(学号),
    index(课程)
);
