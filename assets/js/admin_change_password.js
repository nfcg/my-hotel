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

const toggle_cur_password = document.querySelector('#toggle_cur_password');
const cur_password = document.querySelector('#cur_password');
toggle_cur_password.addEventListener('click', () => {
  const type = cur_password.getAttribute('type') === 'password' ? 'text' : 'password';
  cur_password.setAttribute('type', type);
  this.classList.toggle('bi-eye');
});

const toggle_new_password = document.querySelector('#toggle_new_password');
const new_password = document.querySelector('#new_password');
toggle_new_password.addEventListener('click', () => {
  const type = new_password.getAttribute('type') === 'password' ? 'text' : 'password';
  new_password.setAttribute('type', type);
  this.classList.toggle('bi-eye');
});

const toggle_confirm_password = document.querySelector('#toggle_confirm_password');
const confirm_password = document.querySelector('#confirm_password');
toggle_confirm_password.addEventListener('click', () => {
  const type = confirm_password.getAttribute('type') === 'password' ? 'text' : 'password';
  confirm_password.setAttribute('type', type);
  this.classList.toggle('bi-eye');
});


