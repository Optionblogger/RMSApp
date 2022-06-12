<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="container-fluid section">
    <h3 class="text-center main-title">
        <i class="fa fa-cloud-upload"></i>&nbsp;ADD RENT BATCH
    </h3>
    <div class="col-md-6">
        <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#importRentBatch">Upload
            Batch
        </button>
    </div>
    <p>&nbsp;</p>
    <div class="col-md-12" id="sa-results">

    </div>
</div>

<div class="container">

</div>
<!-- Modal -->
<div class="modal fade" id="importRentBatch" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <form role="form" id="form-add-rentBatch">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span>

                    </button>
                    <h4 class="modal-title" id="myModalLabel">Rent Batch Upload</h4>

                </div>
                <div class="modal-body">
                    <input type="hidden" name="ACTION" id="ACTION" value="RENT_BATCH"/>
                    <div class="row">
                        <div class="col-md-8">
                            <div class="form-group">
                                <span class="control-fileupload">
          <label for="rentBatch">Choose Excel File :</label> <input type="file" id="rentBatch" name="rentBatch">
        </span>
                            </div>
                        </div>
                        <div class="form-group col-md-4">
                            <button id="btn-file" type="submit" value="UPLOAD" class="btn btn-primary">UPLOAD
                            </button>

                        </div>
                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning pull-right"  data-dismiss="modal">Close</button>

                </div>
            </div>
        </div>
    </form>
</div>
<div class="modal fade" id="modal-view-contribution" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabelViewContributions" aria-hidden="true">
    <form role="form" id="form-view-contributions">
        <div class="modal-dialog large-modal">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" id="myModalLabelViewContributions">
                        <i class="glyphicon glyphicon-picture"></i>&nbsp;&nbsp;EXCEPTIONS
                    </h4>
                </div>
                <div class="modal-body" style=" width: 1000px;margin: auto; background-color: #ffffff"
                     id="page-content">

                    <h2 style="text-align: center; color: #2b669a; font-family: 'Roboto'; font-size: 24px;">PAID
                        RENT</h2>
                    <table class="table table-responsive table-striped table-bordered" id="select-results"
                           style=" width: 1000px;">
                    </table>
                    <hr>
                    <hr>

                    <hr>
                    <hr>
                </div>
            </div>
        </div>
    </form>
</div>

<style type="text/css">
    .modal-dialog {

        width: 800px;

        height: 400px !important;

    }

    .modal-content {
        height: 70%;
        background-color: #ffffff;

    }

    .modal-header {

        background-color: #337AB7;

        padding: 16px 16px;

        color: #fff;

        border-bottom: 2px dashed #337AB7;

    }

    .modal-footer {
        padding-bottom: 16px;
    }
</style>
<script type="text/javascript">

    $(document).ready(function () {

        $('#form-add-rentBatch')
            .bootstrapValidator(
                {
                    message: 'This value is not valid',
                    feedbackIcons: {
                        valid: 'glyphicon glyphicon-ok',
                        invalid: 'glyphicon glyphicon-remove',
                        validating: 'glyphicon glyphicon-refresh'
                    },
                    excluded: ':disabled',
                    fields: {
                        rentBatch: {
                            validators: {
                                notEmpty: {
                                    message: 'Please Choose Excel File'
                                }
                            }
                        }
                    }

                })
            .on(
                'success.form.bv',
                function (e) {
                    e.preventDefault();
                    var btn = "btn-file";
                    var form = "form-add-rentBatch";
                    var modal = "importRentBatch";
                    $('#' + btn).val('Please wait...');
                    var formData = new FormData($(this)[0]);
                    $.ajax({
                        url: $('#base_url').val() + 'agent',
                        type: 'post',
                        data:formData,
                        dataType: 'json',
                        async: false,
                        success: function (json) {

                            bootbox
                                .alert('<p class="text-center">'
                                    + json.message
                                    + '</p>');
                            $('#' + form)[0].reset();
                            setTimeout(
                                function () {
                                    window.location.href = $(
                                        '#base_url')
                                            .val()
                                        + 'agent';
                                }, 500);

                        },
                        cache: false,
                        contentType: false,
                        processData: false,

                        error: function (json) {
                            bootbox.alert('<p class="text-center">' + "Uploaded Batch has exceptions!" + '</p>');
                            viewRentBatchExceptions();
                        }



                    });

                });



        function viewRentBatchExceptions() {
            $.ajax({
                url: $('#base_url').val() + 'agent',
                type: 'post',
                data: {
                    ACTION: 'VIEW_RENT_BATCH_EXCEPTIONS'
                },
                dataType: 'html',
                success: function (html) {
                    $('#update_property-content').html(html);
                    $('#modal-edit-property').modal('show');

                }
            });
        }
    });



</script>

<div class="modal fade" id="modal-edit-property" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabelEditBenefit" aria-hidden="true">
    <form role="form" id="form-edit-property" enctype="multipart/form-data">
        <div class="modal-dialog large-modal">
            <div class="modal-content">
                <div class="modal-body" id="update_property-content">

                </div>

                <div class="modal-footer">
                    <a href="#" class="btn btn-warning pull-right" data-dismiss="modal">Close</a>

                </div>
            </div>
        </div>
    </form>
</div>