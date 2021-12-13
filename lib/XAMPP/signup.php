<?php
    $db = mysqli_connect("localhost", "root","", "woofle");
    if(!$db) {
        echo "Database Connection Failed";
    }

    $username = $_POST['username'];
    $password = $_POST['password'];
    //$username = "Jacob Black";
    //$password = "SuperScarySnake"; 

    $sql = "Select * FROM users WHERE username = '$username' AND password = '$password'";
    $result = mysqli_query($db, $sql);
    $count = mysqli_num_rows($result);

    if($count>=1) {
        echo json_encode("Username already exists");
    }
    else{
        $query = "INSERT INTO users (id, username, password) VALUES (NULL, '$username', '$password')";
        $result = mysqli_query($db,$query);
        if($result)
        {
            echo json_encode("true");
        }
        else
        {
            echo json_encode("false");
        }
    }
?>