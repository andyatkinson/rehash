$(function() {
  var text = $('#search #q').val();
  $('#search #q').css('color', '#aaa');
  $('#search #q').val(text);
  $('#search #q').focus(function() {
    $(this).css('color', '#000');
    if($(this).val() == text) {$(this).val('')};
  });
  $('#search #q').blur(function() {
    $(this).css('color', '#aaa');
    if($(this).val() == '') {$(this).val(text)}
  });
});