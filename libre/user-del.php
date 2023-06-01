<?php

require('config.php');
$connect = mysqli_connect($host, $user, $pass, $db);
if(!$connect){
    die();
}
mysqli_query($connect, "SET CHARSET UTF8;");

// DELETE FROM `worker` WHERE `worker_id` = 1;

$rawData = file_get_contents('php://input');
$jsonData = json_decode($rawData,true);
$arr = $jsonData['user_id'];
//echo($arr);
var_dump($arr);


for ($i=0; $i < count($arr); $i++) { 
    var_dump($arr[$i]);
    mysqli_query($connect, "DELETE FROM `user` WHERE `user_id` = $arr[$i];");
}


// mysqli_query($connect, "INSERT INTO `worker`( `w_name`, `w_lastname`, `bibl_id`) VALUES ('$name','$lastname','$idbibl');");

// foreach ($_POST['del'] as $id => $value)
// {
//     if (isset($_POST['del'])){
//         $value = 1;
//         $Database->query("UPDATE `izgotoviteli` SET stamp = $value WHERE id = $id");
//     }
//     else{
//         $value = 0;
//         $Database->query("UPDATE `izgotoviteli` SET stamp = $value WHERE id = $id");
//     }
// }
