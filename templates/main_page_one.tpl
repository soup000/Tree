<div class="box box-theme box-form">
  <div class="box-header with-border">
    <h3 class="box-title">%TITLE%</h3>
  </div>
  <form action="index.cgi" method="post">
    <input hidden="" name="index" value="%INDEX%">
    <input hidden="" name="ID" value="%ID%">
    <div class="box-body">
      <div class="form-group">
        <label class="control-label col-md-3" for="RATECODE_ID">_{TYPE}_</label>
        <div class="col-md-9">
          %ADD_TREE%
        </div>
      </div>
    </div>
    <div class="box-footer text-center">
      %BUTTON_ADD%
      %BUTTON_CHANGE%
    </div>
  </form>
</div>
