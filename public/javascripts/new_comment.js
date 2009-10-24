$(function() {
  $('#comment_submit').click(function() {
    $(this).attr('disabled', true).val('Please wait...');
    $(this).closest('form').submit();
  })
});