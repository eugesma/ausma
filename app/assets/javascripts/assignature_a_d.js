$(document)
.on('cocoon:after-insert', '.teacher_assignatures', function(e, added_task) {
  $('.selectpicker').selectpicker({dropupAuto: false});
  added_task.find(".selectpicker").focus();
})

// Calc and update preparation on implementation change
$(document)
.on('change', '.assignature-implementation', function() {
  var context = $(this);
  jQuery(function() {
    let nested_form = context.parents(".nested-fields");
    let implem_val = context.val()
    let preparation = nested_form.find('.assignature-preparation');
    let consultation = nested_form.find('.assignature-consultation');
    let weeks_val = nested_form.find('.assignature-weeks').val();
    let teacher = nested_form.find('.selectpicker');
    let total_dedication = $('option:selected',teacher).data("total-dedication");

    let prep_perc = $("#preparation_percent").val();
    let cons_perc = $("#consultation_percent").val();

    preparation.val( (implem_val * (prep_perc / 100)).toFixed(2) )
    consultation.val( (weeks_val * (total_dedication * (cons_perc / 100)) ).toFixed(2) )
  });
  updateAssignatureTotalCredit(context);
});

// Calc and update consultation on weeks change
$(document)
.on('change', '.assignature-weeks', function() {
  var context = $(this);
  jQuery(function() {
    let nested_form = context.parents(".nested-fields");
    let weeks_val = context.val()
    let consultation = nested_form.find('.assignature-consultation');
    let teacher = nested_form.find('.selectpicker');
    let total_dedication = $('option:selected',teacher).data("total-dedication");
    let cons_perc = $("#consultation_percent").val();

    consultation.val( (weeks_val * (total_dedication * (cons_perc / 100)) ).toFixed(2) )
  });

  updateAssignatureTotalCredit(context);
});

// Calc and update total credit
function updateAssignatureTotalCredit(context){

  jQuery(function() {
    let nested_form = context.parents(".nested-fields");
    let total_credit = nested_form.find('.assignature-total-credit');
    let implementation = nested_form.find('.assignature-implementation').val();
    let preparation = nested_form.find('.assignature-preparation').val();
    let consultation = nested_form.find('.assignature-consultation').val();

    total_credit.text( (parseFloat(implementation) + parseFloat(preparation) + parseFloat(consultation)).toFixed(2));
  });
}