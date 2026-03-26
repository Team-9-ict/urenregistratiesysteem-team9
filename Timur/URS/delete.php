<?php
include 'config.php';
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $conn->query("DELETE FROM apparatuur WHERE id = $id");
}
header("Location: apparatuur.php");
?>