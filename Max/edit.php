<?php
include 'config.php';

$id = $_GET['id'];
$result = $conn->query("SELECT * FROM medewerkers WHERE ID = $id");
$m = $result->fetch_assoc();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $v = $_POST['voornaam'];
    $t = $_POST['tussenvoegsel'];
    $a = $_POST['achternaam'];
    $g = $_POST['geboortedatum'];
    $f = $_POST['functie'];
    $w = $_POST['werkmail'];
    $k = $_POST['kantoor'];

    $sql = "UPDATE medewerkers SET 
            Voornaam='$v', Tussenvoegsel='$t', Achternaam='$a', 
            Geboortedatum='$g', Functie='$f', Werkmail='$w', Kantoorruimte='$k' 
            WHERE ID=$id";
    
    $conn->query($sql);
    header("Location: medewerkers.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <title>GOP3 | Medewerker Wijzigen</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <div class="form-card">
            <h3>Medewerker Wijzigen (ID: <?= $m['ID'] ?>)</h3>
            <form method="POST">
                <div class="form-grid">
                    <input type="text" name="voornaam" value="<?= $m['Voornaam'] ?>" required>
                    <input type="text" name="tussenvoegsel" value="<?= $m['Tussenvoegsel'] ?>">
                    <input type="text" name="achternaam" value="<?= $m['Achternaam'] ?>" required>
                    <input type="date" name="geboortedatum" value="<?= $m['Geboortedatum'] ?>" required>
                    <input type="text" name="functie" value="<?= $m['Functie'] ?>" required>
                    <input type="email" name="werkmail" value="<?= $m['Werkmail'] ?>" required>
                    <input type="text" name="kantoor" value="<?= $m['Kantoorruimte'] ?>" required>
                </div>
                <button type="submit" class="btn-save">Wijzigingen Opslaan</button>
                <a href="medewerkers.php" style="display: block; text-align: center; margin-top: 10px; color: var(--text-muted);">Annuleren</a>
            </form>
        </div>
    </div>
</body>
</html>