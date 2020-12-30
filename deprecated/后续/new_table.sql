create table 学院
(
学院号 int not null,
学院名 varchar(64) not null,
primary key(学院号)
);

create table 专业
(
学院号 int not null,
专业号 int not null,
专业名 varchar(64) not null,
primary key(学院号,专业号),
foreign key(学院号) references 学院(学院号)
on update cascade
on delete cascade
);

create table 班级
(
学院号 int not null,
专业号 int not null,
班级号 int not null,
班级名 varchar(64) not null,
primary key(学院号,专业号,班级号),
foreign key(学院号,专业号) references 专业(学院号,专业号)
on update cascade
on delete cascade
);
