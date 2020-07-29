<?php
$con = mysqli_connect('mysql:3306', 'CalendarsDB', 'CalendarsDB', 'CalendarsDB');
$dbc = mysqli_connect('mysql:3306', 'CalendarsDB', 'CalendarsDB', 'CalendarsDB');
if (!mysqli_set_charset($con, "utf8")||$con->connect_errno)
{
    die("连接失败: (" . $con->connect_errno . ") " . $con->connect_error);
}
if (!mysqli_set_charset($dbc, "utf8")||$dbc->connect_errno)
{
    die("连接失败: (" . $dbc->connect_errno . ") " . $dbc->connect_error);
}
$redis=new Redis();
$redis->connect('redis',6379);
?>