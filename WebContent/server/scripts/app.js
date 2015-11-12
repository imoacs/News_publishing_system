$(function() {

	var block = $('.block');
	// message start
	$('.item-msg').click(function() {
		block.hide();
		var $message = $('.message');

		$.ajax({
			type: 'GET',
			url: './message.xml',
			dataType: 'xml',
			success: function(xml) {
				$(xml).find('message').each(function() {
					var $this = $(this);
					var id = $this.attr('id');
					var isRead = $this.attr('isRead');
					var title = $this.children('title').text();
					var content = $this.children('content').text();
					var from = $this.children('from').text();
					var to = $this.children('to').text();
					var time = $this.children('time').text();
					var str = '';
					str += '<article>';
					str += '<h3>' + title + '</h3>';
					str += '<p>' + content + '</p>';
					str += '<div class="wrap">' + '<span class="left">' + from + '</span>' + '<span class="right">' + time + '</span>' + '</div>';
					str += '</article>';
					$message.append(str).show();
				});
			}
		});

	});
	// message end


	// form select 
	var select = $('.select'),
			select_ul = $('.select ul'),
			list = $('.select ul li'),
			span = $('.select span');
	select.on('click', function() {
		select_ul.toggleClass('show');	
	});
	list.on('click', function() {
		var value = $(this).text();
		span.html(value);
	});

	// form ajax

	var title = $('#title').val(),
			span_html = span.html(),
			message = $('#message').val(),
			item_pub = $('.item-pub'),
			publish_article = $('.publish-article'),
			publish_btn = $('.publish-btn');

	item_pub.on('click', function() {
		block.hide();
		publish_article.show();
	});

	publish_btn.on('click', function() {

		$.ajax({
			method: 'POST',
			url: 'example.jsp', // 记得换掉哦
			data: {
				title: title,
				editor: span_html,
				message: message
			},
			success: function() {
				$('.tip').html('success');
			}
		});
	});

});
