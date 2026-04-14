<?php
$host = "localhost";
$user = "root"; 
$pass = ""; 
$db   = "usp3"; 

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Verbinding mislukt: " . $conn->connect_error);
}
?>