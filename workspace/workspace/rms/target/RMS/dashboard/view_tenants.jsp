<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="css/plugins/dataTables/datatables.min.css" rel="stylesheet">

    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">

</head>

<body>


<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>List of Tenants</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="#">Config option 1</a>
                            </li>
                            <li><a href="#">Config option 2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">

                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover dataTables-example">
                            <thead>
                            <tr>
                                <th>NAME</th>
                                <th>UNIT NO</th>
                                <th>PROPERTY</th>
                                <th>STATUS</th>
                                <th>EMAIL</th>
                                <th>PHONE</th>
                                <th>SERVICE CHARGE</th>
                                <th>DATE JOINED</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="tenancyAgreement" items="${tenancyAgreements}">

                                <tr class="gradeX">
                                    <td>${ tenancyAgreement.name }</td>
                                    <td class="center">${ tenancyAgreement.unitNumber }</td>
                                    <td>${ tenancyAgreement.property }</td>
                                    <td>${ tenancyAgreement.status }</td>
                                    <td class="center">${ tenancyAgreement.emailAddress }</td>
                                    <td>${ tenancyAgreement.phoneNumber }</td>
                                    <td>${ tenancyAgreement.serviceCharge }</td>
                                    <td class="center">${ tenancyAgreement.dateJoined }</td>

                                </tr>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr>
                                <th>NAME</th>
                                <th>UNIT NO</th>
                                <th>PROPERTY</th>
                                <th>STATUS</th>
                                <th>EMAIL</th>
                                <th>PHONE</th>
                                <th>SERVICE CHARGE</th>
                                <th>DATE JOINED</th>
                            </tr>
                            </tfoot>
                        </table>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>


<!-- Mainly scripts -->
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<script src="js/plugins/dataTables/datatables.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="js/inspinia.js"></script>
<script src="js/plugins/pace/pace.min.js"></script>

<!-- Page-Level Scripts -->
<script>
    $(document).ready(function () {
        $('.dataTables-example').DataTable({
            pageLength: 25,
            responsive: true,
            dom: '<"html5buttons"B>lTfgitp',
            buttons: [
                {extend: 'copy'},
                {extend: 'csv'},
                {extend: 'excel', title: 'Tenants'},
                {extend: 'pdf', title: 'Tenants'},

                {
                    extend: 'print',
                    customize: function (win) {
                        $(win.document.body).addClass('white-bg');
                        $(win.document.body).css('font-size', '10px');

                        $(win.document.body).find('table')
                            .addClass('compact')
                            .css('font-size', 'inherit');
                    }
                }
            ]

        });

    });

</script>

</body>

</html>



