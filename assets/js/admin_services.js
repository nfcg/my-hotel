$(document).ready(function () {
  $(".edit").addClass('disabled');

  $("#services").change(function () {

    $(".edit").addClass('btn-outline-primary bi bi-floppy').removeClass('btn-outline-success btn-outline-danger disabled');
    var option = $("select#services option").filter(":selected").val();

    $.ajax({
      type: 'POST',
      dataType: 'json',
      data: {"select": $('#services').val()},
      url: "include/do_post.php?do=admin_services",
      cache: false,
      success: function (response) {
        $("#name").val(response['NAME']);
        $("#description").val(response['DESCRIPTION']);
        $("#imgsrc").val(response['IMG_SRC']);
        $("#imgalt").val(response['IMG_ALT']);
        $("#language").val(response['LANGUAGE']);

        var btn_id = $('.edit').prop('id')
        $('#' + btn_id).prop('id', option);
      }
    });
  });

  $('.edit').click(function () {
    var btn_id = $('.edit').prop('id')
    var btn_column = $(this).attr("column")

    var btn_text = $(this).attr('textvalue')
    var btn_txt = $("#" + btn_text).val()

    $.ajax({
      type: 'POST',
      dataType: 'json',
      data: {"select": btn_id, "column": btn_column, "value": btn_txt},
      url: "include/do_post.php?do=save_admin_services",
      cache: false,
      success: function (response) {
        if (response['success'] == 'true') {
          $("[textvalue='" + btn_text + "']").addClass('bi bi-check-square btn-outline-success disabled').removeClass('bi bi-floppy bi-x-square btn-outline-primary');
        } else {
          $("[textvalue='" + btn_text + "']").addClass('bi bi-x-square btn-outline-danger disabled').removeClass('bi bi-floppy btn-outline-primary');
        }
      }
    });
  });
});

$('#addservicebtn').click(function () {
$("#addservice_form").addClass("was-validated");
  $.ajax({
    type: 'POST',
    dataType: 'json',
    data: {
    "servicename": $("#addservicename").val(),
    "servicedescription": $("#addservicedescription").val(),
    "serviceimgsrc": $("#addserviceimgsrc").val(),
    "serviceimgalt": $("#addserviceimgalt").val(),
    "servicelanguage":  $("#addservicelanguage").val()
    },
    url: "include/do_post.php?do=admin_service_add_service",
    cache: false,
    success: function (response) {
      if (response['success'] == 'true') {
       //window.location.reload();
      } else {
        alert(response['error']);
        $("#addservicebtn").addClass('btn-outline-danger').removeClass('btn-outline-primary');
      }
    }
  });
});

$("#deleteserviceselect").change(function () {
  var option = $("select#deleteserviceselect option").filter(":selected").val();
  $.ajax({
    type: 'POST',
    dataType: 'json',
    data: {"select": option},
    url: "include/do_post.php?do=admin_services",
    cache: false,
    success: function (response) {
      $("#deleteservicename").val(response['NAME']);
      $("#deleteservicedescription").val(response['DESCRIPTION']);
      $("#deleteserviceimgsrc").val(response['IMG_SRC']);
      $("#deleteserviceimgalt").val(response['IMG_ALT']);
      $("#deleteservicelanguage").val(response['LANGUAGE']);
    }
  });
});
  
$('#deleteservicebtn').click(function () {
var option = $("select#deleteserviceselect option").filter(":selected").val();
  $.ajax({
    type: 'POST',
    dataType: 'json',
    data: {"id": option},
    url: "include/do_post.php?do=admin_service_delete_service",
    cache: false,
    success: function (response) {
      if (response['success'] == 'true') {
      $(".form-select option[value="+option+"]").remove();
      $("#deleteservicename").val('');
      $("#deleteservicedescription").val('');
      $("#deleteserviceimgsrc").val('');
      $("#deleteserviceimgalt").val('');
      } else {
        alert(response['error']);
        $("#deleteservicebtn").addClass('btn-outline-danger disabled').removeClass('btn-outline-primary');
      }
    }
  });
});

$("#cloneservicebtn").click(function () {
  $("#addservicename").val($("#name").val() + ' (Clone)');
  $("#addservicedescription").val($("#description").val());
  $("#addserviceimgsrc").val($("#imgsrc").val());
  $("#addserviceimgalt").val($("#imgalt").val());
  $("#addservicelanguage").val($("#language").val());
  $("#nav-addservice-tab").click()
});
