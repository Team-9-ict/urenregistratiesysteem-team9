function searchTable() {
    let val = document.getElementById("searchInput").value.toLowerCase();
    let rows = document.querySelectorAll("#employeeTable tbody tr");
    rows.forEach(r => r.style.display = r.innerText.toLowerCase().includes(val) ? "" : "none");
}

function toggleForm() {
    const form = document.getElementById("addForm");
    if (form.style.display === "none") {
        form.style.display = "block";
    } else {
        form.style.display = "none";
    }
}

function generatePDF() {
    const el = document.getElementById('pdf-content');
    const pdfStyle = document.createElement('style');
    pdfStyle.id = 'pdf-fix';
    pdfStyle.innerHTML = `
        .action-cell, .action-cell-flex { display: none !important; }
        #pdf-content { background: white !important; color: black !important; padding: 10px; }
        table { width: 100% !important; border: 1px solid #ccc !important; }
        td, th { color: black !important; border-bottom: 1px solid #ccc !important; padding: 8px !important; }
    `;
    document.head.appendChild(pdfStyle);

    html2pdf().set({
        margin: 10, 
        filename: 'export.pdf', 
        html2canvas: { scale: 2, backgroundColor: '#ffffff' },
        jsPDF: { orientation: 'landscape' }
    }).from(el).save().then(() => document.getElementById('pdf-fix').remove());
}