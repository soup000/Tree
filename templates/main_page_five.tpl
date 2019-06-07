<div class="%STYLE_BOX%">
    <div class="box-header with-border">
        <h3 class="box-title">Редагування дерева</h3>
        <div class="box-tools pull-right">
            <button type="button" class="btn btn-default btn-xs" data-widget="collapse"><i class="fa fa-minus"></i>
            </button>
        </div>
    </div>
    <form role="form" method="get">
        <input hidden="" name="index" value="%INDEX%">
        <input hidden="" name="ID" value="%ID%">
        <div class="box-body">
            <div class="form-group">
                <label class="control-label col-md-3">Сорт дерева</label>
                <div class="col-md-9">
                    %SORT%
                </div>
            </div>
        </div>
        <div class="box-body">
            <div class="form-group">
                <label class="control-label col-md-3">Статус</label>
                <div class="col-md-9">
                    %STATUS%
                </div>
            </div>
        </div>

        <div class="box-body">
            <div class="form-group">
                <label class="control-label col-md-3">Вік</label>
                <div class="col-md-9">
                    %ONE_NUMB_YEAR%
                </div>
            </div>
        </div>
        <div class="box-body">
            <div class="form-group">
                <label class="control-label col-md-3">Номер дерева</label>
                <div class="col-md-9">
                    %NUMBER_TREE%
                </div>
            </div>
        </div>
        <div class="box-body">
            <div class="form-group">
                <label class="control-label col-md-3">Коментар</label>
                <div class="col-md-9">
                    <textarea cols="30" rows="4" name="COMMENTS" class="form-control"></textarea>
                </div>
            </div>
        </div>
        <div class="box-footer">
            %BUTTON_EDIT%
        </div>
    </form>
</div>