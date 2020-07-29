<?php
session_start();
if (!isset($_SESSION['id']))
{
    header("Location:login.html");
    exit();
}
$user_id = $_SESSION['id'];
session_write_close();

require_once '../connection.php';
$StudentID = $_POST['StudentID'];
$RegistryDepartmentPassword = $_POST['RegistryDepartmentPassword'];
$SQL = "UPDATE 用户 SET 学号='$StudentID',教务处密码='$RegistryDepartmentPassword'WHERE 用户名='{$user_id}'";
mysqli_query($con, $SQL);
exit();