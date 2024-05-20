$("#booking_button").click(function (response) {
  $("#booking").addClass("was-validated");
  var o = $("#booking").serialize();
  return $.ajax({
    type: "POST",
    url: "include/do_post.php?do=booking",
    data: o,
    dataType: "json",
    success: function (response) {
      "ok" == response.response ? ($("#booking_button").html('<button class="m-3 btn btn-primary btn-lg btn-block" type="button" disabled><span class="spinner-border spinner-border" role="status"></span></button>'), setTimeout(function () {
        $("#error").html('<div class="alert alert-success"><span class=""></span>' + response.message + '</div>'), $("#booking").hide()
      }, 1e2)) : $("#error").fadeIn(1e3, function () {

        $("#error").html('<div class="alert alert-danger alert-dismissible fade show" role="alert"><strong>Warning! </strong>' + response.message + ' !<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"><span aria-hidden="true"></span></button></div>')

      })
    }
  }), !1
});

new tempusDominus.TempusDominus(document.getElementById('check_in'), {
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
      clock: false,
      hours: false,
      minutes: false,
      seconds: false,
      useTwentyfourHour: undefined
    },
  },
  localization: {
    format: 'dd-MM-yyyy',
    locale: lang,
    maxWeekdayLength: '3'
  },
   restrictions: {
    minDate: new Date(),
  },
});

new tempusDominus.TempusDominus(document.getElementById('check_out'), {
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
      clock: false,
      hours: false,
      minutes: false,
      seconds: false,
      useTwentyfourHour: undefined
    },
  },
  localization: {
    format: 'dd-MM-yyyy',
    locale: lang,
    maxWeekdayLength: '3'
  },
   restrictions: {
    minDate: new Date(Date.now() + (60 * 60 * 24 * 1000)),
  },
});

$(document).ready(function () {
  $("#check_out").change(function () {
   $("#pax_div").show()
   $("#room_type").val("").change();
  })
  
  $("#check_in").change(function () {
   $("#room_type").val("").change();
  })
  
  $("#room_type").change(function () {
   "double" === $("#room_type").val() || "double_extra_bed" === $("#room_type").val() ? $("#double_bed_div").show() : $("#double_bed_div").hide(),
   $("#flname_div").show(), 
   $("#h_cc_div").show(), 
   $("#cc_div").show(), 
   $("#div_canc_pol").show(), 
   $("#h_flname_div").show(),
   $("#price_div").show()

  ajaxRequest = $.ajax({
    url: "include/do_post.php?do=booking_price",
    type: 'post',
    data: $('#booking').serialize(),
    dataType: 'json',
    success: 'success'
  });

  ajaxRequest.done(function (response) {
      $("#price_div").html(response['message']);

  });

  })
  
});
