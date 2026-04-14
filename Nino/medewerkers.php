<?php include 'config.php'; 
$sql = "SELECT id, naam, functie, email, telefoon FROM medewerkers";
$result = $conn->query($sql);
?>
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style.css">
    <title>Medewerkers Overzicht</title>
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
        <h1>Medewerkers Overzicht</h1>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Naam</th>
                    <th>Functie</th>
                    <th>Email</th>
                    <th>Telefoon</th>
                </tr>
            </thead>
            <tbody>
                <?php
                if ($result->num_rows > 0) {
                    while($row = $result->fetch_assoc()) {
                        echo "<tr>
                            <td>{$row['id']}</td>
                            <td>{$row['naam']}</td>
                            <td>{$row['functie']}</td>
                            <td>{$row['email']}</td>
                            <td>{$row['telefoon']}</td>
                        </tr>";
                    }
                } else {
                    echo "<tr><td colspan='5'>Geen medewerkers gevonden</td></tr>";
                }
                ?>
            </tbody>
        </table>
        <br>
        <a href="index.php" class="btn-secondary">Terug naar Home</a>
    </div>
</body>
</html>