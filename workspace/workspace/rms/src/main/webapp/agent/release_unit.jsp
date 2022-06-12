<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container-fluid section">
    <h3 class="text-center main-title" id="title">
        <i class="fa fa-unlock"></i>&nbsp;&nbsp;RELEASE UNIT
    </h3>
    <form class="form-horizontal" method="post" id="form-add-unit-release">
        <div class="row">
            <div class="col-md-6">
                <fieldset>
                    <legend>
                    </legend>

                    <div class="form-group">
                        <label for="unitNumber" class="control-label">Unit No:</label> <select
                            name="unitNumber" id="unitNumber" class="form-control">
                        <option value="">Select Unit No...</option>
                        <c:forEach var="unit" items="${units}">
                            <option value="${unit.unitNumber}">
                                    ${unit.unitNumber}
                            </option>
                        </c:forEach>
                    </select>
                    </div>

                    <div class="form-group">
                        <label for="tenant" class="control-label">Tenant :</label>
                        <input
                                type="text" name="tenant" class="form-control"
                                id="tenant"
                                placeholder="Tenant Name" readonly>

                    </div>

                    <div class="form-group">
                        <label for="dateLeft" class="control-label">DATE LEFT:</label> <input type="text"
                                                                                              readonly="readonly"
                                                                                              name="dateLeft"
                                                                                              class="form-control datepicker"
                                                                                              id="dateLeft"
                                                                                              placeholder="Date of Exit">
                    </div>


                </fieldset>
            </div>
            <div class="col-md-6">
                <fieldset>
                    <legend>
                    </legend>
                    <div class="form-group">
                        <label for="deposit" class="control-label">Deposit:</label>

                        <input
                                type="numeric" name="deposit" class="form-control"
                                id="deposit"
                                placeholder="Deposit" readonly>

                    </div>
                    <div class="form-group">
                        <label for="liabilities" class="control-label">Liabilities:</label>

                        <input
                                type="numeric" name="liabilities" class="form-control"
                                id="liabilities"
                                placeholder="Liabilities" readonly>

                    </div>
                    <div class="form-group">
                        <label for="balance" class="control-label">Balance:</label>

                        <input
                                type="numeric" name="balance" class="form-control"
                                id="balance"
                                placeholder="Balance" readonly>

                    </div>


                </fieldset>
            </div>
            <div class="row">
                <div class="col-md-6">

                </div>
                <div class="col-md-6">
                    <button class="btn btn-warning pull-right">RELEASE</button>
                </div>
            </div>
        </div>
    </form>

</div>

<script type="text/javascript">

    $("#unitNumber").on("keypress keyup", function () {
        if ($(this).val() == '0') {
            $(this).val('');
        }
    });


    $(document).ready(function () {
        $('.datepicker').datetimepicker({
            format: 'dd-mm-yyyy',
            startView: 'month',
            minView: 'month',
            autoclose: true
        });
        $('#dateLeft')
            .datetimepicker({
                format: 'dd-mm-yyyy',
                startView: 'month',
                minView: 'month',
                autoclose: true
            })
            .on('changeDate', function (e) {
                $(this).datetimepicker('hide');
                $('#sa-form').bootstrapValidator('revalidateField', 'fromDate');
            });

        $("#unitNumber").change(function () {
            var selectedVal = $(this).find(':selected').val();
            console.log(("selected id is " + selectedVal));
            $.ajax({
                url: $('#base_url').val() + 'agent',
                type: 'post',
                data: {ACTION: 'GET_UNIT_RELEASE_DETAILS', unitNumber: selectedVal},
                dataType: 'json',
                success: function (json) {
                    console.log(json);
                    if (json.success) {
                        json = $.parseJSON(json.data);
                        console.log(json);
                        $.each(json, function (key, value) {
                            if (key == 'rows') {
                                for (var i = 0; i < json.rows.length; i++) {
                                    var row = json.rows[i];
                                    var tenantName = (row['tenantName'] != null ? row['tenantName'] : "");
                                    console.log("Tnnnnnnnnnnnnnnnnnn" + tenantName)
                                    var deposit = (row['deposit'] != null ? row['deposit'] : 0);
                                    var liabilities = (row['liabilities'] != null ? row['liabilities'] : 0);
                                    var balance = (row['balance'] != null ? row['balance'] : 0);
                                    document.getElementById("tenant").value = tenantName;
                                    document.getElementById("deposit").value = deposit;
                                    document.getElementById("liabilities").value = liabilities;
                                    document.getElementById("balance").value = balance;

                                    /*$('#tenant').val(tenantName);
                                    $('#deposit').val(deposit);
                                    $('#liabilities').val(liabilities);
                                    $('#balance').val(balance);*/


                                }
                            }
                        });
                    }
                },

                error: function () {
                    bootbox.alert('<p class="text-center">' + "Selected Unit is not Occupied!" + '</p>');
                }
            });


        });
        $('#form-add-unit-release')
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
                                    message: 'Please select unit number'
                                }
                            }
                        }
                        ,
                        dateLeft: {
                            validators: {
                                notEmpty: {
                                    message: 'Please select the date of exit'
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
                        url: $('#base_url').val() + 'agent',
                        type: 'post',
                        data: {
                            ACTION: 'RELEASE_UNIT',
                            dateLeft: $('dateLeft').val(),
                            unitNumber: $('#unitNumber')
                                .val(),
                            tenantName: $('#tenant')
                                .val(),
                            deposit: $('#deposit')
                                .val(),
                            liabilities: $('#liabilities')
                                .val(),
                            balance: $('#balance')
                                .val()
                        },
                        dataType:
                            'json',
                        success: function (json) {
                            $("form#form-add-unit-release")[0]
                                .reset();
                            bootbox.alert("<p class=\"text-center\">" + json.message + "</p>");
                            setTimeout(
                                function () {
                                    window.location.href = $(
                                        '#base_url')
                                            .val()
                                        + 'agent';
                                }, 500);
                        }
                    })
                    ;
                });


    });
</script>




