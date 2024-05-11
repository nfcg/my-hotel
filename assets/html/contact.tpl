<!-- Container -->
<div class="px-4 container-fluid mt-3">
  <div class="col-lg">
  
    <h2 class="text-primary fw-bold ms-1">{$PAGE_CONTACT_HEADING}</h2>
    <h4 class="ms-3 mb-5 text-secondary fw-bold">{$PAGE_CONTACT_DESCRIPTION}</h4>
    
    <div class="row mx-auto">
      <div class="col-4 my-auto ms-5">
       <address class="text-secondary ms-4 fw-bold">
          <strong class="bi bi-geo-alt text-secondary fw-bold"> {$MY_HOTEL}</strong></br>
        {$ADDRESS_LINE_1}</br>
        {$ADDRESS_LINE_2}</br>
        {$ADDRESS_LINE_3}</br>
        <p class="mt-4 fw-bold">
          <span class="bi bi-telephone text-secondary"> {$CONTACT_PHONE} </span>
        </p>
        <p class="mt-4 fw-bold">
          <span class="bi bi-envelope text-secondary"> {$CONTACT_EMAIL} </span>
        </p>
        <p class="mt-4 fw-bold">
          <span class="bi bi-card-list text-secondary"> vCard </span>
        </p>
        <img src="assets/img/vCard.png" class="img-thumbnail" alt="vCard" width="80" height="80">
       </address>
      </div>
      <div class="col-7 my-4">
        <div class="row shadow-sm p-3 mb-5 bg-body rounded">
          <form name="contact-form" id="contact-form" method="post">
            <div class="controls">
              <h3 class="bi bi-envelope-at fw-bold my-4 text-primary"> {$CONTACT_US} </h3>
              <div class="form-floating mb-3">
                <input type="text" class="form-control border rounded-0 rounded-bottom border-primary border-top-0 border-end-0 border-bottom-1" id="name" name="name" placeholder="Name">
                <label for="name">{$NAME}</label>
              </div>
              <div class="form-floating mb-3">
                <input type="email" class="form-control border rounded-0 rounded-bottom border-primary border-top-0 border-end-0 border-bottom-1" id="email" name="email" placeholder="E-Mail">
                <label for="name">E-Mail</label>
              </div>
              <div class="form-floating mb-3">
                <textarea class="form-control border rounded-0 rounded-bottom border-primary border-top-0 border-end-0 border-bottom-1" id="message" name="message" placeholder="Your Message" style="height: 150px"></textarea>
                <label for="message">{$MESSAGE}</label>
              </div>
            </div>
            <div class="d-grid">
              <button class="btn btn-outline-primary btn-lg" type="submit">{$SEND}</button>
            </div>
          </form>
          <button id="RequestDiv" class="m-3 btn btn-outline-primary btn-lg" type="submit" disabled style="display:none">
            <span class="spinner-border text-secondary"></span> {$PLEASE_WAIT}... </button>
          <div id="result" class="result mt-3"></div>
        </div>
      </div>
    </div>
    
  </div>
</div>

