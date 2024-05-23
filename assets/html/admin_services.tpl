<!-- Container -->
<div class="px-4 container-fluid mt-3">
  <div class="col-lg">
  
    <h2 class="ms-1">{$PAGE_ADM_SERVICES_HEADING}</h2>
    <h5 class="ms-3 mb-5 text-secondary fw-bold">{$PAGE_ADM_SERVICES_DESCRIPTION}</h5>
    
    <nav>
      <div class="nav nav-tabs" id="nav-tab" role="tablist">
        <button class="nav-link active fw-bold" id="nav-editservice-tab" data-bs-toggle="tab" data-bs-target="#nav-editservice" type="button" role="tab" aria-controls="nav-editservice" aria-selected="true">{$EDIT_SERVICES}</button>
        <button class="nav-link fw-bold" id="nav-addservice-tab" data-bs-toggle="tab" data-bs-target="#nav-addservice" type="button" role="tab" aria-controls="nav-addservice" aria-selected="false">{$ADD_SERVICES}</button>
        <button class="nav-link fw-bold" id="nav-deleteservice-tab" data-bs-toggle="tab" data-bs-target="#nav-deleteservice" type="button" role="tab" aria-controls="nav-deleteservice" aria-selected="false">{$DELETE_SERVICES}</button>
      </div>
    </nav>
    
    <div class="tab-content" id="nav-tabContent">
      <div class="nav-editservice tab-pane fade show active" id="nav-editservice" role="tabpanel" aria-labelledby="nav-editservice-tab" tabindex="0">
      
        <div class="input-group p-4">
          <span class="input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$SERVICES}</span>
          <select id="services" class="form-select bg-white border-top-0 border-primary border-left-0 border-right-0" style="width: auto">
            <option value="">{$SELECT_SERVICE}</option>{foreach $services_admin as $value}<option value="{$value.ID}">{$value.LANGUAGE} - {$value.NAME}</option>{/foreach}
          </select>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$NAME}</span>
          <input type="text" class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" id="name">
          <span class="input-group-text text-primary bg-white border-primary bg-white border-top-0 border-right-0">
            <div class="d-grid gap-2">
              <button id="submit" column="NAME" textvalue="name" class="edit bi bi-floppy btn btn-outline-primary fw-bold" type="button"> {$SAVE} </button>
            </div>
          </span>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$DESCRIPTION}</span>
          <textarea class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" id="description" style="height: 130px"></textarea>
          <span class="input-group-text text-primary bg-white border-primary bg-white border-top-0 border-right-0">
            <div class="d-grid gap-2">
              <button id="submit" column="DESCRIPTION" textvalue="description" class="edit bi bi-floppy btn btn-outline-primary fw-bold" type="button"> {$SAVE} </button>
            </div>
          </span>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$IMG_SRC}</span>
          <input type="text" class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" id="imgsrc">
          <span class="input-group-text text-primary bg-white border-primary bg-white border-top-0 border-right-0">
            <div class="d-grid gap-2">
              <button id="submit" column="IMG_SRC" textvalue="imgsrc" class="edit bi bi-floppy btn btn-outline-primary fw-bold" type="button"> {$SAVE} </button>
            </div>
          </span>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$IMG_ALT}</span>
          <input type="text" class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" id="imgalt">
          <span class="input-group-text text-primary bg-white border-primary bg-white border-top-0 border-right-0">
            <div class="d-grid gap-2">
              <button id="submit" column="IMG_ALT" textvalue="imgalt" class="edit bi bi-floppy btn btn-outline-primary fw-bold" type="button"> {$SAVE} </button>
            </div>
          </span>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$LANGUAGE}</span>
          <select id="language" class="form-select bg-white border-top-0 border-primary border-left-0 border-right-0"> {foreach $languages as $value} <option value="{$value}">{$value}</option> {/foreach} </select>
          <span class="input-group-text text-primary bg-white border-primary bg-white border-top-0 border-right-0">
            <div class="d-grid gap-2">
              <button id="submit" column="LANGUAGE" textvalue="language" class="edit btn btn-outline-primary fw-bold bi bi-floppy" type="button"> {$SAVE} </button>
            </div>
          </span>
        </div>
        <div class="mt-3 d-grid px-3">
          <button id="cloneservicebtn" class="btn btn-outline-primary fw-bold bi bi-floppy" type="button"> {$CLONE_SERVICE}</button>
        </div>
      </div>
      <div class="mt-3 tab-pane fade" id="nav-addservice" role="tabpanel" aria-labelledby="nav-addservice-tab" tabindex="0">
       <form class="needs-validation" name="bulkupdate_form" id="addservice_form" novalidate>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$NAME}</span>
          <input type="text" class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" id="addservicename">
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$DESCRIPTION}</span>
          <textarea class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" id="addservicedescription" style="height: 130px"></textarea>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$IMG_SRC}</span>
          <input type="text" class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" id="addserviceimgsrc">
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$IMG_ALT}</span>
          <input type="text" class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" id="addserviceimgalt">
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$LANGUAGE}</span>
          <select id="addservicelanguage" class="form-select bg-white border-top-0 border-primary border-left-0 border-right-0"> {foreach $languages as $value} <option value="{$value}">{$value}</option> {/foreach} </select>
        </div>
        <div class="mt-3 d-grid px-3">
          <button id="addservicebtn" class="btn btn-outline-primary fw-bold bi bi-floppy" type="button"> {$ADD_SERVICE}</button>
        </div>
       </form>
      </div>
      <div class="mt-3 tab-pane fade" id="nav-deleteservice" role="tabpanel" aria-labelledby="nav-deleteservice-tab" tabindex="0">
      
        <div class="input-group p-4">
          <span class="input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$ROOMS}</span>
          <select id="deleteserviceselect" class="form-select bg-white border-top-0 border-primary border-left-0 border-right-0" style="width: auto">
            <option value="">{$SELECT_SERVICE}</option>{foreach $services_admin as $value}<option value="{$value.ID}">{$value.LANGUAGE} - {$value.NAME}</option> {/foreach}
          </select>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$NAME}</span>
          <input type="text" class="form-control bg-light border-top-0 border-primary border-left-0 border-right-0" id="deleteservicename" disabled readonly>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$DESCRIPTION}</span>
          <input type="text" class="form-control bg-light border-top-0 border-primary border-left-0 border-right-0" id="deleteservicedescription" disabled readonly>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$IMG_SRC}</span>
          <input type="text" class="form-control bg-light border-top-0 border-primary border-left-0 border-right-0" id="deleteserviceimgsrc" disabled readonly>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$IMG_ALT}</span>
          <input type="text" class="form-control bg-light border-top-0 border-primary border-left-0 border-right-0" id="deleteserviceimgalt" disabled readonly>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$LANGUAGE}</span>
          <input type="text" class="form-control bg-light border-top-0 border-primary border-left-0 border-right-0" id="deleteservicelanguage" disabled readonly>
        </div>
        <div class="mt-3 d-grid px-3">
          <button id="deleteservicebtn" class="btn btn-outline-primary fw-bold bi bi-floppy" type="button"> {$DELETE_SERVICE}</button>
        </div>
      </div>
      
    </div>
    
  </div>
</div>
