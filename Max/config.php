<?php
$host = "localhost";
$user = "root"; //gebruikersnaam XAMPP server
$pass = "";     // Standaard wachtwoord leeg voor XAMPP
$db   = "gop3"; //naam database

//verbinding maken
$conn = new mysqli($host, $user, $pass, $db);

//verbindingdings test
if ($conn->connect_error) {
    die("Verbinding mislukt: " . $conn->connect_error);
}
?>