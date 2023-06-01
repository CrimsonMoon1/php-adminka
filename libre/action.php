<?php 

echo "Данные добавлены!"; 

require('config.php');
$connect = mysqli_connect($host, $user, $pass, $db);
if(!$connect){
    die();
}
mysqli_query($connect, "SET CHARSET UTF8;");

$name = $_POST['name'];
$lastname = $_POST['lastname'];
$idbibl = $_POST['idbibl'];

mysqli_query($connect, "INSERT INTO `worker`( `w_name`, `w_lastname`, `bibl_id`) VALUES ('$name','$lastname','$idbibl');");