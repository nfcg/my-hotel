<!-- Container -->
<div class="px-4 container-fluid mt-3">
  <div class="col-lg">
  
    <h2 class="text-primary fw-bold ms-1">{$PAGE_CHANGE_PASSWORD_HEADING}</h2>
    <h4 class="ms-3 mb-5 text-secondary fw-bold">{$PAGE_ADM_CHANGE_PASSWORD_DESCRIPTION}</h4>
    
    <div class="row p-3">
      <div class="col-md-4 offset-md-4 shadow-sm p-3 mb-5 bg-body rounded">
        <form name="change-password-form" id="change-password-form" method="post" class="needs-validation" novalidate>
          <div class="controls">
            <h3 class="fw-bold my-4 text-primary"> {$PAGE_CHANGE_PASSWORD_HEADING} </h3>
            
            <div class="form-floating mb-3">
              <input type="password" class="form-control border rounded-0 rounded-bottom border-primary border-top-0 border-end-0 border-bottom-1" id="cur_password" name="cur_password" placeholder="{$PAGE_CHANGE_PASSWORD_HEADING}" required>
              <label class="form-label" for="cur_password"> {$CURRENT_PASSWORD} </label>
            </div>
            
            <div class="form-floating mb-3">
              <input type="password" class="form-control border rounded-0 rounded-bottom border-primary border-top-0 border-end-0 border-bottom-1" id="new_password" name="new_password" placeholder="{$NEW_PASSWORD}" required>
              <label class="form-label" for="new_password"> {$NEW_PASSWORD} </label>
            </div>
            
            <div class="form-floating mb-3">
              <input type="password" class="form-control border rounded-0 rounded-bottom border-primary border-top-0 border-end-0 border-bottom-1" id="confirm_password" name="confirm_password" placeholder="{$CONFIRM_NEW_PASSWORD}" required>
              <label class="form-label" for="confirm_password"> {$CONFIRM_NEW_PASSWORD} </label>
            </div>

          </div>
          <div class="d-grid">
            <button class="btn btn-outline-primary btn-lg" type="submit"> {$PAGE_CHANGE_PASSWORD_HEADING} </button>
          </div>
        </form>
        <div class="d-grid">
         <button id="RequestDiv" class="m-3 btn btn-lg btn-outline-info" type="submit" disabled style="display:none">
         <span class="spinner-border text-secondary"></span>{$PLEASE_WAIT}... 
         </button>
        </div>
      </div>
      <div id="result" class="result mt-3"></div>
      
    </div>
    
  </div>
</div>

