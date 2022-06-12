<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container-fluid section">
    <h3 class="text-center main-title" id="title">
        <i class="fa fa-plus-circle"></i>&nbsp;ADD UNIT
    </h3>
    <form class="form-horizontal" method="post" id="form-add-unit">
        <div class="row">
            <fieldset>
                <div class="col-sm-6">
                    <input type="hidden" id="propertyId" name="propertyId" value="${ property.id }"/>
                    <div class="form-group">
                        <label for="unitNumber" class="control-label">Unit Number:</label>
                        <input
                                type="text" name="unitNumber" class="form-control"
                                id="unitNumber"
                                placeholder="Unit Number">
                    </div>
                    <div class="form-group">
                        <label for="unitType" class="control-label">Unit Type:</label>
                        <select
                                name="unitType" id="unitType" class="form-control"
                                required>
                            <option value="">Select Unit Type...</option>
                            <option value="residential"> RESIDENTIAL</option>
                            <option value="commercial">COMMERCIAL</option>

                        </select>
                    </div>
                    <div class="form-group">
                        <label for="unitFloor" class="control-label">Floor Number:</label> <input
                            type="text" name="unitFloor"
                            class="form-control"
                            id="unitFloor"
                            placeholder="Floor Number">
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label for="unitDeposit" class="control-label">Unit Deposit:</label>
                        <input
                                type="number" name="unitDeposit"
                                class="form-control"
                                id="unitDeposit"
                                placeholder="Unit Deposit">
                    </div>
                    <div class="form-group">
                        <label for="unitMonthlyRent" class="control-label">Monthly Rent:</label>
                        <input type="number" name="unitMonthlyRent" class="form-control"
                               id="unitMonthlyRent" placeholder="Monthly Rent">
                    </div>
                    <div class="form-group">
                        <label for="unitDescription" class="control-label">Description:</label>
                        <textarea rows="6" cols="10" class="form-control" id="unitDescription"
                                  name="unitDescription" style="text-align: right">
                                    </textarea>

                    </div>
                </div>
            </fieldset>
        </div>
        <div class="row">
            <div class="col-md-6">

            </div>
            <div class="col-md-6">
                <button class="btn btn-warning pull-right">ADD</button>
            </div>
        </div>
    </form>

</div>

<script type="text/javascript">


    $(document).ready(function () {
        $('#form-add-unit')
            .bootstrapValidator(
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
                        }, unitFloor: {
                            validators: {
                                notEmpty: {
                                    message: 'Sorry, Floor Number is required!'
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
                    e.preventDefault();
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
                        dataType:
                            'json',
                        success: function (json) {
                            $("form#form-add-unit")[0]
                                .reset();
                            setTimeout(
                                function () {
                                    window.location.href = $(
                                        '#base_url')
                                            .val()
                                        + 'admin';
                                }, 500);
                        }

                    })
                    ;
                });


    });

</script>