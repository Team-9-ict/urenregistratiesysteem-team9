<?php
include 'config.php';

if (isset($_GET['id'])) {
    $id = intval($_GET['id']);
    $sql = "DELETE FROM medewerkers WHERE ID = $id";
    $conn->query($sql);
}

// Altijd terug naar het overzicht
header("Location: medewerkers.php");
exit();
?>