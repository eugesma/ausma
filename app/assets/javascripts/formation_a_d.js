$(document)
.on('cocoon:after-insert', '.teacher_formations', function(e, added_task) {
  $('.selectpicker').selectpicker({dropupAuto: false});
})