<?php 

echo "Данные добавлены!"; 

require('config.php');
$connect = mysqli_connect($host, $user, $pass, $db);
if(!$connect){
    die();
}
mysqli_query($connect, "SET CHARSET UTF8;");

$tick_id = $_POST['tick_id'];
$bibl_id = $_POST['bibl_id'];
$type_id = $_POST['type_id'];

mysqli_query($connect, "INSERT INTO `user`( `tick_id`, `bibl_id`, `type_id`) VALUES ('$tick_id','$bibl_id','$type_id');");