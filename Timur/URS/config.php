<?php
$host = "localhost";
$user = "root"; 
$pass = "";     
$db   = "werkapparatuur"; 

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Verbinding mislukt: " . $conn->connect_error);
}
?>