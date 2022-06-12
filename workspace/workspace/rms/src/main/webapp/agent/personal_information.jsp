<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container-fluid section">
    <h3 class="text-center main-title" id="title">
        <i class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;EDIT PERSONAL INFORMATION
    </h3>
    <form class="form-horizontal" method="post" id="pi-form">
        <input type="hidden" id="agentId" value="${ agent.id }"/>
        <div class="row">
            <div class="col-md-6">
                <fieldset>
                    <legend>
                        <i class="fa fa-user"></i> &nbsp;Personal
                    </legend>
                    <div class="form-group">
                        <label for="name" class="col-sm-6 control-label"> Name:</label>
                        <div class="col-sm-6">
                            <input
                                    type="text" name="name" class="form-control  input-sm" id="name"
                                    placeholder="Firstname"
                                    value="${ agent.name }"  ${agentPermission.name == 'TRUE' ? '' : 'disabled'}>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="emailAddress" class="col-sm-6 control-label">Email
                            Address:</label>
                        <div class="col-sm-6"><input type="text" name="emailAddress"
                                                     class="form-control  input-sm" id="emailAddress"
                                                     placeholder="Email Address"
                                                     value="${ agent.emailAddress }" ${agentPermission.emailAddress == 'TRUE' ? '' : 'disabled'}>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="phoneNumber" class="col-sm-6 control-label">Phone
                            Number:</label>
                        <div class="col-sm-6"><input type="text" name="phoneNumber"
                                                     class="form-control  input-sm" id="phoneNumber"
                                                     value="${ agent.phoneNumber }"
                                                     placeholder="Phone Number" ${agentPermission.phoneNumber == 'TRUE' ? '' : 'disabled'}>
                        </div>
                    </div>

                </fieldset>
            </div>
            <div class="col-md-6">
                <fieldset>
                    <legend>
                        <i class="fa fa-phone"></i> &nbsp;Contact
                    </legend>

                    <div class="form-group">
                        <label for="postalAddress" class="col-sm-6 control-label">Postal Address:</label>
                        <div class="col-sm-6"><input type="text" name="postalAddress"
                                                     class="form-control  input-sm" id="postalAddress"
                                                     placeholder="Postal Address"
                                                     value="${ agent.address.postalAddress }" ${agentPermission.postalAddress == 'TRUE' ? '' : 'disabled'}>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="town" class="col-sm-6 control-label">City Or Town:</label>
                        <div class="col-sm-6"><input
                                type="text" value="${ agent.address.town }" name="town" class="form-control  input-sm" id="town"
                                placeholder="City or Town" ${agentPermission.town == 'TRUE' ? '' : 'disabled'}>
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <fieldset>
                    <legend>
                        <i class="fa fa-user"></i> &nbsp;Other Details
                    </legend>
                    <div class="form-group">
                        <label for="agentNumber" class="col-sm-6 control-label">Agent No:</label>
                        <div class="col-sm-6"><input
                                type="text" name="memberNo" class="form-control  input-sm" id="agentNumber"
                                placeholder="Agent No"
                                value="${ agent.agentNumber }"  ${agentPermission.agentNumber == 'TRUE' ? '' : 'disabled'}>
                        </div>
                    </div>


                </fieldset>
                <button class="btn btn-primary" type="submit">UPDATE DETAILS</button>
            </div>

        </div>

    </form>

</div>

<script type="text/javascript">

    $(document).ready(function () {
        $('#pi-form')
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

                        name: {
                            validators: {
                                notEmpty: {
                                    message: 'Please enter your other names'
                                }
                            }
                        },

                        postalAddress: {
                            validators: {
                                notEmpty: {
                                    message: 'Please Enter your Address'
                                }
                            }
                        },

                        emailAddress: {
                            validators: {
                                notEmpty: {
                                    message: 'Please enter your email address'
                                }
                            }
                        },
                        phoneNumber: {
                            validators: {
                                notEmpty: {
                                    message: 'Please enter your phone number'
                                }
                            }
                        },
                        city: {
                            validators: {
                                notEmpty: {
                                    message: 'Please enter your town/city'
                                }
                            }
                        }
                    }
                })
            .on(
                'success.form.bv',
                function (e) {
                    e.preventDefault();

                    var form = "pi-form";
                    console.log('The form is: ' + form);


                    $.ajax({
                        url: $('#base_url').val() + 'admin',
                        type: 'post',
                        data: {
                            ACTION: 'UPDATE_AGENT',
                            agentId: $('#agentId')
                                .val(),
                            agentNumber: $('#agentNumber')
                                .val(),
                            name: $('#name')
                                .val(),
                            emailAddres: $('#emailAddress')
                                .val(),
                            phoneNumber: $('#phoneNumber')
                                .val(),
                            postalAddress: $('#postalAddress')
                                .val(),
                            town: $('#city')
                                .val(),
                        },
                        dataType: 'json',
                        success: function (json) {
                            bootbox
                                .alert('<p class="text-center">'
                                    + json.message
                                    + '</p>');
                        }
                    });
                });


    });
</script>

