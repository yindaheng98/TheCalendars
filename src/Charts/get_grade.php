<?php
require_once "../connection.php";
require_once "get_grade_func.php";
session_start();
if (!isset($_SESSION['id']))
{
    echo "error:请先登录";
    exit();
}
$id = $_SESSION['id'];
session_write_close();
$result = mysqli_query($con, "SELECT 学号 FROM 用户 WHERE 用户名='$id'");
$school_id=@mysqli_fetch_array($result)[0];
if($school_id==null)
{
    echo "null:请先填写用户信息";
    exit();
}
$result=mysqli_query($con,"SELECT 入学年份 FROM 学生 WHERE 学号='$school_id'");
$start_year=@mysqli_fetch_array($result)[0];
if($start_year===null)//没有入学学年信息就查最早的课程年份
{
    $result=mysqli_query($con,"SELECT 年份 FROM 成绩 WHERE 学号='$school_id'");
    $start_year=@mysqli_fetch_array($result)[0];
    if($start_year===null)
    {
        echo "error:没有您的成绩信息";
        exit();
    }
    $start_year=intval(substr($start_year,0,strpos($start_year, '-')));
    while($row=mysqli_fetch_array($result))
    {
        $s=intval(substr($row['年份'],0,strpos($row['年份'], '-')));
        if($s<$start_year)$start_year=$s;
    }
}
$data=getGrade($school_id,$start_year,$con);
echo json_encode($data);
