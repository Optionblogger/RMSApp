<%--
  Created by IntelliJ IDEA.
  User: willy
  Date: 11/3/18
  Time: 12:32 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container-fluid section">
    <h3 class="text-center main-title" id="title">
        <i class="fa fa-id-card"></i>&nbsp;&nbsp;ADD UNIT LIABILITY
    </h3>
    <form class="form-horizontal" method="post" id="form-add-unit-liability">
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
                        <label for="electricity" class="control-label">Electricity :</label>
                        <input
                                type="number" name="electricity" class="form-control"
                                id="electricity"
                                placeholder="Electricity Cost">

                    </div>

                    <div class="form-group">
                        <label for="water" class="control-label">Water:</label>
                        <input type="number" name="water" class="form-control" id="water"
                               placeholder="Water Cost">
                    </div>


                </fieldset>
            </div>
            <div class="col-md-6">
                <fieldset>
                    <legend>
                    </legend>
                    <div class="form-group">
                        <label for="mismanagement" class="control-label">General House Mismanagement:</label>

                        <input
                                type="number" name="mismanagement" class="form-control"
                                id="mismanagement"
                                placeholder="General House Mismanagement">

                    </div>
                    <div class="form-group">
                        <label for="unitLiabiltyDescription" class="control-label">Description:</label>
                        <textarea rows="6" cols="10" class="form-control" id="unitLiabiltyDescription"
                                  name="unitLiabiltyDescription" style="text-align: right">
                                    </textarea>

                    </div>


                </fieldset>
            </div>
            <div class="row">
                <div class="col-md-6">

                </div>
                <div class="col-md-6">
                    <button class="btn btn-warning pull-right">SAVE</button>
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
        $('#form-add-unit-liability')
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
                        unitLiabiltyDescription: {
                            validators: {
                                notEmpty: {
                                    message: 'Please enter description for the liability'
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
                            ACTION: 'ADD_UNIT_LIABILITY',
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
                        dataType:
                            'json',
                        success: function (json) {
                            $("form#form-add-unit-liability")[0]
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




