$(document).ready(function () {

  $(".edit").addClass('disabled');

  $("#editimage").change(function () {
    $(".edit").addClass('btn-outline-primary bi bi-floppy').removeClass('btn-outline-success btn-outline-danger disabled');
    var option = $("select#editimage option").filter(":selected").val();

    $.ajax({
      type: 'POST',
      dataType: 'json',
      data: {"select": $('#editimage').val()},
      url: "include/do_post.php?do=admin_gallery",
      cache: false,
      success: function (response) {
        $("#galname").val(response['GAL_NAME']);
        $("#description").val(response['DESCRIPTION']);
        $("#imgsrc").val(response['IMG_SRC']);
        $("#imgalt").val(response['IMG_ALT']);
        $("#type").val(response['TYPE']);
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
      url: "include/do_post.php?do=save_admin_gallery",
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

$('#addimgbtn').click(function () {
$("#addimage_form").addClass("was-validated");
  $.ajax({
    type: 'POST',
    dataType: 'json',
    data: {"imgdescription": $("#addimgdescription").val(), "imgsrc": $("#addimgsrc").val(), "imgalt": $("#addimgalt").val(), "imgtype": $("#addimgtype").val(), "imglanguage": $("#addimglanguage").val()},
    url: "include/do_post.php?do=admin_gallery_add_image",
    cache: false,
    success: function (response) {
      if (response['success'] == 'true') {
       //window.location.reload();
      } else {
        alert(response['error']);
        $("#addimgbtn").addClass('btn-outline-danger').removeClass('btn-outline-primary');
      }
    }
  });
});

$('#addgallery').click(function () {
$("#addgallery_form").addClass("was-validated");
  $.ajax({
    type: 'POST',
    dataType: 'json',
    data: {"galleryname": $("#addgalleryname").val(), "gallerytype": $("#addgallerytype").val(), "gallerylanguage":  $("#addgallerylanguage").val()},
    url: "include/do_post.php?do=admin_gallery_add_gallery",
    cache: false,
    success: function (response) {
      if (response['success'] == 'true') {
       //window.location.reload();
      } else {
        alert(response['error']);
        $("#addgallery").addClass('bi bi-x-square btn-outline-danger disabled').removeClass('bi bi-floppy btn-outline-primary');
      }
    }
  });
});

$("#deleteimageselect").change(function () {
  var option = $("select#deleteimageselect option").filter(":selected").val();
  $.ajax({
    type: 'POST',
    dataType: 'json',
    data: {"select": option},
    url: "include/do_post.php?do=admin_gallery",
    cache: false,
    success: function (response) {
      $("#deleteimagegalname").val(response['GAL_NAME']);
      $("#deleteimagedescription").val(response['DESCRIPTION']);
      $("#deleteimageimgsrc").val(response['IMG_SRC']);
      $("#deleteimageimgalt").val(response['IMG_ALT']);
      $("#deleteimagetype").val(response['TYPE']);
    }
  });
});
  
$('#deleteimagebtn').click(function () {
var option = $("select#deleteimageselect option").filter(":selected").val();
  $.ajax({
    type: 'POST',
    dataType: 'json',
    data: {"id": option},
    url: "include/do_post.php?do=admin_gallery_delete_image",
    cache: false,
    success: function (response) {
      if (response['success'] == 'true') {
      $(".form-select option[value="+option+"]").remove();
      $("#deleteimagegalname").val('');
      $("#deleteimagedescription").val('');
      $("#deleteimageimgsrc").val('');
      $("#deleteimageimgalt").val('');
      $("#deleteimagetype").val('');
      } else {
        $("#addimage").addClass('bi bi-x-square btn-outline-danger disabled').removeClass('bi bi-floppy btn-outline-primary');
      }
    }
  });
});

$('#uploadimage').click(function (e) {
  e.preventDefault();
  $.ajax({
    url: "include/do_post.php?do=upload_image",
    type: "POST",
    data: new FormData($('#form')[0]),
    contentType: false,
    cache: false,
    processData: false,
    beforeSend: function () {
      $("#preview").fadeOut();
      $("#err").fadeOut();
    },
    success: function (data) {
      if (data == 'invalid') {
        $("#err").html("Invalid File !").fadeIn();
      } else {
        $("#preview").html(data).fadeIn();
        $("#form")[0].reset();
      }
    },
    error: function (e) {
      $("#err").html(e).fadeIn();
    }
  });
});

$("#clone").click(function(){
$("#addimgname").val($("#galname").val() + ' (Clone)');
$("#addimgdescription").val($("#description").val());
$("#addimgsrc").val($("#imgsrc").val());
$("#addimgalt").val($("#imgalt").val());
$("#addimglanguage").val($("#language").val());
$("#addimgtype").val($("#type").val());
$("#nav-addimage-tab").click()
});
