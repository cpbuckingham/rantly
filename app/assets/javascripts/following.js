$(document).ready(function () {

  $('body').on('click', '.follow-button', function (event) {
    event.preventDefault();
    var button = this;
    var toggleFollowButton = function () {
      $(button).removeClass('follow-button').addClass('unfollow-button').empty()
        .append('Unfollow');
    };
    var id = $(this).data('id');
    var promiseOfResultFollow = $.post("/users/" + id + "/follows", {follow_id: id});
    promiseOfResultFollow.success(toggleFollowButton($(this)));
  });

  $('body').on('click', '.unfollow-button', function (event) {
    event.preventDefault();
    console.log(event);

    var id = $(this).data('id');
    var url = "/users/" + id + "/follows/" + id;
    console.log(url);
    var promiseOfResultUnfollow = $.ajax({
                                  url: url,
                                  type: "DELETE"});
    promiseOfResultUnfollow.success(toggleUnfollowButton($(this)));
  });

  var toggleUnfollowButton = function (button) {
    console.log(button);
    button.empty().append('Follow').removeClass('unfollow-button')
      .addClass('follow-button');
  };
});