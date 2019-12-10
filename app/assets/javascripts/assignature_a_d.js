$(document)
.on('cocoon:after-insert', '.teacher_assignatures', function(e, added_task) {
  $('.selectpicker').selectpicker({dropupAuto: false});
})