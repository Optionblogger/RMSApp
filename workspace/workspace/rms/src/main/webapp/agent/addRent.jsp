<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container-fluid section">
    <h2 class="text-center main-title">
        <i class="fa fa-file-o">
            RECORD RENT</i></h2>
    <form class="form-horizontal" method="post" id="form-add-rent">
        <fieldset>
            <div class="col-sm-6">
                <div class="form-group">
                    <label for="unitNumber" class="control-label">Unit Number:</label>
                    <select
                            name="unitNumber" id="unitNumber" class="form-control">
                        <option value="">Select Unit...</option>
                        <c:forEach var="tenant" items="${units}">
                            <option value="${tenant.unitNumber}">
                                    ${tenant.unitNumber}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group">
                    <label for="rentAmount" class="control-label">Amount:</label>
                    <input
                            type="number" name="rentAmount" class="form-control"
                            id="rentAmount"
                            placeholder="">
                </div>
                <div class="form-group">
                    <label for="datePaid" class="control-label"> DatePaid:</label>
                    <input type="text" name="datePaid" class="form-control datetimepicker"
                           id="datePaid"
                           placeholder="">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label for="month" class="control-label">Month:</label>
                    <select
                            name="month" id="month" class="form-control"
                            required>
                        <option value="">Select Month...</option>
                        <c:forEach var="month1" items="${months}">
                            <option value="${month1.id}">
                                    ${month1.name}
                            </option>
                        </c:forEach>

                    </select>
                </div>
                <div class="form-group">
                    <label for="year" class="control-label">Year:</label>
                    <input
                            type="text" name="year" class="form-control"
                            id="year"
                            placeholder="year">
                </div>


            </div>

            <button class="btn btn-warning pull-right">ADD</button>


        </fieldset>

    </form>
</div>
<script>

    $('#datePaid')
        .datetimepicker({
            language: 'en',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0,
            format: 'yy-mm-dd'
        })
        .on('changeDate', function (e) {
            // Revalidate the date field
            $('#form-add-rent').bootstrapValidator('revalidateField', 'datePaid');

        });

    //
    // $('#year').datepicker({
    //     minViewMode: 'years',
    //     autoclose: true,
    //     format: 'yyyy'
    // }).on('changeDate', function (e) {
    //     // Revalidate the date field
    //     $('#form-add-rent').bootstrapValidator('revalidateField', 'year');
    // });

    $(document).ready(function () {
        $('#form-add-rent')
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
                                    message: 'Please enter Unit Number'
                                }
                            }
                        },
                        rentAmount: {
                            validators: {
                                notEmpty: {
                                    message: 'Please enter Rent Amount'
                                }
                            }
                        },

                        datePaid: {
                            validators: {
                                notEmpty: {
                                    message: 'Please Enter date paid'
                                }
                            }
                        },
                        month: {
                            validators: {
                                notEmpty: {
                                    message: 'Please enter Month'
                                }
                            }
                        },
                        year: {
                            validators: {
                                notEmpty: {
                                    message: 'Please enter Year'
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
                            ACTION: 'RECORD_RENT',
                            unitNumber: $('#unitNumber')
                                .val(),
                            rentAmount: $('#rentAmount')
                                .val(),
                            datePaid: $('#datePaid')
                                .val(),
                            monthId: $('#month')
                                .val(),
                            year: $('#year')
                                .val()
                        },
                        dataType:
                            'json',
                        success: function (json) {
                            $("form#form-add-rent")[0]
                                .reset();
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


