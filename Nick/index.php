<?php
// 1. Verbinding maken met de database
require 'db_config.php';

// 2. Data ophalen (voor de tabel)
try {
    $stmt = $pdo->query("SELECT * FROM Opdrachten ORDER BY Aanvraagdatum DESC");
    $opdrachten = $stmt->fetchAll();
} catch (PDOException $e) {
    die("Fout bij ophalen data: " . $e->getMessage());
}
?>

<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Opdrachten Beheer Systeem</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
</head>
<body>

    <!-- Navigatie -->
    <nav class="navbar">
        <div class="nav-container">
            <div class="logo">TEAM9<strong> URSysteem</strong></div>
            <div class="nav-links">
                <a href="index.php" class="active">Opdrachten</a>
                <a href="#">Klanten</a>
                <a href="#">Instellingen</a>
            </div>
        </div>
    </nav>

    <div class="container" id="printableArea">
        <div class="header-section">
            <h1>Opdrachten Overzicht</h1>
            <div class="action-buttons">
                <button class="btn-secondary" onclick="toggleForm()">+ Nieuwe Opdracht</button>
                <button class="btn-primary" onclick="generatePDF()">Exporteer naar PDF</button>
                
            </div>
        </div>

        <!-- Formulier Sectie (Verwijst naar add.php) -->
        <div class="form-card" id="formSection" style="display: none;">
            <h3>Nieuwe Opdracht Toevoegen</h3>
            <form action="add.php" method="POST">
                <div class="form-grid">
                    <input type="text" name="klantnaam" placeholder="Klantnaam" required>
                    <input type="text" name="titel" placeholder="Titel opdracht" required>
                    <input type="date" name="datum" value="<?= date('Y-m-d'); ?>" required>
                    <input type="text" name="kennis" placeholder="Benodigde kennis (bijv. SQL, PHP)">
                </div>
                <button type="submit" class="btn-save">Opslaan in Database</button>
            </form>
        </div>

        <!-- Tabel met Database Gegevens -->
        <div class="table-card">
            <div class="table-header">
                <input type="text" id="searchInput" onkeyup="filterTable()" placeholder="Zoek in alle velden...">
            </div>
            <table id="mainTable">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Klantnaam</th>
                        <th>Titel</th>
                        <th>Datum</th>
                        <th>Kennis</th>
                        <th>Acties</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if (empty($opdrachten)): ?>
                        <tr><td colspan="6" style="text-align:center;">Geen opdrachten gevonden.</td></tr>
                    <?php else: ?>
                        <?php foreach ($opdrachten as $opdracht): ?>
                        <tr>
                            <td>#<?= $opdracht['ID'] ?></td>
                            <td><strong><?= htmlspecialchars($opdracht['Klantnaam']) ?></strong></td>
                            <td><?= htmlspecialchars($opdracht['Titel']) ?></td>
                            <td><?= date('d-m-Y', strtotime($opdracht['Aanvraagdatum'])) ?></td>
                            <td><span class="badge"><?= htmlspecialchars($opdracht['Benodigde_kennis']) ?></span></td>
                            <td class="action-buttons">
                                <!-- Link naar delete.php met ID -->
                                <a href="delete.php?id=<?= $opdracht['ID'] ?>" 
                                   onclick="return confirm('Weet je zeker dat je deze opdracht wilt verwijderen?')" 
                                   style="color: #ef4444; text-decoration: none; font-size: 0.85rem;">Verwijder</a>
                            </td>
                        </tr>
                        <?php endforeach; ?>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
    </div>

    <script>
        // 1. Zoekfunctie (Client-side filtering)
        function filterTable() {
            const filter = document.getElementById('searchInput').value.toLowerCase();
            const rows = document.querySelectorAll('#mainTable tbody tr');
            
            rows.forEach(row => {
                const text = row.textContent.toLowerCase();
                row.style.display = text.includes(filter) ? '' : 'none';
            });
        }

        // 2. Formulier Tonen/Verbergen
        function toggleForm() {
            const f = document.getElementById('formSection');
            f.style.display = (f.style.display === 'none') ? 'block' : 'none';
        }

        // 3. PDF Genereren van de container
        function generatePDF() {
            const element = document.getElementById('printableArea');
            const opt = {
                margin:       [10, 10],
                filename:     'opdrachten_overzicht.pdf',
                image:        { type: 'jpeg', quality: 0.98 },
                html2canvas:  { scale: 2 },
                jsPDF:        { unit: 'mm', format: 'a4', orientation: 'landscape' }
            };
            html2pdf().set(opt).from(element).save();
        }
    </script>
</body>
</html>