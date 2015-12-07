$(document).on('page:change', function(event) {
  $('#types_table').dataTable({
    columnDefs: [
      { bSortable: false, aTargets: [1] }
    ],
    "bDestroy": true
  });
});
