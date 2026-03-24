// Zoekfunctie
document.getElementById('searchInput').addEventListener('keyup', function() {
    let filter = this.value.toLowerCase();
    let rows = document.querySelectorAll('#klantenTable tbody tr');

    rows.forEach(row => {
        let text = row.innerText.toLowerCase();
        row.style.display = text.includes(filter) ? '' : 'none';
    });
});

// Functie om gegevens in het formulier te laden voor bewerken
function editKlant(klant) {
    document.getElementById('klant_id').value = klant.id;
    document.getElementById('bedrijfsnaam').value = klant.bedrijfsnaam;
    document.getElementById('voornaam').value = klant.voornaam;
    document.getElementById('tussenvoegsel').value = klant.tussenvoegsel;
    document.getElementById('achternaam').value = klant.achternaam;
    document.getElementById('functie').value = klant.functie;
    document.getElementById('email').value = klant.email;
    document.getElementById('telefoonnummer').value = klant.telefoonnummer;
    document.getElementById('adres').value = klant.adres;
    
    // Verander knop tekst
    document.querySelector('.btn-save').innerText = 'Klant Wijzigen';
    
    // Scroll soepel naar het formulier
    document.querySelector('.form-card').scrollIntoView({ behavior: 'smooth' });
}

// PDF Genereren (Exporteert alleen de tabel)
function generatePDF() {
    const element = document.getElementById('tableToExport');
    const opt = {
        margin:       10,
        filename:     'klanten_overzicht.pdf',
        image:        { type: 'jpeg', quality: 0.98 },
        html2canvas:  { scale: 2 },
        jsPDF:        { unit: 'mm', format: 'a4', orientation: 'landscape' }
    };

    // We gebruiken de html2pdf library (geladen in klanten.php)
    html2pdf().set(opt).from(element).save();
}