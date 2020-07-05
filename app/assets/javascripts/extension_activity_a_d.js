$(document)
.on('cocoon:after-insert', '.teacher_extension_activities', function(e, added_task) {
  $('.selectpicker').selectpicker({dropupAuto: false});
})

$(document).on('change', '#activity-type', function() {
  let implementation = document.getElementById("implementation").value; 
  let calc_preparation = $(this).find(':selected').data('prep');
  let calc_type = $(this).find(':selected').data('prep-calc');

  if (!implementation) {
    document.getElementById("implementation").value = 0;
    implementation = 0
  }
  if (calc_preparation) {
    document.getElementById("implementation").readOnly = false;
    // Set evaluation value on input
    document.getElementById("evaluation").value = $(this).find(':selected').data('evaluation');

    // Check which calc of preparation do
    if(calc_type == "porcentaje"){
      document.getElementById("preparation").value = implementation * calc_preparation / 100;  
    }else{
      document.getElementById("preparation").value = calc_preparation;
    }
    document.getElementById("credit").value = parseFloat(implementation) + parseFloat(document.getElementById("preparation").value) + parseFloat(document.getElementById("evaluation").value);   
  }else{
    document.getElementById("implementation").readOnly = true;
  }
 
});//End on change event

$(document).on('change', '#implementation', function() {
  let calc_type = $("#activity-type").find(':selected').data('prep-calc');
  let calc_preparation = $("#activity-type").find(':selected').data('prep');
  let implementation = document.getElementById("implementation").value
  if(calc_type == "porcentaje"){
    document.getElementById("preparation").value = implementation * calc_preparation  / 100;
  }
  document.getElementById("credit").value = parseFloat(implementation) + parseFloat(document.getElementById("preparation").value) + parseFloat(document.getElementById("evaluation").value);
});