<div class="container-fluid section">
    <form role="form" id="form-media">
        <div>
            <div>
                <div>
                    <h4 id="myModalLabelLogo">
                        <i class="glyphicon glyphicon-picture"></i>&nbsp;&nbsp;UPLOAD RECEIPTS
                    </h4>
                </div>
                <div>
                    <input type="hidden" name="ACTION" id="ACTION" value="RECEIPTS"/>
                    <div class="form-group">
                        <label class="control-label">Upload Receipts</label>
                        <input type="file" class="filestyle" data-buttonName="btn-primary" id="media_file"
                               name="media_file[]" data-buttonBefore="true" multiple/>
                    </div>

                </div>
                <div>
                    <a href="#" class="btn btn-warning" data-dismiss="modal">Cancel</a>
                    <input class="btn btn-primary" type="submit"
                           value="Upload File" id="btn-file">
                </div>
            </div>
        </div>
    </form>
</div>