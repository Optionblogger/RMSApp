<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container-fluid section">
    <h3 class="text-center main-title" id="title">
        <i class="fa fa-bell"></i>&nbsp;&nbsp;SEND NOTIFICATIONS TO LANDLORDS
    </h3>
    <form class="form-horizontal" method="post" id="form-landlord-notifications">
        <div class="row">

            <fieldset>
                <div class="col-md-8">
                    <div class="form-group">
                        <label for="to" class="control-label">To:</label>
                        <input
                                type="to" name="to" class="form-control"
                                id="to"
                                placeholder="Optional EmailAddress">
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="form-group">
                        <label for="subject" class="control-label">Subject:</label>
                        <input
                                type="subject" name="subject" class="form-control"
                                id="subject"
                                placeholder="Subject">
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-8">
                        <label for="message" class="control-label">Message:</label>
                    </div>
                    <div class="col-md-8">
                        <textarea id="message" name="message"
                                  rows="10" cols="88"></textarea>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                    </div>
                    <div class="col-md-4">
                        <button class="btn btn-warning pull-right">EMAIL</button>
                    </div>
                </div>
            </fieldset>
        </div>
    </form>
</div>


<script type="text/javascript">
    $(document).ready(function () {
        $('#form-landlord-notifications')
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
                        subject: {
                            validators: {
                                notEmpty: {
                                    message: 'Please enter Subject'
                                }
                            }
                        },
                        message: {
                            validators: {
                                notEmpty: {
                                    message: 'Please enter message'
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
                            ACTION: 'SEND_LANDLORD_NOTIFICATION',
                            to: $('#to').val(),
                            subject: $('#subject')
                                .val(),
                            message: $('#message')
                                .val()
                        },
                        dataType:
                            'json',
                        success: function (json) {
                            $("form#form-landlord-notifications")[0]
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


