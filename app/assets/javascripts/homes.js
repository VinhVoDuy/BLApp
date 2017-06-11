jQuery(document).ready(function(){
  jQuery('.swipebox').swipebox({hideCloseButtonOnMobile : false});
  jQuery('#book-now-btn').on('click', function(){
    HotelRunnerWidget.show(null);
  });

});
