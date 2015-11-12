$(function() {
	var $top = $('.toTop');
	var $window = $(window);
	$top.hide();
	$window.scroll(function() {
		$(this).scrollTop() > $window.height() ? $top.show() : $top.hide();
	});

	$top.on('click', function() {
		$('html, body').animate({scrollTop: 0}, 700);
	});
})