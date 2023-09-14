$(function() {
  //編集押下
  $(document).on("click", '.js-edit-review-button', function(e) {
    e.preventDefault();
    const reviewId = $(this).data("review-id")
    switchToEdit(reviewId)
  })
  //キャンセル押下
  $(document).on("click", '.js-button-edit-review-cancel', function() {
    clearErrorMessages()
    const reviewId = $(this).data("review-id")
    switchToLabel(reviewId)
  })
  //更新押下
  $(document).on("click", '.js-button-review-update', function(event) {
    const $button = $(event.target);
    if ($button.prop("disabled")) {
      return;
    }
    $button.prop("disabled", true); 
    clearErrorMessages()
      const reviewId = $button.data("review-id")
      submitReview($("#js-textarea-review-" + reviewId).val(), reviewId)
        .then(result => {
            $("#js-review-" + result.review.id).html(result.review.content.replace(/\r?\n/g, '<br>'))
            switchToLabel(result.review.id)
        })
        .catch(result => {
            const reviewId = result.responseJSON.review.id
            const messages = result.responseJSON.errors.messages
            showErrorMessages(reviewId, messages)
        })
        .finally(() => {
          $button.prop("disabled", false);
        });
  })
  //更新用設定
  function submitReview(content, reviewId) {
    return new Promise(function(resolve, reject) {
      $.ajax({
        type: 'PATCH',
        url: '/reviews/' + reviewId,
        data: {
          review: {
            content: content,
            "authenticity_token": $("#authenticity_token").val()
            },
        },
        headers: {
          'X-CSRF-Token' : $('meta[name="csrf-token"]').attr('content')
        },
        }).done(function (result) {
            resolve(result)
        }).fail(function (result) {
            reject(result)
        });
    })
}
  //編集フォームを隠す
  function switchToLabel(reviewId) {
    $("#js-textarea-review-box-" + reviewId).hide()
    $("#js-review-" + reviewId).show()
  }
  //編集フォーム表示
  function switchToEdit(reviewId) {
    $("#js-review-" + reviewId).hide()
    $("#js-textarea-review-box-" + reviewId).show()
  }
  //エラーメッセージ表示
  function showErrorMessages(reviewId, messages) {
    $('<p class="error_messages text-danger">' + messages.join('<br>') + '</p>').insertBefore($("#js-textarea-review-" + reviewId))
  }
  //エラーメッセージ削除
  function clearErrorMessages() {
    $("p.error_messages").remove()
  }
});
