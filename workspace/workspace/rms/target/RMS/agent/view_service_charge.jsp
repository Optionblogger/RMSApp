<%--
  Created by IntelliJ IDEA.
  User: machinelearning
  Date: 5/30/18
  Time: 12:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container-fluid section">
    <div class="panel panel-primary">

        <div class="panel-heading" style="background-color: #191970; width: 1000px">
            <h5 style="text-align: center;color: white">VIEW SERVICE CHARGE</h5>

        </div>

        <table class="table table-responsive table-condensed table-striped"
               id="service_charge-pdf" style="font-size: 10px;color: #191970;width: 1000px">

            <thead>
            <tr>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>

            </tr>

            </thead>

            <tbody>


            <tr>
                <td>TENANT NAME</td>
                <td>UNIT No</td>
                <td>PROPERTY</td>
                <td>SERVICE CHARGE</td>
                <td>STATUS</td>
            </tr>
            <c:forEach var="service" items="${serviveCharges}">
                <tr>
                    <td>${ service.tenantName }</td>
                    <td>${ service.unitNumber }</td>
                    <td>${ service.property }</td>
                    <td>${ service.serviceCharge }</td>
                    <td>${ service.status }</td>
                </tr>
            </c:forEach>

            </tbody>
        </table>


    </div>

</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#service_charge-pdf').DataTable({
            dom: 'Bfrtip',
            "searching": true,
            "bSort": false,
            "bInfo": true,
            "pageLength": 50,
            paging: true
        });
    });

</script>



