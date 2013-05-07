$(function () {
  $('ul.restaurants input[type=checkbox]').change(function(){
    var c = this.checked ? true : false;
    $.post('/user_restaurants/update_status', { user_restaurant_id: this.id, attended: c }, function(percent) {
      $('.percent').html(percent);
    });
  });


  $('ul.bars input[type=checkbox]').change(function(){
    var c = this.checked ? true : false;
    $.post('/user_bars/update_status', { user_bar_id: this.id, attended: c }, function(data) {
    });
  });


  $("a.accordion-toggle").click(function (){
    $(this).children().eq(0).toggleClass('icon-chevron-right icon-chevron-down');
  });
});
