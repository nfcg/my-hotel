<!-- Container -->
<div class="px-4 container-fluid mt-3">
  <div class="col-lg">
  
    <h2 class="ms-1">{$PAGE_CALENDAR_HEADING}</h2>
    <h5 class="ms-3 mb-5 text-secondary fw-bold">{$PAGE_CALENDAR_DESCRIPTION}</h5>
    
    <nav>
      <div class="nav nav-tabs" id="nav-tab" role="tablist">
        <button class="nav-link active fw-bold" id="nav-calendar-tab" data-bs-toggle="tab" data-bs-target="#nav-calendar" type="button" role="tab" aria-controls="nav-calendar" aria-selected="true">{$CALENDAR}</button>
        <button class="nav-link fw-bold" id="nav-newyear-tab" data-bs-toggle="tab" data-bs-target="#nav-newyear" type="button" role="tab" aria-controls="nav-newyear" aria-selected="false">{$NEW_YEAR}</button>
      </div>
    </nav>
    <div class="tab-content" id="nav-tabContent">
      <div class="nav-calendar tab-pane fade show active" id="nav-calendar" role="tabpanel" aria-labelledby="nav-calendar-tab" tabindex="0">
        <div class="row mx-2 mt-5">
          <div class="input-group date input-group-lg" data-target-input="nearest">
            <span class="input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$YEAR_MONTH}</span>
            <input type="text" class="datetimepicker-input check_in form-control bg-white border-top-0 border-primary border-left-0 border-right-0 d-flex justify-content-center mx-auto" placeholder="yyyy/mm" data-target="#date_from" id="date_from" name="date_from" autocomplete="off">
          </div>
        </div>
        <table class="table table-striped table-responsive table-striped" 
         id="table" 
         data-toggle="table" 
         data-pagination="true" 
         data-id-field="ID" 
         data-url="include/do_post.php?do=json_calendar" 
         data-editable-url="include/do_post.php?do=calendar_update" 
         data-search="true" 
         data-search-selector="#date_from" 
         data-page-size="31" 
         data-filter-control="true" 
         data-show-search-clear-button="true" 
         data-show-toggle="true" 
         data-page-list="all">
          <thead>
            <tr>
              <th id="ID" data-field="ID" data-searchable="false" data-visible="false" class="tr align-middle">ID</th>
              <th id="DAY" data-field="DAY" data-searchable="true" data-align="center" data-filter-control="select" class="tr align-middle">{$DAY|upper}</th>
              <th id="ROOM_TYPE" data-field="ROOM_TYPE" data-searchable="true" data-filter-control="select" class="tr align-middle">{$ROOM_TYPE|upper}</th>
              <th id="AVAILABILITY" data-field="AVAILABILITY" data-searchable="false" data-align="center" data-editable="true" data-editable-type="number" class="tr align-middle">{$AVAILABILITY|upper}</th>
              <th id="PRICE" data-field="PRICE" data-editable="true" data-searchable="false" data-align="center" class="tr align-middle">{$PRICE|upper}</th>
              <th id="STATUS" data-field="STATUS" data-editable="true" data-editable-type="select" data-editable-source="['open', 'closed']" data-searchable="false" data-align="center" class="tr align-middle">{$STATUS|upper}</th>
            </tr>
          </thead>
        </table>
      </div>
      <div class="mt-3 tab-pane fade" id="nav-newyear" role="tabpanel" aria-labelledby="nav-newyear-tab" tabindex="0">
        <form name="add_year_form" id="login-form" method="post">
          <div class="controls">
            <div class="input-group p-2 mb-3 p-4">
              <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$YEAR}</span>
              <input type="text" placeholder="yyyy" class="datetimepicker-input form-control bg-white border-top-0 border-primary border-left-0 border-right-0" id="add_year" name="add_year">
            </div> {foreach $room_types as $value} <div class="input-group p-2">
              <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$ROOM_TYPE}</span>
              <input type="text" class="form-control bg-light border-top-0 border-primary border-left-0 border-right-0" id="add_room_type_{$value.TYPE}" name="add_room_type_{$value.TYPE}" value="{$value.TYPE}" disabled readonly>
            </div>
            <div class="input-group p-2">
              <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$AVAILABILITY}</span>
              <input type="number" min="0" class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" name="add_availability_{$value.TYPE}" id="add_availability_{$value.TYPE}">
            </div>
            <div class="input-group p-2">
              <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$PRICE}</span>
              <input type="number" min="0" class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" name="add_price_{$value.TYPE}" id="add_price_{$value.TYPE}">
            </div>
            <div class="input-group p-2">
              <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$STATUS}</span>
              <select id="add_status_{$value.TYPE}" name="add_status_{$value.TYPE}" class="form-select bg-white border-top-0 border-primary border-left-0 border-right-0">
                <option value="open">{$OPEN}</option>
                <option value="closed">{$CLOSED}</option>
              </select>
            </div>
            <hr class="mx-auto text-primary"> {/foreach}
          </div>
          <div class="mt-3 d-grid px-3">
            <button id="addyearbtn" class="btn btn-outline-primary fw-bold bi bi-floppy" type="submit"> {$ADD_YEAR} </button>
          </div>
          <div id="pw" class="px-3 d-flex align-items-center text-primary d-none">
            <strong>{$PLEASE_WAIT}...</strong>
            <div class="spinner-border ms-auto" role="status" aria-hidden="true"></div>
          </div>
          <div id="error" class="px-3 mt-3"></div>
          <div id="success" class="px-3 mt-3"></div>
        </form>
      </div>
    </div>
    
  </div>
</div>
