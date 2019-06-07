    <div class="box box-theme box-form">
      <div class="box-header with-border">
        <h3 class="box-title">%TITLE%</h3>
      </div>
      <form role="form" method="get">
        <input hidden="" name="index" value="%INDEX%">
        <input hidden="" name="ID" value="%ID%">
        <div class="box-body">
          <div class="form-group">
            <label class="control-label col-md-3">_{TYPE}_</label>
              <div class="col-md-9">
                %TYPE_TREE%
              </div>
          </div>
        </div>
        <div class="box-body">
          <div class="form-group">
            <label class="control-label col-md-3">_{SORT_OF_TREE}_</label>
              <div class="col-md-9">
                %ADD_TREE_SORT%
              </div>
          </div>
        </div>
        <div class="box-footer">
          %BUTTON_ADD%
          %BUTTON_CHANGE%
        </div>
      </form>
    </div>
