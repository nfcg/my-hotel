<!-- Container -->
<div class="px-4 container-fluid mt-3">
  <div class="col-lg">
  
    <h2 class="text-primary fw-bold ms-1">{$PAGE_SERVICES_HEADING}</h2>
    <h4 class="ms-3 mb-5 text-secondary fw-bold">{$PAGE_SERVICES_DESCRIPTION}</h4> 
    
   {foreach $services as $value}
    <div class="card mb-3 shadow p-1 bg-body rounded">    
      <div class="row g-0">
        <div class="col-md-4">
          <img src="{$value.IMG_SRC}" class="img-fluid rounded-start" alt="{$value.IMG_ALT}">
        </div>
        <div class="col-md-8">
          <div class="card-body">
            <h3 class="card-title text-primary fw-bold">{$value.NAME}</h3>
            <p class="card-text" style="white-space: pre-wrap">{$value.DESCRIPTION}</p>
          </div>
        </div>
      </div>
    </div>
   {/foreach}
    
  </div>
</div>

