{assign var="page" value="{$smarty.get.page|lower|replace:'-':'_'}" nocache}
{$spanleftsize = ['admin_rooms','admin_calendar','admin_services', 'admin_gallery']}
 <head>
    <title>{$MY_HOTEL} | {$page_name}</title>
  
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="{$PAGE_DESCRIPTION}">
    
    <meta property="og:locale" content="{$html_lang}">
    <meta property="og:type" content="website">
    <meta property="og:title" content="{$MY_HOTEL} | {$page_name}">
    <meta property="og:description" content="{$PAGE_DESCRIPTION}">
    <meta property="og:site_name" content="{$MY_HOTEL}">
    {if $seo_links eq 'true'}<meta property="og:url" content="{$http}://{$domain}/{$smarty.get.page}">
    {else}<meta property="og:url" content="{$http}://{$domain}/?page={$page}">{/if}    
    <meta name="twitter:title" content="{$MY_HOTEL} | {$page_name}">
    <meta name="twitter:description" content="{$PAGE_DESCRIPTION}">
    <meta name="twitter:label1" content="Written by">
    <meta name="twitter:data1" content="nfcg">

     <!-- Popper JS -->
      <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
      
     <!-- jquery JS -->
      <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>      
    
     <!-- bootstrap JS -->
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
   
     <!-- bootstrap CSS -->
      {if $theme eq 'default'}<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
      {else}<link rel="stylesheet" href="assets/css/bootswatch/dist/{$theme}/bootstrap.min.css">{/if}
      
     <!-- bootstrap-icons CSS -->
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
      
     {if {$page} == 'booking' || {$page} == 'admin_bookings' || {$page} == 'admin_calendar'}
     <!-- tempus-dominus JS -->
      <script src="https://cdn.jsdelivr.net/npm/@eonasdan/tempus-dominus@6.9.9/dist/js/tempus-dominus.min.js"></script>  

     <!-- tempus-dominus CSS -->
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@eonasdan/tempus-dominus@6.9.9/dist/css/tempus-dominus.min.css">{/if}

     {if {$page} == 'admin_bookings' || {$page} == 'admin_calendar' || {$page} == 'admin_language'}
     <!-- bootstrap-table CSS -->
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-table@1.22.6/dist/bootstrap-table.min.css">

     <!-- bootstrap-table JS -->           
      <script src="https://cdn.jsdelivr.net/npm/bootstrap-table@1.22.6/dist/bootstrap-table.min.js"></script>
      
     <!-- bootstrap-table-editable JS -->      
      <script src="https://cdn.jsdelivr.net/npm/bootstrap-table@1.22.6/dist/extensions/editable/bootstrap-table-editable.js"></script>

     <!-- x-editable CSS -->
      <link rel="stylesheet" href="assets/bootstrap5-editable/css/bootstrap-editable.css" media="all">
      
     <!-- x-editable JS --> 
      <script src="assets/bootstrap5-editable/js/bootstrap-editable.js"></script>

     <!-- bootstrap-table-filter-control JS --> 
      <script src="https://cdn.jsdelivr.net/npm/bootstrap-table@1.22.6/dist/extensions/filter-control/bootstrap-table-filter-control.min.js"></script>
      
     <!-- tableExport JS --> 
     <script src="https://cdn.jsdelivr.net/npm/tableexport.jquery.plugin@1.30.0/tableExport.min.js"></script>
     
     <!-- bootstrap-table-export JS --> 
      <script src="https://cdn.jsdelivr.net/npm/bootstrap-table@1.22.6/dist/extensions/export/bootstrap-table-export.min.js"></script>{/if}
    
     {if {$page} == 'admin_bookings'}<!-- page-admin_bookings CSS -->
      <link rel="stylesheet" href="assets/css/admin_bookings.css" media="all">{/if}   
     
     {if {$page} == 'admin_language'}<!-- page-admin_bookings CSS -->
      <link rel="stylesheet" href="assets/css/admin_language.css" media="all">{/if}   
     
     {if {$page} == 'cc'}<!-- page-cc CSS -->
      <link rel="stylesheet" href="assets/css/cc.css" media="all">{/if}

    {if in_array({$page}, $spanleftsize)}<style>     
      .spanleftsize {
        width: 135px;
      }      
    </style>{/if}
    
    <style>
      @import url('https://fonts.googleapis.com/css2?family={$FONT}&display=swap');
      body { --bs-body-font-family: '{$FONT}'; }
    </style>

    {if {$page} == 'admin_calendar' || {$page} == 'admin_bookings' || {$page} == 'admin_language'}<style>
      .pagination-info { 
        content:""; 
        display:none; 
        clear:both;
      }
           
      .editable-clear-x {
        content:""; 
        display:none; 
        clear:both; 
        background:none;
      }
      
      th.tr {
        background: #0d6efd;
        color: white;
        text-align: center;
      }
      </style>{/if}
      
    {if {$page} == 'gallery'}<style>
      .card:hover {
        opacity: 0.7;
      }
      </style>{/if}
      
    {if {$page} == 'login' || {$page} == 'admin_change_password'}<style>
      .bi-eye-slash {
        color: blue;
        font-size: 24px;
        position: absolute;
        z-index: 200;
        top: 12px;
        right: 12px;
        cursor: pointer;
      }
      </style>{/if}

    {if {$page} == 'booking' || {$page} == 'login' || {$page} == 'admin_change_password'}<script>{literal} 
          (function () {
            'use strict'
            var forms = document.querySelectorAll('.needs-validation')
            Array.prototype.slice.call(forms)
              .forEach(function (form) {
                form.addEventListener('submit', function (event) {
                  if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                  }
                  form.classList.add('was-validated')
                }, false)
              })
          })()
    {/literal}</script>{/if}

    {if {$page} == 'admin_bookings' || {$page} == 'admin_calendar'}<script>{literal}    
      $(function () {
        $('#table').bootstrapTable();

        $.fn.editable.defaults.mode = 'inline';
        $.fn.editableform.buttons = '<button type="submit" class="btn btn-success btn-sm editable-submit"><i class="bi bi-floppy"></i></button><button           type="button" class="btn btn-danger btn-sm editable-cancel"><i class="bi bi-x-lg"></i></button>';
      });
    {/literal}</script>{/if}

 </head>

