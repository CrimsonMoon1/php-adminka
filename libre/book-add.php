<?php 

echo "Данные добавлены!"; 

require('config.php');
$connect = mysqli_connect($host, $user, $pass, $db);
if(!$connect){
    die();
}
mysqli_query($connect, "SET CHARSET UTF8;");

$author_id = $_POST['author_id'];
$genre_id = $_POST['genre_id'];
$storage_id	= $_POST['storage_id'];

mysqli_query($connect, "INSERT INTO `book`(`author_id`,`genre_id`, `storage_id`) VALUES ('$author_id','$genre_id','$storage_id');");