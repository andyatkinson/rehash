$(function() {
  $('.login').click(function(e) {
    e.preventDefault();
    $('#admin-area').fadeOut('slow', function() {
      location.href = e.target.href;
    });
  })
});
