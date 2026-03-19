<?php
$host = "localhost";
$user = "root";
$password = "";
$dbname = "usp3";

// Verbinding maken met database
$conn = new mysqli($host, $user, $password, $dbname);
if ($conn->connect_error) {
    die("Verbinding mislukt: " . $conn->connect_error);
}

// Zoekfunctie
$zoek = "";
if (isset($_GET['zoek'])) {
    $zoek = $conn->real_escape_string($_GET['zoek']);
}

// Query met zoekfilter
if ($zoek != "") {
    $sql = "SELECT * FROM facturen 
            WHERE id LIKE '%$zoek%' 
               OR opdracht_id LIKE '%$zoek%' 
               OR betaalstatus LIKE '%$zoek%'";
} else {
    $sql = "SELECT * FROM facturen";
}

$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Facturen Overzicht</title>
    <!-- jsPDF en AutoTable -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.28/jspdf.plugin.autotable.min.js"></script>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; }
        h1 { text-align: center; }
        nav { margin-bottom: 20px; }
        .nav-menu { list-style: none; padding: 0; display: flex; gap: 15px; justify-content: center; }
        .nav-menu li { display: inline; }
        .nav-menu a {
            text-decoration: none;
            padding: 6px 12px;
            background-color: #4CAF50;
            color: white;
            border-radius: 4px;
        }
        .nav-menu a:hover { background-color: #45a049; }

        table { border-collapse: collapse; width: 100%; margin-top: 15px; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        input[type=text] { padding: 5px; width: 250px; }
        button { padding: 6px 12px; margin-left: 5px; cursor: pointer; }
        .search-container { margin-bottom: 15px; }
        .search-container form { display: flex; align-items: center; justify-content: center; }
        .search-container form button { margin-left: 5px; }
        .search-results { margin-top: 10px; font-style: italic; text-align: center; }
    </style>
</head>
<body>

    <!-- Navigatiebalk -->
    <nav>
        <ul class="nav-menu">
            <li><a href="facturen.php">Facturen</a></li>
            <li><a href="opdrachten.php">Opdrachten</a></li>
            <li><a href="medewerkers.php">Medewerkers</a></li>
            <li><a href="uren.php">Urenregistratie</a></li>
        </ul>
    </nav>

    <h1>Facturen Overzicht</h1>

    <!-- Zoekfunctie -->
    <div class="search-container">
        <form method="GET" action="">
            <input type="text" name="zoek" placeholder="Zoek op ID, Opdracht ID of Betaalstatus" value="<?php echo htmlspecialchars($zoek); ?>">
            <button type="submit">Zoek</button>
            <a href="facturen.php"><button type="button">Reset</button></a>
        </form>
    </div>

    <?php if ($zoek != ""): ?>
        <div class="search-results">
            Zoekresultaten voor: <strong><?php echo htmlspecialchars($zoek); ?></strong>
        </div>
    <?php endif; ?>

    <!-- PDF download knop -->
    <div style="text-align: center; margin-bottom: 10px;">
        <button id="downloadPdf">Download PDF</button>
    </div>

    <!-- Facturen tabel -->
    <table>
        <tr>
            <th>ID</th>
            <th>Opdracht ID</th>
            <th>Factuurdatum</th>
            <th>Totaalbedrag</th>
            <th>BTW Tarief</th>
            <th>Betaalstatus</th>
            <th>Vervaldatum</th>
        </tr>
        <?php
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                echo "<tr>
                    <td>{$row['id']}</td>
                    <td>{$row['opdracht_id']}</td>
                    <td>{$row['factuurdatum']}</td>
                    <td>{$row['totaalbedrag']}</td>
                    <td>{$row['btw_tarief']}</td>
                    <td>{$row['betaalstatus']}</td>
                    <td>{$row['vervaldatum']}</td>
                </tr>";
            }
        } else {
            echo "<tr><td colspan='7'>Geen facturen gevonden</td></tr>";
        }
        ?>
    </table>

    <!-- PDF JavaScript -->
    <script>
        document.getElementById("downloadPdf").addEventListener("click", () => {
            const { jsPDF } = window.jspdf;
            const doc = new jsPDF();

            let table = document.querySelector("table");
            let rows = table.querySelectorAll("tr");
            let data = [];

            rows.forEach(row => {
                let rowData = [];
                row.querySelectorAll("th, td").forEach(cell => rowData.push(cell.innerText));
                data.push(rowData);
            });

            doc.autoTable({
                head: [data[0]],
                body: data.slice(1),
                startY: 20
            });

            doc.save("facturen.pdf");
        });
    </script>
</body>
</html>

<?php $conn->close(); ?>