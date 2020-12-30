#CREATE SCHEMA CalendarsDB;
#USE CalendarsDB;
/*
CREATE TABLE 用户
(
用户名 VARCHAR(10) NOT NULL PRIMARY KEY,
密码 VARCHAR(255),

学校 VARCHAR(255),
学号 VARCHAR(255),
姓名 VARCHAR(255),
专业 VARCHAR(255),
入学年份 INT UNSIGNED,
班级 VARCHAR(255)
);
*/
/*
INSERT INTO 用户
(用户名, 密码, 学校, 学号, 姓名, 专业, 入学年份, 班级)
VALUES('a','1234567','江北大学','2030616134','达恒尹','互联网工程','2016','互联1601');
INSERT INTO 用户
(用户名, 密码, 学校, 学号, 姓名, 专业, 入学年份, 班级)
VALUES('b','12345678','江西大学','3030616134','恒尹达','车联网工程','2016','车联1601');
INSERT INTO 用户
(用户名, 密码, 学校, 学号, 姓名, 专业, 入学年份, 班级)
VALUES('c','123456789','江东大学','4030616134','达尹恒','机联网工程','2016','机联1601');
*/
#INSERT INTO 用户
#(用户名, 密码, 学校, 学号, 姓名, 专业, 入学年份, 班级)
#VALUES('yin','123456','江南大学','1030616134','尹达恒','物联网工程','2016','物联1601');
INSERT INTO 用户
(用户名, 密码, 班级, 学号, 姓名, 学校, 专业, 入学年份)
SELECT * FROM (SELECT 'gch','654321','物联1602','1030616213','高超宏') AS t1 
JOIN (SELECT 学校, 入学年份, 专业 FROM 用户 WHERE 姓名='尹达恒') AS t2;
#UPDATE 用户 SET 密码='987654321'  WHERE 用户名='yin';
#UPDATE 用户 SET 班级=concat('卓工',班级) WHERE 班级 like '%物联网%';
#DELETE FROM 作业 WHERE 用户名='yin' AND Date(作业截止日期)<='2018-05-10';
#DELETE FROM 作业 WHERE 用户名 IN (SELECT 用户名 FROM 用户 WHERE 班级 LIKE '%物联1602%') AND Date(作业截止日期)<='2018-05-10';
#DELETE FROM 作业 WHERE 用户名 IN (SELECT 用户名 FROM 用户 WHERE 班级 LIKE '%物联1602%') AND 作业截止日期<='2018-05-10';
#SELECT * FROM 作业 WHERE 作业截止日期>'2018-05-10';
