$(document).ready(function () {

  $(".edit").addClass('disabled');
  
  $("#rooms").change(function () {
    $(".edit").addClass('btn-outline-primary bi bi-floppy').removeClass('btn-outline-success btn-outline-danger disabled');
    var option = $("select#rooms option").filter(":selected").val();
    $.ajax({
      type: 'POST',
      dataType: 'json',
      data: {"select": $('#rooms').val()},
      url: "include/do_post.php?do=admin_rooms",
      cache: false,
      success: function (response) {
        $("#name").val(response['NAME']);
        $("#description").val(response['DESCRIPTION']);
        $("#facilities").val(response['FACILITIES']);
        $("#maxlotation").val(response['MAX_LOTATION']);
        $("#imgsrc").val(response['IMG_SRC']);
        $("#imgalt").val(response['IMG_ALT']);
        $("#language").val(response['LANGUAGE']);
        $("#type").val(response['TYPE']);
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
      url: "include/do_post.php?do=save_admin_rooms",
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


$('#addroombtn').click(function () {
  $.ajax({
    type: 'POST',
    dataType: 'json',
    data: {
    "roomname": $("#addroomname").val(),
    "roomdescription": $("#addroomdescription").val(),
    "roomfacilities": $("#addroomfacilities").val(), 
    "roommaxlotation": $("#addroommaxlotation").val(),
    "roomimgsrc": $("#addroomimgsrc").val(),
    "roomimgalt": $("#addroomimgalt").val(),
    "roomtype": $("#addroomtype").val(), 
    "roomlanguage":  $("#addroomlanguage").val()
    },
    url: "include/do_post.php?do=admin_room_add_room",
    cache: false,
    success: function (response) {
      if (response['success'] == 'true') {
       window.location.reload();
      } else {
        alert(response['error']);
        $("#addroombtn").addClass('btn-outline-danger').removeClass('btn-outline-primary');
      }
    }
  });
});

$("#deleteroomselect").change(function () {
  var option = $("select#deleteroomselect option").filter(":selected").val();
  $.ajax({
    type: 'POST',
    dataType: 'json',
    data: {"select": option},
    url: "include/do_post.php?do=admin_rooms",
    cache: false,
    success: function (response) {
      $("#deleteroomname").val(response['NAME']);
      $("#deleteroomdescription").val(response['DESCRIPTION']);
      $("#deleteroomfacilities").val(response['FACILITIES']);
      $("#deleteroommaxlotation").val(response['MAX_LOTATION']);
      $("#deleteroomimgsrc").val(response['IMG_SRC']);
      $("#deleteroomimgalt").val(response['IMG_ALT']);
      $("#deleteroomlanguage").val(response['LANGUAGE']);
      $("#deleteroomtype").val(response['TYPE']);
    }
  });
});
  
$('#deleteroombtn').click(function () {
var option = $("select#deleteroomselect option").filter(":selected").val();
  $.ajax({
    type: 'POST',
    dataType: 'json',
    data: {"id": option},
    url: "include/do_post.php?do=admin_room_delete_room",
    cache: false,
    success: function (response) {
      if (response['success'] == 'true') {
      $(".form-select option[value="+option+"]").remove();
      $("#deleteroomname").val('');
      $("#deleteroomdescription").val('');
      $("#deleteroomfacilities").val('');
      $("#deleteroommaxlotation").val('');
      $("#deleteroomimgsrc").val('');
      $("#deleteroomimgalt").val('');
      $("#deleteroomtype").val('');
      } else {
        alert(response['error']);
        $("#deleteroombtn").addClass('btn-outline-danger disabled').removeClass('btn-outline-primary');
      }
    }
  });
});

$("#cloneroombtn").click(function () {
  var clone = ['name', 'description', 'facilities', 'maxlotation', 'imgsrc', 'imgalt', 'type', 'language'];
  Object.keys(clone).forEach(function (key) {
    $("#addroom" + clone[key]).val($("#" + clone[key]).val());
  });
  $("#nav-addroom-tab").click()
});
