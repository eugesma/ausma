// Events on input quantity
$(document)
.on('change', '.quantity', function() {
  var quant = $(this);
  jQuery(function() {
    console.log("Entró");
    var nested_form = quant.parents(".nested-fields");
    if(quant.val() == '' ){
      quant.val('0');
      nested_form.find('.total-credit').html('0');
    }else{
      nested_form.find('.total-credit').html(quant = quant.val() * $("#dedication_credit").val());
    }
  });
})