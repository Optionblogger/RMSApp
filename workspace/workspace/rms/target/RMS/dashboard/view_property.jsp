<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container-fluid section">
    <h3 class="text-center main-title">
        <i class="fa fa-th"></i>&nbsp;VIEW PROPERTIES
    </h3>

    <table class="table table-responsive table-striped">
        <thead>
        <tr>
            <th>NAME</th>
            <th>LOCATION</th>
            <th>AGENT THAT MANAGE</th>
            <th>NUMBER OF UNITS</th>
            <th>ACTION</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach var="property" items="${properties}">

            <tr>
                <td>${ property.name }</td>
                <td>${ property.location }</td>
                <td>${ property.agent.name }</td>
                <td>${ property.numberOfUnits }</td>


                <td>

                    <button class="btn btn-sm btn-warning"
                            onclick="viewPropertyDetails('${ property.id }');">
                        <i class="glyphicon glyphicon-adjust"></i>&nbsp; Details

                    </button>
                    <button class="btn btn-sm btn-danger"
                            onclick="removeProperty('${ property.id}', '${property.name }');">
                        <i class="glyphicon glyphicon-pencil"></i>&nbsp;REMOVE

                    </button>
                </td>
               <%-- <td>
                    <button class="btn btn-sm btn-primary"
                            onclick="addPropertyUnit('${ property.id }');">
                        <i class="glyphicon glyphicon-eye-open"></i>&nbsp;ADD UNIT

                    </button>

                    <button class="btn btn-sm btn-success"
                            onclick="viewUnits('${ property.id }');">
                        <i class="glyphicon glyphicon-eye-open"></i>&nbsp;VIEW UNITS

                    </button>
                </td>--%>
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
                            window.location.href = $(
                                '#base_url')
                                .val() + 'admin';

                        }
                    });
                }


            }
        );
    }


    function addPropertyUnit(id) {
        $.ajax({
            url: $('#base_url').val() + 'admin',
            type: 'post',
            data: {ACTION: 'ADD_PROPERTY_UNIT', propertyId: id},
            dataType: 'html',
            success: function (html) {
                $('#add_unit-content').html(html);
                $('#modal-add-unit').modal('show');
            }
        });

    }

    function viewPropertyDetails(id) {
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

    function viewUnits(id) {
        $.ajax({
            url: $('#base_url').val() + 'admin',
            type: 'post',
            data: {ACTION: 'VIEW_UNITS', propertyId: id},
            dataType: 'html',
            success: function (html) {
                $('#view-property-units').html(html);
                $('#modal-edit-view-property-units').modal('show');


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


                    var modal = "modal-edit-property";
                    // Prevent form submission
                    e.preventDefault();
                    var form = "form-edit-property";
                    $.ajax({
                        url: $('#base_url').val() + 'admin',
                        type: 'post',

                        data: {
                            ACTION: 'EDIT_PROPERTYINFO',

                            propertyId: $(
                                '#propertyId')
                                .val(),
                            name: $(
                                '#propertyName')
                                .val(),
                            location: $(
                                '#propertyLocation')
                                .val(),
                            road: $(
                                '#propertyRoad')
                                .val(),
                            town: $(
                                '#propertyTown')
                                .val(),
                            landNumber: $(
                                '#propertyLrNumber')
                                .val(),
                            numberOfUnits: $(
                                '#propertyUnitNo')
                                .val(),
                            totalArea: $(
                                '#propertyAreaSF')
                                .val(),
                            agent: $(
                                '#agentName').val()
                        },
                        dataType: 'json',
                        success: function (json) {
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


        $('#form-add-unit').bootstrapValidator(
            {
                excluded: ':disabled',
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
                                message: 'Sorry, Unit Number is required!'
                            }
                        }
                    },
                    unitType: {
                        validators: {
                            notEmpty: {
                                message: 'Sorry, Unit Type is required!'
                            }
                        }
                    },
                    unitDeposit: {
                        validators: {
                            notEmpty: {
                                message: 'Sorry, Unit Deposit is required!'
                            }
                        }
                    },
                    unitMonthlyRent: {
                        validators: {
                            notEmpty: {
                                message: 'Sorry, Unit Monthly Deposit is required!'
                            }
                        }
                    },
                    unitDescription: {
                        validators: {
                            notEmpty: {
                                message: 'Sorry, Unit Description  is required!'
                            }
                        }
                    }


                }
            })
            .on(
                'success.form.bv',
                function (e) {
                    var modal = "modal-add-unit";
                    // Prevent form submission
                    e.preventDefault();
                    var form = "form-add-unit";
                    $.ajax({
                        url: $('#base_url').val() + 'admin',
                        type: 'post',

                        data: {
                            ACTION: 'SAVE_UNIT',
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
                            if (json.success) {
                                $("form#form-add-unit")[0].reset();
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
<div class="modal fade" id="modal-edit-view-property-units" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabelEditBenefit" aria-hidden="true">
    <form role="form" id="form-view-property-units" enctype="multipart/form-data">
        <div class="modal-dialog large-modal">
            <div class="modal-content">
                <div class="modal-body" id="view-property-units">

                </div>

            </div>
        </div>
    </form>
</div>


<div class="modal fade" id="modal-add-unit" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabelViewEmployerBenefit"
     aria-hidden="true">
    <form role="form" id="form-add-unit">
        <div class="modal-dialog large-modal">
            <div class="modal-content">

                <div class="modal-body" id="add_unit-content">

                </div>
                <div class="modal-footer">
                    <input class="btn btn-primary" type="submit"
                           value="ADD UNIT" id="btn-add-unit">
                    <a href="#" class="btn btn-warning" data-dismiss="modal">Close</a>
                </div>
            </div>
        </div>
    </form>
</div>