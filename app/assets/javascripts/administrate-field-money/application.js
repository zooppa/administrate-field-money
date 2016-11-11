//= require jquery.maskMoney.min

$(function() {
  $('.maskmoney').each(function() {
    // Apply the mask and trigger it
    $(this).maskMoney().trigger('mask');

    // Sync unmasked value with hidden field
    $(this).on('change keyup paste', function() {
      var unmaskedMoneyCents = $(this).maskMoney('unmasked')[0] * 100;
      $(this).siblings('[type="hidden"]').val(unmaskedMoneyCents);
    })
  });
});
