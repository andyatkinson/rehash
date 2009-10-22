// state for the theme selection is stored served side. send theme selection to server, if successful update 
// the stylesheet source. subsequent page loads will load the new current theme stylesheet path from the server.
$(function() {
  $('.themes a.theme').click(function(e) {
    e.preventDefault();
    var overlay = $(this).parent('li').find('.overlay');
    overlay.show();
    var theme_name = $(this).attr('title');
    var base_uri = $(this).attr('href').split(/(.+)(\?)/)[1]; // get the base URI
    var ajaxUrl = base_uri + '.json';
    $.get(ajaxUrl, {'theme_name':theme_name}, function(data) {
      if(data == 'success') {
        $('link[rel=stylesheet theme]').attr('href', '/stylesheets/'+theme_name+'.css');
      }
      overlay.hide();
    });
  });
});