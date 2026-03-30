function searchTable() {
    let input = document.getElementById("searchInput").value.toLowerCase();
    let rows = document.querySelectorAll("#deviceTable tbody tr");

    rows.forEach(row => {
        let text = row.innerText.toLowerCase();
        row.style.display = text.includes(input) ? "" : "none";
    });
}

function generatePDF() {
    const element = document.getElementById('pdf-content');
    
    // Forceer alle tekst in de tabel tijdelijk naar zwart
    const items = element.querySelectorAll('*');
    items.forEach(item => {
        item.style.setProperty('color', 'black', 'important');
    });

    const opt = {
        margin: 10,
        filename: 'apparatuur_overzicht.pdf',
        image: { type: 'jpeg', quality: 0.98 },
        html2canvas: { 
            scale: 2, 
            backgroundColor: '#ffffff', 
            useCORS: true 
        },
        jsPDF: { unit: 'mm', format: 'a4', orientation: 'landscape' }
    };

    html2pdf().set(opt).from(element).save().then(() => {
        // Zet de kleuren weer terug naar normaal na de export
        items.forEach(item => {
            item.style.color = '';
        });
    });
}

function toggleForm() {
    const form = document.getElementById('addForm');
    form.style.display = form.style.display === 'none' ? 'block' : 'none';
}