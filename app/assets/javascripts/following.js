$(document).ready(function () {

  $('body').on('click', '.follow-button', function (event) {
    event.preventDefault();
    var toggleFollowButton = function () {
      button.removeClass('follow-button').addClass('unfollow-button').empty()
        .append('Unfollow');
    };

    var id = $(this).parents('.rant').first().data('user');
   debugger;
    var promiseOfResult = $.get("/" + id + "/follow", {follow_id: id});
    promiseOfResult.success(toggleFollowButton($(this)));
  });

  $('body').on('click', '.unfollow-button', function () {
    var toggleUnfollowButton = function (button) {
      console.log(button);
      button.empty().append('Follow').removeClass('unfollow-button')
        .addClass('follow-button');
    };

    var id = $(this).parents('.rant').first().data('user');
    var promiseOfResult = $.get("/" + id + "/unfollow", {follow_id: id});
    promiseOfResult.success(toggleUnfollowButton($(this)));
  })
});