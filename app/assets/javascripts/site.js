$(document).on('turbolinks:load', function(){

		//Raty
    $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
    $('.rated').raty({ path: '/assets',
      readOnly: true,
      score: function() {
        return $(this).attr('data-score');
      }
    });

    //elevateZoom
    var width = $(window).width();
    if (width < 700) {
    		var position = 14
    	}
    	else {
    		var position = 10
    	};

    $('#image-zoom').elevateZoom({
    	zoomWindowPosition: position,
  		easing: "true",
  		borderSize: 0,
  		zoomWindowOffetx: -10
		});

});