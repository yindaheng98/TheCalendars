from sqlalchemy import create_engine
# import random
import numpy.random

cc_sql_host = '120.79.175.123'
cc_sql_dbname = 'db_homework_scx'
cc_sql_uname = 'db_homework_scx'
cc_sql_pswd = '123456'

if __name__ == '__main__':
    # init connection
    '''
    con = pymysql.connect(
        host=cc_sql_host,
        user=cc_sql_uname,
        db=cc_sql_dbname,
        passwd=cc_sql_pswd,
        charset="utf8"
    )
    '''

    con = create_engine("mysql+mysqlconnector://" +
                        'CalendarsDB:CalendarsDB' +
                        '@39.108.232.131:3306/CalendarsDB?charset=utf8'
                        , encoding='utf-8')

    # cursor = con.cursor()
    cursor = con

    for x in range(1030616101, 1030616135):
        print(x)
        cursor.execute("INSERT INTO 学生(学号, 入学年份,班级) "
                       "VALUES ('%010d',2016, '1') "
                       % x)
        for y in range(100, 109):
            grade = numpy.random.normal(80, 10)
            grade = 100 if grade > 100 else grade
            cursor.execute("INSERT INTO 成绩(学号, 课程, 成绩, 绩点, 年份, 学期) "
                           "VALUES ('%010d', '%d', '%.1f', '%.1f', '2016-2017', '1') "
                           % (x, y, grade, grade / 25))
        for y in range(110, 119):
            grade = numpy.random.normal(80, 10)
            grade = 100 if grade > 100 else grade
            cursor.execute("INSERT INTO 成绩(学号, 课程, 成绩, 绩点, 年份, 学期) "
                           "VALUES ('%010d', '%d', '%.1f', '%.1f', '2016-2017', '2') "
                           % (x, y, grade, grade / 25))
        for y in range(120, 129):
            grade = numpy.random.normal(80, 10)
            grade = 100 if grade > 100 else grade
            cursor.execute("INSERT INTO 成绩(学号, 课程, 成绩, 绩点, 年份, 学期) "
                           "VALUES ('%010d', '%d', '%.1f', '%.1f', '2017-2018', '1') "
                           % (x, y, grade, grade / 25))
        for y in range(130, 139):
            grade = numpy.random.normal(80, 10)
            grade = 100 if grade > 100 else grade
            cursor.execute("INSERT INTO 成绩(学号, 课程, 成绩, 绩点, 年份, 学期) "
                           "VALUES ('%010d', '%d', '%.1f', '%.1f', '2017-2018', '2') "
                           % (x, y, grade, grade / 25))
    for x in range(1030616201, 1030616235):
        print(x)
        cursor.execute("INSERT INTO 学生(学号, 入学年份,班级) "
                       "VALUES ('%010d',2016, '2') "
                       % x)
        for y in range(100, 109):
            grade = numpy.random.normal(80, 10)
            grade = 100 if grade > 100 else grade
            cursor.execute("INSERT INTO 成绩(学号, 课程, 成绩, 绩点, 年份, 学期) "
                           "VALUES ('%010d', '%d', '%.1f', '%.1f', '2016-2017', '1') "
                           % (x, y, grade, grade / 25))
        for y in range(110, 119):
            grade = numpy.random.normal(80, 10)
            grade = 100 if grade > 100 else grade
            cursor.execute("INSERT INTO 成绩(学号, 课程, 成绩, 绩点, 年份, 学期) "
                           "VALUES ('%010d', '%d', '%.1f', '%.1f', '2016-2017', '2') "
                           % (x, y, grade, grade / 25))
        for y in range(120, 129):
            grade = numpy.random.normal(80, 10)
            grade = 100 if grade > 100 else grade
            cursor.execute("INSERT INTO 成绩(学号, 课程, 成绩, 绩点, 年份, 学期) "
                           "VALUES ('%010d', '%d', '%.1f', '%.1f', '2017-2018', '1') "
                           % (x, y, grade, grade / 25))
        for y in range(130, 139):
            grade = numpy.random.normal(80, 10)
            grade = 100 if grade > 100 else grade
            cursor.execute("INSERT INTO 成绩(学号, 课程, 成绩, 绩点, 年份, 学期) "
                           "VALUES ('%010d', '%d', '%.1f', '%.1f', '2017-2018', '2') "
                           % (x, y, grade, grade / 25))
    '''
    con.commit()
    cursor.close()
    con.close()
    '''
