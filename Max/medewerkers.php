<?php
include 'config.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $v = $conn->real_escape_string($_POST['voornaam']);
    $t = $conn->real_escape_string($_POST['tussenvoegsel']);
    $a = $conn->real_escape_string($_POST['achternaam']);
    $g = $conn->real_escape_string($_POST['geboortedatum']);
    $f = $conn->real_escape_string($_POST['functie']);
    $m = $conn->real_escape_string($_POST['werkmail']);
    $k = $conn->real_escape_string($_POST['kantoor']);

    // Let op: Ik gebruik hier 'Kantoorruimte', check of dit klopt met je database!
    $sql = "INSERT INTO medewerkers (Voornaam, Tussenvoegsel, Achternaam, Geboortedatum, Functie, Werkmail, Kantoorruimte) 
            VALUES ('$v', '$t', '$a', '$g', '$f', '$m', '$k')";
    
    if ($conn->query($sql)) {
        header("Location: medewerkers.php");
        exit();
    } else {
        // Dit laat zien wat er mis gaat
        die("Fout in database: " . $conn->error);
    }
}
?>

<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <title>Max | Medewerkers Beheer</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
</head>
<body>
    <nav class="navbar">
        <div class="nav-container">
            <span class="logo">TEAM9 <strong>Medewerkers</strong></span>
            <div class="nav-links">
                <a href="../Hub/index.php">Dashboard</a>
                <a href="medewerkers.php" class="active">Medewerkers</a>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="header-section">
            <h1>Medewerkers Beheer</h1>
            <div class="action-buttons">
                <button onclick="toggleForm()" class="btn-secondary">Nieuwe Medewerker</button>
                <button onclick="generatePDF()" class="btn-primary">Export PDF</button>
            </div>
        </div>

        <div id="addForm" class="form-card" style="display: none;">
            <h3>Nieuwe Medewerker Toevoegen</h3>
            <form method="POST">
                <div class="form-grid">
                    <input type="text" name="voornaam" placeholder="Voornaam" required>
                    <input type="text" name="tussenvoegsel" placeholder="Tussenvoegsel">
                    <input type="text" name="achternaam" placeholder="Achternaam" required>
                    <input type="date" name="geboortedatum" required>
                    <input type="text" name="functie" placeholder="Functie" required>
                    <input type="email" name="werkmail" placeholder="Werkmail" required>
                    <input type="text" name="kantoor" placeholder="Kantoorruimte" required>
                </div>
                <button type="submit" class="btn-save">Opslaan in Database</button>
            </form>
        </div>

        <div class="table-card">
            <div class="table-header">
                <input type="text" id="searchInput" placeholder="Filter op naam, functie, mail of kantoor..." onkeyup="searchTable()">
            </div>

            <div id="pdf-content" style="overflow-x: auto;">
                <table id="employeeTable">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Naam</th>
                            <th>Geboortedatum</th>
                            <th>Functie</th>
                            <th>Werkmail</th>
                            <th>Kantoor</th>
                            <th class="action-cell">Acties</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $sql = "SELECT * FROM medewerkers";
                        $result = $conn->query($sql);
                        if ($result && $result->num_rows > 0) {
                            while ($row = $result->fetch_assoc()) {
                                $volledigeNaam = trim($row["Voornaam"] . " " . $row["Tussenvoegsel"] . " " . $row["Achternaam"]);
                                echo "<tr>
                                        <td><strong>" . $row["ID"] . "</strong></td>
                                        <td>" . $volledigeNaam . "</td>
                                        <td>" . $row["Geboortedatum"] . "</td>
                                        <td><span class='badge'>" . $row["Functie"] . "</span></td>
                                        <td>" . $row["Werkmail"] . "</td>
                                        <td>" . $row["Kantoorruimte"] . "</td>
                                        <td class='action-cell'>
                                            <div class='action-cell-flex'>
                                                <a href='edit.php?id=" . $row["ID"] . "' class='btn-edit'>Wijzig</a>
                                                <a href='delete.php?id=" . $row["ID"] . "' class='btn-delete' onclick='return confirm(\"Weet je het zeker?\")'>Wis</a>
                                            </div>
                                        </td>
                                      </tr>";
                            }
                        } else {
                            echo "<tr><td colspan='7' style='text-align:center;'>Geen medewerkers gevonden</td></tr>";
                        }
                        $conn->close();
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script src="script.js"></script>
</body>
</html>