$(function() {  
  $("#editor-image").on('change', function (e) {
  var reader = new FileReader();
  reader.onload = function (e) {
      $("#select-image").attr('src', e.target.result);
  }
  reader.readAsDataURL(e.target.files[0]);
  });
});