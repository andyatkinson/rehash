$(function() {
  $('#comment_submit').click(function() {
    $(this).attr('disabled', true).parent().append('<span>Posting comment...</span>');
  })
});