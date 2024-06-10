<!-- Modal -->
<div class="modal fade cancelpolicy" id="cancelpolicy" tabindex="-1" role="dialog" aria-labelledby="cancelpolicy" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"> {$CANCELLATION_POLICY} </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body"> {$CANCELLATION_POLICY_DESCRIPTION} </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">{$CLOSE}</button>
      </div>
    </div>
  </div>
</div>

<!-- Container -->
<div class="px-4 container-fluid mt-3">
  <div class="col-lg">
  
    <h2 class="text-primary fw-bold ms-1">{$PAGE_BOOKING_HEADING}</h2>
    <h4 class="ms-3 mb-5 text-secondary fw-bold">{$PAGE_BOOKING_DESCRIPTION}</h4>
    
    <form class="needs-validation basic-grey pt-0 pb-3 border border border-secondary mt-3 mx-auto rounded shadow shadow-lg" method="post" name="booking" id="booking" novalidate>
      <div class="card-header bg-primary p-1 mb-4">
        <h4 class="text-left text-white fw-bold ms-3 my-2"> {$RESERVATION_FORM} </h4>
      </div>
      <div class="row mx-2">
        <div class="input-group date input-group-lg mb-3" data-target-input="nearest">
          <span class="text-decoration-underline input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">Check-In 
            <img src="assets/img/arrival.png" class="mx-1 text-primary"/>
          </span>
          <input type="text" class="datetimepicker-input check_in form-control bg-white border-top-0 border-primary border-left-0 border-right-0 d-flex justify-content-center mx-auto" placeholder="dd/mm/yyyy" data-target="#check_in" id="check_in" name="check_in" autocomplete="off" required>          
          <span class="text-decoration-underline input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0 ms-2">Check-Out 
            <img src="assets/img/departure.png" class="mx-1 text-primary"/>
          </span>
          <input type="text" class="datetimepicker-input check_out form-control bg-white border-top-0 border-primary border-left-0 border-right-0 d-flex justify-content-center mx-auto" placeholder="dd/mm/yyyy" data-target="#check_out" id="check_out" name="check_out" autocomplete="off" required>
        </div>
      </div>
      <div id="pax_div" style="display: none;" class="row mx-2">
        <div class="input-group date input-group-lg mb-3">
          <span class="input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$ROOMS}</span>
          <select class="room_type form-control custom-select custom-select-lg border-primary border-top-0 border-left-0 border-right-0 form-control d-flex justify-content-center mx-auto" id="room_type" name="room_type" required>
            <option value="" selected>{$SELECT_ROOM}</option>{foreach $rooms as $value}<option value="{$value.TYPE}">{$value.NAME} - {$MAX_LOTATION} {$value.MAX_LOTATION}</option>{/foreach}
          </select>
        </div>
      </div>
      <div id="double_bed_div" class="form-check form-check-inline px-4 mx-4" style="display: none;">
        <input class="form-check-input mb-3" type="checkbox" id="double_bed" name="double_bed" value="true">
        <label class="custom-control-label fw-bold text-primary" for="double_bed"> {$DOUBLE_ROOM}? <small class="text-danger fw-bold"> * {$SUBJECT_TO_AVAILABILITY}</small>
        </label>
      </div>
      <div id="price_div" style="display: none;" class="bg-white rounded px-2 my-4 mx-5 border border-primary">
        <label class="custom-control-label fw-bold text-primary" for="price_div"> </label>
      </div>
      <div id="h_flname_div" style="display: none;" class="card-header bg-primary rounded-top mx-4 border border-primary">
        <h5 class="text-left text-white fw-bold ms-3 my-1"> {$YOUR_INFORMATION} </h5>
      </div>
      <div id="flname_div" style="display: none;" class="row-fluid mx-4 border border-primary p-3 rounded-bottom mb-3"> {$} <div class="input-group date input-group-lg mb-3 shadow shadow-sm">
          <span class="input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$NAME_SURNAME}</span>
          <input type="text" class="form-control datetimepicker-input bg-white border-top-0 border-primary border-left-0 border-right-1 d-flex justify-content-center rounded-right mx-auto" id="first_name" name="first_name" required>
          <input type="text" class="form-control datetimepicker-input bg-white border-top-0 border-primary border-left-0 border-right-0 d-flex justify-content-center mx-auto" id="last_name" name="last_name" required>
        </div>
        <div class="input-group date input-group-lg mb-3 shadow shadow-sm">
          <span class="input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$PHONE_NUMBER}</span>
          <input type="text" class="form-control datetimepicker-input bg-white border-top-0 border-primary border-left-0 border-right-0 d-flex justify-content-center mx-auto" id="phone" name="phone" required>
        </div>
        <div class="input-group date input-group-lg mb-3 shadow shadow-sm">
          <span class="input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">E-Mail</span>
          <input type="text" class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0 d-flex justify-content-center mx-auto" id="email" name="email" required>
        </div>
        <div class="input-group input-group-lg mb-3 shadow shadow-sm">
          <span class="input-group-text fw-bold text-primary bg-white border-top-0 border-primary border-right-0">{$COMMENTS}</span>
          <textarea class="form-control border-top-0 border-primary border-left-0 border-right-0" id="comments" name="comments"></textarea>
        </div>
      </div>
      <div id="h_cc_div" style="display: none;" class="card-header bg-primary rounded-top mx-4 border border-primary">
        <h5 class="text-left text-white fw-bold ms-3 my-1">
          <span class="fw-bold fas fa-credit-card"> {$YOUR_PAYMENT}</span>
        </h5>
      </div>
      <div id="cc_div" style="display: none;" class="row-fluid mx-4 border border-primary p-3 rounded-bottom mb-3">
        <div class="input-group date input-group-lg mb-3">
          <span class="input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$TYPE_CARD}</span>
          <select class="form-control custom-select custom-select-lg border-primary border-top-0 border-left-0 border-right-0 form-control d-flex justify-content-center mx-auto" id="cc_type" name="cc_type" required>
            <option value="">{$TYPE_CARD}</option>
            <option value="visa">Visa</option>
            <option value="mastercard">MasterCard</option>
          </select>
        </div>
        <div class="input-group date input-group-lg mb-3 shadow shadow-sm">
          <span class="input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$CARDHOLDER_NAME}</span>
          <input type="text" class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0 d-flex justify-content-center mx-auto" id="cc_name" name="cc_name" autocomplete="off" required>
        </div>
        <div class="input-group date input-group-lg mb-3 shadow shadow-sm">
          <span class="input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$NUMBER}</span>
          <input type="text" class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0 d-flex justify-content-center mx-auto" id="cc_number" name="cc_number" autocomplete="off" value="5500005555555559" required>
        </div>
        <div class="row">
          <div class="col input-group date input-group-lg mb-3">
            <span class="input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$MONTH}</span>
            <select class="form-control custom-select custom-select-lg border-primary border-top-0 border-left-0 border-right-0 form-control d-flex justify-content-center mx-auto" id="cc_expire_m" name="cc_expire_m" required>
              <option value="">{$CARD_EXPIRY_DATE}</option>{foreach $CC_VAL as $value}<option value="{$value@key}">{$value}</option>{/foreach}
            </select>
          </div>
          <div class="col input-group date input-group-lg mb-3">
            <span class="input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$YEAR}</span>
            <select class="form-control custom-select custom-select-lg border-primary border-top-0 border-left-0 border-right-0 form-control d-flex justify-content-center mx-auto" id="cc_expire_y" name="cc_expire_y" required>
              <option value="">{$YEAR}</option>{foreach $CC_YEARS as $value}<option value="{$value}">{$value}</option>{/foreach}
            </select>
          </div>
        </div>
        <div class="input-group date input-group-lg mb-3 shadow shadow-sm">
          <span class="input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">CVV/CVC</span>
          <input type="text" class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0 d-flex justify-content-center mx-auto" id="cc_cvc" name="cc_cvc" autocomplete="off" required>
        </div>
      </div>
      <div id="div_canc_pol" style="display: none;" class="form-check form-check-inline mx-4 px-4">
        <input type="checkbox" class="form-check-input mb-3" id="canc_pol" name="canc_pol">
        <label class="form-check-label" for="canc_pol">
          <a class="fw-bold text-secondary" href="#" data-bs-toggle="modal" data-bs-target="#cancelpolicy"> {$ACCEPT_CANCELLATION_POLICY}</a>
          <small class="text-danger fw-bold"> * {$MANDATORY}</small>
        </label>
      </div>
      <div class="btn-group btn-group d-flex justify-content-center mx-4" role="group">
        <button type="submit" class="btn btn-outline-primary btn-block" name="booking_button" id="booking_button">
          <i class="bi bi-check-square"> {$BOOK_NOW}</i>
        </button>
        <button type="button" class="btn btn-outline-secondary justify-content-center mx-auto" onClick="window.location.reload();return false;">
          <i class="m-2 bi bi-x-square"> {$CLEAR}</i>
        </button>
      </div>
    </form>
    <div class="mt-2" id="error"></div>
    
  </div>
</div>

