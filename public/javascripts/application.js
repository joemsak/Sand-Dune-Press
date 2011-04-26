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
		var pageTotal = parseInt($('.page').length);
		if ($(this).hasClass('previous')) {
			if ($('.previous').hasClass('disabled')) {
				return false;
			} else {
				var currentId = $('#comic-page .show').attr('id');
				var previousId = '#' + (parseInt(currentId) - 1);
				var previousPage = parseInt(currentId) - 1;
				$('.page').removeClass('show');
				$(previousId).addClass('show');
				$('.currentpage').text(previousPage);
				$('#comic-nav a').removeClass('disabled');
				if (previousPage == 1) {
					$('.previous').addClass('disabled');
				}
			}
		}
		if ($(this).hasClass('next')) {
			if ($('.next').hasClass('disabled')) {
				return false;
			} else {
				var currentId = $('#comic-page .show').attr('id');
				var nextId = '#' + (parseInt(currentId) + 1);
				var nextPage = parseInt(currentId) + 1;
				$('.page').removeClass('show');
				$(nextId).addClass('show');
				$('.currentpage').text(nextPage);
				$('#comic-nav a').removeClass('disabled');
				if (nextPage == pageTotal) {
					$('.next').addClass('disabled');
				}
			}
		}
		return false;
	});
});