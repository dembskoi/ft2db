$(document).on('page:change', function(event) {
  $('#equations_table').dataTable({
    columnDefs: [
      { bSortable: false, aTargets: [1] }
    ],
    "bDestroy": true
  });
});
