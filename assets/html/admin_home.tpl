<!-- Container -->
<div class="px-4 container-fluid mt-3">
  <div class="col-lg">
  
    <h2 class="ms-1">{$PAGE_ADM_HOME_HEADING}</h2>
    <h5 class="ms-3 mb-5 text-secondary fw-bold">{$PAGE_ADM_HOME_DESCRIPTION}</h5>
    
    <div class="row">
      <div class="col-sm-7 p-2">
        <div class="card shadow bg-body rounded">
          <div class="card-header text-white bg-primary fw-bold"> Welcome to Admin Area </div>
          <div class="card-body">
            <h5 class="card-title ms-1 text-secondary fw-bold">{$YOUR_INFORMATION}</h5>
            <div class="row">
              <div class="col-4 text-primary fw-bold">{$USER}:</div>
              <div class="col-6">{$smarty.session.USER}</div>
            </div>
            <div class="row">
              <div class="col-4 text-primary fw-bold">{$USER_NAME}:</div>
              <div class="col-6">{$smarty.session.USER_NAME}</div>
            </div>
            <div class="row">
              <div class="col-4 text-primary fw-bold">{$USER_TYPE}:</div>
              <div class="col-6">{$smarty.session.USER_TYPE}</div>
            </div>
            <div class="row">
              <div class="col-4 text-primary fw-bold">E-Mail:</div>
              <div class="col-6">{$smarty.session.USER_EMAIL}</div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-sm-5 p-1">
        <div class="p-1 col-md-auto">
          <div class="p-1">
            <div class="card shadow bg-body rounded">
              <div class="card-header text-white bg-primary fw-bold"> CHECK-IN <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"> {$check_in_today|@count} <span class="visually-hidden">CHECK-IN {$TODAY}</span>
                </span>
              </div>
              <div class="card-body">
                <div class="accordion accordion-flush " id="accordionFlushCHECK-IN">
                  <div class="accordion-item">
                    <h2 class="accordion-header" id="flush-headingCHECK-IN">
                      <button class="card-title fw-bold accordion-button collapsed text-secondary" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseCHECK-IN" aria-expanded="false" aria-controls="flush-collapseCHECK-IN"> CHECK-IN {$TODAY} </button>
                    </h2>
                    <div id="flush-collapseCHECK-IN" class="accordion-collapse collapse" aria-labelledby="flush-headingCHECK-IN" data-bs-parent="#accordionFlushCHECK-IN">
                      <div class="accordion-body">
                        <ul class="list-group list-group-flush">                          
                          {foreach $check_in_today as $value}<li class="list-group-item">
                            <div class="row">
                              <div class="col-4 text-primary fw-bold">{$value.NAME}</div>
                              <div class="col-3 fw-lighter">{$value.CHECK_IN}</div>
                              <div class="col-3 fw-lighter">{$value.CHECK_OUT}</div>
                              <div class="col-2 fw-lighter">{$value.ID}-{$value.DATE}</div>
                            </div>
                          </li>{/foreach}                          
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="p-1 col-md-auto">
          <div class="p-1">
            <div class="card shadow bg-body rounded">
              <div class="card-header text-white bg-primary fw-bold"> CHECK-OUT <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"> {$check_out_today|@count} <span class="visually-hidden">CHECK-OUT {$TODAY}</span>
                </span>
              </div>
              <div class="card-body">
              
                <div class="accordion accordion-flush" id="accordionFlushCHECK-OUT">
                  <div class="accordion-item">
                    <h2 class="accordion-header" id="flush-headingCHECK-OUT">
                      <button class="card-title fw-bold accordion-button collapsed text-secondary" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseCHECK-OUT" aria-expanded="false" aria-controls="flush-collapseCHECK-OUT"> CHECK-OUT {$TODAY} </button>
                    </h2>
                    <div id="flush-collapseCHECK-OUT" class="accordion-collapse collapse" aria-labelledby="flush-headingCHECK-OUT" data-bs-parent="#accordionFlushCHECK-OUT">
                      <div class="accordion-body">
                        <ul class="list-group list-group-flush">                        
                          {foreach $check_out_today as $value}<li class="list-group-item">
                            <div class="row">
                              <div class="col-4 text-primary fw-bold">{$value.NAME}</div>
                              <div class="col-3 fw-lighter">{$value.CHECK_IN}</div>
                              <div class="col-3 fw-lighter">{$value.CHECK_OUT}</div>
                              <div class="col-2 fw-lighter">{$value.ID}-{$value.DATE}</div>
                            </div>
                          </li>{/foreach}
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
                
              </div>
            </div>
          </div>
        </div>
        <div class="p-1 col-md-auto">
          <div class="p-1">
            <div class="card shadow bg-body rounded">
              <div class="card-header text-white bg-primary fw-bold"> {$NEW_BOOKINGS} <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"> {$recent_bookings|@count} <span class="visually-hidden">{$RECENT_BOOKINGS}</span>
                </span>
              </div>
              <div class="card-body">

                <div class="accordion accordion-flush" id="accordionFlushRECENT_BOOKINGS">
                  <div class="accordion-item">
                    <h2 class="accordion-header" id="flush-headingRECENT_BOOKINGS">
                      <button class="card-title fw-bold accordion-button collapsed text-secondary" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseRECENT_BOOKINGS" aria-expanded="false" aria-controls="flush-collapseRECENT_BOOKINGS"> {$RECENT_BOOKINGS} </button>
                    </h2>
                    <div id="flush-collapseRECENT_BOOKINGS" class="accordion-collapse collapse" aria-labelledby="flush-headingRECENT_BOOKINGS" data-bs-parent="#accordionFlushRECENT_BOOKINGS">
                      <div class="accordion-body">
                        <ul class="list-group list-group-flush">                        
                          {foreach $recent_bookings as $value}<li class="list-group-item">
                            <div class="row">
                              <div class="col-4 text-primary fw-bold">{$value.NAME}</div>
                              <div class="col-3 fw-lighter">{$value.CHECK_IN}</div>
                              <div class="col-3 fw-lighter">{$value.CHECK_OUT}</div>
                              <div class="col-2 fw-lighter">{$value.ID}-{$value.DATE}</div>
                            </div>
                          </li>{/foreach}                          
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
                
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
  </div>
</div>
