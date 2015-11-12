$(function() {
	'use strict';
	var position = "reporter",
		id,
		type,
		block = $('.block'),
		n_msg = $('.n-msg'),
		o_msg = $('.o-msg'),
		new_message = $('.new-message'),
		old_message = $('.old-message'),
		pubItem = $('.pub'),
		pubForm = $('.pub-form'),
		a1 = $('.a1'),
		a2 = $('.a2'),
		a3 = $('.a3'),
		a1c = $('.a1c'),
		a2c = $('.a2c'),
		a3c = $('.a3c');
	block.hide();
	// message start
	n_msg.on('click', function() {	
		$.ajax({
			method: 'GET',
			url: 'include/modules/new_message.jsp',
			dateType: 'json',
			data: {
				username: $('.avatar p').text(),
				position: position,
			},
			success:function(data) {
				new_message.empty();
				block.hide();
				new_message.append(data).show();
			}
		});
	});
	new_message.on('click', '.read-btn', function() {
		id = $(this).attr("id");
		type = $(this).attr("type");
		$.ajax({
			method: 'POST',
			url: 'include/modules/read.jsp',
			dateType: 'json',
			data: {
				type: type,
				id: id,
			},
			success:function() {
				n_msg.click();
			}
		});
	});
	o_msg.on('click', function() {	
		$.ajax({
			method: 'GET',
			url: 'include/modules/old_message.jsp',
			dateType: 'json',
			data: {
				username: $('.avatar p').text(),
				position: position,
			},
			success:function(data) {
				old_message.empty();
				block.hide();
				old_message.append(data).show();
			}
		});
	});
	// message end

	// form select
	var selectEditor = $('.slct-et'),
			selectUl = $('.slct-et ul'),
			list = $('.slct-et ul li'),
			span = $('.slct-et span');

	selectEditor.click( function() {
		selectUl.toggleClass('show');
	});

	list.click(function() {
		var value = $(this).text();
		span.html(value);
	});
	pubItem.click(function() {
		block.hide();
		pubForm.show();
	});

	a1.on('click', function() {	
		status = "0,1",
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
				a1c.empty();
				block.hide();
				a1c.append(message).show();
			}
		});
	});
	a2.on('click', function() {	
		status = "2,3",
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
				a2c.empty();
				block.hide();
				a2c.append(message).show();
			}
		});
	});
	a3.on('click', function() {	
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
				a3c.empty();
				block.hide();
				a3c.append(message).show();
			}
		});
	});

});
