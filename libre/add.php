<?php
$rowData = file_get_contents('php://input');
$jsonData = json_decode($rowData, true);

$name = $jsonData['inputName'];
$rank = $jsonData['rank'];

require_once "config.php"; //подключение конфига с данными доступа к БД
$connect = mysqli_connect($host, $user, $pass, $db);//соединение с БД
if (!$connect) { //если нет соединения
  echo false; //возращаем клиенту false
  die(); //убиваем скрипт
}
//если соединение произошло успешно
$result = mysqli_query($connect,"INSERT INTO `orders`(`name`, `last_name`, `tel`, `dop_tel`, `city`, `structure`, `street`, `house`, `porch`, `apartment`, `frame`, `floor`, `com`, `shop`, `price`) VALUES ('$name', '$last_name', '$tel', '$tel2', '$city', '$build', '$street', '$house', '$porch', '$apartment', '$frame', '$floor', '$com', '$pay', '$price')");

//echo $result;

?>
