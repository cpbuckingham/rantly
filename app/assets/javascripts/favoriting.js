$(document).ready(function () {
  $('.favorite-button').on('click', function () {
    var userId = $(this).data('user');
    var rantId = $(this).data('rant');
    var favoriteCount = $(this).data('fav-count');

    var toggleFavoriteButton = function (button) {
      favoriteCount += 1;
      button.empty().append(favoriteCount + ' - Unfavorite').removeClass('favorite-button')
        .addClass('unfavorite-button')
    };

    var promiseOfResult = $.get("/users/" + userId + "/rants/" + rantId + '/favorite');
    promiseOfResult.success(toggleFavoriteButton($(this)));
  });

  $('body').on('click', '.unfavorite-button', function () {
    var userId = $(this).data('user');
    var rantId = $(this).data('rant');
    var favoriteCount = $(this).data('fav-count');

    var toggleUnfavoriteButton = function (button) {
      button.empty().append(favoriteCount + ' - Favorite').removeClass('unfavorite-button')
        .addClass('favorite-button');
    };

    var promiseOfResult = $.get("/users/" + userId + "/rants/" + rantId + "/unfavorite");
    promiseOfResult.success(toggleUnfavoriteButton($(this)));
  });

});