<!-- Container -->
<div class="px-4 container-fluid mt-3">
  <div class="col-lg">
  
    <h2 class="text-primary fw-bold ms-1">{$PAGE_HOME_HEADING}</h2>
    <h4 class="ms-3 mb-5 text-secondary fw-bold">{$PAGE_HOME_DESCRIPTION}</h4>
    {$text}
    <div class="row flex-lg-row-reverse align-items-center py-3 px-3 mb-5">
      <div class="col-10 col-sm-8 col-lg-6">
        <img src="assets/img/hotel.jpg" class="shadow p-1 mb-5 bg-body rounded d-block mx-lg-auto img-fluid" alt="{$MY_HOTEL}" width="600" height="400" loading="lazy">
      </div>
      <div class="col-lg-6">
        <h6 class="text-primary display-6 fw-bold lh-1 mb-3">{$WELCOME_MY_HOTEL}</h6>
        <p class="lead" style="white-space: pre-wrap">{$INDEX_WELCOME_DESCRIPTION}</p>
      </div>
    </div>
    <div class="row flex-lg-row-reverse align-items-center py-2 px-3 mb-5">
      <div class="col-10 col-sm-8 col-lg-6">
        <img src="assets/img/room.jpeg" class="shadow p-1 mb-5 bg-body rounded d-block mx-lg-auto img-fluid" alt="{$ROOMS}" width="600" height="400" loading="lazy">
      </div>
      <div class="col-lg-6">
        <h6 class="text-primary display-6 fw-bold lh-1 mb-3">{$ROOMS}</h6>
        <p class="lead" style="white-space: pre-wrap">{$INDEX_ROOMS_DESCRIPTION}</p>
        <div class="d-grid gap-2 d-md-flex justify-content-md-start mt-5">
          <a href="{$link_booking}" class="btn btn-outline-primary px-4 me-md-2">{$BOOK_NOW}</a>
          <a href="{$link_rooms}" class="btn btn-outline-secondary px-4">{$VIEW_ALL}</a>
        </div>
      </div>
    </div>
    <div class="row flex-lg-row-reverse align-items-center py-2 px-3">
      <div class="col-10 col-sm-8 col-lg-6">
        <div class="container px-4 py-4" id="featured-3">
          <h2 class="text-secondary pb-2 border-bottom border-primary">{$MORE_ABOUT_OUR_SERVICES}</h2>
          <div class="row g-4 py-5 row-cols-1 row-cols-lg-3">
            <div class="feature col">
              <div class="feature-icon bg-primary bg-gradient">
                <img src="assets/img/restaurant.jpeg" class="shadow p-1 mb-5 bg-body d-block mx-lg-auto img-fluid" alt="{$RESTAURANT}">
              </div>
              <h4 class="mt-2 text-secondary">{$RESTAURANT}</h4>
              <p>{$INDEX_RESTAURANT_DESCRIPTION}</p>
            </div>
            <div class="feature col">
              <div class="feature-icon bg-primary bg-gradient">
                <img src="assets/img/gymnasium.jpeg" class="shadow p-1 mb-5 bg-body d-block mx-lg-auto img-fluid" alt="{$GYM_MASSAGES}">
              </div>
              <h4 class="mt-2 text-secondary">{$GYM_MASSAGES}</h4>
              <p>{$INDEX_GYM_MASSAGES_DESCRIPTION}</p>
            </div>
            <div class="feature col">
              <div class="feature-icon bg-primary bg-gradient">
                <img src="assets/img/transfer.jpeg" class="shadow p-1 mb-5 bg-body d-block mx-lg-auto img-fluid" alt="{$TRANSFER_SERVICE}">
              </div>
              <h4 class="mt-2 text-secondary">{$TRANSFER_SERVICE}</h4>
              <p>{$INDEX_TRANSFER_SERVICE_DESCRIPTION}</p>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-6">
        <h6 class="text-primary display-6 fw-bold lh-1 mb-3">{$SERVICES}</h6>
        <p class="lead" style="white-space: pre-wrap">{$INDEX_SERVICES_DESCRIPTION}</p>
        <div class="d-grid gap-2 d-md-flex justify-content-md-start mt-5">
          <a href="{$link_services}" class="btn btn-outline-primary px-4 me-md-2">{$VIEW_ALL}</a>
        </div>
      </div>
    </div>
    
  </div>
</div>

