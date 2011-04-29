$(document).ready(function() {
	if ($("#tweet").length) {
		$("#tweet").tweet({
			username: "schneiderik",
			count: 3,
			loading_text: "loading tweets..."
		});
	}
	$('.not-yet').click(function() {
		return false;
	});
	$('.not-yet').css('text-decoration', 'line-through');
	
	jQuery.fn.onImagesLoaded = function(_cb) { 
		return this.each(function() {
	 
			var $imgs = (this.tagName.toLowerCase()==='img')?$(this):$('img',this),
					_cont = this,
							i = 0,
			_done=function() {
				if( typeof _cb === 'function' ) _cb(_cont);
			};
	 
			if( $imgs.length ) {
				$imgs.each(function() {
					var _img = this,
					_checki=function(e) {
						if((_img.complete) || (_img.readyState=='complete'&&e.type=='readystatechange') )
						{
							if( ++i===$imgs.length ) _done();
						}
						else if( _img.readyState === undefined ) // dont for IE
						{
							$(_img).attr('src',$(_img).attr('src')); // re-fire load event
						}
					}; // _checki \\
	 
					$(_img).bind('load readystatechange', function(e){_checki(e);});
					_checki({type:'readystatechange'}); // bind to 'load' event...
				});
			} else _done();
		});
	};
	
	if ($('.page').length) {
		$('.page').onImagesLoaded(function(_img) {
    	$(_img).fadeIn(400).css('display', 'block');
  	});
  }
	
	$('#comic-nav a').click(function() {
		var nextComicId = $('#comic-page img').data('next');
		var previousComicId = $('#comic-page img').data('previous');
		if ($(this).hasClass('next')) {
			var url = '/comic_pages/' + nextComicId + '.js'
		} else {
			var url = '/comic_pages/' + previousComicId + '.js'
		}
		$.get(url, function(data) {
			$('#comic-page').html(data);
			var currentPage = $('#comic-page img').data('position');
			nextComicId = $('#comic-page img').data('next');
			previousComicId = $('#comic-page img').data('previous');
			$('.currentpage').html(currentPage);
			if (undefined == previousComicId) {
				$('.previous').addClass('disabled')
			} else { $('.previous').removeClass('disabled') }
			if (undefined == nextComicId) {
				$('.next').addClass('disabled')
			} else { $('.next').removeClass('disabled') }
			$('.page').onImagesLoaded(function(_img) {
    		$(_img).fadeIn(400).css('display', 'block');
    		var imageHeight = $(_img).height();
    		$('#comic-page').css('height', imageHeight);
  		});
		});
		return false;
	});
});