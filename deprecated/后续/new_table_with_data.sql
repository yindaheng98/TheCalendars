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

INSERT INTO `学院` (`学院号`, `学院名`) VALUES
(1, '学院A'),
(2, '学院B'),
(3, '学院C');

INSERT INTO `专业` (`专业号`, `学院号`, `专业名`) VALUES
(1, 1, '专业A1'),
(2, 1, '专业A2'),
(3, 1, '专业A3'),
(4, 1, '专业A4'),
(5, 2, '专业B1'),
(6, 2, '专业B2'),
(7, 2, '专业B3'),
(8, 2, '专业B4'),
(9, 2, '专业B5'),
(10, 3, '专业C1'),
(11, 3, '专业C2'),
(12, 3, '专业C3'),
(13, 3, '专业C4');

INSERT INTO `班级` (`班级号`, `专业号`, `班级名`) VALUES
(1, 1, '班级1'),
(2, 1, '班级2'),
(3, 2, '班级3'),
(4, 2, '班级4'),
(5, 3, '班级5'),
(6, 3, '班级6'),
(7, 4, '班级7'),
(8, 4, '班级8'),
(9, 5, '班级9'),
(10, 5, '班级10'),
(11, 6, '班级11'),
(12, 6, '班级12'),
(13, 7, '班级13'),
(14, 7, '班级14'),
(15, 8, '班级15'),
(16, 8, '班级16'),
(17, 9, '班级17'),
(18, 9, '班级18'),
(19, 10, '班级19'),
(20, 10, '班级20'),
(21, 11, '班级21'),
(22, 11, '班级22'),
(23, 12, '班级23'),
(24, 12, '班级24'),
(25, 13, '班级25'),
(26, 13, '班级26');

INSERT INTO `开课` (`课程编号`, `课程代码`, `课程性质`, `课程名称`, `课程归属`, `学分`, `开课学院`) VALUES
(100, 'T0000001', NULL, 'MOBA动作预判基础', NULL, 3.5, 1),
(101, 'T0000002', NULL, '偷袭概论', NULL, 3.5, 3),
(102, 'T0000003', NULL, '大学英语I', NULL, 2.5, 3),
(103, 'T0000004', NULL, '线性代数', NULL, 4.5, 3),
(104, 'T0000005', NULL, '压枪原理与技巧', NULL, 3.5, 1),
(105, 'T0000006', NULL, '走位概论', NULL, 2, 1),
(106, 'T0000007', NULL, 'FPS动作预判基础', NULL, 5.5, 2),
(107, 'T0000008', NULL, '快速伤害计算', NULL, 5.5, 3),
(108, 'T0000009', NULL, 'MC物理特性', NULL, 5.5, 2),
(109, 'T0000010', NULL, '高等数学I', NULL, 5.5, 1),

(110, 'T0000011', NULL, '打野原理与实战', NULL, 4, 2),
(111, 'T0000012', NULL, 'C位输出概论', NULL, 5, 2),
(112, 'T0000013', NULL, '大学英语II', NULL, 2.5, 3),
(113, 'T0000014', NULL, '高等数学II', NULL, 6, 2),
(114, 'T0000015', NULL, '红石电路原理实验', NULL, 2, 1),
(115, 'T0000016', NULL, 'MC科技系模组基础', NULL, 6, 3),
(116, 'T0000017', NULL, 'MC农业系模组基础', NULL, 2.5, 1),
(117, 'T0000018', NULL, '红石电路原理', NULL, 6, 1),
(118, 'T0000019', NULL, 'MC快速地形跳越', NULL, 3, 1),
(119, 'T0000020', NULL, '辅助概论', NULL, 6, 3),

(120, 'T0000021', NULL, 'BC-FST农业自动化', NULL, 4.5, 2),
(121, 'T0000022', NULL, '复变函数与积分变换', NULL, 4.5, 1),
(122, 'T0000023', NULL, '运筹学', NULL, 0.5, 3),
(123, 'T0000024', NULL, '德语A', NULL, 1.5, 1),
(124, 'T0000025', NULL, '拉枪线技巧与实战', NULL, 2.5, 1),
(125, 'T0000026', NULL, '大型集成红石电路课程设计', NULL, 1, 3),
(126, 'T0000027', NULL, '高频红石电路原理实验', NULL, 1, 1),
(127, 'T0000028', NULL, '大型集成红石电路设计与制造', NULL, 5, 2),
(128, 'T0000029', NULL, 'IE-IC-BC工业自动化', NULL, 0.5, 2),
(129, 'T0000030', NULL, '高频红石电路原理', NULL, 5, 1),

(130, 'T0000031', NULL, '日语A', NULL, 1.5, 1),
(131, 'T0000032', NULL, 'MC集团战斗指挥课程设计', NULL, 1, 2),
(132, 'T0000033', NULL, 'FPS战场指挥学课程设计', NULL, 0.5, 3),
(133, 'T0000034', NULL, 'MOBA战场指挥学课程设计', NULL, 0.5, 3),
(134, 'T0000035', NULL, '人工智能基础', NULL, 6, 3),
(135, 'T0000036', NULL, 'MC集团战斗指挥', NULL, 3, 3),
(136, 'T0000037', NULL, 'MOBA战场指挥学', NULL, 5, 1),
(137, 'T0000038', NULL, '农业科技模组综合工程中心规划与建造', NULL, 6, 2),
(138, 'T0000039', NULL, '农业科技模组综合工程中心课程设计', NULL, 2, 1),
(139, 'T0000040', NULL, 'FPS战场指挥学', NULL, 5, 2);
