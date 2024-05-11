<!-- Modal -->
<div class="modal fade" id="bookingModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header"></div>
      <div id="printThis" class="modal-body">
        <div class="card">
          <div class="card-header">
            <h5 class="modal-title">_</h5>
          </div>
          <div class="card-body">
            <div class="mx-auto row border-secondary border-start border-bottom mt-2 rounded-bottom">
              <div class="col-5 text-primary fw-bold">
                <p class="card-title align-middle">{$NAME|upper}: </p>
              </div>
              <div class="col-7 text-secondary fw-bold">
                <label class="modal-name"></label>
              </div>
            </div>
            <div class="mx-auto row border-secondary border-start border-bottom mt-3 rounded-bottom">
              <div class="col-5 text-primary fw-bold">
                <p class="card-title">CHECK-IN: </p>
              </div>
              <div class="col-7 text-secondary fw-bold">
                <label class="modal-checkin"></label>
              </div>
            </div>
            <div class="mx-auto row border-secondary border-start border-bottom mt-3 rounded-bottom">
              <div class="col-5 text-primary fw-bold">
                <p class="card-title">CHECK-OUT: </p>
              </div>
              <div class="col-7 text-secondary fw-bold">
                <label class="modal-checkout"></label>
              </div>
            </div>
            <div class="mx-auto row border-secondary border-start border-bottom mt-3 rounded-bottom">
              <div class="col-5 text-primary fw-bold">
                <p class="card-title">{$PHONE|upper}: </p>
              </div>
              <div class="col-7 text-secondary fw-bold">
                <label class="modal-phone"></label>
              </div>
            </div>
            <div class="mx-auto row border-secondary border-start border-bottom mt-3 rounded-bottom">
              <div class="col-5 mt-1 text-primary fw-bold">
                <p class="card-title">E-MAIL: </p>
              </div>
              <div class="col-7 text-secondary fw-bold">
                <label class="modal-email"></label>
              </div>
            </div>
            <div class="mx-auto row border-secondary border-start border-bottom mt-3 rounded-bottom">
              <div class="col-5 mt-1 text-primary fw-bold">
                <p class="card-title">{$ROOM_TYPE|upper}: </p>
              </div>
              <div class="col-7 text-secondary fw-bold">
                <label class="modal-roomtype"></label>
              </div>
            </div>
            <div class="mx-auto row border-secondary border-start border-bottom mt-3 rounded-bottom">
              <div class="col-5 mt-1 text-primary fw-bold">
                <p class="card-title">{$DOUBLE_BED|upper}: </p>
              </div>
              <div class="col-7 text-secondary fw-bold">
                <label class="modal-doublebed"></label>
              </div>
            </div>
            <div class="mx-auto row border-secondary border-start border-bottom mt-3 rounded-bottom">
              <div class="col-5 text-primary fw-bold">
                <p class="card-title">{$COMMENTS|upper}: </p>
              </div>
              <div class="col-7 text-secondary fw-bold">
                <label class="modal-comments"></label>
              </div>
            </div>
            <div class="mx-auto row border-secondary border-start border-bottom mt-3 rounded-bottom">
              <div class="col-5 text-primary fw-bold">
                <p class="card-title">{$STATUS|upper}: </p>
              </div>
              <div class="col-7 text-secondary fw-bold">
                <label class="modal-status"></label>
              </div>
            </div>
            <div class="mx-auto row border-secondary border-start border-bottom mt-3 rounded-bottom rounded-bottom">
              <div class="col-5 text-primary fw-bold">
                <p class="card-title">{$DATE|upper}: </p>
              </div>
              <div class="col-7 text-secondary fw-bold">
                <label class="modal-date"></label>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <div class="btn-group mx-auto gap-1" role="group">
          <button type="button" id="btnPrint" value="Print" class="btn btn-primary">
            <i class="bi bi-printer"></i>
          </button>
          <button type="button" class="btn btn-danger" data-bs-dismiss="modal">
            <i class="bi bi-x-square"></i>
          </button>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Container -->
<div class="px-4 container-fluid mt-3">
  <div class="col-lg">
  
    <h2 class="ms-1">{$PAGE_BOOKINGS_HEADING}</h2>
    <h5 class="ms-3 mb-5 text-secondary fw-bold">{$PAGE_BOOKINGS_DESCRIPTION}</h5>
    
    <div class="row mx-2 mb-3">
      <div class="input-group date input-group-lg" data-target-input="nearest">
        <span class="input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$YEAR_MONTH}</span>
        <input type="text" class="datetimepicker-input check_in form-control bg-white border-top-0 border-primary border-left-0 border-right-0 d-flex justify-content-center mx-auto" placeholder="yyyy/mm" data-target="#CHECK_IN" id="CHECK_IN" name="CHECK_IN" autocomplete="off">
      </div>
    </div>
    <table class="table table-hover mx-2" 
     id="table" 
     data-toggle="table" 
     data-pagination="true" 
     data-id-field="ID" 
     data-url="include/do_post.php?do=json_bookings" 
     data-editable-url="include/do_post.php?do=calendar_bookings" 
     data-search="true" 
     data-sortable="true" 
     data-search-selector="#CHECK_IN" 
     data-page-size="10" 
     data-filter-control="true" 
     data-show-search-clear-button="true" 
     data-show-toggle="false" 
     data-page-list="all" 
     data-index="ID">
      <thead>
        <tr>
          <th id="ID" data-field="ID" data-searchable="false" data-visible="false">ID</th>
          <th data-field="operate" data-formatter="operateFormatter" data-events="operateEvents" data-align="center" class="tr align-middle">INFO</th>
          <th id="NAME" data-field="NAME" data-searchable="true" data-align="center" data-cell-style="cellStyle" class="tr align-middle tblColEllipsis">{$NAME|upper}</th>
          <th id="PHONE" data-field="PHONE" data-searchable="true" data-align="center" class="tr align-middle">{$PHONE|upper}</th>
          <th id="EMAIL" data-field="EMAIL" data-searchable="true" data-align="center" class="tr align-middle">E-MAIL</th>
          <th id="CHECK_IN" data-field="CHECK_IN" data-searchable="true" data-align="center" data-filter-control="select" data-sortable="true" class="tr align-middle">CHECK-IN</th>
          <th id="CHECK_OUT" data-field="CHECK_OUT" data-searchable="true" data-align="center" data-sortable="true" class="tr align-middle">CHECK-OUT</th>
          <th id="ROOM_TYPE" data-field="ROOM_TYPE" data-searchable="true" data-align="center" data-editable="true" data-editable-type="select" data-editable-source="['single', 'double', 'double_extra_bed']" class="tr align-middle">{$ROOM_TYPE|upper}</th>
          <th id="DOUBLE_BED" data-field="DOUBLE_BED" data-searchable="true" data-align="center" data-editable="true" data-editable-type="select" data-editable-source="['true', 'false']" class="tr align-middle">{$DOUBLE_BED|upper}</th>
          <th id="COMMENTS" data-field="COMMENTS" data-searchable="true" data-align="center"class="tr align-middle tblColEllipsis">{$COMMENTS|upper}</th>
          <th id="STATUS" data-field="STATUS" data-searchable="true" data-align="center" data-editable="true" data-editable-type="select" data-editable-source="['pending', 'confirmed', 'canceled']" class="tr align-middle">{$STATUS|upper}</th>
          <th id="DATE" data-field="DATE" data-searchable="true" data-align="center" data-sortable="true" class="tr align-middle">{$DATE|upper}</th>
        </tr>
      </thead>
    </table>
    
  </div>
</div>
