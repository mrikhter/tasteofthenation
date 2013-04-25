$(function () {
  $('ul.restaurants input[type=checkbox]').change(function(){
    var c = this.checked ? true : false;
    $.post('/user_restaurants/update_status', { user_restaurant_id: this.id, attended: c }, function(percent) {
      $('.percent').html(percent);
    });
  });
});

$(function () {
  $('ul.bars input[type=checkbox]').change(function(){
    var c = this.checked ? true : false;
    $.post('/user_bars/update_status', { user_bar_id: this.id, attended: c }, function(data) {
    });
  });
});

