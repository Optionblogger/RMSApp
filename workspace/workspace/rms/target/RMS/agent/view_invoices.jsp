
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container-fluid section">
    <h3 class="text-center main-title">
        <i class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;INVOICES
    </h3>
    <form class="form-inline" role="form" id="sa-form">
        <div class="form-group col-md-6">
            <label for="month" class="control-label">MONTH:</label> <input type="text" readonly="readonly" name="month"
                                                                           class="form-control datepicker" id="month"
                                                                           placeholder="Month">
        </div>
        <div class="col-md-6">
            <button class="btn btn-primary btn-sm">SHOW INVOICES</button>
        </div>
    </form>
    <p>&nbsp;</p>
    <div class="col-md-12" id="sa-results">

    </div>
</div>

<div class="modal fade" id="modal-view-invoice" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabelViewInvoices" aria-hidden="true">
    <form role="form" id="form-view-invoices">
        <div class="modal-dialog large-modal">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" id="myModalLabelViewContributions">
                        <i class="glyphicon glyphicon-picture"></i>&nbsp;&nbsp;INVOICES
                    </h4>
                </div>
                <div class="modal-body">
                    <h4>Invoices:</h4>
                    <table class="table table-responsive table-striped table-bordered" id="select-opbal">
                    </table>
                </div>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript">

    function format_no(yourNumber) {
        if (typeof    yourNumber != 'undefined') {
            //Seperates the components of the number
            var n = yourNumber.toString().split(".");
            //Comma-fies the first part
            n[0] = n[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            //Combines the two sections
            return n.join(".");
        }
        return yourNumber;
    }

    function format_date(date) {
        if (typeof    date != 'undefined') {
            //Seperates the components of the number
            var n = date.toString().split(' ')[0];

        }
        return n;
    }

    var roundFormattedNumber = function (n) {

        if (typeof    n != 'undefined') {
            var result = parseFloat(n.replace(/[^0-9.]/g, ''));
            return isNaN(result) ? NaN : result.toFixed(0);
        }
    };

    $(document).ready(function () {

          $('.datepicker').datetimepicker({
                 format: 'mm-yyyy',
                 startView: 'month',
                 minView: 'month',
                 autoclose: true
             });
        $('#month')
            .datetimepicker({
                format: 'mm-yyyy',
                startView: 'month',
                minView: 'month',
                autoclose: true
            })
            .on('changeDate', function (e) {
                $(this).datetimepicker('hide');
                $('#sa-form').bootstrapValidator('revalidateField', 'asAt');
            });
        $('#sa-form').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                asAt: {
                    validators: {
                        notEmpty: {
                            message: 'Please select the date'
                        }
                    }
                }
            }
        }).on('success.form.bv', function (e) {
            $.ajax({
                url: $('#base_url').val() + 'agent',
                type: 'post',
                data: {
                    ACTION: 'INVOICE_GRID',
                    ap_id: asAt
                },
                dataType: 'json',
                success: function (json) {
                    if (json.success) {
                        json = $.parseJSON(json.data);
                        $.each(json, function (key, value) {
                            if (key == 'rows') {
                                html = "<tr><th class='text-center'>UNIT NUMBER</th><th class='text-center'>TENANT NAME</th><th class='text-center'>RENT</th><th class='text-center'>ARREARS</th><th class='text-center'>MONTH</th><th class='text-center'>YEAR</th></tr>";

                                for (var i = 0; i < json.rows.length; i++) {
                                    var row = json.rows[i];

                                    var total_rent = row['monthlyRent'];
                                    var rent = parseFloat(total_contr);


                                    var total_arrears = row['arrears'];
                                    var arrears = parseFloat(total_arrears);

                                    op_row = "<tr><td>" + row['unitNumber'] + "</td><td>" + row['tenantName'] + "</td><td>" + format_no(row['rent']) + "</td><td>" + format_no(row['arrears']) + "</td><td>" + row['month'] + "</td><td>" + format_no(row['year']) + "</td></tr>";


                                }
                                html2 =html + op_row;

                            }

                        });
                    }
                    $('#select-opbal').html(html2);
                    $('#modal-view-invoice').modal('show');
                }
            });
        });

    });


</script>