#create schema CalendarsDB;
USE CalendarsDB;
SELECT 课程名称,年份,学期,成绩,绩点,学分 FROM 开课 JOIN(SELECT 课程,年份,学期,成绩,绩点 FROM 成绩 WHERE 学号='$school_id')AS t ON 开课.课程编号=t.课程;