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
        }
      }
    }
  
  $("#editor-image").on('change', function (e) {
  var reader = new FileReader();
  reader.onload = function (e) {
      $("#select-image").attr('src', e.target.result);
  }
  reader.readAsDataURL(e.target.files[0]);
  });

  
  
});