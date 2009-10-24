$(function() {
  $('#form_submit_button').click(function() {
    $(this).attr('disabled', true).val('Please wait...');
    $(this).closest('form').submit();
  })
});