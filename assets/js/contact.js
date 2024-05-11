$('button').click(function(event) {
	$('#RequestDiv').show();
	var ajaxRequest;
	event.preventDefault();
	$("#result").html('');
	var values = $('#contact-form').serialize();

	ajaxRequest = $.ajax({
		url: "include/do_post.php?do=contact_us",
		type: 'post',
		data: $('#contact-form').serialize(),
		dataType: 'json',
		success: 'success'
	});

	ajaxRequest.done(function(response) {
		if (response['response'] == 'ok') {
			$("#result").html('<div class="alert alert-success"><span class=""></span> ' + response['message'] + '</div>');
			$('#RequestDiv').hide();
			$("#contact-form").trigger('reset');
		} else {
			$("#result").html('<div class="alert alert-danger alert-dismissible"><button type="button" class="btn-close" data-bs-dismiss="alert"></button> ' + response['message'] + '</div>');
			$('#RequestDiv').hide();
		}
	});
});
