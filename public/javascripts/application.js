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
		alert($(this).attr('class'));
		return false;
	});
});