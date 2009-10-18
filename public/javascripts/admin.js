$(function() {
  $('.login').click(function(e) {
    e.preventDefault();
    $('#admin-area').fadeOut('slow', function() {
      location.href = e.target.href;
    });
  })
  
  // trigger focus on login page
  if($('.new_session #password').length > 0) {
    $('.new_session #password').focus();
    $('.new_session #password').css('background', '#FAEBD7');
  }
});
