$(document).on('page:change', function(event) {
  $('#results_table').dataTable({
    columnDefs: [
      { bSortable: false, aTargets: [1] }
    ],
    "bDestroy": true
  });
});
