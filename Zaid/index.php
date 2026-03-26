<?php
require 'db.php';
try {
    $stmt = $conn->query("SELECT * FROM Werkzaamheden ORDER BY ID DESC");
    $werkzaamheden = $stmt->fetchAll();
} catch (PDOException $e) {
    die("Fout bij ophalen data: " . $e->getMessage());
}
?>

<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Werkzaamheden Overzicht | Zaid</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
</head>
<body>
    <nav class="navbar">
        <div class="nav-container">
            <div class="logo">TEAM9<strong> URSysteem</strong></div>
            <div class="nav-links">
                <a href="index.php" class="active">Werkzaamheden</a>
                <a href="#">Instellingen</a>
            </div>
        </div>
    </nav>

    <div class="container" id="printableArea">
        <div class="header-section">
            <h1>Werkzaamheden Overzicht</h1>
            <div class="action-buttons">
                <button class="btn-secondary" onclick="toggleForm()">+ Nieuwe Werkzaamheid</button>
                <button class="btn-primary" onclick="generatePDF()">Exporteer naar PDF</button>
                
            </div>
        </div>

        <div class="form-card" id="formSection" style="display: none;">
            <h3>Werkzaamheid Toevoegen</h3>
            <form action="add.php" method="POST">
                <div class="form-grid">
                    <input type="text" name="voornaam" placeholder="Voornaam medewerker" required>
                    <input type="text" name="tussenvoegsel" placeholder="Tussenvoegsel medewerker">
                    <input type="text" name="achternaam" placeholder="Achternaam medewerker" required>
                    <input type="number" name="uren" placeholder="Uren gewerkt" required>
                    <input type="text" name="opdracht" placeholder="Opdracht naam" required>
                    <input type="text" name="beschrijving" placeholder="Opdracht beschrijving" required>
                </div>
                <button type="submit" class="btn-save">Opslaan in database</button>
            </form>
        </div>

        <div class="table-card">
            <div class="table-header">
                <input type="text" id="searchInput" onkeyup="filterTable()" placeholder="Zoek in alle velden...">
            </div>
            <table id="mainTable">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Voornaam</th>
                        <th>Tussenvoegsel</th>
                        <th>Achternaam</th>
                        <th>Gewerkte uren</th>
                        <th>Opdracht</th>
                        <th>Omschrijving</th>
                        <th>Verwijderen?</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if (empty($werkzaamheden)): ?>
                        <tr><td colspan="6" style="text-align:center;">Geen werkzaamheden gevonden.</td></tr>
                    <?php else: ?>
                        <?php foreach ($werkzaamheden as $werkzaamheid): ?>
                        <tr>
                            <td>#<?= $werkzaamheid['ID'] ?></td>
                            <td><?= htmlspecialchars($werkzaamheid['Voornaam']) ?></td>
                            <td><?= htmlspecialchars($werkzaamheid['Tussenvoegsel']) ?></td>
                            <td><?= htmlspecialchars($werkzaamheid['Achternaam']) ?></td>
                            <td><?= htmlspecialchars($werkzaamheid['Gewerkte uren']) ?></td>
                            <td><?= htmlspecialchars($werkzaamheid['Opdracht']) ?></td>
                            <td><?= htmlspecialchars($werkzaamheid['Omschrijving']) ?></td>
                            <td class="action-buttons">
                                <!-- Link naar delete.php met ID -->
                                <a href="delete.php?id=<?= $werkzaamheid['ID'] ?>" 
                                   onclick="return confirm('Weet je zeker dat je deze werkzaamheid wilt verwijderen? Dit kan niet ongedaan worden.')" 
                                   style="color: #ef4444; text-decoration: none; font-size: 0.85rem;">Verwijderen</a>
                            </td>
                        </tr>
                        <?php endforeach; ?>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
    </div>

    <script>
        function filterTable() {
            const filter = document.getElementById('searchInput').value.toLowerCase();
            const rows = document.querySelectorAll('#mainTable tbody tr');
            
            rows.forEach(row => {
                const text = row.textContent.toLowerCase();
                row.style.display = text.includes(filter) ? '' : 'none';
            });
        }

        function toggleForm() {
            const f = document.getElementById('formSection');
            f.style.display = (f.style.display === 'none') ? 'block' : 'none';
        }

function generatePDF() {
    const originalElement = document.getElementById('printableArea');
    
    const clone = originalElement.cloneNode(true);
    
    clone.style.background = "white";
    clone.style.color = "black";
    clone.style.padding = "20px";
    clone.style.width = "1000px";
    
    const actionButtons = clone.querySelectorAll('.action-buttons, .action-buttons a, .btn-primary, .btn-secondary');
    actionButtons.forEach(btn => btn.remove());

    const allText = clone.querySelectorAll('h1, th, td, div');
    allText.forEach(el => {
        el.style.color = "black";
        el.style.backgroundColor = "white";
        el.style.borderColor = "#ccc";
    });

    const opt = {
        margin:       [10, 10],
        filename:     'werkzaamheden_overzicht.pdf',
        image:        { type: 'jpeg', quality: 1 },
        html2canvas:  { 
            scale: 2, 
            backgroundColor: '#ffffff',
            logging: false
        },
        jsPDF:        { unit: 'mm', format: 'a4', orientation: 'landscape' }
    };

    html2pdf().set(opt).from(clone).save();
}
    </script>
</body>
</html>
