$(function() {
	$('#babel-stone').click(function() {
		$('.zhrr-st').each(function() {
			$(this).text($(this).data('text'));
		});
		$('body').css('font-family', 'BabelStone Han');
	});
	
	$('#safe-font').click(function() {
		$('.zhrr-st').each(function() {
			$(this).text($(this).data('alt'));
		});
		$('body').css('font-family', 'PingFang SC');
	});
});