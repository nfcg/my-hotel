<!-- Container -->
<div class="px-4 container-fluid mt-3">
  <div class="col-lg">
  
    <h2 class="text-primary fw-bold ms-1">{$PAGE_LOGIN_HEADING}</h2>
    <h4 class="ms-3 mb-5 text-secondary fw-bold">{$PAGE_LOGIN_DESCRIPTION}</h4>
    
    <div class="row p-3">
      <div class="col-md-4 offset-md-4 shadow-sm p-3 mb-5 bg-body rounded">
        <form name="login-form" id="login-form" method="post" class="needs-validation" novalidate>
          <div class="controls">
            <h3 class="bi bi-box-arrow-right fw-bold my-4 text-primary"> {$LOGIN} </h3>
            
            <div class="form-floating mb-3">
              <input type="text" class="form-control border rounded-0 rounded-bottom border-primary border-top-0 border-end-0 border-bottom-1" id="user_email" name="user_email" placeholder="{$NAME}" required>
              <label class="form-label" for="user_email"> {$NAME} </label>
            </div>
            
            <div class="form-floating mb-3">
              <input type="password" class="form-control border rounded-0 rounded-bottom border-primary border-top-0 border-end-0 border-bottom-1" id="password" name="password" placeholder="{$PASSWORD}" required>
              <i class="bi bi-eye-slash" id="togglePassword"></i>
              <label class="form-label" for="password"> {$PASSWORD} </label>
            </div>
            
            <div class="form-check mb-3">
              <input type="checkbox" class="form-check-input" id="remember" name="remember">
              <label class="form-check-label" for="remember"> {$REMEMBER_ME} </label>
            </div>
            
          </div>
          
          <div class="d-grid">
            <button class="btn btn-outline-primary btn-lg" type="submit"> {$LOGIN} </button>
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

