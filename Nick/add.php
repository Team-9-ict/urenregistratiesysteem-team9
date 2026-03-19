<?php
require 'db_config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $sql = "INSERT INTO Opdrachten (Klantnaam, Titel, Aanvraagdatum, Benodigde_kennis) VALUES (?, ?, ?, ?)";
    $stmt= $pdo->prepare($sql);
    $stmt->execute([$_POST['klantnaam'], $_POST['titel'], $_POST['datum'], $_POST['kennis']]);
    
    header("Location: index.php"); // Terug naar het overzicht
}
?>