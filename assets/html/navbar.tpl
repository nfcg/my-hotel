<!-- NavBar -->
<nav class="navbar navbar-expand-lg bg-primary navbar-dark navbar-fixed">

  <div class="container-fluid">

    <img src="assets/img/snoring-icon.svg" alt="{$MY_HOTEL}" width="30" height="24" class="d-inline-block align-text-top">

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
    
    <div class="collapse navbar-collapse" id="navbarContent">
    
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0 fw-bold">
        {nocache}{foreach $NAV_LINKS as $value}{if $page_name eq $value} 
        <li class="nav-item">
          <a class="nav-link disabled fs-4 text-muted" href="{$value@key}">{$value}</a>
        </li>        
        {else}<li class="nav-item">
          <a class="nav-link fs-5 text-white" href="{$value@key}">{$value}</a>
        </li>{/if}{/foreach}{/nocache} 
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle fs-5 text-white" href="#" role="button" data-bs-toggle="dropdown">&#x1f310; {$LANGUAGE}</a>
          <ul id="language" class="dropdown-menu dropdown-menu-dark"> 
            <li>
              {if $smarty.cookies.LANGUAGE eq 'pt_PT'}<a id="pt_PT" class="dropdown-item disabled fw-bold text-secondary">&#x1f1f5;&#x1f1f9; {$PORTUGUESE}</a>
              {else}<a id="pt_PT" class="dropdown-item fw-bold text-white">&#x1f1f5;&#x1f1f9; {$PORTUGUESE}</a>{/if}
            </li> 
            <li>
              {if $smarty.cookies.LANGUAGE eq 'en'}<a id="en" class="dropdown-item disabled fw-bold text-secondary">&#x1f1ec;&#x1f1e7; {$ENGLISH}</a>
              {else}<a id="en" class="dropdown-item fw-bold text-white">&#x1f1ec;&#x1f1e7; {$ENGLISH}</a>{/if}
            </li> 

          </ul>
        </li>
        {if isset($smarty.session.ID)}<li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle fs-5 text-white" href="#" role="button" data-bs-toggle="dropdown">{$ADM_MENU}</a>
          <ul class="dropdown-menu dropdown-menu-dark"> 
            {nocache}{foreach $ADM_LINKS as $value}{if $page_name eq $value}<li>
              <a class="dropdown-item disabled fw-bold text-secondary" href="{$value@key}">{$value}</a>
            </li> 
            {else} 
            <li>
              <a class="dropdown-item fw-bold text-white" href="{$value@key}">{$value}</a>
            </li>{/if}{/foreach}{/nocache} 
            <li class="mx-1">
              <hr class="dropdown-divider" style="height:1px; background:#FFFFFF;">
            </li>
            <li>
              <a class="dropdown-item fw-bold text-white" href="include/do_post.php?do=logout">{$LOGOUT}</a>
            </li>
          </ul>
        </li>{/if} 
        
        </ul>
        
    </div>
  </div>
</nav>

