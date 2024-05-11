$('button').click(function (event) {
  $("#change-password-form").addClass("was-validated");
  $('#RequestDiv').show();
  var ajaxRequest;
  event.preventDefault();
  $("#result").html('');
  var values = $('#change-password-form').serialize();

  ajaxRequest = $.ajax({
    url: "include/do_post.php?do=change_password",
    type: 'post',
    data: $('#change-password-form').serialize(),
    dataType: 'json',
    success: 'success'
  });

  ajaxRequest.done(function (response) {
    if (response['response'] == 'ok') {
      $("#result").html('<div class="alert alert-success alert-dismissible"><button type="button" class="btn-close" data-bs-dismiss="alert"></button> ' + response['message'] + '</div>');
      $('#RequestDiv').hide();
      $('#change-password-form')[0].reset();
    } else {
      $("#result").html('<div class="alert alert-danger alert-dismissible"><button type="button" class="btn-close" data-bs-dismiss="alert"></button> ' + response['message'] + '</div>');
      $('#RequestDiv').hide();
    }
  });
});
