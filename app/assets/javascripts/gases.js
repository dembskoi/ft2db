$(document).on('page:change', function(event) {
  $('#gases_table').dataTable({
    columnDefs: [
      { bSortable: false, aTargets: [1] }
    ],
    "bDestroy": true
  });
});
