$(function() {
  $('#password').hide().before("<a href='#' class='change_password'>Change site password</a>");
  $('.change_password').click(function(e) {
    e.preventDefault();
    $('#password').slideToggle();
  });
});