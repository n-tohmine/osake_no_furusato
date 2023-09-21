$(function() {
  //編集押下
  $(document).on("click", '.js-edit-review-button', function(e) {
    e.preventDefault();
    const editReviewId = $(this).data("review-id")
    switchToEdit(editReviewId)
  })
  //キャンセル押下
  $(document).on("click", '.js-button-edit-review-cancel', function() {
    clearErrorMessages()
    const editReviewId = $(this).data("review-id")
    switchToLabel(editReviewId)
  })
  //更新押下
  $(document).on("click", '.js-button-review-update', function(event) {
    const $button = $(event.target);
    if ($button.prop("disabled")) {
      return;
    }
    $button.prop("disabled", true); 
    clearErrorMessages()
      const editReviewId = $button.data("review-id")
      submitReview($("#js-textarea-review-" + editReviewId).val(), editReviewId)
        .then(result => {
            $("#js-review-" + result.review.id).html(result.review.content.replace(/\r?\n/g, '<br>'))
            switchToLabel(result.review.id)
        })
        .catch(result => {
            const editReviewId = result.responseJSON.review.id
            const messages = result.responseJSON.errors.messages
            showErrorMessages(editReviewId, messages)
        })
        .finally(() => {
          $button.prop("disabled", false);
        });
  })
    //更新用設定
    function submitReview(content, editReviewId) {
      return new Promise(function(resolve, reject) {
          $.ajax({
              type: 'PATCH',
              url: '/reviews/' + editReviewId,
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
  function switchToLabel(editReviewId) {
      $("#js-textarea-review-box-" + editReviewId).hide()
      $("#js-review-" + editReviewId).show()
  }
  //編集フォーム表示
  function switchToEdit(editReviewId) {
      $("#js-review-" + editReviewId).hide()
      $("#js-textarea-review-box-" + editReviewId).show()
  }
  //エラーメッセージ表示
  function showErrorMessages(editReviewId, messages) {
      $('<p class="error_messages text-danger">' + messages.join('<br>') + '</p>').insertBefore($("#js-textarea-review-" + editReviewId))
  }
   //エラーメッセージ削除
  function clearErrorMessages() {
    $("p.error_messages").remove()
  }
});
