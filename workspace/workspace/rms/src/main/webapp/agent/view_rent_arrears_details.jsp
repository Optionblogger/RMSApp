<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="css/plugins/dataTables/datatables.min.css" rel="stylesheet">

    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">

</head>
<div class="container-fluid section">


    <div class="row">
        <div class="col-md-12">

            <div class="panel panel-primary" style="width:1000px">

                <div class="panel-heading" style="background-color: #f8b437">
                    <h5 style="text-align: center;color: black">RENT ARREARS STATEMENT</h5>

                </div>

                <!-- Table -->
                <table class="table-hover table table-responsive table-bordered table-condensed table-striped"
                       id="cumulative_statement" style="font-size: 12px;margin: 0px">

                    <thead>
                    <tr>
                        <th>TENANT NAME</th>
                        <th>UNIT NUMBER</th>
                        <th>ARREARS</th>
                        <th>MONTH</th>
                        <th>YEAR</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="rent" items="${rents}">
                        <tr>
                            <td>${ rent.tenantName }</td>
                            <td>${ rent.unitNumber }</td>
                            <td>${ rent.arrears }</td>
                            <td>${ rent.month }</td>
                            <td>${ rent.year }</td>
                        </tr>

                    </c:forEach>


                    </tbody>
                </table>

            </div>
        </div>
    </div>
</div>
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<script src="js/plugins/dataTables/datatables.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="js/inspinia.js"></script>
<script src="js/plugins/pace/pace.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#cumulative_statement').DataTable({
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
                    text: 'Download Rent Arrears Statement',
                    title: 'RENT ARREARS STATEMENT',
//                    className: 'btn btn-success',
                    orientation: 'landscape', //landscape give you more space
                    pageSize: 'A4'//A0 is the largest A5 smallest(A0,A1,A2,A3,legal,A4,A5,letter))


                }

            ]
        });
    });


</script>



