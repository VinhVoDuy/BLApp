jQuery(document).ready(function(){
  jQuery('.swipebox').swipebox({hideCloseButtonOnMobile : false});

  jQuery('.bookable').on('click', function(e){
    jQuery.post('/set_time');
    window.location.href = 'http://blue-river-hotel-3.hotelrunner.com/bv2/search';
  });

});
