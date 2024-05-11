<!-- Container -->
<div class="px-4 container-fluid mt-3">
  <div class="col-lg">
  
    <h2 class="text-primary fw-bold ms-1">{$PAGE_ADM_CC_HEADING}</h2>
    <h4 class="ms-3 mb-5 text-secondary fw-bold">{$PAGE_ADM_CC_DESCRIPTION}</h4>
    
    <div class="row p-3">
      <div class="col-md-4 offset-md-4 shadow-sm p-3 mb-5 bg-body rounded">
        <div id="printThis" class="controls">
          <h4 id="booking_n" class="fw-bold my-4 text-secondary">{$BOOKING_CC_DETAILS}: </h4>
          <div class="form-floating mb-3">
            <input type="text" class="bg-light form-control border rounded-0 rounded-bottom border-primary border-top-0 border-end-0 border-bottom-1" id="cc_number" name="cc_number" placeholder="{$NAME}" readonly />
            <label class="form-label" for="cc_number"> {$CC_NUMBER} </label>
          </div>
          <div class="form-floating mb-3">
            <input type="text" class="bg-light form-control border rounded-0 rounded-bottom border-primary border-top-0 border-end-0 border-bottom-1" id="cc_expire" name="cc_expire" placeholder="{$PASSWORD}" readonly />
            <label class="form-label" for="cc_expire"> {$CC_EXPIRE} </label>
          </div>
          <div class="form-floating mb-3">
            <input type="text" class="bg-light form-control border rounded-0 rounded-bottom border-primary border-top-0 border-end-0 border-bottom-1" id="cc_cvc" name="cc_cvc" placeholder="{$PASSWORD}" readonly />
            <label class="form-label" for="cc_cvc"> {$CC_CVC} </label>
          </div>
        </div>
        <div class="d-grid">
          <button class="bi bi-printer btn btn-outline-primary btn-lg" type="submit" id="btnPrint"> {$PRINT} </button>
        </div>
      </div>
    </div>
    
  </div>
</div>
