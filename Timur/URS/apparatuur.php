<?php
include 'config.php';

// Apparaat toevoegen logica
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['submit_device'])) {
    $naam = $_POST['apparaat_naam'];
    $sn = $_POST['serienummer'];
    $type = $_POST['type'];
    $datum = $_POST['aanschafdatum'];
    $status = $_POST['status'];

    $sql = "INSERT INTO apparatuur (apparaat_naam, serienummer, type, aanschafdatum, status) 
            VALUES ('$naam', '$sn', '$type', '$datum', '$status')";
    
    $conn->query($sql);
    header("Location: apparatuur.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <title>GOP3 | Apparatuur</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
</head>
<body>
    <nav class="navbar">
        <div class="nav-container">
            <span class="logo">TEAM9 <strong>URSysteem</strong></span>
            <div class="nav-links">
            <a href="dashboard.php">Dashboard</a>
            <a href="apparatuur.php" class="active">Apparatuur</a>
        </div>
        </div>
    </nav>

    <div class="container">
        <div class="header-section">
            <h1>Apparatuur</h1>
            <div class="action-buttons">
                <button onclick="toggleForm()" class="btn-secondary">Nieuw Apparaat</button>
                <button onclick="generatePDF()" class="btn-primary">Export PDF</button>
            </div>
        </div>

        <div id="addForm" class="form-card" style="display: none;">
            <h3>Nieuw Apparaat Toevoegen</h3>
            <form method="POST">
                <div class="form-grid">
                    <input type="text" name="apparaat_naam" placeholder="Apparaat Naam" required>
                    <input type="text" name="serienummer" placeholder="Serienummer" required>
                    <input type="text" name="type" placeholder="Type (Laptop, Muis, etc.)" required>
                    <input type="date" name="aanschafdatum" required>
                    <input type="text" name="status" placeholder="Status" required>
                </div>
                <button type="submit" name="submit_device" class="btn-save">Opslaan in Database</button>
            </form>
        </div>

        <div class="table-card">
            <div class="table-header">
                <input type="text" id="searchInput" placeholder="Filter op naam, type of status..." onkeyup="searchTable()">
            </div>
            
            <div id="pdf-content">
                <table id="deviceTable">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Naam</th>
                            <th>Serienummer</th>
                            <th>Type</th>
                            <th>Datum</th>
                            <th>Status</th>
                            <th>Acties</th>
                        </tr>
                    </thead>
                    <tbody>
    <?php
    $sql = "SELECT * FROM apparatuur";
    $result = $conn->query($sql);
    while($row = $result->fetch_assoc()) {
        echo "<tr>
                <td><strong>" . $row["id"] . "</strong></td>
                <td>" . $row["apparaat_naam"] . "</td>
                <td>" . $row["serienummer"] . "</td>
                <td>" . $row["type"] . "</td>
                <td>" . $row["aanschafdatum"] . "</td>
                <td><span class='badge'>" . $row["status"] . "</span></td>
                <td>
                    <div class='action-cell'>
                        <a href='edit.php?id=" . $row["id"] . "' class='btn-edit'>Wijzig</a>
                        <a href='delete.php?id=" . $row["id"] . "' class='btn-delete' onclick='return confirm(\"Zeker weten?\")'>Wis</a>
                    </div>
                </td>
              </tr>";
    }
    ?>
</tbody>
                </table>
            </div>
        </div>
    </div>
    <script src="script.js"></script>
</body>
</html>