<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <script src="user.js" defer></script>
    <title>Document</title>
</head>
<body>
    <div class="wrapper">
        <div class="container">
            <div class="section menu">
                <h3>Меню</h3>
                <ul>
                <li><a href="index.php">worker</a></li>
                    <li><a href="user.php">user</a></li>
                    <li><a href="book.php">book</a></li>
                </ul>
            </div>
            <div class="section" id="sotrudnic">
            <h3>Сотрудники</h3>
                <form action="user-add.php" method="post">
                    <div class="inputs">
                        <input type="text" required name="tick_id" id="name" placeholder="Введите номер билета">
                        <input type="text" required name="bibl_id" id="lastname" placeholder="Введите номер библиотеки">
                        <input type="text" required name="type_id" id="idbibl" placeholder="Введите id типа пользователя">
                        
                    </div>
                    <div class="btns">
                        <input type="submit" class="btn btn-add1" value="Добавить">
                        <!-- <input type="submit" class="btn btn-del" value="Удалить"> -->
                    </div>
                </form>
                

                <form action='user-del.php' method='post'>
                <table class="table">
                    <thead>
                        <tr>
                            
                            <th>tick_id</th>
                            <th>bibl_id</th>
                            <th>type_id</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    
                        <tr>
                            
                        <?php
                            require_once('config.php');

                            $connect = mysqli_connect($host, $user, $pass, $db);
                            if(!$connect){
                                die();
                            }
                            mysqli_query($connect, "SET CHARSET UTF8;");
                            $result = mysqli_query($connect, "SELECT * FROM `user` ;");
                            $counter = 1;
                            while($row = mysqli_fetch_array($result)){
                                
                                echo "
                                
                                <tr><td>$row[tick_id]</td><td>$row[bibl_id]</td><td>$row[type_id]</td><td><input type='checkbox' data-row='$row[user_id]' class='del-d1' name='del' id='$counter'></td></tr>";
                                $counter++;
                            }
                        ?>
                        
                        
                        
                        </tr>
                        
                    </tbody>
                </table>
                <div class=""><input type="submit" class="btn btn-del1" value="Удалить"></div>
            </form>
            </div>
        </div>
    </div>
</body>
</html>

<!-- <tr><td>$row[w_name]</td><td>$row[w_lastname]</td>><td>$row[bibl_id]</td><td><input type='checkbox' class='del-d' name='del[".$row['worker_id']."]'></td></tr>"; -->