<?php include 'config.php'; ?>
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <title>FactuurPro - Dashboard</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.25/jspdf.plugin.autotable.min.js"></script>
</head>
<body>

<nav class="navbar">
    <div class="nav-logo">FactuurPro Home</div>
    <ul class="nav-links">
        <li><a href="index.php">Home</a></li>
        <li><a href="facturen.php">Facturen</a></li>
    </ul>
</nav>

<header class="hero">
    <h1>Welkom bij het Dashboard</h1>
    <button onclick="genereerTabelPDF()" class="btn-main">Download PDF Overzicht</button>
</header>

<main class="container">
    <h2>Laatste Facturen</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Opdracht</th>
                <th>Datum</th>
                <th>Totaal</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $sql = "SELECT * FROM facturen ORDER BY factuurdatum DESC LIMIT 5";
            $result = $conn->query($sql);
            if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                    $statusClass = strtolower(str_replace(' ', '-', $row['betaalstatus']));
                    echo "<tr>
                        <td>{$row['id']}</td>
                        <td>{$row['opdracht_id']}</td>
                        <td>{$row['factuurdatum']}</td>
                        <td>€ " . number_format($row['totaalbedrag'], 2, ',', '.') . "</td>
                        <td><span class='status $statusClass'>{$row['betaalstatus']}</span></td>
                    </tr>";
                }
            } else {
                echo "<tr><td colspan='5'>Geen data gevonden.</td></tr>";
            }
            ?>
        </tbody>
    </table>
</main>

<script>
    function genereerTabelPDF() {
        const { jsPDF } = window.jspdf;
        const doc = new jsPDF();
        doc.text("Factuur Overzicht", 14, 20);
        doc.autoTable({ html: 'table', startY: 30 });
        doc.save("Dashboard_Overzicht.pdf");
    }
</script>
</body>
</html>