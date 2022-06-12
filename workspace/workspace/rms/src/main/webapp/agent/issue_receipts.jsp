<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container-fluid section">
    <h3 class="text-center main-title">
        <i class="fa fa-file-text"></i>ISSUE RECEIPTS
    </h3>
    <form class="form-inline" role="form" id="sa-form">
        <div class="row">
            <div class="form-group col-md-2">
                <label for="unitNumber" class="control-label">UNIT NUMBER:</label>
                <select
                        name="unitNumber" id="unitNumber" class="form-control">
                    <option value="">Select Unit...</option>
                    <c:forEach var="unit" items="${units}">
                        <option value="${unit.unitNumber}">
                                ${unit.unitNumber}
                        </option>
                    </c:forEach>
                </select>

            </div>

            <div class="form-group col-md-2">
                <label for="month" class="control-label">MONTH:</label>
                <select
                        name="month" id="month" class="form-control">
                    <option value="">Select Month...</option>
                    <c:forEach var="months" items="${months}">
                        <option value="${months.id}">
                                ${months.name}
                        </option>
                    </c:forEach>
                </select>

            </div>
            <div class="form-group col-md-2">
                <label for="year" class="control-label">YEAR:</label>
                <input
                        type="text" name="year" class="form-control"
                        id="year"
                        placeholder="year">
            </div>

        </div>
        <div class="row">
            <div class="form-group col-md-2">
                <button class="btn btn-primary btn-sm">ISSUE</button>
            </div>
        </div>
    </form>
    <p>&nbsp;</p>
    <div class="col-md-12" id="sa-results">

    </div>
</div>

<div class="modal fade" id="modal-view-contribution" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabelViewContributions" aria-hidden="true">
    <form role="form" id="form-view-contributions">
        <div class="modal-dialog large-modal">
            <div class="modal-content" style="width: 1100px;margin-left: -200px">
                <div class="modal-header">
                    <%--  <button type="button" class="btn btn-warning" &lt;%&ndash;onclick="screenshotrent('page-content');">Download&ndash;%&gt;
                      </button>--%>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" id="myModalLabelViewContributions" style="text-align: center">
                        <i class="glyphicon glyphicon-picture"></i>&nbsp;&nbsp; VIEW RENT PAID
                    </h4>
                </div>
                <div class="modal-body" style=" width: 1000px;margin: auto; background-color: #ffffff"
                     id="page-content">
                    <%--                    <h2 style="text-align: center; color: #2b669a; font-family: 'Roboto'; font-size: 24px;">RENT PAID</h2>--%>
                    <table class="table table-responsive table-striped table-bordered" id="downloadTable"
                           style=" width: 1000px;">
                        <thead>
                        <tr>
                            <th colspan="7" style="text-align: center">Receipts</th>
                        </tr>
                        </thead>
                        <tbody id="select-results">

                        </tbody>
                    </table>
                    <hr>
                    <hr>

                    <hr>
                    <hr>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning pull-right" data-dismiss="modal">Close</button>

                </div>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript">


    function screenshotrent(data) {
        html2canvas(document.getElementById(data)).then(function (canvas) {
            var pdf = new jsPDF();
            //var width = pdf.internal.pageSize.width;
            //var height = pdf.internal.pageSize.height;
            var imgData = canvas.toDataURL("image/jpeg", 1.0);
            pdf.addImage(imgData, 'JPEG', 15, 14);
            pdf.save("Receipts.pdf");

        });
    }

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

    function precisionRound(number, precision) {
        var factor = Math.pow(10, precision);
        return Math.round(number * factor) / factor;
    }

    $(document).ready(function () {



        $('#sa-form').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                unitNumber: {
                    validators: {
                        notEmpty: {
                            message: 'Please select the unit number'
                        }
                    }
                },
                month: {
                    validators: {
                        notEmpty: {
                            message: 'Please select the month'
                        }
                    }
                },
                year: {
                    validators: {
                        notEmpty: {
                            message: 'Please select the month'
                        }
                    }
                }
            }
        }).on('success.form.bv', function (e) {
            $.ajax({
                url: $('#base_url').val() + 'agent',
                type: 'post',
                data: {
                    ACTION: 'ISSUE_RECEIPTS',
                    unitNumber: $('#unitNumber')
                        .val(),
                    month: $('#month')
                        .val(),
                    year: $('#year')
                        .val()
                },
                dataType: 'json',
                success: function (json) {
                    console.log(json);
                    html = "<tr><th>TENANT NAME</th><th>UNIT NUMBER</th><th>AMOUNT PAID</th><th>MONTHLY RENT</th><th>DATE PAID</th><th>MONTH</th><th>YEAR</th></tr>";
                    var amountPaidSum = 0;
                    var monthlyRentSum = 0;
                    var arrearsSum = 0;
                    var totalSum = 0;
                    if (json.success) {

                        json = $.parseJSON(json.data);
                        console.log(json);
                        $.each(json, function (key, value) {
                            if (key == 'rows') {
                                for (var i = 0; i < json.rows.length; i++) {
                                    var row = json.rows[i];
                                    // var arrears = (row['arrears'] != null ? row['arrears'] : 0) || (isEmpty(row['arrears']) ? 0 : row['arrears']);
                                    //var amountPaid = (row['amountPaid'] != null ? row['amountPaid'] : 0) || (isEmpty(row['amountPaid']) ? 0 : row['amountPaid']);
                                    // var monthlyRent = (row['monthlyRent'] != null ? row['monthlyRent'] : 0) || (isEmpty(row['monthlyRent']) ? 0 : row['monthlyRent']);
                                    html = html + "<tr>" +
                                        "<td>" + row['tenantName'] + "</td>" +
                                        "<td>" + row['unitNumber'] + "</td>" +
                                        "<td>" + format_no(row['amountPaid']) + "</td>" +
                                        "<td>" + format_no(row['monthlyRent']) + "</td>" +
                                        "<td>" + row['datePaid'] +
                                        "</td>" +
                                        "<td>" + row['month'] + "</td>" +
                                        "<td>" + row['year'] + "</td>" +
                                        "</tr>";

                                    /*  amountPaidSum = amountPaidSum + parseFloat(row['amountPaid']);
                                      monthlyRentSum = monthlyRentSum +parseFloat( row['monthlyRent']);
                                      arrearsSum = arrearsSum + parseFloat(arrears);*/


                                }

                                //empty = "<tr><th></th><th></th><th>TOTAL AMOUNT PAID</th><th>TOTAL MONTHLY RENT</th><th>TOTAL ARREARS</th><th></th><th></th></tr>";
                                //totals = "<tr><td></td><td></td><td>" + format_no(precisionRound(amountPaidSum, 1)) + "</td><td>" + format_no(precisionRound(monthlyRentSum, 1)) + "</td><td>" + format_no(precisionRound(arrearsSum, 1)) + "</td><td></td><td></td></tr>";
                                html = html;
                                stop_wait();
                            }
                        });
                    }
                    $('#select-results').html(html);
                    stop_wait();
                    $('#modal-view-contribution').modal('show');

                },
                error: function () {
                    bootbox.alert('<p class="text-center">' + "No receipts for the selected period!" + '</p>');
                }
            });
        });



        $('#downloadTable').DataTable({
            dom: 'Bfrtip',
            "searching": false,
            "bSort": false,
            "bInfo": false,
            "bDestroy": true,

            //bFilter: false,
            paging: false,
            buttons: [

                {
                    extend: 'pdfHtml5',
                    text: 'Receipts',
                    title: ' Issue Receipts',
//                    className: 'btn btn-success',
                    orientation: 'landscape', //landscape give you more space
                    pageSize: 'A4'//A0 is the largest A5 smallest(A0,A1,A2,A3,legal,A4,A5,letter))


                }

            ]
        });
    });


</script>

