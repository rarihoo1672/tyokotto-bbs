$(function() {
  $("#editor-title").each(function () {
    $(this).bind('keyup', replaceMarkdown(this));
  });


  function replaceMarkdown(elm) {
    var v, old = elm.value;
    return function () {
      if (old != (v = elm.value)) {
      old = v;
      str = $(this).val();
      $("#marked-title").html(marked(str));
      }
    }
  }
});