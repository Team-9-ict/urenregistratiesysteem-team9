function searchTable() {
    let input = document.getElementById("searchInput").value.toLowerCase();
    let rows = document.querySelectorAll("#employeeTable tbody tr");

    rows.forEach(row => {
        let text = row.innerText.toLowerCase();
        row.style.display = text.includes(input) ? "" : "none";
    });
}

function generatePDF() {
    const element = document.getElementById('pdf-content');
    const options = {
        margin: 10,
        filename: 'medewerkers_gop3.pdf',
        image: { type: 'jpeg', quality: 0.98 },
        html2canvas: { scale: 2 },
        jsPDF: { unit: 'mm', format: 'a4', orientation: 'landscape' }
    };
    html2pdf().set(options).from(element).save();
}

function toggleForm() {
    const form = document.getElementById('addForm');
    form.style.display = form.style.display === 'none' ? 'block' : 'none';
}

function searchTable() {
    let input = document.getElementById("searchInput").value.toLowerCase();
    let rows = document.querySelectorAll("#employeeTable tbody tr");
    rows.forEach(row => {
        let text = row.innerText.toLowerCase();
        row.style.display = text.includes(input) ? "" : "none";
    });
}

function generatePDF() {
    const element = document.getElementById('pdf-content');
    html2pdf().from(element).set({
        margin: 10,
        filename: 'medewerkers.pdf',
        html2canvas: { scale: 2 },
        jsPDF: { orientation: 'landscape' }
    }).save();
}