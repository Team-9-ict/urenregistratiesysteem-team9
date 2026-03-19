<?php
require 'db_config.php';
if (isset($_GET['id'])) {
    $stmt = $pdo->prepare("DELETE FROM Opdrachten WHERE ID = ?");
    $stmt->execute([$_GET['id']]);
}
header("Location: index.php");
?>