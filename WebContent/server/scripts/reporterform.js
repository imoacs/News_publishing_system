$(function() {	
	var pubBtn = $('#btn-pub');
	
	pubBtn.on('click', function() {
		$.ajax({
			method: 'POST',
			url: 'create_news.jsp',
			dataType: 'html',
			data: {
				title: $('#articleTitle').val(),
				content: $('#editBox #content').html(),
				part: $('.part input[type="radio"]:checked').val()
			},
			success: function() {
				$('#articleTitle').val('');
				$('#editBox #content').html('');
				$('.part input[type="radio"]:checked').removeAttr("checked");
				$('.upload-msg').html('');
				$('.tip').html('success');
			}
		});
	});
});