$(document).on('page:change', function(event) {
  $('#users_table').dataTable({
    columnDefs: [
      { bSortable: false, aTargets: [1,2] }
    ],
    "bDestroy": true
  });
});
