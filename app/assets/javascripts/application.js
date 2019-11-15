// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require popper
//= require font_awesome5
//= require bootstrap
//= require bootstrap-select
//= require cocoon
//= require activestorage
//= require turbolinks
//= require_tree .


// Se oculta el flash message
window.setTimeout(function() {
  $(".alert").fadeTo(500, 0).slideUp(500, function(){
      $(this).remove();
  });
}, 5000);
$(function () {
  $('[data-toggle="tooltip"]').tooltip()
});
$(document).on('turbolinks:load', function() {
  window.setTimeout(function() {
    $(".alert").fadeTo(500, 0).slideUp(500, function(){
      $(this).remove();
    });
  }, 5000);
  
  $(function () {
    $('[data-toggle="tooltip"]').tooltip()
  });

  $('.selectpicker').selectpicker({dropupAuto: false});
});
$('.selectpicker').selectpicker({dropupAuto: false});

$(document)
.on('cocoon:after-insert', '.teacher_dedications', function(e, added_task) {
  $('.selectpicker').selectpicker({dropupAuto: false});
})