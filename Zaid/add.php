<?php
require 'db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $sql = "INSERT INTO Werkzaamheden (Voornaam, Tussenvoegsel, Achternaam, `Gewerkte uren`, Opdracht, Omschrijving) 
            VALUES (?, ?, ?, ?, ?, ?)";
    
    $stmt = $conn->prepare($sql);
    
    $stmt->execute([
        $_POST['voornaam'],
        $_POST['tussenvoegsel'], 
        $_POST['achternaam'], 
        $_POST['uren'],
        $_POST['opdracht'], 
        $_POST['beschrijving']
    ]);
    
    header("Location: index.php");
    exit();
}
?>