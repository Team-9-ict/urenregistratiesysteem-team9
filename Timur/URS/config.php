<?php
$host = "localhost";
$user = "root"; 
$pass = "";     
$db   = "werkapparatuur"; // Check of dit exact de naam is in phpMyAdmin

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Verbinding mislukt: " . $conn->connect_error);
}
?>