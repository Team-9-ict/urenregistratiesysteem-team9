<?php
require 'db.php';

// --- CRUD: Toevoegen & Wijzigen (Create & Update) ---
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['save_klant'])) {
    $id = $_POST['klant_id'];
    $bedrijfsnaam = $_POST['bedrijfsnaam'];
    $voornaam = $_POST['voornaam'];
    $tussenvoegsel = $_POST['tussenvoegsel'];
    $achternaam = $_POST['achternaam'];
    $functie = $_POST['functie'];
    $email = $_POST['email'];
    $telefoonnummer = $_POST['telefoonnummer'];
    $adres = $_POST['adres'];

    if (empty($id)) {
        // INSERT: Nieuwe klant
        $stmt = $pdo->prepare("INSERT INTO klanten (bedrijfsnaam, voornaam, tussenvoegsel, achternaam, functie, email, telefoonnummer, adres) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
        $stmt->execute([$bedrijfsnaam, $voornaam, $tussenvoegsel, $achternaam, $functie, $email, $telefoonnummer, $adres]);
    } else {
        // UPDATE: Bestaande klant
        $stmt = $pdo->prepare("UPDATE klanten SET bedrijfsnaam=?, voornaam=?, tussenvoegsel=?, achternaam=?, functie=?, email=?, telefoonnummer=?, adres=? WHERE id=?");
        $stmt->execute([$bedrijfsnaam, $voornaam, $tussenvoegsel, $achternaam, $functie, $email, $telefoonnummer, $adres, $id]);
    }
    // Herlaad de pagina om dubbele form submissions te voorkomen
    header("Location: klanten.php");
    exit;
}

// --- CRUD: Verwijderen (Delete) ---
if (isset($_GET['delete'])) {
    $id = $_GET['delete'];
    $stmt = $pdo->prepare("DELETE FROM klanten WHERE id=?");
    $stmt->execute([$id]);
    header("Location: klanten.php");
    exit;
}

// --- CRUD: Ophalen (Read) ---
$stmt = $pdo->query("SELECT * FROM klanten ORDER BY id DESC");
$klanten = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="nl">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Klantenbeheer - UrenRegistratieSysteem</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
</head>

<body>

    <nav class="navbar">
        <div class="nav-container">
            <div class="logo"><strong>Dillan's</strong> Klanten-Database</div>
            <div class="nav-links">
                <a href="#">Dashboard</a>
                <a href="klanten.php" class="active">Klanten</a>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="header-section">
            <h1>Klantenbeheer</h1>
            <div class="action-buttons">
                <button class="btn-secondary" onclick="generatePDF()">Exporteren naar PDF</button>
            </div>
        </div>

        <div class="form-card">
            <h3>Klant Toevoegen / Bewerken</h3>
            <form method="POST" action="klanten.php">
                <input type="hidden" name="klant_id" id="klant_id">

                <div class="form-grid">
                    <input type="text" name="bedrijfsnaam" id="bedrijfsnaam" placeholder="Bedrijfsnaam" required>
                    <input type="text" name="voornaam" id="voornaam" placeholder="Voornaam" required>
                    <input type="text" name="tussenvoegsel" id="tussenvoegsel" placeholder="Tussenvoegsel">
                    <input type="text" name="achternaam" id="achternaam" placeholder="Achternaam" required>
                    <input type="text" name="functie" id="functie" placeholder="Functie">
                    <input type="email" name="email" id="email" placeholder="E-mailadres" required>
                    <input type="text" name="telefoonnummer" id="telefoonnummer" placeholder="Telefoonnummer">
                    <input type="text" name="adres" id="adres" placeholder="Adres">
                </div>

                <button type="submit" name="save_klant" class="btn-save">Klant Opslaan</button>
            </form>
        </div>

        <div class="table-card" id="tableToExport">
            <div class="table-header">
                <input type="text" id="searchInput" placeholder="Zoek op naam, bedrijf, email...">
            </div>

            <table id="klantenTable">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Bedrijf</th>
                        <th>Naam</th>
                        <th>Email</th>
                        <th>Functie</th>
                        <th>Acties</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($klanten as $klant): ?>
                        <tr>
                            <td><span class="badge">#<?= htmlspecialchars($klant['id']) ?></span></td>
                            <td><?= htmlspecialchars($klant['bedrijfsnaam']) ?></td>
                            <td>
                                <?= htmlspecialchars($klant['voornaam'] . ' ' . $klant['tussenvoegsel'] . ' ' . $klant['achternaam']) ?>
                            </td>
                            <td><?= htmlspecialchars($klant['email']) ?></td>
                            <td><?= htmlspecialchars($klant['functie']) ?></td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn-secondary"
                                        onclick='editKlant(<?= json_encode($klant) ?>)'>Wijzig</button>
                                    <a href="klanten.php?delete=<?= $klant['id'] ?>"
                                        onclick="return confirm('Weet je zeker dat je deze klant wilt verwijderen?')"
                                        style="text-decoration:none;">
                                        <button class="btn-secondary"
                                            style="color: #ef4444; border-color: #ef4444;">Verwijder</button>
                                    </a>
                                </div>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>

    <script src="script.js"></script>
</body>

</html>