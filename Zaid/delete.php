<?php
require 'db.php';
if (isset($_GET['id'])) {
    $stmt = $conn->prepare("DELETE FROM Werkzaamheden WHERE ID = ?");
    $stmt->execute([$_GET['id']]);
}
header("Location: index.php");
?>