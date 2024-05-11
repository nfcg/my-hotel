<!-- Container -->
<div class="px-4 container-fluid mt-3">
  <div class="col-lg">
  
    <h2 class="ms-1">{$PAGE_ADM_TEMPLATES_HEADING}</h2>
    <h5 class="ms-3 mb-5 text-secondary fw-bold">{$PAGE_ADM_TEMPLATES_DESCRIPTION}</h5>
    
    <div class="input-group p-4">
      <span class="input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$TEMPLATES}</span>
      <select id="templates" class="form-select bg-white border-top-0 border-primary border-left-0 border-right-0" style="width: auto">
        <option value="">{$SELECT_TEMPLATES}</option> 
        {foreach $templates as $value} 
        <option value="{$value}.tpl">{$value}</option> 
        {/foreach}
      </select>
    </div>
    
    <div class="input-group p-2">
      <textarea class="form-control attribute fw-bold" id="templatetextarea" style="height:500px;"></textarea>
    </div>
    
    <div class="mt-2 d-grid px-3">
      <button id="savetemplatebtn" class="btn btn-outline-primary fw-bold bi bi-floppy" type="button"> {$SAVE}</button>
    </div>
  </div>
  
</div>
