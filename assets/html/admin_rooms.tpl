<!-- Container -->
<div class="px-4 container-fluid mt-3">
  <div class="col-lg">
  
    <h2 class="ms-1">{$PAGE_ADM_ROOMS_HEADING}</h2>
    <h5 class="ms-3 mb-5 text-secondary fw-bold">{$PAGE_ADM_ROOMS_DESCRIPTION}</h5>
    
    <nav>
      <div class="nav nav-tabs" id="nav-tab" role="tablist">
        <button class="nav-link active fw-bold" id="nav-editroom-tab" data-bs-toggle="tab" data-bs-target="#nav-editroom" type="button" role="tab" aria-controls="nav-editroom" aria-selected="true">{$EDIT_ROOMS}</button>
        <button class="nav-link fw-bold" id="nav-addroom-tab" data-bs-toggle="tab" data-bs-target="#nav-addroom" type="button" role="tab" aria-controls="nav-addroom" aria-selected="false">{$ADD_ROOMS}</button>
        <button class="nav-link fw-bold" id="nav-deleteroom-tab" data-bs-toggle="tab" data-bs-target="#nav-deleteroom" type="button" role="tab" aria-controls="nav-deleteroom" aria-selected="false">{$DELETE_ROOMS}</button>
      </div>
    </nav>
    
    <div class="tab-content" id="nav-tabContent">
      <div class="nav-editroom tab-pane fade show active" id="nav-editroom" role="tabpanel" aria-labelledby="nav-editroom-tab" tabindex="0">
        <div class="input-group p-4">
          <span class="input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$ROOMS}</span>
          <select id="rooms" class="form-select bg-white border-top-0 border-primary border-left-0 border-right-0" style="width: auto">
            <option value="">{$SELECT_ROOM}</option>{foreach $rooms_admin as $value}<option value="{$value.ID}">{$value.LANGUAGE} - {$value.NAME} - {$value.TYPE}</option>{/foreach}
          </select>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$NAME}</span>
          <input type="text" class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" id="name">
          <span class="input-group-text text-primary bg-white border-primary bg-white border-top-0 border-right-0">
            <div class="d-grid gap-2">
              <button id="submit" column="NAME" textvalue="name" class="edit bi bi-floppy btn btn-outline-primary fw-bold btn-sm" type="button"> {$SAVE} </button>
            </div>
          </span>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$DESCRIPTION}</span>
          <textarea class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" id="description" style="height: 130px"></textarea>
          <span class="input-group-text text-primary bg-white border-primary bg-white border-top-0 border-right-0">
            <div class="d-grid gap-2">
              <button id="submit" column="DESCRIPTION" textvalue="description" class="edit bi bi-floppy btn btn-outline-primary fw-bold btn-sm" type="button"> {$SAVE} </button>
            </div>
          </span>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$FACILITIES}</span>
          <textarea class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" id="facilities" style="height: 130px"></textarea>
          <span class="input-group-text text-primary bg-white border-primary bg-white border-top-0 border-right-0">
            <div class="d-grid gap-2">
              <button id="submit" column="FACILITIES" textvalue="facilities" class="edit bi bi-floppy btn btn-outline-primary fw-bold btn-sm" type="button"> {$SAVE} </button>
            </div>
          </span>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$MAX_LOTATION}</span>
          <input type="number" min="1" class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" id="maxlotation">
          <span class="input-group-text text-primary bg-white border-primary bg-white border-top-0 border-right-0">
            <div class="d-grid gap-2">
              <button id="submit" column="MAX_LOTATION" textvalue="maxlotation" class="edit bi bi-floppy btn btn-outline-primary fw-bold btn-sm" type="button"> {$SAVE} </button>
            </div>
          </span>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$IMG_SRC}</span>
          <input type="text" class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" id="imgsrc">
          <span class="input-group-text text-primary bg-white border-primary bg-white border-top-0 border-right-0">
            <div class="d-grid gap-2">
              <button id="submit" column="IMG_SRC" textvalue="imgsrc" class="edit bi bi-floppy btn btn-outline-primary fw-bold btn-sm" type="button"> {$SAVE} </button>
            </div>
          </span>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$IMG_ALT}</span>
          <input type="text" class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" id="imgalt">
          <span class="input-group-text text-primary bg-white border-primary bg-white border-top-0 border-right-0">
            <div class="d-grid gap-2">
              <button id="submit" column="IMG_ALT" textvalue="imgalt" class="edit bi bi-floppy btn btn-outline-primary fw-bold btn-sm" type="button"> {$SAVE} </button>
            </div>
          </span>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$TYPE}</span>
          <select id="type" class="form-select bg-white border-top-0 border-primary border-left-0 border-right-0">
           {foreach $room_types as $value}<option value="{$value.TYPE}">{$value.TYPE}</option>{/foreach} 
          </select>
          <span class="input-group-text text-primary bg-white border-primary bg-white border-top-0 border-right-0">
            <div class="d-grid gap-2">
              <button id="submit" column="TYPE" textvalue="type" class="edit btn btn-outline-primary fw-bold bi bi-floppy" type="button"> {$SAVE} </button>
            </div>
          </span>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$LANGUAGE}</span>
          <select id="language" class="form-select bg-white border-top-0 border-primary border-left-0 border-right-0">
           {foreach $languages as $value}<option value="{$value}">{$value}</option>{/foreach} 
          </select>
          <span class="input-group-text text-primary bg-white border-primary bg-white border-top-0 border-right-0">
            <div class="d-grid gap-2">
              <button id="submit" column="LANGUAGE" textvalue="language" class="edit btn btn-outline-primary fw-bold bi bi-floppy" type="button"> {$SAVE} </button>
            </div>
          </span>
        </div>
        <div class="mt-3 d-grid px-3">
          <button id="cloneroombtn" class="btn btn-outline-primary fw-bold bi bi-floppy" type="button"> {$CLONE_ROOM}</button>
        </div>
      </div>
      <div class="mt-3 tab-pane fade" id="nav-addroom" role="tabpanel" aria-labelledby="nav-addroom-tab" tabindex="0">
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$NAME}</span>
          <input type="text" class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" id="addroomname">
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$DESCRIPTION}</span>
          <textarea class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" id="addroomdescription" style="height: 130px"></textarea>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$FACILITIES}</span>
          <textarea class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" id="addroomfacilities" style="height: 130px"></textarea>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$MAX_LOTATION}</span>
          <input type="number" min="1" class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" id="addroommaxlotation">
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$IMG_SRC}</span>
          <input type="text" class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" id="addroomimgsrc">
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$IMG_ALT}</span>
          <input type="text" class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" id="addroomimgalt">
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$TYPE}</span>
          <input type="text" class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" id="addroomtype">
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$LANGUAGE}</span>
          <select id="addroomlanguage" class="form-select bg-white border-top-0 border-primary border-left-0 border-right-0">
           {foreach $languages as $value}<option value="{$value}">{$value}</option>{/foreach}
          </select>
        </div>
        <div class="mt-3 d-grid px-3">
          <button id="addroombtn" class="btn btn-outline-primary fw-bold bi bi-floppy" type="button"> {$ADD_ROOM}</button>
        </div>
      </div>
      <div class="mt-3 tab-pane fade" id="nav-deleteroom" role="tabpanel" aria-labelledby="nav-deleteroom-tab" tabindex="0">
        <div class="input-group p-4">
          <span class="input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$ROOMS}</span>
          <select id="deleteroomselect" class="form-select bg-white border-top-0 border-primary border-left-0 border-right-0" style="width: auto">
            <option value="">{$SELECT_ROOM}</option>{foreach $rooms_admin as $value}<option value="{$value.ID}">{$value.LANGUAGE} - {$value.NAME} - {$value.TYPE}</option>{/foreach}
          </select>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$NAME}</span>
          <input type="text" class="form-control bg-light border-top-0 border-primary border-left-0 border-right-0" id="deleteroomname" disabled readonly>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$DESCRIPTION}</span>
          <input type="text" class="form-control bg-light border-top-0 border-primary border-left-0 border-right-0" id="deleteroomdescription" disabled readonly>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$FACILITIES}</span>
          <input type="text" class="form-control bg-light border-top-0 border-primary border-left-0 border-right-0" id="deleteroomfacilities" disabled readonly>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$MAX_LOTATION}</span>
          <input type="text" min="1" class="form-control bg-light border-top-0 border-primary border-left-0 border-right-0" id="deleteroommaxlotation" disabled readonly>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$IMG_SRC}</span>
          <input type="text" class="form-control bg-light border-top-0 border-primary border-left-0 border-right-0" id="deleteroomimgsrc" disabled readonly>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$IMG_ALT}</span>
          <input type="text" class="form-control bg-light border-top-0 border-primary border-left-0 border-right-0" id="deleteroomimgalt" disabled readonly>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$TYPE}</span>
          <input type="text" class="form-control bg-light border-top-0 border-primary border-left-0 border-right-0" id="deleteroomtype" disabled readonly>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$LANGUAGE}</span>
          <input type="text" class="form-control bg-light border-top-0 border-primary border-left-0 border-right-0" id="deleteroomlanguage" disabled readonly>
        </div>
        <div class="mt-3 d-grid px-3">
          <button id="deleteroombtn" class="btn btn-outline-primary fw-bold bi bi-floppy" type="button"> {$DELETE_ROOM}</button>
        </div>
      </div>
    </div>
    
  </div>
</div>
