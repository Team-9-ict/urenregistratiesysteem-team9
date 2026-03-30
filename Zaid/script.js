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
