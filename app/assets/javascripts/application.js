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
//= require jquery3
//= require jquery
//= require rails-ujs
//= require font_awesome5
//= require popper
//= require moment
//= require moment-timezone-with-data
//= require tempusdominus-bootstrap-4.js
//= require moment/es.js
//= require filterrific/filterrific-jquery
//= require bootstrap-sprockets
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
  $('.counter').each(function () {
    $(this).prop('Counter',0).animate({
      Counter: $(this).text()
    }, {
    duration: 4000,
    easing: 'swing',
    step: function (now) {
      $(this).text(Math.ceil(now));
      }
    });
  });

  window.setTimeout(function() {
    $(".alert").fadeTo(500, 0).slideUp(500, function(){
      $(this).remove();
    });
  }, 5000);
  
  $(function () {

    $('[data-toggle="tooltip"]').tooltip()

    $("#meeting_since_date").datetimepicker({
      format: 'DD/MM/YYYY HH:mm',
      locale: 'es',
      icons: {
        time: "fa fa-clock",
      }
    });

    $("#post_published_at").datetimepicker({
      format: 'DD/MM/YYYY',
      locale: 'es',
      icons: {
        time: "fa fa-clock",
      }
    });

    $("#formation_init_date").datetimepicker({
      format: 'DD/MM/YYYY',
      locale: 'es',
      icons: {
        time: "fa fa-clock",
      }
    });

    $("#month_presence_month_date").datetimepicker({
      viewMode: 'months',
      format: 'MM/YYYY',
      locale: 'es',
      icons: {
        time: "fa fa-clock",
      }
    });
  });

  $('#meeting_since_date').on('dp.change', function (e) { console.log(e.date); })

  $('.selectpicker').selectpicker();
});

$(function () {
  $('.datetimepicker-input').datetimepicker({
    locale: 'es'
  });
});
$(function () {
  $('#datetimepicker2').datetimepicker({
    format: 'L', // or 'l' (lowercase L) for non-zero-padded
    date: moment()
  });
});

$("#datetimepicker2").on("dp.change", function (e) {
  $('#datetimepicker1').datetimepicker('maxDate', e.date);
});