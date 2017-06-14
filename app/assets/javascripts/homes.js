jQuery(document).ready(function(){
  jQuery('.swipebox').swipebox({hideCloseButtonOnMobile : false});

  jQuery('.bookable').on('click', function(e){
    jQuery.post('/set_time?room_id=' + $(this).data('room-id'));
    window.location.href = 'http://blue-river-hotel-3.hotelrunner.com/bv2/search';
  });

});
