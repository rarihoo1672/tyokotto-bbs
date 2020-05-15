$(function() {
    $("#editor-content").each(function () {
      $(this).bind('keyup', replaceMarkdown(this));
    });
  
  
    function replaceMarkdown(elm) {
      var v, old = elm.value;
      return function () {
        if (old != (v = elm.value)) {
        old = v;
        str = $(this).val();
        $("#marked-content").html(marked(str));
        $('html,body').animate({scrollTop: $('#marked-title').offset().top});
        }
      }
    }
});