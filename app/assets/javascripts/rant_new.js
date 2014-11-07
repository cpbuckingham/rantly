$(document).ready(function () {
    $('.new-rant').on('click', function () {

          var userId = $(this).data('user-id');
        var title = $('.rant-title').val();
        var content = $('.rant-content').val();
        var newRant = {rant: {title: title, content: content}};

          var promiseOfResult = $.post('/users/' + userId + '/rants', newRant);
        promiseOfResult.success(function (errors) {
            if (errors.errors) {
                $('.errors').html(errors.errors.base)
              } else {
                location.reload();
              }
          });
      })
  });
