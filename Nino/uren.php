<?php include 'config.php'; 
$sql = "SELECT urenregistratie.id, medewerkers.naam AS medewerker_naam, opdrachten.naam AS opdracht_naam, urenregistratie.datum, urenregistratie.uren 
        FROM urenregistratie
        JOIN medewerkers ON urenregistratie.medewerker_id = medewerkers.id
        JOIN opdrachten ON urenregistratie.opdracht_id = opdrachten.id
        ORDER BY urenregistratie.datum DESC";
$result = $conn->query($sql);
?>
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style.css">
    <title>Urenregistratie Overzicht</title>
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
        <h1>Geregistreerde Uren</h1>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Medewerker</th>
                    <th>Opdracht</th>
                    <th>Datum</th>
                    <th>Aantal Uren</th>
                </tr>
            </thead>
            <tbody>
                <?php
                if ($result && $result->num_rows > 0) {
                    while($row = $result->fetch_assoc()) {
                        echo "<tr>
                            <td>{$row['id']}</td>
                            <td>{$row['medewerker_naam']}</td>
                            <td>{$row['opdracht_naam']}</td>
                            <td>" . date('d-m-Y', strtotime($row['datum'])) . "</td>
                            <td>" . number_format($row['uren'], 2, ',', '.') . " uren</td>
                        </tr>";
                    }
                } else {
                    echo "<tr><td colspan='5'>Geen urenregistraties gevonden (Check of de tabel data bevat)</td></tr>";
                }
                ?>
            </tbody>
        </table>
        <br>
        <a href="index.php" class="btn-secondary">Terug naar Dashboard</a>
    </div>
</body>
</html>