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
        <i class="fa fa-th"></i>&nbsp;&nbsp;VIEW UNITS PER PROPERTY
    </h3>

    <table class="table table-responsive table-striped" id="myTable">
        <thead>
        <tr>
            <th>UNIT NUMBER</th>
            <th>MONTHLY RENT</th>
            <th>DEPOSIT</th>
            <th>STATUS</th>
            <th>ACTION</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="unit" items="${units}">
            <tr>
                <td>${ unit.unitNumber }</td>
                <td>${ unit.monthlyRent }</td>
                <td>${ unit.deposit }</td>
                <td>${ unit.occupancyStatus }</td>
                <td>
                    <button class="btn btn-sm btn-warning"
                            onclick="viewUnitDetails('${ unit.id }');">
                        <i class="glyphicon glyphicon-adjust"></i>&nbsp; DETAILS

                    </button>
                </td>
            </tr>

        </c:forEach>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    function viewUnitDetails(id) {
        $.ajax({
            url: $('#base_url').val() + 'agent',
            type: 'post',
            data: {ACTION: 'VIEW_UNIT_DETAILS', unitId: id},
            dataType: 'html',
            success: function (html) {
                $('#view-unit-content').html(html);
                $('#modal-view-unit').modal('show');

            }
        });
    }

    $(document).ready(function () {

        $('#myTable').DataTable({
            // dom: 'Bfrtip',
            "searching": true,
            // "bSort": false,
            "bInfo": true,
            "pageLength": 50,
            paging: true
        });


        $('#form-edit-unit').bootstrapValidator(
            {
                excluded: ':disabled',
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {}
            })
            .on(
                'success.form.bv',
                function (e) {
                    start_wait();

                    var modal = "modal-view-unit";
                    // Prevent form submission
                    e.preventDefault();
                    var form = "form-edit-unit";
                    $.ajax({
                        url: $('#base_url').val() + 'agent',
                        type: 'post',

                        data: {
                            ACTION: 'EDIT_UNITINFO',

                            unitId: $(
                                '#unitId')
                                .val(),
                            unitNumber: $(
                                '#unitNumber')
                                .val(),
                            unitType: $(
                                '#unitType')
                                .val(),
                            unitFloor: $(
                                '#unitFloor')
                                .val(),
                            unitDeposit: $(
                                '#unitDeposit')
                                .val(),
                            unitMonthlyRent: $(
                                '#unitMonthlyRent')
                                .val(),
                            unitDescription: $(
                                '#unitDescription')
                                .val(),
                            propertyId: $(
                                '#propertyId').val()
                        },
                        dataType: 'json',
                        success: function (json) {
                            stop_wait();
                            if (json.success) {
                                $("form#form-edit-unit")[0].reset();
                                $('#' + modal).modal('hide');

                            }
                            bootbox.alert('<p class="text-center">'
                                + json.message
                                + '</p>');
                        }


                    });
                });


    });


</script>
<div class="modal fade" id="modal-view-unit" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabelEditBenefit" aria-hidden="true">
    <form role="form" id="form-edit-unit" enctype="multipart/form-data">
        <div class="modal-dialog large-modal">
            <div class="modal-content">
                <div class="modal-body" id="view-unit-content">

                </div>

                <div class="modal-footer">
                    <a href="#" class="btn btn-warning" data-dismiss="modal">Close</a>
                    <%-- <input class="btn btn-primary" type="submit"
                            value="Updates Details" id="btn-benefit">--%>
                </div>
            </div>
        </div>
    </form>
</div>
