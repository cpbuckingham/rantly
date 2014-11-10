$(document).ready(function () {
  $('#new_rant .button').on('click', function (event) {
    event.preventDefault();
    var userId = $(this).data('userId');
    var title = $('#rant_title').val();
    var content = $('#rant_content').val();
    var newRant = {rant: {title: title, content: content}};
    var promiseOfResult = $.post('/users/' + userId + '/rants', newRant);
    promiseOfResult.success(function (data) {
      if (data.errors) {
        $.each(data.errors, function(index, error) {
          $('.errors').append("<br>" + error + "<br>");
        })
      } else {
        location.reload();
      }
    });
  })
});
