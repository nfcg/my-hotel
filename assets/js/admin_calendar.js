$("button#addyearbtn").click(function(e){
e.preventDefault();
    $.ajax({
      type: 'POST',
      dataType: 'json',
      data: $('form#add_year_form').serialize(),
      url: "include/do_post.php?do=add_year",
      cache: false,
      beforeSend: function() {
      $("#addyearbtn").addClass('d-none');
      $("#pw").removeClass('d-none');
      },
      success: function (response) {
        if (response['success'] == 'true') {
          $("#pw").addClass('d-none');
          $("#addyearbtn").removeClass('d-none');
          $("#success").addClass('alert alert-success alert-dismissible');
          $("#success").html('<button type="button" class="btn-close" data-bs-dismiss="alert"></button> Year Added Successfully' );
        } else {
          $("#addyearbtn").removeClass('d-none');
          $("#pw").addClass('d-none');
          $("#error").addClass('alert alert-danger alert-dismissible');
          $("#error").html('<button type="button" class="btn-close" data-bs-dismiss="alert"></button> ' + response['error'] );
        }
      }
    });
});

$("button#bulkupdate").click(function(e){
e.preventDefault();
    $.ajax({
      type: 'POST',
      dataType: 'json',
      data: $('form#bulkupdate_form').serialize(),
      url: "include/do_post.php?do=bulkupdate_calendar",
      cache: false,
      beforeSend: function() {
      $("#success_bulk").removeClass('d-none');
      $("#error_bulk").removeClass('d-none');
      
      $("#bulkupdate").addClass('d-none');
      $("#pw_bulk").removeClass('d-none');
      },
      success: function (response) {
        if (response['success_bulk'] == 'true') {
          $("#pw_bulk").addClass('d-none');
          $("#bulkupdate").removeClass('d-none');
          $("#success_bulk").addClass('alert alert-success alert-dismissible');
          $("#success_bulk").html('<button type="button" class="btn-close" data-bs-dismiss="alert"></button> Bulk Update Successfully' );
        } else {
          $("#bulkupdate").removeClass('d-none');
          $("#pw_bulk").addClass('d-none');
          $("#error_bulk").addClass('alert alert-danger alert-dismissible');
          $("#error_bulk").html('<button type="button" class="btn-close" data-bs-dismiss="alert"></button> ' + response['error_bulk'] );
        }
      }
    });
});

new tempusDominus.TempusDominus(document.getElementById('date_from'), {
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
    minDate: new Date(),
  },
});

new tempusDominus.TempusDominus(document.getElementById('add_year'), {
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
        month: false,
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
    format: 'yyyy',
    locale: lang,
    maxWeekdayLength: '3'
  },
   restrictions: {
    minDate: new Date(),
  },
});

new tempusDominus.TempusDominus(document.getElementById('from'), {
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
    format: 'yyyy-MM-dd',
    locale: lang,
    maxWeekdayLength: '3'
  },
   restrictions: {
    minDate: new Date(),
  },
});

new tempusDominus.TempusDominus(document.getElementById('to'), {
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
    format: 'yyyy-MM-dd',
    locale: lang,
    maxWeekdayLength: '3'
  },
   restrictions: {
    minDate: new Date(Date.now() + (60 * 60 * 24 * 1000)),
  },
});

function rowStyle(row, index) {
  if ((row.STATUS == 'closed') || (row.AVAILABILITY == '0')) {
    return {
      css: {
        "background-color": "red", "color": "white", "font-weight": "bold"
      }
    };
  }
  return {}
}
  
  

