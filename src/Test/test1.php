<?php
//$redis=new Redis();
//$redis->connect('127.0.0.1',6379);
//echo $redis->ping();
//echo $redis->set('admin','yin');
//echo $redis->get('canvasdata9');
//echo "\n";

//$data=array('a'=>'a','b'=>'bb','c'=>'ccc');
//echo $data;
//echo json_encode($data);
//$redis->set('projectdata9',json_encode($data));
//$data=json_decode($redis->get('projectdata9'));
//$data=json_decode(json_encode($data),true);//错误?
//echo $data['b'];
require_once "../connection.php";
//require_once "../functions/getProjsData.php";
//$proj_id=$_POST['proj_id'];
//echo json_encode(getProjData_FromDB($proj_id,$con));
//$result = mysqli_query($con, "SELECT 学号 FROM 用户 WHERE 用户名='lyf'");
//$school_id=mysqli_fetch_array($result)[0];
//echo $school_id==null;
//print_r(mysqli_fetch_array($result));
//$a=array(array(),array(),array(0,0,0,0,0));
//print_r(sizeof($a));
//$a=intval(substr("2016-2017",0,strpos("2016-2017", '-')))-2016;
//print($a);
require_once "../Charts/get_grade_func.php";
$id='ydhydhydh';
$result = mysqli_query($con, "SELECT 学号 FROM 用户 WHERE 用户名='$id'");
if($result==false)
{
    echo "null:请先填写用户信息";
    exit();
}
$school_id=mysqli_fetch_array($result)[0];
$result=mysqli_query($con,"SELECT 入学年份 FROM 学生 WHERE 学号='$school_id'");
$start_year=mysqli_fetch_array($result)[0];
if($start_year===null)//没有入学学年信息就查最早的课程年份
{
    $result=mysqli_query($con,"SELECT 年份 FROM 成绩 WHERE 学号='$school_id'");
    $start_year=mysqli_fetch_array($result)[0];
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
