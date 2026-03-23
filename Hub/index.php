<?php
// We gaan een map omhoog (..) en dan de map Max in voor de database
include '../Max/config.php';

// Statistieken ophalen uit de database in de andere map
$res_totaal = $conn->query("SELECT COUNT(*) as totaal FROM medewerkers");
$totaal = ($res_totaal) ? $res_totaal->fetch_assoc()['totaal'] : 0;

$res_kantoren = $conn->query("SELECT COUNT(DISTINCT Kantoorruimte) as kantoren FROM medewerkers");
$kantoren = ($res_kantoren) ? $res_kantoren->fetch_assoc()['kantoren'] : 0;
?>

<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <title>GOP3 | Hub Dashboard</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <nav class="navbar">
        <div class="nav-container">
            <span class="logo">TEAM9 <strong>URSysteem</strong></span>
            <div class="nav-links">
                <a href="index.php" class="active">Dashboard</a>
                <a href="../Max/medewerkers.php">Medewerkers</a>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="header-section">
            <h1>Systeem Hub</h1>
        </div>

        <div class="form-grid" style="margin-bottom: 30px;">
            <div class="table-card" style="padding: 20px; text-align: center;">
                <h3 style="color: var(--text-muted);">Totaal Medewerkers</h3>
                <p style="font-size: 2.5rem; font-weight: bold; color: var(--primary); margin: 10px 0;"><?php echo $totaal; ?></p>
            </div>
            <div class="table-card" style="padding: 20px; text-align: center;">
                <h3 style="color: var(--text-muted);">Bezette Kantoren</h3>
                <p style="font-size: 2.5rem; font-weight: bold; color: var(--primary); margin: 10px 0;"><?php echo $kantoren; ?></p>
            </div>
        </div>

        <div class="table-card" style="padding: 24px;">
            <h3>Snelkoppelingen</h3>
            <div class="action-buttons" style="margin-top: 20px;">
                <a href="../Max/medewerkers.php" class="btn-primary" style="text-decoration: none;">Open Medewerkers Beheer</a>
            </div>
        </div>
    </div>

    <script src="script.js"></script>
</body>
</html>