<?php include 'config.php'; ?>
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <title>Facturen - FactuurPro</title>
    <link rel="stylesheet" href="style.css">
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
        <h1>Factuuroverzicht</h1>
        
        <form method="GET" style="margin-bottom: 20px;">
            <input type="text" name="zoek" placeholder="Zoek op status (bijv. betaald)..." style="padding: 10px; width: 250px; border-radius: 5px; border: 1px solid #ccc;">
            <button type="submit" class="btn-main">Zoeken</button>
            <a href="facturen.php" class="btn-secondary">Reset</a>
        </form>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Opdracht</th>
                    <th>Datum</th>
                    <th>Totaal</th>
                    <th>Status</th>
                    <th>Vervaldatum</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $zoek = isset($_GET['zoek']) ? $conn->real_escape_string($_GET['zoek']) : '';
                $sql = "SELECT * FROM facturen";
                if ($zoek != '') {
                    $sql .= " WHERE betaalstatus LIKE '%$zoek%' OR id LIKE '%$zoek%'";
                }

                $result = $conn->query($sql);
                while($row = $result->fetch_assoc()) {
                    $statusClass = strtolower(str_replace(' ', '-', $row['betaalstatus']));
                    echo "<tr>
                        <td>{$row['id']}</td>
                        <td>{$row['opdracht_id']}</td>
                        <td>{$row['factuurdatum']}</td>
                        <td>€ {$row['totaalbedrag']}</td>
                        <td><span class='status $statusClass'>{$row['betaalstatus']}</span></td>
                        <td>{$row['vervaldatum']}</td>
                    </tr>";
                }
                ?>
            </tbody>
        </table>
    </div>
</body>
</html>