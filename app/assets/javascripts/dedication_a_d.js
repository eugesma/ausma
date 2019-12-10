// Events on input quantity
$(document)
.on('change', '.quantity', function() {
  var quant = $(this);
  jQuery(function() {
    var nested_form = quant.parents(".nested-fields");
    if(quant.val() == '' ){
      quant.val('0');
      nested_form.find('.total-credit').html('0');
    }else{
      nested_form.find('.total-credit').html(quant = quant.val() * $("#dedication_credit").val());
    }
  });
});

$(document)
.on('preparation', '.consultation', '.implementation', function() {
  var event = $(this);
  jQuery(function() {
    var nested_form = event.parents(".nested-fields");
    var preparation = nested_form.find('.preparation');
    var consultation = nested_form.find('.consultation');
    var implementation = nested_form.find('.implementation');

    if(quant.val() == '' ){
      quant.val('0');
      nested_form.find('.total-credit').html('0');
    }else{
      nested_form.find('.total-credit').html(preparation.val() + consultation.val() + implementation.val());
    }
  });
});