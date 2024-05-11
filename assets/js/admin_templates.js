$(document).ready(function () {
  $.ajaxSetup({ cache: false });
  $("#templates").change(function () {
    var option = $("select#templates option").filter(":selected").val();
    $.get("assets/html/" + option, function (html_string) {
      $("textarea#templatetextarea").val(html_string);
    }, 'html');
  });
});

$('#savetemplatebtn').click(function () {
  var option = $("select#templates option").filter(":selected").val();
  $.ajax({
    type: 'POST',
    dataType: 'json',
    data: {"template": $("#templatetextarea").val(), "file": option},
    url: "include/do_post.php?do=admin_save_template",
    cache: false,
    success: function (response) {
      if (response['success'] == 'true') {
        window.location.reload();
      } else {
        alert(response['error']);
        $("#addservicebtn").addClass('btn-outline-danger').removeClass('btn-outline-primary');
      }
    }
  });
});
