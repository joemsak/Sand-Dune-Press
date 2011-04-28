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
		});
		return false;
	});
});