$(function() {
  function buildHTML(comment){
    let html = `<div class = "comment">
                  <p class = "comment__text">
                    ${comment.text}
                  </p>
                  <div class = "comment__info">
                    <p class = "comment__info__user-name">
                      ${comment.user_name}
                      さん
                    </p>
                    <p class = "comment__info__date">
                      ${comment.date}
                    </p>
                  </div>
                </div>`
    return html;
  }
  
  $("#new_comment").on("submit", function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr("action")
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: "json",
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $(".comments").append(html);
      $(".comment__form--input").val("");
      $(".comments").animate({ scrollTop: $(".comments")[0].scrollHeight});
      $(".comment__form--btn").prop("disabled", false);
    })
    .fail(function(data){
      alert('エラーが発生したためメッセージは送信できませんでした。');
      $(".comment__form--btn").prop("disabled", false);
    })
  })


  $(".comment__form--btn").click(function() {
    let form = $(".comment__form--btn").offset().top;
    $('html, body').animate({scrollTop:form});
  });
});