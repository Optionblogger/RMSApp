<%--
  Created by IntelliJ IDEA.
  User: machinelearning
  Date: 5/30/18
  Time: 12:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container-fluid section">
    <h3 class="text-center main-title">
        <i class="glyphicon glyphicon-film"></i>&nbsp;&nbsp;VIEW &amp; SERVICE CHARGE
    </h3>
    <table class="table table-responsive table-striped" id="service_charge_grid-pdf">
        <thead>
        <tr>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>


        </tr>

        </thead>
        <tbody>

        <tr>
            <th>TENANT NAME</th>
            <th>UNIT No</th>
            <th>PROPERTY</th>
            <th>SERVICE CHARGE</th>
            <th>STATUS</th>
            <th>ACTION</th>
        </tr>
        <c:forEach var="service" items="${serviveCharges}">

            <tr>
                <td>${ service.tenantName }</td>
                <td>${ service.unitNumber }</td>
                <td>${ service.property }</td>
                <td>${ service.serviceCharge }</td>
                <td>${ service.status }</td>

                <td>
                    <button class="btn btn-sm btn-danger"
                            onclick="editServiceCharge('${ service.id }');">
                        <i class="glyphicon glyphicon-pencil"></i>&nbsp;UPDATE
                    </button>

                </td>

            </tr>
        </c:forEach>
        </tbody>

    </table>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $('#service_charge_grid-pdf').DataTable({
            //dom: 'Bfrtip',
            "searching": true,
            //"//bSort": false,
            //"bInfo": true,
            "pageLength": 50,
            paging: true
        });
    });

    function editServiceCharge(id) {
        $.ajax({
            url: $('#base_url').val() + 'agent',
            type: 'post',
            data: {
                ACTION: 'EDIT_SERVICE_CHARGE',
                tenantId: id

            },
            dataType: 'html',
            success: function (html) {
                $('#benefit-content2').html(html);
                $('#modal-view-benefit').modal('show');

                stop_wait();
            }
        });
    }

</script>


<div class="modal fade" id="modal-view-benefit" tabindex="-1" role="dialog" aria-labelledby="myModalLabelViewBenefit"
     aria-hidden="true">
    <form role="form" id="form-view-member">
        <div class="modal-dialog large-modal">
            <div class="modal-content">

                <div class="modal-body" id="benefit-content2">

                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-warning" data-dismiss="modal">Close</a>
                </div>
            </div>
        </div>
    </form>
</div>
