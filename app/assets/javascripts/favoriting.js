$(document).ready(function () {

  $('body').on('click', '.favorite-button', function (event) {
    event.preventDefault();
    var button = $(this);
    var userId = button.data('user');
    var rantId = button.data('rant');

    var toggleFavoriteButton = function (button) {
      button.empty().append(' Unfavorite').removeClass('favorite-button')
        .addClass('unfavorite-button')
    };

    var promiseOfResult = $.post("/users/" + userId + "/favorites", {rant_id: rantId});
    promiseOfResult.success(function(data) {
      button.data('fav', data.favorite_id);
      toggleFavoriteButton(button);
    });
  });

  $('body').on('click', '.unfavorite-button', function (event) {
    event.preventDefault();
    var userId = $(this).data('user');
    var favId = $(this).data('fav');

    var toggleUnfavoriteButton = function (button) {
      button.empty().append('Favorite').removeClass('unfavorite-button')
        .addClass('favorite-button');
    };
    var promiseOfResult = $.ajax ({
                                    url:  "/users/" + userId + "/favorites/" + favId,
                                    type: "DELETE"});
    promiseOfResult.success(toggleUnfavoriteButton($(this)));
  });
});

