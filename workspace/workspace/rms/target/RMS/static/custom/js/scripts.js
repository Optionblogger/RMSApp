function format_no(yourNumber) {
    if (typeof    yourNumber != 'undefined') {
        //Seperates the components of the number
        var n = yourNumber.toString().split(".");
        //Comma-fies the first part
        n[0] = n[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        //Combines the two sections
        return n.join(".");
    }
    return yourNumber;
}

function hasKey(json, key) {
    return json.hasOwnProperty(key);
}

function adminreload() {
    if ($('#property2_id').val() != '') {

        $.ajax({
            url: $('#base_url').val() + 'admin',
            type: 'post',
            data: {ACTION: 'CHANGE_PROPERTY', propertyID: $('#property2_id').val()},
            dataType: 'json',
            success: function (json) {
                console.log(json);
                if (json.success)
                    setTimeout(function () {
                        window.location.href = $('#base_url').val() + "admin";
                    }, 0);
            }
        });
    }
}

function reloadAgent() {
    if ($('#property2_id').val() != '') {
        $.ajax({
            url: $('#base_url').val() + 'agent',
            type: 'post',
            data:
                {
                    ACTION: 'CHANGE_PROPERTY',
                    propertyID: $('#property2_id').val()
                },
            dataType: 'json',
            success: function (json) {
                if (json.success)
                    setTimeout(function () {
                        var propertyID = $('#property2_id').val();
                        console.log("Property Id: " + propertyID);
                        window.location.href = $('#base_url').val() + "agent"
                    }, 0);
            }
        });
    }

}


var menu_done = false;

var content_done = false;

function load_menu(MODULE) {
    $.ajax({
        url: $('#base_url').val() + 'menu',
        type: 'get',
        data: {menu: MODULE},
        dataType: 'html',
        success: function (html) {
            $('#sub-menu').fadeOut('slow', function () {
                menu_done = true;
                if (content_done) {
                    stop_wait();
                    $('.modal-backdrop').addClass('hide');
                }
                $('#sub-menu').html(html);
                $('#sub-menu').fadeIn('slow');
            });
        }
    });
}

function loadDashboard(MODULE) {
    console.log(MODULE);
    $.ajax({
        url: $('#base_url').val() + 'dashboard',
        type: 'get',
        data: {dashboard: MODULE},
        dataType: 'html',
        success: function (html) {
            $('#dashboard').fadeOut('slow', function () {
                content_done = true;
                if (menu_done) {
                    stop_wait();
                    $('.modal-backdrop').addClass('hide');
                }
                $('#dashboard').html(html);
                $('#dashboard').fadeIn('slow');
            });
        }
    });
}

$(document).ready(function () {

    $("#etl_dateOfBirth").datetimepicker({
        language: 'en',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,
        endDate: new Date(),
        format: 'yyyy-mm-dd'
    });

    $('.datepicker').datetimepicker({
        language: 'en',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,
        format: 'yyyy-mm-dd'
    });

    function m_switch(MODULE) {
        menu_done = true;
        start_wait();
        loadDashboard(MODULE);
    }

    function switch_page(MODULE) {
        menu_done = false;
        content_done = false;
        start_wait();
        load_menu(MODULE);
        loadDashboard(MODULE);
    }

    /***** ADMINISTRATION MENU *****/

    $('#admin-dashboard-li').click(function () {

        start_wait();

        window.location.href = $('#base_url').val() + "admin";

    });

    $('#switch_profile').click(function () {
        var profile = "agent";
        if ($('#switch_to').val() == 'admin')
            profile = 'managerial';
        bootbox.confirm("<p class=\"text-center\">You are about to switch your " + profile + ". Are you sure?</p>", function (result) {
            if (result) {
                start_wait();
                setTimeout(function () {
                    window.location.href = $('#base_url').val() + $('#switch_to').val();
                }, 0);
            }
        });
    });

    $('#setup-main-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#setup-main-li').addClass('active');

        switch_page('SETUP');

    });

    $('#pwd-reset-btn').click(function () {
        $('#modal-pwd-reset').modal('show');
    });

    $('#pwd-reset-btnMobile').click(function () {
        $('#modal-pwd-reset').modal('show');
    });


    $('#pwd-reset-btn-admin').click(function () {
        $('#modal-pwd-reset-admin').modal('show');
    });

    // $('#acc-recover-btn').click(function(){
    //     $('#modal-acc-recover').modal('show');
    //
    // });
    $('#content-main-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#content-main-li').addClass('active');

        switch_page('CONTENT');

    });


    $('#media-main-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#media-main-li').addClass('active');

        switch_page('MEDIA');

    });


    $('#registered-main-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#registered-main-li').addClass('active');

        m_switch('PORTAL_AGENT');

    });

    $('#view_tenants-main-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#view_tenants-main-li').addClass('active');

        m_switch('VIEW_TENANTS');

    });

    $('#add_property-main-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#add_property-main-li').addClass('active');

        m_switch('ADD_PROPERTY');

    });
    $('#add_property-batch-main-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#add_property-batch-main-li').addClass('active');

        m_switch('ADD_PROPERTY_BATCH');

    });

    $('#view_property-main-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#view_property-main-li').addClass('active');

        m_switch('VIEW_PROPERTY');

    });

    $('#add_unit-main-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#add_unit-main-li').addClass('active');

        m_switch('ADD_UNIT');

    });
    $('#view_unit-main-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#view_unit-main-li').addClass('active');

        m_switch('VIEW_UNIT_ADMIN');

    });
    $('#view_unit_grid-main-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#view_unit_grid-main-li').addClass('active');

        m_switch('VIEW_UNIT_GRID_ADMIN');

    });


    $('#view_occupied_unit-main-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#view_occupied_unit-main-li').addClass('active');

        m_switch('VIEW_OCCUPIED_UNIT');

    });


    $('#view_service_charge-main-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#view_service_charge-main-li').addClass('active');

        m_switch('VIEW_SERVICE_CHARGE');

    });

    $('#view_rent_paid-main-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#view_rent_paid-main-li').addClass('active');

        m_switch('VIEW_RENT_PAID');

    });


    $('#view_rent_arrears-main-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#view_rent_arrears-main-li').addClass('active');

        m_switch('VIEW_RENT_ARREARS');

    });

    $('#view_rent_prepaid-main-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#view_rent_prepaid-main-li').addClass('active');

        m_switch('VIEW_RENT_PREPAID');

    });
    $('#vew-rent-prepaid-grid-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#vew-rent-prepaid-grid-li').addClass('active');

        m_switch('VRPP_GRID');

    });


    $('#view_commissions-main-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#view_commissions-main-li').addClass('active');

        m_switch('VIEW_COMMISSIONS');

    });


    $('#view_deductions-main-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#view_deductions-main-li').addClass('active');

        m_switch('VIEW_DEDUCTIONS');

    });

    $('#view_invoices-main-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#view_invoices-main-li').addClass('active');

        m_switch('VIEW_INVOICES');

    });


    $('#view_receipts-main-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#view_receipts-main-li').addClass('active');

        m_switch('VIEW_RECEIPTS');

    });

    $('#add_agent-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#add_agent-li').addClass('active');

        m_switch('ADD_AGENT');

    });

    $('#view_agents-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#view_agents-li').addClass('active');

        m_switch('VIEW_AGENT');

    });

    $('#landlords-main-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#landlords-main-li').addClass('active');

        m_switch('LANDLORD');

    });

    /* $('#add_landlord-main-li').click(function () {

         $('#side-menu.nav li').removeClass('active');

         $('#add_landlord-main-li').addClass('active');

         m_switch('ADD_LANDLORD');

     });*/

    $('#add_landlord-main-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#add_landlord-main-li').addClass('active');

        m_switch('ADD_LANDLORD');

    });
    $('#view_landlord-main-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#view_landlord-main-li').addClass('active');

        m_switch('VIEW_LANDLORD');

    });


    $('#uac-main-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#uac-main-li').addClass('active');

        switch_page('UAC');

    });


    $('#personal-information-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#personal-information-li').addClass('active');

        m_switch("PI");
    });
    $('#agent-dashboard-li').click(function () {

        window.location.href = $('#base_url').val() + "agent";

    });

    $('#view-tenant-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#view-tenant-li').addClass('active');

        m_switch("VT");
    });

    $('#view-tenant-grid-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#view-tenant-grid-li').addClass('active');

        m_switch("VT_GRID");
    });


    $('#send-notification-tenants-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#send-notification-tenants-li').addClass('active');

        m_switch("SNT");
    });
    $('#send-notification-landlord-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#send-notification-landlord-li').addClass('active');

        m_switch("SNL");
    });
    /*   $('#view-property-li').click(function () {

           $('#side-menu.nav li').removeClass('active');

           $('#view-property-li').addClass('active');

           m_switch("VP");
       });*/
    $('#add-contract-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#add-contract-li').addClass('active');

        m_switch("AT");
    });
    $('#add-contract-batch-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#add-contract-batch-li').addClass('active');

        m_switch("ATB");
    });
    $('#view-contract-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#view-contract-li').addClass('active');

        m_switch("VC");
    });

    $('#view-contract-grid-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#view-contract-grid-li').addClass('active');

        m_switch("VC_GRID");
    });


    $('#add-unit-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#add-unit-li').addClass('active');

        m_switch("AU");
    });
    $('#view-unit-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#view-unit-li').addClass('active');

        m_switch("VIEW_UNIT");
    });
    $('#view-unit-grid-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#view-unit-grid-li').addClass('active');

        m_switch("VIEW_UNIT_GRID");
    });

    $('#view-service-charge-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#view-service-charge-li').addClass('active');

        m_switch("VSC");
    });

    $('#view-service-charge-grid-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#view-service-charge-grid-li').addClass('active');

        m_switch("VSC_GRID");
    });


    $('#release-unit-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#release-unit-li').addClass('active');

        m_switch("RU");
    });
    $('#add-unit-liabilities-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#add-unit-liabilities-li').addClass('active');

        m_switch("AUL");
    });
    $('#view-unit-liabilities-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#view-unit-liabilities-li').addClass('active');

        m_switch("VUL");
    });
    $('#view-unit-lib-grid').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#view-unit-lib-grid').addClass('active');

        m_switch("VUL_GRID");
    });
    $('#add-service-charge-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#add-service-charge-li').addClass('active');

        m_switch("ASC");
    });
    $('#record-rent-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#record-rent-li').addClass('active');

        m_switch("RR");
    });
    $('#upload-rent-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#upload-rent-li').addClass('active');

        m_switch("RBU");
    });
    $('#upload-receipts-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#upload-receipts-li').addClass('active');

        m_switch("UR");
    });

    $('#print-invoice-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#print-invoice-li').addClass('active');

        m_switch("PR");
    });
    $('#issue-receipts-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#issue-receipts-li').addClass('active');

        m_switch("IR");
    });
    $('#view-rent-paid-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#view-rent-paid-li').addClass('active');

        m_switch("VRP");
    });

    $('#view-rent-paid-grid-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#view-rent-paid-grid-li').addClass('active');

        m_switch("VRP_GRID");
    });


    $('#view-rent-arrears-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#view-rent-arrears-li').addClass('active');

        m_switch("VRA");
    });


    $('#view-rent-arrears-grid-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#view-rent-arrears-grid-li').addClass('active');

        m_switch("VRA_GRID");
    });

    $('#view-rent-prepaid-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#view-rent-prepaid-li').addClass('active');

        m_switch("VRPP");
    });

    $('#view-rent-prepaid-grid-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#view-rent-prepaid-grid-li').addClass('active');

        m_switch("VRPP_GRID");
    });


    $('#media-files-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#media-files-li').addClass('active');

        m_switch("MF");
    });
    $('#document-files-li').click(function () {

        $('#side-menu.nav li').removeClass('active');

        $('#document-files-li').addClass('active');

        m_switch("DOCUMENTS");
    });


    /***** Other Menu Items *****/

    $('#change-pwd-li').click(function () {
        bootbox.confirm("<p style=\"text-center\">You have requested to change your password. Are you sure?</p>", function (result) {
            if (result) {
                $.ajax({
                    url: $('#base_url').val() + $('#path').val(),
                    type: 'post',
                    data: {ACTION: 'PRE_CHANGE_PASSWORD'},
                    dataType: 'json',
                    success: function (json) {
                        if (json.success) {
                            $('#modal-change-pwd').modal('show');
                        }
                        else {
                            bootbox.alert(json.message);
                        }
                    }
                });
            }
        });
    });

    $('#send-email-btn').click(function () {
        $('#modal-send-email').modal('show');
    });

    $('#logout-li').click(function () {
        bootbox.confirm("<p class='text-center'>Are you sure?</p>", function (result) {
            if (result) {
                $.ajax({
                    url: $('#base_url').val() + "admin",
                    type: 'post',
                    data: {ACTION: 'LOGOUT'},
                    dataType: 'json',
                    success: function (json) {
                        if (json.success) {
                            bootbox.alert('<p class="text-center">You have been logged out successfully.<br />Redirecting...</p>');
                            location.reload();
                        }
                    }
                });
            }
        });

    });
    $('#register-btn').click(function () {
        $('#modal-register').modal('show');
    });

    $('#form-change-password').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        excluded: ':disabled',
        fields: {
            currentPassword: {
                validators: {
                    notEmpty: {
                        message: 'Please enter your current password'
                    }
                }
            },
            securityCode: {
                validators: {
                    notEmpty: {
                        message: 'Please enter the security code'
                    }
                }
            },
            newPassword: {
                validators: {
                    notEmpty: {
                        message: 'Please enter your new password'
                    },
                    identical: {
                        field: 'confirmPassword',
                        message: 'Your passwords must match'
                    },
                    callback: {
                        message: 'Invalid password entered',
                        callback: function (value, validator, $field) {
                            if (value === '') {
                                return true;
                            }

                            // Check the password strength
                            if (value.length < minimum && minimum > 0) {
                                console.log("minimum....");
                                return {
                                    valid: false,
                                    message: 'It must be at least ' + minimum + ' characters long'
                                };
                            }

                            // The password doesn't contain any uppercase character
                            if (value === value.toLowerCase() && uppercase == "true") {
                                console.log("uppercase....");
                                return {
                                    valid: false,
                                    message: 'It must contain at least one upper case character'
                                }
                            }

                            // The password doesn't contain any uppercase character
                            if (value === value.toUpperCase() && lowercase == "true") {
                                console.log("lowercase....");
                                return {
                                    valid: false,
                                    message: 'It must contain at least one lower case character'
                                }
                            }

                            // The password doesn't contain any digit
                            if (value.search(/[0-9]/) < 0 && numbers == "true") {

                                console.log("numbers....");
                                return {
                                    valid: false,
                                    message: 'It must contain at least one digit'
                                }
                            }

                            return true;
                        }
                    }
                }
            },
            confirmPassword: {
                validators: {
                    notEmpty: {
                        message: 'Please confirm the new password'
                    },
                    identical: {
                        field: 'newPassword',
                        message: 'Your passwords must match'
                    },
                    callback: {
                        message: 'Invalid password entered',
                        callback: function (value, validator, $field) {
                            if (value === '') {
                                return true;
                            }

                            // Check the password strength
                            if (value.length < minimum && minimum > 0) {
                                console.log("minimum....");
                                return {
                                    valid: false,
                                    message: 'It must be at least ' + minimum + ' characters long'
                                };
                            }

                            // The password doesn't contain any uppercase character
                            if (value === value.toLowerCase() && uppercase == "true") {
                                console.log("uppercase....");
                                return {
                                    valid: false,
                                    message: 'It must contain at least one upper case character'
                                }
                            }

                            // The password doesn't contain any uppercase character
                            if (value === value.toUpperCase() && lowercase == "true") {
                                console.log("lowercase....");
                                return {
                                    valid: false,
                                    message: 'It must contain at least one lower case character'
                                }
                            }

                            // The password doesn't contain any digit
                            if (value.search(/[0-9]/) < 0 && numbers == "true") {

                                console.log("numbers....");
                                return {
                                    valid: false,
                                    message: 'It must contain at least one digit'
                                }
                            }

                            return true;
                        }
                    }
                }
            }
        }
    })
        .on('success.form.bv', function (e) {

            // Prevent form submission
            e.preventDefault();
            start_wait();
            $.ajax({
                url: $('#base_url').val() + 'admin',
                type: 'POST',
                data: {
                    ACTION: 'CHANGE_PASSWORD',
                    currentPassword: $('#currentPassword').val(),
                    securityCode: $('#securityCode').val(),
                    newPassword: $('#newPassword').val()
                },
                dataType: 'json',
                success: function (json) {
                    stop_wait();
                    if (json.success)
                        $('#modal-change-pwd').modal('hide');
                    bootbox.alert(json.message);
                }
            });

        });

});

$('#form-password-reset').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    excluded: ':disabled',
    fields: {
        Username: {
            validators: {
                notEmpty: {
                    message: 'Please enter your Username'
                }
            }
        }
    }
})

    .on('success.form.bv', function (e) {

        // Prevent form submission
        var resetCountryCode = $('.reset-country-code').val();
        if (resetCountryCode == null) {
            resetCountryCode = '';
        }
        else {
            resetCountryCode = $('.reset-country-code').val();
        }
        e.preventDefault();
        //start_wait();
        $.ajax({
            url: $('#base_url').val() + 'password-reset',
            type: 'POST',
            data: {ACTION: 'REQUEST_RESET', Username: resetCountryCode + $('#Username').val()},
            dataType: 'json',
            success: function (json) {
                stop_wait();
                bootbox.alert(json.message);
                if (json.success)
                    $('#modal-pwd-reset').modal('hide');

                setTimeout(
                    function () {
                        window.location.href = $(
                            '#base_url')
                                .val()
                            + 'password-reset';
                    }, 500);
            }
        });

    });

$('#form-password-reset-admin').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    excluded: ':disabled',
    fields: {
        AUsername: {
            validators: {
                notEmpty: {
                    message: 'Please enter your username'
                }
            }
        }
    }
})

    .on('success.form.bv', function (e) {
        var resetCountryCode = $('.admin-reset-country-code').val();
        if (resetCountryCode == null) {
            resetCountryCode = '';
        }
        else {
            resetCountryCode = $('.admin-reset-country-code').val();
        }
        // Prevent form submission
        e.preventDefault();
        start_wait();
        $.ajax({
            url: $('#base_url').val() + 'password-reset-admin',
            type: 'POST',
            data: {ACTION: 'REQUEST_RESET_ADMIN', AUsername: resetCountryCode + $('#AUsername').val()},
            dataType: 'json',
            success: function (json) {
                stop_wait();
                bootbox.alert(json.message);
                if (json.success)
                    $('#modal-pwd-reset-admin').modal('hide');
                setTimeout(
                    function () {
                        window.location.href = $(
                            '#base_url')
                                .val()
                            + 'password-reset-admin';
                    }, 5000);

            }
        });

    });

$('#form-find-agent-account').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    excluded: ':disabled',
    fields: {
        memberNo: {
            validators: {
                notEmpty: {
                    message: 'Please enter your Membership Number'
                }
            }
        }
    }
})

    .on('success.form.bv', function (e) {

        // Prevent form submission
        e.preventDefault();
        start_wait();
        $.ajax({
            url: $('#base_url').val() + 'find-agent-account',
            type: 'get',
            data: {ACTION: 'FIND_MEMBER', category: 'MEMBER', memberNo: $('#memberNo').val()},
            dataType: 'json',
            success: function (json) {
                stop_wait();
                bootbox.alert(json.message);
                var status = json.success;
                if (status) {
                    setTimeout(
                        function () {
                            window.location.href = $(
                                '#base_url')
                                    .val()
                                + 'recover-account';
                        }, 5000);
                }

            }
        });

    });

//form-sms-code

$('#form-sms-code').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    excluded: ':disabled',
    fields: {
        code: {
            validators: {
                notEmpty: {
                    message: 'Please enter your Activation Code'
                }
            }
        }
    }
})

    .on('success.form.bv', function (e) {

        // Prevent form submission
        e.preventDefault();
        start_wait();
        $.ajax({
            url: $('#base_url').val() + 'sign-in',
            type: 'POST',
            data: {ACTION: 'ACTIVATE_ACCOUNT', code: $('#code').val()},
            dataType: 'json',
            success: function (json) {
                stop_wait();
                bootbox.alert(json.message);
                if (json.success) {
                    var status = json.success;
                    if (status) {
                        $("form#form-sms-code")[0]
                            .reset();
                        setTimeout(
                            function () {
                                window.location.href = $(
                                    '#base_url')
                                        .val()
                                    + 'sign-in';
                            }, 5000);

                    }
                }
            }
        });

    });

$('#form-sms-code-admin').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    excluded: ':disabled',
    fields: {
        code: {
            validators: {
                notEmpty: {
                    message: 'Please enter your Activation Code'
                }
            }
        }
    }
})

    .on('success.form.bv', function (e) {

        // Prevent form submission
        e.preventDefault();
        start_wait();
        $.ajax({
            url: $('#base_url').val() + 'sign-in',
            type: 'POST',
            data: {ACTION: 'ACTIVATE_ACCOUNT_ADMIN', code: $('#code').val()},
            dataType: 'json',
            success: function (json) {
                stop_wait();
                bootbox.alert(json.message);
                if (json.success) {
                    var status = json.success;
                    if (status) {
                        $("form#form-sms-code-admin")[0]
                            .reset();
                        setTimeout(
                            function () {
                                window.location.href = $(
                                    '#base_url')
                                        .val()
                                    + 'admin';
                            }, 5000);

                    }
                }
            }
        });

    });


//modal-resend-code

$('#form-resend-code').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    excluded: ':disabled',
    fields: {
        phoneNumber: {
            validators: {
                notEmpty: {
                    message: 'Please enter your Phone Number'
                }
            }
        }
    }
})

    .on('success.form.bv', function (e) {

        // Prevent form submission
        e.preventDefault();
        start_wait();
        $.ajax({
            url: $('#base_url').val() + 'resend-code',
            type: 'POST',
            data: {ACTION: 'RESEND_CODE', phoneNumber: $('#phoneNumber').val()},
            dataType: 'json',
            success: function (json) {
                stop_wait();
                bootbox.alert(json.message);
                var status = json.success;

                if (status) {


                    // $('#modal-resend-code').modal('hide');

                    $("form#form-sms-code")[0]
                        .reset();
                    setTimeout(
                        function () {
                            window.location.href = $(
                                '#base_url')
                                    .val()
                                + 'activate-account';
                        }, 5000);

                }
            }
        });

    });

$('#form-resend-code-admin').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    excluded: ':disabled',
    fields: {
        userName: {
            validators: {
                notEmpty: {
                    message: 'Please enter your Uername'
                }
            }
        }
    }
})

    .on('success.form.bv', function (e) {

        // Prevent form submission
        e.preventDefault();
        start_wait();
        $.ajax({
            url: $('#base_url').val() + 'resend-code-admin',
            type: 'POST',
            data: {ACTION: 'RESEND_CODE_ADMIN', userName: $('#userName').val()},
            dataType: 'json',
            success: function (json) {
                stop_wait();
                bootbox.alert(json.message);
                var status = json.success;

                if (status) {
                    setTimeout(
                        function () {
                            window.location.href = $(
                                '#base_url')
                                    .val()
                                + 'activate-account-admin';
                        }, 5000);

                }
            }
        });

    });


$('#form-reset-password-admin').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
        resetCodeA: {
            validators: {
                notEmpty: {
                    message: 'Please enter the security code'
                }
            }
        },
        newPassword: {
            validators: {
                notEmpty: {
                    message: 'Please enter your new password'
                },
                identical: {
                    field: 'confirmPassword',
                    message: 'Your passwords must match'
                },
                callback: {
                    message: 'Invalid password entered',
                    callback: function (value, validator, $field) {
                        if (value === '') {
                            return true;
                        }

                        // Check the password strength
                        if (value.length < minimum && minimum > 0) {
                            console.log("minimum....");
                            return {
                                valid: false,
                                message: 'It must be at least ' + minimum + ' characters long'
                            };
                        }

                        // The password doesn't contain any uppercase character
                        if (value === value.toLowerCase() && uppercase == "true") {
                            console.log("uppercase....");
                            return {
                                valid: false,
                                message: 'It must contain at least one upper case character'
                            }
                        }

                        // The password doesn't contain any uppercase character
                        if (value === value.toUpperCase() && lowercase == "true") {
                            console.log("lowercase....");
                            return {
                                valid: false,
                                message: 'It must contain at least one lower case character'
                            }
                        }

                        // The password doesn't contain any digit
                        if (value.search(/[0-9]/) < 0 && numbers == "true") {

                            console.log("numbers....");
                            return {
                                valid: false,
                                message: 'It must contain at least one digit'
                            }
                        }

                        return true;
                    }
                }
            }
        },
        confirmPassword: {
            validators: {
                notEmpty: {
                    message: 'Please confirm the new password'
                },
                identical: {
                    field: 'newPassword',
                    message: 'Your passwords must match'
                },
                callback: {
                    message: 'Invalid password entered',
                    callback: function (value, validator, $field) {
                        if (value === '') {
                            return true;
                        }

                        // Check the password strength
                        if (value.length < minimum && minimum > 0) {
                            console.log("minimum....");
                            return {
                                valid: false,
                                message: 'It must be at least ' + minimum + ' characters long'
                            };
                        }

                        // The password doesn't contain any uppercase character
                        if (value === value.toLowerCase() && uppercase == "true") {
                            console.log("uppercase....");
                            return {
                                valid: false,
                                message: 'It must contain at least one upper case character'
                            }
                        }

                        // The password doesn't contain any uppercase character
                        if (value === value.toUpperCase() && lowercase == "true") {
                            console.log("lowercase....");
                            return {
                                valid: false,
                                message: 'It must contain at least one lower case character'
                            }
                        }

                        // The password doesn't contain any digit
                        if (value.search(/[0-9]/) < 0 && numbers == "true") {

                            console.log("numbers....");
                            return {
                                valid: false,
                                message: 'It must contain at least one digit'
                            }
                        }

                        return true;
                    }
                }
            }
        }
    }
})
    .on('success.form.bv', function (e) {

        // Prevent form submission
        e.preventDefault();
        start_wait();
        $.ajax({
            url: $('#base_url').val() + 'password-reset-admin',
            type: 'POST',
            data: {
                ACTION: 'RESET_PASSWORD_ADMIN',
                resetCodeA: $('#resetCodeA').val(),
                newPassword: $('#newPassword').val()
            },
            dataType: 'json',
            success: function (json) {
                stop_wait();
                bootbox.alert(json.message);

                if (json.success)
                    setTimeout(function () {
                        window.location.href = $('#base_url').val() + "login";
                    }, 3000);
            }
        });

    });

$('#form-reset-password').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
        resetCode: {
            validators: {
                notEmpty: {
                    message: 'Please enter the reset code'
                }
            }
        },
        newPassword: {
            validators: {
                notEmpty: {
                    message: 'Please enter your new password'
                },
                identical: {
                    field: 'confirmPassword',
                    message: 'Your passwords must match'
                },
                callback: {
                    message: 'Invalid password entered',
                    callback: function (value, validator, $field) {
                        if (value === '') {
                            return true;
                        }

                        // Check the password strength
                        if (value.length < minimum && minimum > 0) {
                            console.log("minimum....");
                            return {
                                valid: false,
                                message: 'It must be at least ' + minimum + ' characters long'
                            };
                        }

                        // The password doesn't contain any uppercase character
                        if (value === value.toLowerCase() && uppercase == "true") {
                            console.log("uppercase....");
                            return {
                                valid: false,
                                message: 'It must contain at least one upper case character'
                            }
                        }

                        // The password doesn't contain any uppercase character
                        if (value === value.toUpperCase() && lowercase == "true") {
                            console.log("lowercase....");
                            return {
                                valid: false,
                                message: 'It must contain at least one lower case character'
                            }
                        }

                        // The password doesn't contain any digit
                        if (value.search(/[0-9]/) < 0 && numbers == "true") {

                            console.log("numbers....");
                            return {
                                valid: false,
                                message: 'It must contain at least one digit'
                            }
                        }

                        return true;
                    }
                }
            }
        },
        confirmPassword: {
            validators: {
                notEmpty: {
                    message: 'Please confirm the new password'
                },
                identical: {
                    field: 'newPassword',
                    message: 'Your passwords must match'
                },
                callback: {
                    message: 'Invalid password entered',
                    callback: function (value, validator, $field) {
                        if (value === '') {
                            return true;
                        }

                        // Check the password strength
                        if (value.length < minimum && minimum > 0) {
                            console.log("minimum....");
                            return {
                                valid: false,
                                message: 'It must be at least ' + minimum + ' characters long'
                            };
                        }

                        // The password doesn't contain any uppercase character
                        if (value === value.toLowerCase() && uppercase == "true") {
                            console.log("uppercase....");
                            return {
                                valid: false,
                                message: 'It must contain at least one upper case character'
                            }
                        }

                        // The password doesn't contain any uppercase character
                        if (value === value.toUpperCase() && lowercase == "true") {
                            console.log("lowercase....");
                            return {
                                valid: false,
                                message: 'It must contain at least one lower case character'
                            }
                        }

                        // The password doesn't contain any digit
                        if (value.search(/[0-9]/) < 0 && numbers == "true") {

                            console.log("numbers....");
                            return {
                                valid: false,
                                message: 'It must contain at least one digit'
                            }
                        }

                        return true;
                    }
                }
            }
        }
    }
})
    .on('success.form.bv', function (e) {

        // Prevent form submission
        e.preventDefault();
        start_wait();
        $.ajax({
            url: $('#base_url').val() + 'password-reset',
            type: 'POST',
            data: {
                ACTION: 'RESET_PASSWORD',
                resetCode: $('#resetCode').val(),
                newPassword: $('#newPassword').val()
            },
            dataType: 'json',
            success: function (json) {
                stop_wait();
                bootbox.alert(json.message);

                if (json.success)
                    setTimeout(function () {
                        window.location.href = $('#base_url').val() + 'sign-in';
                    }, 3000);
            }
        });

    });


function hide_or_show() {
    if ($('#maritalStatus').val() == '2') {
        $('#spouseDateOfBirthGroup').removeClass('hide');
        $('#paymentModeGroup').removeClass('hide');
        $('#spouseGenderGroup').removeClass('hide');
    }
    else {
        $('#paymentMode').val('SINGLE');
        $('#spouseDateOfBirthGroup').addClass('hide');
        $('#paymentModeGroup').addClass('hide');
        $('#spouseGenderGroup').addClass('hide');
    }
}