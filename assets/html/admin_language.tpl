<!-- Container -->
<div class="px-4 container-fluid mt-3">
  <div class="col-lg">
  
    <h2 class="ms-1">{$PAGE_ADM_LANGUAGE_HEADING}</h2>
    <h5 class="ms-3 mb-5 text-secondary fw-bold">{$PAGE_ADM_LANGUAGE_DESCRIPTION}</h5>
    
    <div class="input-group p-4">
      <span class="input-group-text fw-bold text-primary bg-white border-primary bg-white border-top-0 border-right-0">{$LANGUAGE}</span>
      <select id="select_language" class="form-select bg-white border-top-0 border-primary border-left-0 border-right-0" style="width: auto">
        <option value="">{$SELECT_LANGUAGE}</option> 
        {foreach $languages as $value} 
        <option value="{$value}">{$value}</option> 
        {/foreach}
      </select>
    </div>

    <table class="table table-hover mx-2" 
     id="table"
     data-toggle="table" 
     data-pagination="true" 
     data-id-field="ID" 
     data-url="include/do_post.php?do=json_language" 
     data-editable-url="include/do_post.php?do=save_language" 
     data-search="true" 
     data-sortable="true" 
     data-page-size="20" 
     data-filter-control="true" 
     data-show-search-clear-button="true" 
     data-show-toggle="true" 
     data-page-list="all" 
     data-index="ID">
      <thead>
        <tr>
          <th id="ID" data-field="ID" data-searchable="false" data-visible="false">ID</th>
          <th id="NAME" data-field="NAME" data-searchable="true" data-align="left" data-cell-style="cellStyle" class="tr align-middle tblColEllipsis" data-sortable="true">{$NAME|upper}</th>
          <th id="TRANSLATION" data-field="TRANSLATION" data-searchable="true" data-align="left" class="tr align-middle" data-editable="true" data-editable-type="text" data-sortable="true">{$TRANSLATION|upper}</th>

        </tr>
      </thead>
    </table>
    
  </div>
</div>
