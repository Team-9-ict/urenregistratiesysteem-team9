<?php include 'config.php'; 
$sql = "SELECT id, naam, klant, startdatum, einddatum, status, omschrijving FROM opdrachten";
$result = $conn->query($sql);
?>
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style.css">
    <title>Opdrachten Overzicht</title>
</head>
<body>
    <nav class="navbar">
        <div class="nav-logo">FactuurPro</div>
        <ul class="nav-links">
            <li><a href="index.php">Home</a></li>
            <li><a href="facturen.php">Facturen</a></li>
            <li><a href="opdrachten.php">Opdrachten</a></li>
            <li><a href="medewerkers.php">Medewerkers</a></li>
            <li><a href="uren.php">Urenregistratie</a></li>
        </ul>
    </nav>

    <div class="container">
        <h1>Projecten & Opdrachten</h1>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Opdracht</th>
                    <th>Klant</th>
                    <th>Startdatum</th>
                    <th>Einddatum</th>
                    <th>Status</th>
                    <th>Omschrijving</th>
                </tr>
            </thead>
            <tbody>
                <?php
                if ($result->num_rows > 0) {
                    while($row = $result->fetch_assoc()) {
                        echo "<tr>
                            <td>{$row['id']}</td>
                            <td>{$row['naam']}</td>
                            <td>{$row['klant']}</td>
                            <td>{$row['startdatum']}</td>
                            <td>{$row['einddatum']}</td>
                            <td><span class='status'>" . $row['status'] . "</span></td>
                            <td>{$row['omschrijving']}</td>
                        </tr>";
                    }
                } else {
                    echo "<tr><td colspan='7'>Geen opdrachten gevonden</td></tr>";
                }
                ?>
            </tbody>
        </table>
        <br>
        <a href="index.php" class="btn-secondary">Terug naar Dashboard</a>
    </div>
</body>
</html>