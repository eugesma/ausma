$(document).on('cocoon:after-insert', '.teacher_projects', function (e, added_task) {
  $('.selectpicker').selectpicker({ dropupAuto: false });
})