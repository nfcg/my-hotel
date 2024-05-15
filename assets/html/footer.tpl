<!-- Footer --> 
{assign var="page" value="{$smarty.get.page|lower|replace:'-':'_'}" nocache}
<footer class="bg-primary py-4 mt-4">
  <div class="container px-5">
    <div class="row align-items-center justify-content-between flex-column flex-sm-row">
    
      <div class="col-auto">
        <div class="fs-6 m-0 text-dark fw-bold">{$COPYRIGHT} &copy; {$MY_HOTEL} {$SITE_START_YEAR}-{$CUR_YEAR} {$ALL_RIGHTS_RESERVED}</div>
      </div>
      
      <div class="col-auto fw-bold justify-content-between">
        <a class="fs-5 link-light" href="?page=privacy">{$PRIVACY}</a>
        <span class="text-white mx-1">&middot;</span>
        <a class="fs-5 link-light" href="?page=terms">{$TERMS}</a>
        <span class="text-white mx-1">&middot;</span>
        <a class="fs-5 link-light" href="?page=contact">{$CONTACT}</a>
      </div>
      
    </div>
  </div>
</footer>

      <script> var lang = "{$html_lang}"; var book = "{$BOOK}"; var domain = "{$domain}"; </script>

      {if {$page} == 'admin_gallery'}<!-- page-admin_gallery JS -->
      <script src="assets/js/admin_gallery.js"></script>{/if}

      {if {$page} == 'admin_templates'}<!-- page-admin_templates JS -->
      <script src="assets/js/admin_templates.js"></script>{/if}

      {if {$page} == 'cc'}<!-- page-cc JS -->
      <script src="assets/js/cc.js"></script>{/if}

      {if {$page} == 'contact'}<!-- page-contact JS -->
      <script src="assets/js/contact.js"></script>{/if}

      {if {$page} == 'gallery'}<!-- bs5-lightbox JS -->
      <script src="https://cdn.jsdelivr.net/npm/bs5-lightbox@1.8.3/dist/index.bundle.min.js"></script>{/if}

      {if {$page} == 'login'}<!-- page-login JS -->
      <script src="assets/js/login.js?domain=domain"></script>{/if}

      {if {$page} == 'admin_bookings'}<!-- page-admin_bookings JS -->
      <script src="assets/js/admin_bookings.js?lang=lang"></script>{/if}

      {if {$page} == 'admin_language'}<!-- page-admin_bookings JS -->
      <script src="assets/js/admin_language.js?lang=lang"></script>{/if}

      {if {$page} == 'admin_calendar'}<!-- page-admin_calendar JS -->
      <script src="assets/js/admin_calendar.js?lang=lang"></script>{/if}

      {if {$page} == 'admin_rooms'}<!-- page-admin_rooms JS -->
      <script src="assets/js/admin_rooms.js"></script>{/if}

      {if {$page} == 'admin_services'}<!-- page-admin_services JS -->
      <script src="assets/js/admin_services.js"></script>{/if}

      {if {$page} == 'booking'}<!-- page-booking JS -->
      <script src="assets/js/booking.js?lang=lang"></script>{/if}
      
      {if {$page} == 'admin_change_password'}<!-- admin-change-password JS -->
      <script src="assets/js/admin_change_password.js"></script>{/if}
      
<script>{literal}
$("#language a").click(function () {
  var language = $(this).attr('id');
  $.ajax({
    url: "include/do_post.php?do=change_language",
    type: "POST",
    dataType: 'json',
    data: {'language': language},
    success: function (data) {
      window.location.reload();
    }
  });
});
{/literal}</script>
