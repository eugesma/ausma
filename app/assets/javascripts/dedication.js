$(document)
.on('cocoon:after-insert', '.teacher_dedications', function(e, added_task) {
  $('.selectpicker').selectpicker({dropupAuto: false});
})