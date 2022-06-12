<div class="container-fluid section">
    <h3 class="text-center main-title">
        <i class="glyphicon glyphicon-film"></i>&nbsp;&nbsp;USER ACCESS CONTROL
    </h3>
    <table class="table table-responsive table-striped">
        <tr>
            <th>PROFILE</th>
            <th>DESCRIPTION</th>
            <th>ACTIONS</th>
        </tr>
        <tr>
            <td>ADMINISTRATOR</td>
            <td>SYSTEM ADMINISTRATORS PROFILE</td>
            <td>
                <button class="btn btn-sm btn-warning" onclick="edit_profile('ADMINISTRATOR');"><i
                        class="glyphicon glyphicon-cog"></i>PRIVILEGES
                </button>
            </td>
        </tr>

        <tr>
            <td>LANDLORD</td>
            <td>LANDLORDS</td>
            <td>
                <button class="btn btn-sm btn-warning" onclick="edit_profile('LANDLORD');"><i
                        class="glyphicon glyphicon-cog"></i>PRIVILEGES
                </button>
            </td>
        </tr>
    </table>
</div>
<script type="text/javascript">
    var prof;

    function edit_profile(profile) {
        prof = profile;
        start_wait();
        $.ajax({
            url: $('#base_url').val() + 'admin',
            type: 'post',
            data: {ACTION: 'GET_PERMISSION', profile: profile},
            dataType: 'html',
            success: function (html) {
                $('#permission-content').html(html);
                $('#modal-permission').modal('show');
                stop_wait();
            }
        });
    }

    $(document).ready(function () {
        $('#form-permission').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {}
        })
            .on('success.form.bv', function (e) {

                // Prevent form submission
                e.preventDefault();
                start_wait();
                $.ajax({
                    url: $('#base_url').val() + 'admin',
                    type: 'post',
                    data: {
                        ACTION: 'SAVE_PERMISSION',
                        profile: prof,
                        setup_company: $('#setup_company').prop('checked'),
                        setup_email: $('#setup_email').prop('checked'),
                        setup_logo: $('#setup_logo').prop('checked'),
                        setup_menu: $('#setup_menu').prop('checked'),
                        db_menu: $('#db_menu').prop('checked'),
                        setup_social: $('#setup_social').prop('checked'),
                        setup_theme: $('#setup_theme').prop('checked'),
                        setup_banner: $('#setup_banner').prop('checked'),
                        enable_acc_recovery: $('#enable_acc_recovery').prop('checked'),
                        setup_other: $('#setup_other').prop('checked'),
                        setup_contact_reason: $('#setup_contact_reason').prop('checked'),
                        member_edit: $('#member_edit').prop('checked'),
                        member_view: $('#member_view').prop('checked'),
                        media_upload: $('#media_upload').prop('checked'),
                        media_remove: $('#media_remove').prop('checked'),
                        profile_names: $('#profile_names').prop('checked'),
                        client_names: $('#client_names').prop('checked'),
                        profile_privileges: $('#profile_privileges').prop('checked'),
                        agent_edit_permissions: $('#agent_edit_permissions').prop('checked'),
                        profile_login_username: $('#profile_login_username').prop('checked'),
                        client_setup_config: $('#client_setup_config').prop('checked'),
                        content_help: $('#content_help').prop('checked'),
                        content_page: $('#content_page').prop('checked'),
                        faq_page: $('#faq_page').prop('checked'),
                        setup: $('#setup').prop('checked'),
                        content: $('#content').prop('checked'),
                        agent_menu_config: $('#agent_menu_config').prop('checked'),
                        agent_dashboard_items: $('#agent_dashboard_items').prop('checked'),
                        admin_dashboard_items: $('#admin_dashboard_items').prop('checked'),
                        media: $('#media').prop('checked'),
                        uac: $('#uac').prop('checked'),
                        users: $('#users').prop('checked'),
                        user_enable_disable: $('#user_enable_disable').prop('checked'),
                        audit_trail: $('#audit_trail').prop('checked'),
                        portal_agent_add: $('#portal_agent_add').prop('checked'),
                        portal_agent_view: $('#portal_agent_view').prop('checked'),
                        portal_agent_delete: $('#portal_agent_delete').prop('checked'),
                        portal_member_process: $('#portal_member_process').prop('checked'),
                        portal_landlord_add: $('#portal_landlord_add').prop('checked'),
                        portal_landlord_view: $('#portal_landlord_view').prop('checked'),
                        portal_landlord_delete: $('#portal_landlord_delete').prop('checked'),
                        portal_sponsor_process: $('#portal_sponsor_process').prop('checked'),
                        portal_agents: $('#portal_agents').prop('checked'),
                        portal_landlords: $('#portal_landlords').prop('checked'),
                        password_policy: $('#password_policy').prop('checked'),
                        tenants: $('#tenants').prop('checked'),
                        view_tenant: $('#view_tenant').prop('checked'),
                        property: $('#property').prop('checked'),
                        add_property: $('#add_property').prop('checked'),
                        add_propertyBatch: $('#add_propertyBatch').prop('checked'),
                        view_property: $('#view_property').prop('checked'),
                        unit: $('#unit').prop('checked'),
                        add_unit: $('#add_unit').prop('checked'),
                        view_unit: $('#view_unit').prop('checked'),
                        view_unit_grid: $('#view_unit_grid').prop('checked'),
                        service_charge: $('#service_charge').prop('checked'),
                        view_service_charge: $('#view_service_charge').prop('checked'),
                        rent: $('#rent').prop('checked'),
                        view_rent_paid: $('#view_rent_paid').prop('checked'),
                        view_rent_arrears: $('#view_rent_arrears').prop('checked'),
                        view_rent_prepaid: $('#view_rent_prepaid').prop('checked'),
                        commissions: $('#commissions').prop('checked'),
                        view_commissions: $('#view_commissions').prop('checked'),
                        deductions: $('#deductions').prop('checked'),
                        view_deductions: $('#view_deductions').prop('checked'),
                        invoices: $('#invoices').prop('checked'),
                        view_invoices: $('#view_invoices').prop('checked'),
                        receipts: $('#receipts').prop('checked'),
                        view_receipts: $('#view_receipts').prop('checked'),

                    },
                    dataType: 'json',
                    success: function (json) {
                        if (json.success) {
                            $('#modal-permission').modal('hide');
                        }
                        bootbox.alert(json.message);
                        stop_wait();
                    }
                });
            });
    });
</script>

<div class="modal fade" id="modal-permission" tabindex="-1" role="dialog" aria-labelledby="myModalLabelPermission"
     aria-hidden="true">
    <form role="form" id="form-permission">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" id="myModalLabelPermission">
                        <i class="glyphicon glyphicon-picture"></i>&nbsp;&nbsp;EDIT PROFILE PERMISSIONS
                    </h4>
                </div>
                <div class="modal-body" id="permission-content">

                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-warning" data-dismiss="modal">Cancel</a>
                    <input class="btn btn-primary" type="submit"
                           value="Save Permissions">
                </div>
            </div>
        </div>
    </form>
</div>