$(document).ready(function () {
  const url = new URL($(location).attr('href'));
  const id = url.searchParams.get("id");
  const uuid = url.searchParams.get("uuid");

  $.ajax({
    url: 'include/do_post.php?do=my_dencrypt',
    data: {
      id: id,
      uuid: uuid
    },
    dataType: 'json',
    success: function (outputfromserver) {
      $('#cc_number').val(outputfromserver[4]);
      $('#cc_expire').val(outputfromserver[1]);
      $('#cc_cvc').val(outputfromserver[2]);
      $("#booking_n").append(outputfromserver[3]);
    }
  });
});

document.getElementById("btnPrint").onclick = function () {
    printElement(document.getElementById("printThis"));
}

function printElement(elem) {
    var domClone = elem.cloneNode(true);
    
    var $printSection = document.getElementById("printSection");
    
    if (!$printSection) {
        var $printSection = document.createElement("div");
        $printSection.id = "printSection";
        document.body.appendChild($printSection);
    }
    
    $printSection.innerHTML = "";
    $printSection.appendChild(domClone);
    // alert($(printSection).html());
    window.print();
}
