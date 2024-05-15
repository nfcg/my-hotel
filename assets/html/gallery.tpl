<!-- Container -->
<div class="px-4 container-fluid mt-3">
  <div class="col-lg">
  
    <h2 class="text-primary fw-bold ms-1">{$PAGE_GALLERY_HEADING}</h2>
    <h4 class="ms-3 mb-5 text-secondary fw-bold">{$PAGE_GALLERY_DESCRIPTION}</h4> {foreach $gallery_list as $value_list} <div class="row row-cols-1 row-cols-md-1 g-7 mx-2">
    
      <h3 class="text-primary fw-bold mb-2 shadow bg-body rounded py-1">{$value_list.GAL_NAME}</h3>
      <div class="card-group mb-5 d-flex flex-wrap shadow p-1 bg-body rounded">
       {foreach $images as $value}{if $value_list.GAL_NAME eq $value.GAL_NAME}<div class="card text-dark bg-light">
          <a href="{$value.IMG_SRC}" data-toggle="lightbox" data-gallery="{$value_list.GAL_NAME}">     
           <img class="card-img-top mx-auto img-fluid" src="{$value.IMG_SRC}" alt="{$value.IMG_ALT}">
          </a>      
          <div class="card-body">
            <p class="card-text">{$value.DESCRIPTION}</p>
          </div>
       </div> 
       {/if}{/foreach}</div>
      </div>
    {/foreach}
    
  </div>
</div>

