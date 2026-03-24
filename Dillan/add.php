<?php
include 'db.php';

$stmt = $conn->prepare("INSERT INTO klanten (bedrijfsnaam, voornaam, tussenvoegsel, achternaam, functie, email, telefoonnummer, adres) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
$stmt->bind_param("ssssssss",
    $_POST['bedrijfsnaam'],
    $_POST['voornaam'],
    $_POST['tussenvoegsel'],
    $_POST['achternaam'],
    $_POST['functie'],
    $_POST['email'],
    $_POST['telefoonnummer'],
    $_POST['adres']
);

$stmt->execute();
header("Location: index.php");
?>