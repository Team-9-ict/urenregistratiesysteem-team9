<?php
include 'config.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $voornaam = $_POST['voornaam'];
    $tussenvoegsel = $_POST['tussenvoegsel'];
    $achternaam = $_POST['achternaam'];
    $geboortedatum = $_POST['geboortedatum'];
    $functie = $_POST['functie'];
    $werkmail = $_POST['werkmail'];
    $kantoor = $_POST['kantoor'];

    $sql = "INSERT INTO medewerkers (Voornaam, Tussenvoegsel, Achternaam, Geboortedatum, Functie, Werkmail, Kantoorruimte) 
            VALUES ('$voornaam', '$tussenvoegsel', '$achternaam', '$geboortedatum', '$functie', '$werkmail', '$kantoor')";
    
    $conn->query($sql);
    header("Location: medewerkers.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <title>GOP3 | Medewerkers</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
</head>
<body>
    <nav class="navbar">
        <div class="nav-container">
            <span class="logo">TEAM9 <strong>URSysteem</strong></span>
            <div class="nav-links">
                <a href="#">Dashboard</a>
                <a href="medewerkers.php" class="active">Medewerkers</a>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="header-section">
            <h1>Medewerkers</h1>
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
                <input type="text" id="searchInput" placeholder="Filter op naam, functie of mail..." onkeyup="searchTable()">
            </div>
            
            <div id="pdf-content">
                <table id="employeeTable">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Naam</th>
                            <th>Geboortedatum</th>
                            <th>Functie</th>
                            <th>Werkmail</th>
                            <th>Kantoor</th>
                            <th>Acties</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $sql = "SELECT * FROM medewerkers";
                        $result = $conn->query($sql);
                        while($row = $result->fetch_assoc()) {
                            $volledigeNaam = trim($row["Voornaam"] . " " . $row["Tussenvoegsel"] . " " . $row["Achternaam"]);
                            echo "<tr>
                                    <td><strong>" . $row["ID"] . "</strong></td>
                                    <td>" . $volledigeNaam . "</td>
                                    <td>" . $row["Geboortedatum"] . "</td>
                                    <td><span class='badge'>" . $row["Functie"] . "</span></td>
                                    <td>" . $row["Werkmail"] . "</td>
                                    <td>" . $row["Kantoorruimte"] . "</td>
                                    <td>
                                        <div class='action-cell'>
                                            <a href='edit.php?id=" . $row["ID"] . "' class='btn-edit'>Wijzig</a>
                                            <a href='delete.php?id=" . $row["ID"] . "' class='btn-delete' onclick='return confirm(\"Weet je het zeker?\")'>Wis</a>
                                        </div>
                                    </td>
                                  </tr>";
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