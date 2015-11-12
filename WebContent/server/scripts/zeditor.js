$(function() {
	var status = 0,
		position = "zeditor",
		block = $('.block'),
		judge = $('.judge'),
		judgement = $('.judgement'),
		modify_status = 0,
		comment = 0,
		id,
		type,
		c1 = $('.c1'),
		c2 = $('.c2'),
		c3 = $('.c3'),
		c1c = $('.c1c'),
		c2c = $('.c2c'),
		c3c = $('.c3c');
	
	block.hide();
	
	judge.on('click', function() {			
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
				judgement.empty();
				block.hide();
				judgement.append(message).show();
			}
		});
	});
	
	c1.on('click', function() {	
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
				c1c.empty();
				block.hide();
				c1c.append(message).show();
			}
		});
	});
	
	c2.on('click', function() {	
		status = 4,
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
				c2c.empty();
				block.hide();
				c2c.append(message).show();
			}
		});
	});
	
	c3.on('click', function() {	
		status = 5,
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
				c3c.empty();
				block.hide();
				c3c.append(message).show();
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
			if($('.modal-bg .recommend:checked')){
				modify_status = 5;
			}
			else{				
				modify_status = 4;
			}
			$('.modal-bg .reason-msg').hide();
			$('.modal-bg').show();
			$('.modal-bg .recommend').show();
			$('.modal-bg label').show();
		});
		
		self.children('.dispass-btn').one('click', function() {
			$('.confirm-text').html('这篇新闻不能通过的原因？');
			modify_status = 3;
			$('.modal-bg .recommend').hide();
			$('.modal-bg label').hide();
			$('.modal-bg').show();
			$('.modal-bg .reason-msg').show();
		});
	});
	
	$('.modal-bg .btn-group .ok-btn').on('click', function() {	
		comment = $('.modal-bg .reason-msg').val();
		$('.modal-bg').hide();
		$('.modal-bg .reason-msg').val("");
		$('.modal-bg .recommend').removeAttr("checked");
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
		$('.modal-bg .recommend').removeAttr("checked");
	});
	
});