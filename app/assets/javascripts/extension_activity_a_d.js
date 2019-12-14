$(document)
.on('cocoon:after-insert', '.teacher_extension_activities', function(e, added_task) {
  $('.selectpicker').selectpicker({dropupAuto: false});
})