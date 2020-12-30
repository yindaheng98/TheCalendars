select * from 课程 right join (select * FROM sql_test.教学班_课程 where 教学班号 like '%物联网%')as t using(课程代码,课程编号);
#SELECT DISTINCT * FROM 用户_任务 WHERE 执行者='yin';
SELECT * FROM 工程 RIGHT JOIN (SELECT DISTINCT * FROM 用户_任务 WHERE 执行者='test')AS t ON 工程.工程代码=t.所属工程代码;