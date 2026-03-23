<?php
include 'config.php';

$id = intval($_GET['id']);
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
    <title>Max | Wijzigen</title>
    <link rel="stylesheet" href="style.css">
    <style>
        /* Extra styling voor het edit formulier */
        .edit-container { max-width: 600px; margin: 50px auto; }
        .form-card { background: var(--bg-card); padding: 30px; border-radius: 12px; border: 1px solid var(--border); }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; color: var(--text-muted); font-size: 0.85rem; }
        input { width: 100%; box-sizing: border-box; }
        .btn-row { display: flex; gap: 10px; margin-top: 20px; }
    </style>
</head>
<body>
    <div class="container edit-container">
        <div class="form-card">
            <h2 style="margin-top: 0;">Medewerker Wijzigen</h2>
            <form method="POST">
                <div class="form-group">
                    <label>Voornaam</label>
                    <input type="text" name="voornaam" value="<?= $m['Voornaam'] ?>" required>
                </div>
                <div class="form-group">
                    <label>Tussenvoegsel</label>
                    <input type="text" name="tussenvoegsel" value="<?= $m['Tussenvoegsel'] ?>">
                </div>
                <div class="form-group">
                    <label>Achternaam</label>
                    <input type="text" name="achternaam" value="<?= $m['Achternaam'] ?>" required>
                </div>
                <div class="form-group">
                    <label>Geboortedatum</label>
                    <input type="date" name="geboortedatum" value="<?= $m['Geboortedatum'] ?>" required>
                </div>
                <div class="form-group">
                    <label>Functie</label>
                    <input type="text" name="functie" value="<?= $m['Functie'] ?>" required>
                </div>
                <div class="form-group">
                    <label>Werkmail</label>
                    <input type="email" name="werkmail" value="<?= $m['Werkmail'] ?>" required>
                </div>
                <div class="form-group">
                    <label>Kantoorruimte</label>
                    <input type="text" name="kantoor" value="<?= $m['Kantoorruimte'] ?>" required>
                </div>
                
                <div class="btn-row">
                    <button type="submit" class="btn-edit" style="border: none; cursor: pointer; flex: 2; padding: 12px;">Wijzigingen Opslaan</button>
                    <a href="medewerkers.php" class="btn-secondary" style="flex: 1; text-align: center; text-decoration: none; padding: 12px;">Annuleren</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>