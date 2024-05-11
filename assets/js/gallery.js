var modal = $("#ImgModal");
var modalImg = modal.find('.modal-content');
var img = $(".Img");
var captionBox = $("#caption");

img.click(function () {
  modalImg.attr('src', $(this).attr('src'));
  captionBox.text($(this).attr('alt'));
  modal.show();
});

var modalCloser = $(".close");

modalCloser.click(function () {
  modal.hide();
});
