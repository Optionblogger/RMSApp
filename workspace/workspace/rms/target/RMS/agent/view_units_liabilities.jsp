<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container-fluid section">
    <h3 class="text-center main-title">
        <i class="fa fa-th"></i>VIEW UNITS LIABILITIES PER  PROPERTY
    </h3>

    <table class="table table-responsive table-striped" id="myTable">
        <thead>
        <tr>
            <th>UNIT NUMBER</th>
            <th>ELECTRICITY</th>
            <th>WATER</th>
            <th>GENERAL MISMANAGEMENT</th>
            <th>ACTION</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="liability" items="${units}">
            <tr>
                <td>${ liability.unit.unitNumber }</td>
                <td>${ liability.electricityCost }</td>
                <td>${ liability.waterCost }</td>
                <td>${ liability.generalUnitMismanagement }</td>
                <td>
                    <button class="btn btn-sm btn-warning"
                            onclick="viewUnitDetails('${ liability.id }');">
                        <i class="glyphicon glyphicon-adjust"></i>&nbsp; UPDATE
                    </button>
                    <button class="btn btn-sm btn-warning"
                            onclick="deleteLiability('${ liability.id }','${liability.unit.unitNumber}');">
                        <i class="glyphicon glyphicon-adjust"></i>&nbsp;REMOVE

                    </button>
                </td>
            </tr>

        </c:forEach>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    function deleteLiability(id, number) {
        bootbox.confirm("<p class=\"text-center\">Are you sure you want to remove unit liability  <strong>\"" + number + "\"</strong>. Are you sure?</p>", function (result) {
            if (result) {
                //start_wait();
                $.ajax({
                    url: $('#base_url').val() + 'agent',
                    type: 'post',
                    data: {ACTION: 'REMOVE_UNIT_LIABILITY', unitLiabilityId: id},
                    dataType: 'json',
                    success: function (json) {
                        bootbox.alert("<p class=\"text-center\">" + json.message + "</p>");
                        window.location.href = $(
                            '#base_url')
                            .val() + 'agent';

                    }
                });


            }
        });

    }

    function viewUnitDetails(id) {
        $.ajax({
            url: $('#base_url').val() + 'agent',
            type: 'post',
            data: {ACTION: 'VIEW_UNIT_LIABILITY_DETAILS', unitLiability: id},
            dataType: 'html',
            success: function (html) {
                $('#view-unitLiability-content').html(html);
                $('#modal-view-unitLiability').modal('show');

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
        $('#form-edit-unit-liability').bootstrapValidator(
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
                    var modal = "modal-view-unitLiability";
                    // Prevent form submission
                    e.preventDefault();
                    var form = "form-edit-unit-liability";
                    $.ajax({
                        url: $('#base_url').val() + 'agent',
                        type: 'post',

                        data: {
                            ACTION: 'EDIT_UNITLIABILITY',
                            unitLiabilityId: $('#unitLiabilityId')
                                .val(),
                            unitNumber: $('#unitNumber')
                                .val(),
                            electricity: $('#electricity')
                                .val(),
                            water: $('#water')
                                .val(),
                            mismanagement: $('#mismanagement')
                                .val(),
                            unitLiabiltyDescription: $('#unitLiabiltyDescription')
                                .val()


                        },
                        dataType: 'json',
                        success: function (json) {
                            stop_wait();
                            if (json.success) {
                                $("form#form-edit-unit-liability")[0].reset();
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
<div class="modal fade" id="modal-view-unitLiability" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabelEditBenefit" aria-hidden="true">
    <form role="form" id="form-edit-unit-liability" enctype="multipart/form-data">
        <div class="modal-dialog large-modal">
            <div class="modal-content">
                <div class="modal-body" id="view-unitLiability-content">

                </div>

                <div class="modal-footer">
                    <a href="#" class="btn btn-warning" data-dismiss="modal">Close</a>
                    <input class="btn btn-primary" type="submit"
                           value="Updates Details" id="btn-benefit">
                </div>
            </div>
        </div>
    </form>
</div>