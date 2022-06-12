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
        <i class="glyphicon glyphicon-film"></i>&nbsp;&nbsp;VIEW &nbsp; AGENT
    </h3>

    <table class="table table-responsive table-striped">
        <thead>
        <tr>
            <th>NAME</th>
            <th>EMAIL ADDRESS</th>
            <th>PHONE NUMBER</th>
            <th>POSTAL ADDRESS</th>
            <th>ACTION</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="property" items="${properties}">

            <tr>
                <td>${ property.name }</td>
                <td>${ property.emailAddress }</td>
                <td>${ property.phoneNumber }</td>
                <td>${ property.address.postalAddress }</td>


                <td>

                    <button class="btn btn-sm btn-warning"
                            onclick="viewPropertyDetails('${ property.id }');">
                        <i class="glyphicon glyphicon-adjust"></i>&nbsp; DETAILS

                    </button>
                    <button class="btn btn-sm btn-danger"
                            onclick="removeProperty('${ property.id}', '${property.name }');">
                        <i class="glyphicon glyphicon-pencil"></i>&nbsp;REMOVE
                    </button>


                </td>
            </tr>

        </c:forEach>
        </tbody>
    </table>
</div>


<script type="text/javascript">
    function removeProperty(id, name) {
        bootbox.confirm("<p class=\"text-center\">Are you sure you want to remove property  <strong>\"" + name + "\"</strong>. Are you sure?</p>", function (result) {
                if (result) {
                    start_wait();
                    $.ajax({
                        url: $('#base_url').val() + 'admin',
                        type: 'post',
                        data: {ACTION: 'REMOVE_PROPERTY', propertyId: id},
                        dataType: 'json',
                        success: function (json) {
                            bootbox.alert("<p class=\"text-center\">" + json.message + "</p>");
                            stop_wait();
                            window.location.href = $(
                                '#base_url')
                                .val() + 'admin';

                        }
                    });
                }


            }
        );
    }


    function addPropertyUnit(id, name) {
        $.ajax({
            url: $('#base_url').val() + 'admin',
            type: 'post',
            data: {ACTION: 'ADD_UNIT', propertyId: id},
            dataType: 'json',
            success: function (json) {
                $('#add_unit-content').html(html);
                $('#modal-add-unit').modal('show');
            }
        });

    }

    function viewPropertyDetails(id) {
        start_wait();
        $.ajax({
            url: $('#base_url').val() + 'admin',
            type: 'post',
            data: {ACTION: 'VIEW_PROPERTY', propertyId: id},
            dataType: 'html',
            success: function (html) {
                $('#update_property-content').html(html);
                $('#modal-edit-property').modal('show');

            }
        });
    }



    $(document).ready(function () {
        $('#form-edit-property').bootstrapValidator(
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

                    var modal = "modal-edit-property";
                    // Prevent form submission
                    e.preventDefault();
                    var form = "form-edit-property";
                    $.ajax({
                        url: $('#base_url').val() + 'benefit-request',
                        type: 'post',

                        data: {
                            ACTION: 'EDIT_MEMBERINFO',

                            benefitId: $('#benefitId').val(),

                            memberNo: $('#memberNo')
                                .val(),
                            memberEmail: $('#email')
                                .val(),
                            totalAmount: $('#totalAmount')
                                .val(),
                            amountPercentage: $('#amountPercentage')
                                .val(),
                            overseasCountry: $('#overseasCountry')
                                .val(),
                            overseasAddress: $('#overseasAddress')
                                .val(),
                            overseasTelephone: $('#overseasTelephone')
                                .val(),
                            overseasFax: $('#overseasFax')
                                .val(),
                            overseasEmail: $('#overseasEmail')
                                .val(),
                            overseasBank: $('#overseasBank')
                                .val(),
                            overseasIbanDetails: $('#overseasIbanDetails')
                                .val(),
                            overseasSwiftCode: $('#overseasSwiftCode')
                                .val(),
                            staffPercentagePerVestingRule: $('#staffPercentagePerVestingRule')
                                .val(),
                            employeeOutstandingLoans: $('#employeeOutstadingLoans')
                                .val(),
                            employeeOutstandingLoansAmount: $('#employeeOutstadingLoansAmount')
                                .val(),
                            staffContribution: $('#staffContribution')
                                .val(),
                            earlyRetirementOption: $('#earlyRetirementOption')
                                .val(),
                            benefitReason: $('#benefitReason')
                                .val(),
                            paymentOption: $('#paymentOption')
                                .val(),
                        },
                        dataType: 'json',
                        success: function (json) {
                            stop_wait();
                            if (json.success) {
                                $("form#form-edit-property")[0].reset();
                                $('#' + modal).modal('hide');

                            }
                            bootbox.alert('<p class="text-center">'
                                + json.message
                                + '</p>');
                        }


                    });
                });


        $('#form-add-unit')
        {

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
                    <a href="#" class="btn btn-warning" data-dismiss="modal">Cancel</a>
                    <input class="btn btn-primary" type="submit"
                           value="Updates Details" id="btn-benefit">
                </div>
            </div>
        </div>
    </form>
</div>

<div class="modal fade" id="modal-add-unit" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabeladdUnit" aria-hidden="true">
    <form role="form" id="form-add-unit" enctype="multipart/form-data">
        <div class="modal-dialog large-modal">
            <div class="modal-content">
                <div class="modal-body" id="add_unit-content">

                </div>
                <div class="modal-footer">
                    <input class="btn btn-primary" type="submit"
                           value="SAVE" id="btn-save">
                </div>
            </div>
        </div>
    </form>
</div>


<div class="modal fade" id="modal-view-employer-benefit" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabelViewEmployerBenefit"
     aria-hidden="true">
    <form role="form" id="form-view-employer-benefit">
        <div class="modal-dialog large-modal">
            <div class="modal-content">

                <div class="modal-body" id="employer-benefit-content2">

                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-warning" data-dismiss="modal">Close</a>
                </div>
            </div>
        </div>
    </form>
</div>