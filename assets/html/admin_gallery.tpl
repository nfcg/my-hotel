<!-- Container -->
<div class="px-4 container-fluid mt-3">
  <div class="col-lg">
  
    <h2 class="ms-1">{$PAGE_ADM_GALLERY_HEADING}</h2>
    <h5 class="ms-3 mb-5 text-secondary fw-bold">{$PAGE_ADM_GALLERY_DESCRIPTION}</h5>
    
    <nav>
      <div class="nav nav-tabs" id="nav-tab" role="tablist">
        <button class="nav-link active fw-bold" id="nav-editimage-tab" data-bs-toggle="tab" data-bs-target="#nav-editimage" type="button" role="tab" aria-controls="nav-editimage" aria-selected="true">{$EDIT_IMAGES}</button>
        <button class="nav-link fw-bold" id="nav-addgallery-tab" data-bs-toggle="tab" data-bs-target="#nav-addgallery" type="button" role="tab" aria-controls="nav-addgallery" aria-selected="false">{$ADD_GALLERY}</button>
        <button class="nav-link fw-bold" id="nav-addimage-tab" data-bs-toggle="tab" data-bs-target="#nav-addimage" type="button" role="tab" aria-controls="nav-addimage" aria-selected="false">{$ADD_IMAGES}</button>
        <button class="nav-link fw-bold" id="nav-deleteimage-tab" data-bs-toggle="tab" data-bs-target="#nav-deleteimage" type="button" role="tab" aria-controls="nav-deleteimage" aria-selected="false">{$DELETE_IMAGES}</button>
        <button class="nav-link fw-bold" id="nav-uploadimage-tab" data-bs-toggle="tab" data-bs-target="#nav-uploadimage" type="button" role="tab" aria-controls="nav-uploadimage" aria-selected="false">{$UPLOAD_IMAGES}</button>
      </div>
    </nav>
    <div class="tab-content" id="nav-tabContent">
      <div class="nav-editimage tab-pane fade show active" id="nav-editimage" role="tabpanel" aria-labelledby="nav-editimage-tab" tabindex="0">
        <div class="input-group p-4">
          <span class="input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$IMAGES}</span>
          <select id="editimage" class="form-select bg-white border-top-0 border-primary border-left-0 border-right-0">
            <option value="">{$SELECT_IMAGE}</option>{foreach $images as $value}<option value="{$value.ID}">{$value.LANGUAGE} - {$value.IMG_ALT} - {$value.TYPE}</option>{/foreach}
          </select>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$GAL_NAME}</span>
          <input type="text" class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" id="galname">
          <span class="input-group-text text-primary bg-white border-primary bg-white border-top-0 border-right-0">
            <div class="d-grid gap-2">
              <button id="submit" column="GAL_NAME" textvalue="galname" class="edit btn btn-outline-primary fw-bold bi bi-floppy btn-sm" type="button"> {$SAVE} </button>
            </div>
          </span>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$DESCRIPTION}</span>
          <input type="text" class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" id="description">
          <span class="input-group-text text-primary bg-white border-primary bg-white border-top-0 border-right-0">
            <div class="d-grid gap-2">
              <button id="submit" column="DESCRIPTION" textvalue="description" class="edit btn btn-outline-primary fw-bold bi bi-floppy btn-sm" type="button"> {$SAVE} </button>
            </div>
          </span>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$IMG_SRC}</span>
          <input type="text" class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" id="imgsrc">
          <span class="input-group-text text-primary bg-white border-primary bg-white border-top-0 border-right-0">
            <div class="d-grid gap-2">
              <button id="submit" column="IMG_SRC" textvalue="imgsrc" class="edit btn btn-outline-primary fw-bold bi bi-floppy btn-sm" type="button"> {$SAVE} </button>
            </div>
          </span>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$IMG_ALT}</span>
          <input type="text" class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" id="imgalt">
          <span class="input-group-text text-primary bg-white border-primary bg-white border-top-0 border-right-0">
            <div class="d-grid gap-2">
              <button id="submit" column="IMG_ALT" textvalue="imgalt" class="edit btn btn-outline-primary fw-bold bi bi-floppy btn-sm" type="button"> {$SAVE} </button>
            </div>
          </span>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$TYPE}</span>
          <select id="type" class="form-select bg-white border-top-0 border-primary border-left-0 border-right-0">
           {foreach $gallery_list as $value}<option value="{$value.TYPE}">{$value.TYPE}</option>{/foreach}<option value="gallery_carousel">gallery_carousel</option>
          </select>
          <span class="input-group-text text-primary bg-white border-primary bg-white border-top-0 border-right-0">
            <div class="d-grid gap-2">
              <button id="submit" column="TYPE" textvalue="type" class="edit btn btn-outline-primary fw-bold bi bi-floppy btn-sm" type="button"> {$SAVE} </button>
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
              <button id="submit" column="LANGUAGE" textvalue="language" class="edit btn btn-outline-primary fw-bold bi bi-floppy btn-sm" type="button"> {$SAVE} </button>
            </div>
          </span>
        </div>
        <div class="mt-3 d-grid px-3">
          <button id="clone" class="btn btn-outline-primary fw-bold bi bi-floppy" type="button"> {$CLONE_IMAGE}</button>
        </div>
      </div>
      <div class="mt-3 tab-pane fade" id="nav-addgallery" role="tabpanel" aria-labelledby="nav-addgallery-tab" tabindex="0">
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$GALLERY}</span>
          <input type="text" class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" id="addgalleryname">
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$TYPE}</span>
          <input type="text" class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" id="addgallerytype">
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$LANGUAGE}</span>
          <select id="addgallerylanguage" class="form-select bg-white border-top-0 border-primary border-left-0 border-right-0">
           {foreach $languages as $value}<option value="{$value}">{$value}</option>{/foreach} 
          </select>
        </div>
        <div class="mt-3 d-grid px-3">
          <button id="addgallery" class="btn btn-outline-primary fw-bold bi bi-floppy" type="button"> {$ADD_GALLERY}</button>
        </div>
      </div>
      <div class="mt-3 tab-pane fade" id="nav-addimage" role="tabpanel" aria-labelledby="nav-addimage-tab" tabindex="0">
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$NAME}</span>
          <input type="text" class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" id="addimgname">
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$DESCRIPTION}</span>
          <input type="text" class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" id="addimgdescription">
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$IMG_SRC}</span>
          <input type="text" class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" id="addimgsrc">
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$IMG_ALT}</span>
          <input type="text" class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" id="addimgalt">
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$TYPE}</span>
          <select id="addimgtype" class="form-select bg-white border-top-0 border-primary border-left-0 border-right-0"> 
           {foreach $gallery_list as $value}<option value="{$value.TYPE}">{$value.TYPE}</option>{/foreach}<option value="gallery_carousel">gallery_carousel</option>
          </select>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$LANGUAGE}</span>
          <select id="addimglanguage" class="form-select bg-white border-top-0 border-primary border-left-0 border-right-0"> 
           {foreach $languages as $value}<option value="{$value}">{$value}</option>{/foreach} 
          </select>
        </div>
        <div class="mt-3 d-grid px-3">
          <button id="addimgbtn" class="btn btn-outline-primary fw-bold bi bi-floppy" type="button"> {$ADD_IMAGE}</button>
        </div>
      </div>
      <div class="mt-3 tab-pane fade" id="nav-deleteimage" role="tabpanel" aria-labelledby="nav-deleteimage-tab" tabindex="0">
        <div class="input-group p-4">
          <span class="input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$IMAGES}</span>
          <select id="deleteimageselect" class="form-select bg-white border-top-0 border-primary border-left-0 border-right-0" style="width: auto">
            <option value="">{$SELECT_IMAGE}</option>{foreach $images as $value}<option value="{$value.ID}">{$value.LANGUAGE} - {$value.IMG_ALT} - {$value.TYPE}</option>{/foreach}
          </select>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$GAL_NAME}</span>
          <input type="text" class="form-control bg-light border-top-0 border-primary border-left-0 border-right-0" id="deleteimagegalname" disabled readonly>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$DESCRIPTION}</span>
          <input type="text" class="form-control bg-light border-top-0 border-primary border-left-0 border-right-0" id="deleteimagedescription" disabled readonly>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$IMG_SRC}</span>
          <input type="text" class="form-control bg-light border-top-0 border-primary border-left-0 border-right-0" id="deleteimageimgsrc" disabled readonly>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$IMG_ALT}</span>
          <input type="text" class="form-control bg-light border-top-0 border-primary border-left-0 border-right-0" id="deleteimageimgalt" disabled readonly>
        </div>
        <div class="input-group p-2">
          <span class="spanleftsize input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$IMG_ALT}</span>
          <input type="text" class="form-control bg-light border-top-0 border-primary border-left-0 border-right-0" id="deleteimagetype" disabled readonly>
        </div>
        <div class="mt-3 d-grid px-3">
          <button id="deleteimagebtn" class="btn btn-outline-primary fw-bold bi bi-floppy" type="button"> {$DELETE_IMAGE}</button>
        </div>
      </div>
      <div class="mt-3 tab-pane fade" id="nav-uploadimage" role="tabpanel" aria-labelledby="nav-uploadimage-tab" tabindex="0">
        <form id="form" enctype="multipart/form-data">
          <div class="input-group p-2">
            <input type="file" class="form-control bg-white border-top-0 border-primary border-left-0 border-right-0" id="uploadImage" type="file" accept="image/*" name="image">
          </div>
          <div class="mt-3 d-grid">
            <button id="uploadimage" class="btn btn-outline-primary fw-bold bi bi-floppy" type="button"> {$UPLOAD_IMAGE}</button>
          </div>
        </form>
        <div class="p-5 mx-auto" id="preview"></div>
        <p class="text-danger fw-bolder" id="err"></p>
      </div>
    </div>
    
  </div>
</div>
