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
    html2pdf().from(element).set({
        margin: 10,
        filename: 'apparatuur_overzicht.pdf',
        html2canvas: { scale: 2 },
        jsPDF: { orientation: 'landscape' }
    }).save();
}

function toggleForm() {
    const form = document.getElementById('addForm');
    form.style.display = form.style.display === 'none' ? 'block' : 'none';
}