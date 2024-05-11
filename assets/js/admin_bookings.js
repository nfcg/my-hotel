new tempusDominus.TempusDominus(document.getElementById('CHECK_IN'), {
  display: {
        icons: {
        type: 'icons',
        time: 'bi bi-clock',
        date: 'bi bi-calendar-week',
        up: 'bi bi-arrow-up',
        down: 'bi bi-arrow-down',
        previous: 'bi bi-chevron-left',
        next: 'bi bi-chevron-right',
        today: 'bi bi-calendar-check',
        clear: 'bi bi-trash',
        close: 'bi bi-x'
      },
    theme: 'auto',
    viewMode: 'calendar',
    components: {
      calendar: true,
        date: false,
        month: true,
        year: true,
        decades: false,
        clock: false,
        hours: false,
        minutes: false,
        seconds: false,
      useTwentyfourHour: undefined
    },
  },
  localization: {
    format: 'yyyy-MM',
    locale: lang,
    maxWeekdayLength: '3'
  },
   restrictions: {
    //minDate: new Date(),
  },
});

var $table = $('#table')

function operateFormatter(value, row, index) {
  var GET_ID = JSON.stringify(row.ID);
  return ['<button class="booking btn btn-primary" data-bs-toggle="modal" data-bs-target="#bookingModal" data-bs-booking="' + GET_ID + '"><i class="bi bi-eye"></i></button>']
}

window.operateEvents = {}

var bookingModal = document.getElementById('bookingModal')

bookingModal.addEventListener('show.bs.modal', function (event) {
  $("#table").on("click", "td", function () {
    var parentTr = $(this).closest('tr');
    var NAME = parentTr.find('td:eq(1)').text();
    var PHONE = parentTr.find('td:eq(2)').text();
    var EMAIL = parentTr.find('td:eq(3)').text();
    var CHECK_IN = parentTr.find('td:eq(4)').text();
    var CHECK_OUT = parentTr.find('td:eq(5)').text();
    var ROOM_TYPE = parentTr.find('td:eq(6)').text();
    var DOUBLE_BED = parentTr.find('td:eq(7)').text();
    var COMMENTS = parentTr.find('td:eq(8)').text();
    var STATUS = parentTr.find('td:eq(9)').text();
    var DATE = parentTr.find('td:eq(10)').text();

    var button = event.relatedTarget

    var recipient = button.getAttribute('data-bs-booking')

    var modalTitle = bookingModal.querySelector('.modal-title')
    var modalBodyNAME = bookingModal.querySelector('.modal-name')
    var modalBodyPHONE = bookingModal.querySelector('.modal-phone')
    var modalBodyEMAIL = bookingModal.querySelector('.modal-email')
    var modalBodyCHECK_IN = bookingModal.querySelector('.modal-checkin')
    var modalBodyCHECK_OUT = bookingModal.querySelector('.modal-checkout')
    var modalBodyROOM_TYPE = bookingModal.querySelector('.modal-roomtype')
    var modalBodyDOUBLE_BED = bookingModal.querySelector('.modal-doublebed')
    var modalBodyCOMMENTS = bookingModal.querySelector('.modal-comments')
    var modalBodySTATUS = bookingModal.querySelector('.modal-status')
    var modalBodyDATE = bookingModal.querySelector('.modal-date')

    var BOOKING = book; 

    modalTitle.textContent = BOOKING + ' Nº: ' + recipient + '-' + DATE.substr(0, 4)
    modalBodyNAME.textContent = NAME
    modalBodyPHONE.textContent = PHONE
    modalBodyEMAIL.textContent = EMAIL
    modalBodyCHECK_IN.textContent = CHECK_IN
    modalBodyCHECK_OUT.textContent = CHECK_OUT
    modalBodyROOM_TYPE.textContent = ROOM_TYPE
    modalBodyDOUBLE_BED.textContent = DOUBLE_BED
    modalBodyCOMMENTS.textContent = COMMENTS
    modalBodySTATUS.textContent = STATUS
    modalBodyDATE.textContent = DATE
  })
});

$(document).ready(function() {
    $("#btnPrint").click(function(){
        printElement(document.getElementById("printThis"));
    }); 
});

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
