<!-- Container -->
<div class="px-4 container-fluid mt-3">
  <div class="col-lg">
  
    <h2 class="text-primary fw-bold ms-1">{$PAGE_ROOMS_HEADING}</h2>
    <h4 class="ms-3 mb-5 text-secondary fw-bold">{$PAGE_ROOMS_DESCRIPTION}</h4>
    
    {foreach $rooms as $value}
     <div class="card mb-3 shadow p-1 bg-body rounded">
      <div class="row g-0">
        <div class="col-md-4">
          <img src="{$value.IMG_SRC}" class="img-fluid rounded-start" alt="{$value.IMG_ALT}">
        </div>
        <div class="col-md-8">
          <div class="card-body">
            <h3 class="card-title text-primary fw-bold">&num;&#xfe0f; {$value.NAME}</h3>
            <p class="card-text" style="white-space: pre-wrap">{$value.DESCRIPTION}</p>
            <div class="accordion accordion-flush" id="accordion_{$value.TYPE}">
              <div class="accordion-item">
                <h2 class="accordion-header">
                  <button class="accordion-button collapsed text-muted fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#flush-{$value.TYPE}" aria-expanded="false" aria-controls="flush-{$value.TYPE}"> {$FACILITIES} </button>
                </h2>
                <div id="flush-{$value.TYPE}" class="accordion-collapse collapse" aria-labelledby="flush-{$value.TYPE}" data-bs-parent="#accordion{$value.TYPE}">
                  <div class="accordion-body">
                    <ul class="list-group list-group-flush"> {$value.FACILITIES} </ul>
                  </div>
                </div>
              </div>
            </div>
            <div class="mb-1 text-center">
              <a class="btn btn-outline-primary fw-bold" href="?page=booking" role="button"> {$BOOK_NOW} </a>
            </div>
            <p class="card-body text-end fw-bold">
              <small class="text-muted">
                <i class="bi bi-person-fill"> {$MAX_LOTATION}: {$value.MAX_LOTATION}</i>
              </small>
            </p>
          </div>
        </div>
      </div>
    </div>
   {/foreach}
   
  </div>
</div>

