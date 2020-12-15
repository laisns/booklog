$(document).ready(function (){
    $('#lists-table').DataTable({
        "lengthMenu": [[5, 10, 20, -1], [5, 10, 20, "All"]],
        "pagingType": "full_numbers",
        "bFilter": false,
    });

    $('#book-lists-table').DataTable({
        "pageLength": 7,
        "lengthChange": false,
        "pagingType": "simple",
        "bFilter": false,
    });
});