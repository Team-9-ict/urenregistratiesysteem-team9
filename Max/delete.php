<?php
include 'config.php';

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $sql = "DELETE FROM medewerkers WHERE ID = $id";
    $conn->query($sql);
}

header("Location: medewerkers.php");
exit();
?>