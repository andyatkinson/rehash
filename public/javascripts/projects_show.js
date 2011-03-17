$(function() {
  $(".project .images .image a.group").fancybox({
    transitionIn: 'none',
    transitionOut: 'none',
    titlePosition: 'over',
    titleFormat: function(title, currentArray, currentIndex, currentOpts) {
      return '<span id="fancybox-title-over">Image ' +  (currentIndex + 1) + ' / ' + currentArray.length + ' ' + title + '</span>';
    }
  });
});