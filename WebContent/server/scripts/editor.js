$(function() {
	var status = 0,
		position = "editor",
		block = $('.block'),
		judge = $('.judge'),
		judgement = $('.judgement'),
		modify_status = 0,
		comment = 0,
		id,
		type,
		b1 = $('.b1'),
		b2 = $('.b2'),
		b3 = $('.b3'),
		b4 = $('.b4'),
		b1c = $('.b1c'),
		b2c = $('.b2c'),
		b3c = $('.b3c'),
		b4c = $('.b4c');
	
	block.hide();
	
	judge.on('click', function() {	
		status = 0,
		$.ajax({
			method: 'GET',
			url: 'include/modules/status.jsp',
			dateType: 'json',
			data: {
				username: $('.avatar p').text(),
				position: position,
				status: status
			},
			success:function(message) {
				judgement.empty();
				block.hide();
				judgement.append(message).show();
			}
		});
	});
	
	b1.on('click', function() {	
		status = 2,
		$.ajax({
			method: 'GET',
			url: 'include/modules/status.jsp',
			dateType: 'json',
			data: {
				username: $('.avatar p').text(),
				position: position,
				status: status
			},
			success:function(message) {
				b1c.empty();
				block.hide();
				b1c.append(message).show();
			}
		});
	});
	
	b2.on('click', function() {	
		status = 1,
		$.ajax({
			method: 'GET',
			url: 'include/modules/status.jsp',
			dateType: 'json',
			data: {
				username: $('.avatar p').text(),
				position: position,
				status: status
			},
			success:function(message) {
				b2c.empty();
				block.hide();
				b2c.append(message).show();
			}
		});
	});
	
	b3.on('click', function() {	
		status = 3,
		$.ajax({
			method: 'GET',
			url: 'include/modules/status.jsp',
			dateType: 'json',
			data: {
				username: $('.avatar p').text(),
				position: position,
				status: status
			},
			success:function(message) {
				b3c.empty();
				block.hide();
				b3c.append(message).show();
			}
		});
	});
	
	b4.on('click', function() {	
		status = "4,5",
		$.ajax({
			method: 'GET',
			url: 'include/modules/status.jsp',
			dateType: 'json',
			data: {
				username: $('.avatar p').text(),
				position: position,
				status: status
			},
			success:function(message) {
				b4c.empty();
				block.hide();
				b4c.append(message).show();
			}
		});
	});
	judgement.on('click', '.article-wrap', function() {
		var self = $(this);
		id = self.attr("id");
		type = self.attr("type");
		self.children('article').children('.hidden-content').toggleClass('hide');
		self.children('.hidden-btn').toggleClass('hide');
		self.children('.hidden-support').toggleClass('hide');
		self.children('.pass-btn').one('click', function() {
			$('.confirm-text').html('确定通过这篇新闻？');
			modify_status = 1;
			$('.modal-bg .reason-msg').hide();
			$('.modal-bg').show();
		});
		
		self.children('.dispass-btn').one('click', function() {
			$('.confirm-text').html('这篇新闻不能通过的原因？');
			modify_status = 2;
			$('.modal-bg').show();
			$('.modal-bg .reason-msg').show();
		});
	});
	
	$('.modal-bg .btn-group .ok-btn').on('click', function() {
		comment = $('.modal-bg .reason-msg').val();
		console.log(comment);
		$('.modal-bg').hide();
		$('.modal-bg .reason-msg').val("");
		$.ajax({
			method: 'POST',
			url: 'include/modules/modify.jsp',
			dateType: 'json',
			data: {
				type: type,
				id: id,
				status: modify_status,
				comment: comment
			},
			success:function() {
				judge.click();
			}
		});
	});
	
	$('.modal-bg .btn-group .cancel-btn').on('click', function() {
		
		$('.modal-bg').hide();
		$('.modal-bg .reason-msg').val("");
	});
	
});