<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container-fluid section">
    <h3 class="text-center main-title">
        <i class="fa fa-plus-circle"></i>ADD PROPERTY
    </h3>
    <form class="form-horizontal" method="post" id="form-add-property">
        <div class="row">
            <fieldset>
                <div class="col-sm-5">

                    <div class="form-group">
                        <label for="propertyNo" class="control-label">Property No:</label>
                        <input
                                type="text" name="propertyNo" class="form-control"
                                id="propertyNo"
                                placeholder="">
                    </div>

                    <div class="form-group">
                        <label for="propertyName" class="control-label">Property Name:</label>
                        <input
                                type="text" name="propertyName" class="form-control"
                                id="propertyName"
                                placeholder="">
                    </div>

                    <div class="form-group">
                        <label for="propertyCategory" class="control-label">Property Category:</label>
                        <select name="propertyCategory" id="propertyCategory" class="form-control">
                            <option value="">Select Category...</option>
                            <option value="COMMERCIAL">COMMERCIAL</option>
                            <option value="RESIDENTIAL">RESIDENTIAL</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="lease" class="control-label">Lease:</label>
                        <select name="lease" id="lease" class="form-control">
                            <option value="">Select Lease...</option>
                            <option value="YES">YES</option>
                            <option value="NO">NO</option>
                        </select>
                    </div>


                    <div class="form-group">
                        <label for="landRates" class="control-label">Land Rates:</label>
                        <input
                                type="text" name="landRates" class="form-control"
                                id="landRates"
                                placeholder="">
                    </div>

                    <div class="form-group">
                        <label for="propertyLocation" class="control-label">Location:</label>
                        <input
                                type="text" name="propertyLocation" class="form-control"
                                id="propertyLocation"
                                placeholder="">
                    </div>





                </div>
                <div class="col-sm-1"></div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label for="propertyRoad" class="control-label">Road:</label> <input
                            type="text" name="propertyRoad"
                            class="form-control"
                            id="propertyRoad"
                            placeholder="">
                    </div>
                    <div class="form-group">
                        <label for="propertyTown" class="control-label">Town:</label> <input
                            type="text" name="propertyTown"
                            class="form-control"
                            id="propertyTown"
                            placeholder="">
                    </div>
                    <div class="form-group">
                        <label for="propertyLrNumber" class="control-label">LR Number:</label> <input
                            type="text" name="propertyLrNumber"
                            class="form-control"
                            id="propertyLrNumber"
                            placeholder="">
                    </div>
                    <div class="form-group">
                        <label for="propertyUnitNo" class="control-label">Number of Units:</label> <input
                            type="number" name="propertyUnitNo"
                            class="form-control"
                            id="propertyUnitNo"
                            placeholder="">
                    </div>
                    <div class="form-group">
                        <label for="propertyAreaSF" class="control-label">Area Square Feet:</label> <input
                            type="number" name="propertyAreaSF"
                            class="form-control"
                            id="propertyAreaSF"
                            placeholder="">
                    </div>

                    <div class="form-group">
                        <label for="agentName" class="control-label">Agent to Manage:</label>
                        <select
                                name="agentName" id="agentName" class="form-control">
                            <option value="">Select Agent...</option>
                            <c:forEach var="agent" items="${agents}">
                                <option value="${agent.id}">
                                        ${agent.name}
                                </option>
                            </c:forEach>
                        </select>
                    </div>


                </div>

                <button class="btn btn-warning pull-right">ADD</button>


            </fieldset>
        </div>

    </form>
</div>

<script type="text/javascript">
    $(document).ready(function () {


        $('#form-add-property')
            .bootstrapValidator(
                {
                    message: 'This value is not valid',
                    feedbackIcons: {
                        valid: 'glyphicon glyphicon-ok',
                        invalid: 'glyphicon glyphicon-remove',
                        validating: 'glyphicon glyphicon-refresh'
                    },
                    excluded: ':disabled',
                    fields: {
                        propertyName: {
                            validators: {
                                notEmpty: {
                                    message: 'Sorry,Property Name is required'
                                }/*,
                                regexp: {
                                    regexp: /^[a-z\s]+$/i,
                                    message: 'Sorry, your  name can only consist of alphabetical letters & spaces'
                                }*/
                            }
                        },
                        propertyNo: {
                            validators: {
                                notEmpty: {
                                    message: 'Sorry,Property No is required'
                                }/*,
                                regexp: {
                                    regexp: /^[a-z\s]+$/i,
                                    message: 'Sorry, your  name can only consist of alphabetical letters & spaces'
                                }*/
                            }
                        },

                        propertyCategory: {
                            validators: {
                                notEmpty: {
                                    message: 'Sorry,Property Category is required'
                                }/*,
                                regexp: {
                                    regexp: /^[a-z\s]+$/i,
                                    message: 'Sorry, your  name can only consist of alphabetical letters & spaces'
                                }*/
                            }
                        },
                        lease: {
                            validators: {
                                notEmpty: {
                                    message: 'Sorry,Choose Lease'
                                }/*,
                                regexp: {
                                    regexp: /^[a-z\s]+$/i,
                                    message: 'Sorry, your  name can only consist of alphabetical letters & spaces'
                                }*/
                            }
                        },

                        landRates: {
                            validators: {
                                notEmpty: {
                                    message: 'Please,Enter Land rates'
                                }/*,
                                regexp: {
                                    regexp: /^[a-z\s]+$/i,
                                    message: 'Sorry, your  name can only consist of alphabetical letters & spaces'
                                }*/
                            }
                        },
                        propertyLocation: {
                            validators: {
                                notEmpty: {
                                    message: 'Sorry, your location is required'
                                }
                            }
                        },

                        propertyUnitNo: {
                            validators: {
                                notEmpty: 'Sorry , number of rooms is required'
                            }
                        },
                        agentName: {
                            validators: {
                                notEmpty: 'Sorry , your agent is required'
                            }
                        }


                    }

                })
            .on(
                'success.form.bv',
                function (e) {

                    // Prevent form submission
                    e.preventDefault();
                    // Get the form instance
                    $
                        .ajax({
                            url: $('#base_url').val() + 'admin',
                            type: 'post',
                            data: {
                                ACTION: 'ADD_PROPERTY',
                                propertyId: $('#propertyId').val(),
                                name: $(
                                    '#propertyName')
                                    .val(),
                                propertyNo: $(
                                    '#propertyNo')
                                    .val(),
                                propertyCategory: $(
                                    '#propertyCategory')
                                    .val(),
                                lease: $(
                                    '#lease')
                                    .val(),
                                landRates: $(
                                    '#landRates')
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
                                    '#agentName').val(),


                            },
                            dataType: 'json',
                            success: function (json) {
                                if (json.success) {
                                    $("form#form-add-property")[0]
                                        .reset();
                                    setTimeout(
                                        function () {
                                            window.location.href = $(
                                                '#base_url')
                                                    .val()
                                                + 'admin';
                                        }, 500);
                                }
                                bootbox
                                    .alert('<p class="text-center">'
                                        + json.message
                                        + '</p>');
                                if (json.captcha || !json.success) {
                                    reload_captcha();
                                }
                            }
                        });

                });
    });
</script>


