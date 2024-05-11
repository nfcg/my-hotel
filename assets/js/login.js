$('button').click(function (event) {
  $('#RequestDiv').show();
  var ajaxRequest;
  event.preventDefault();
  $("#result").html('');
  var values = $('#login-form').serialize();

  ajaxRequest = $.ajax({
    url: "include/do_post.php?do=login",
    type: 'post',
    data: $('#login-form').serialize(),
    dataType: 'json',
    success: 'success'
  });

  ajaxRequest.done(function (response) {
    if (response['response'] == 'ok') {
      $("#result").html('<div class="alert alert-success alert-dismissible"><button type="button" class="btn-close" data-bs-dismiss="alert"></button> ' + response['message'] + '</div>');
      $('#RequestDiv').hide();
      $("#login-form").trigger('reset');
      
      var testStr = response['message'];
      
      if(testStr.includes(domain)){
    window.location.replace(response['message']);
}else{
    window.location.replace('?page=admin_home');
}
      
      
      //window.location.replace(response['message'] );
      //window.history.back();
    } else {
      $("#result").html('<div class="alert alert-danger alert-dismissible"><button type="button" class="btn-close" data-bs-dismiss="alert"></button> ' + response['message'] + '</div>');
      $('#RequestDiv').hide();
    }
  });
});
