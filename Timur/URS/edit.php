<?php
// Foutmeldingen aanzetten voor debugging
ini_set('display_errors', 1);
error_reporting(E_ALL);

include 'config.php';

// 1. Controleer of er een ID is meegegeven
if (!isset($_GET['id'])) {
    die("Fout: Geen ID gevonden in de URL. Ga terug naar apparatuur.php en klik opnieuw op Wijzig.");
}

$id = $_GET['id'];

// 2. Haal gegevens op
$result = $conn->query("SELECT * FROM apparatuur WHERE id = $id");
if (!$result) {
    die("Database fout: " . $conn->error);
}
$row = $result->fetch_assoc();

if (!$row) {
    die("Apparaat met ID $id niet gevonden in de database.");
}

// 3. Verwerk de update
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['update_device'])) {
    $id = $_POST['id'];
    $naam = $_POST['apparaat_naam'];
    $sn = $_POST['serienummer'];
    $type = $_POST['type'];
    $datum = $_POST['aanschafdatum'];
    $status = $_POST['status'];

    $sql = "UPDATE apparatuur SET 
            apparaat_naam='$naam', 
            serienummer='$sn', 
            type='$type', 
            aanschafdatum='$datum', 
            status='$status' 
            WHERE id=$id";

    if ($conn->query($sql)) {
        header("Location: apparatuur.php");
        exit();
    } else {
        echo "Fout bij opslaan: " . $conn->error;
    }
}
?>

<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <title>Wijzig Apparaat</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h2>Apparaat aanpassen: <?php echo $row['apparaat_naam']; ?></h2>
        <form method="POST" class="form-card" style="display:block;">
            <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
            <div class="form-grid">
                <input type="text" name="apparaat_naam" value="<?php echo $row['apparaat_naam']; ?>" required>
                <input type="text" name="serienummer" value="<?php echo $row['serienummer']; ?>" required>
                <input type="text" name="type" value="<?php echo $row['type']; ?>" required>
                <input type="date" name="aanschafdatum" value="<?php echo $row['aanschafdatum']; ?>" required>
                <input type="text" name="status" value="<?php echo $row['status']; ?>" required>
            </div>
            <button type="submit" name="update_device" class="btn-save">Update Opslaan</button>
            <a href="apparatuur.php">Terug</a>
        </form>
    </div>
</body>
</html>