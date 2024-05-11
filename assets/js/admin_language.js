$(document).ready(function () {
  $.ajaxSetup({ cache: false });
  
  $("#select_language").change(function () {
    var option = $("select#select_language option").filter(":selected").val();

    $('#table').bootstrapTable('refresh', {
      url: 'include/do_post.php?do=json_language&language=' + option,
    });

    $(function () {
      $('#table').bootstrapTable();
      $.fn.editable.defaults.params = function (params) {
        params.language = option;
        return params;
      };
      
      $.fn.editable.defaults.mode = 'inline';
      $.fn.editableform.buttons = '<button type="submit" class="btn btn-success btn-sm editable-submit"><i class="bi bi-floppy"></i></button><button           type="button" class="btn btn-danger btn-sm editable-cancel"><i class="bi bi-x-lg"></i></button>';
      
    });
    
  });
  
});
