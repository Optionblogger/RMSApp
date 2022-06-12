<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="accordion-container">
     <h2 class="accordion-header">SETUP &amp; CONFIGURATION<span class="pull-right">
		 <input type="checkbox" id="setup" class="form-control input-sm"  ${permissions.setup == 'TRUE' ? 'checked' : ''}/></span></h2>
     <div class="accordion-content">
          <p>Access the main setup &amp; configuration features</p>
          <table class="table table-responsive table-striped">
			<tr><td>COMPANY DETAILS</td><td><input type="checkbox" id="setup_company" class="form-control input-sm"  ${permissions.setup_company == 'TRUE' ? 'checked' : ''}/></td></tr>
			  <tr><td>MANAGE EMAIL ADDRESSES</td><td><input type="checkbox" id="setup_email" class="form-control input-sm"  ${permissions.setup_email == 'TRUE' ? 'checked' : ''}/></td></tr>
			<tr><td>SETUP LOGO</td><td><input type="checkbox" id="setup_logo" class="form-control input-sm"  ${permissions.setup_logo == 'TRUE' ? 'checked' : ''}/></td></tr>
			<tr><td>CONFIGURE HOMEPAGE MENU</td><td><input type="checkbox" id="setup_menu" class="form-control input-sm"  ${permissions.setup_menu == 'TRUE' ? 'checked' : ''}/></td></tr>
			<tr><td>CONFIGURE ACCOUNT RECOVERY</td><td><input type="checkbox" id="enable_acc_recovery" class="form-control input-sm"  ${permissions.enable_acc_recovery == 'TRUE' ? 'checked' : ''}/></td></tr>
			<tr><td>SOCIAL NETWORK LINKS</td><td><input type="checkbox" id="setup_social" class="form-control input-sm"  ${permissions.setup_social == 'TRUE' ? 'checked' : ''}/></td></tr>
			<tr><td>THEME SETTINGS</td><td><input type="checkbox" id="setup_theme" class="form-control input-sm"  ${permissions.setup_theme == 'TRUE' ? 'checked' : ''}/></td></tr>
			<tr><td>MANAGE BANNERS</td><td><input type="checkbox" id="setup_banner" class="form-control input-sm"  ${permissions.setup_banner == 'TRUE' ? 'checked' : ''}/></td></tr>
			<tr><td>OTHER SETTINGS</td><td><input type="checkbox" id="setup_other" class="form-control input-sm"  ${permissions.setup_other == 'TRUE' ? 'checked' : ''}/></td></tr>
			<tr><td>MANAGE CONTACT REASONS</td><td><input type="checkbox" id="setup_contact_reason" class="form-control input-sm"  ${permissions.setup_contact_reason == 'TRUE' ? 'checked' : ''}/></td></tr>
		</table>
     </div>
     <h2 class="accordion-header">CONTENT MANAGEMENT<span class="pull-right">
         <input type="checkbox" id="content" class="form-control input-sm"  ${permissions.content == 'TRUE' ? 'checked' : ''}/></span></h2>
     <div class="accordion-content">
          <p>Access the content management functions</p>
           <table class="table table-responsive table-striped">
			<tr><td>HELP CONTENT</td><td><input type="checkbox" id="content_help" class="form-control input-sm"  ${permissions.content_help == 'TRUE' ? 'checked' : ''}/></td></tr>
			<tr><td>PAGE CONTENT</td><td><input type="checkbox" id="content_page" class="form-control input-sm"  ${permissions.content_page == 'TRUE' ? 'checked' : ''}/></td></tr>
			<tr><td>FAQ CONTENT</td><td><input type="checkbox" id="faq_page" class="form-control input-sm"  ${permissions.faq_page == 'TRUE' ? 'checked' : ''}/></td></tr>
			</table>
     </div>
      <h2 class="accordion-header">AGENTS<span class="pull-right"><input type="checkbox" id="portal_agents" class="form-control input-sm"  ${permissions.portal_agents == 'TRUE' ? 'checked' : ''}/></span></h2>
     <div class="accordion-content">
          <p>Access the Agents registered through the portal</p>
          <table class="table table-responsive table-striped">
			<tr><td>REGISTER AGENT</td><td><input type="checkbox" id="portal_agent_add" class="form-control input-sm"  ${permissions.portal_agent_add == 'TRUE' ? 'checked' : ''}/></td></tr>
			<tr><td>VIEW AGENT</td><td><input type="checkbox" id="portal_agent_view" class="form-control input-sm"  ${permissions.portal_agent_view == 'TRUE' ? 'checked' : ''}/></td></tr>
			<tr><td>DELETE AGENT</td><td><input type="checkbox" id="portal_agent_delete" class="form-control input-sm"  ${permissions.portal_agent_delete == 'TRUE' ? 'checked' : ''}/></td></tr>
		  </table>
     </div>

	<h2 class="accordion-header">TENANTS<span class="pull-right"><input type="checkbox" id="tenants" class="form-control input-sm"  ${permissions.tenants == 'TRUE' ? 'checked' : ''}/></span></h2>
	<div class="accordion-content">
		<p>Access the Tenants registered through the portal</p>
		<table class="table table-responsive table-striped">
			<tr><td>VIEW TENANT</td><td><input type="checkbox" id="view_tenant" class="form-control input-sm"  ${permissions.view_tenant == 'TRUE' ? 'checked' : ''}/></td></tr>
		</table>
	</div>

	<h2 class="accordion-header">PROPERTY<span class="pull-right"><input type="checkbox" id="property" class="form-control input-sm"  ${permissions.property == 'TRUE' ? 'checked' : ''}/></span></h2>
	<div class="accordion-content">
		<p>Access the Property registered through the portal</p>
		<table class="table table-responsive table-striped">
			<tr><td>ADD PROPERTY</td><td><input type="checkbox" id="add_property" class="form-control input-sm"  ${permissions.add_property == 'TRUE' ? 'checked' : ''}/></td></tr>
			<tr><td>ADD PROPERTY BATCH</td><td><input type="checkbox" id="add_propertyBatch" class="form-control input-sm"  ${permissions.add_propertyBatch == 'TRUE' ? 'checked' : ''}/></td></tr>
			<tr><td>VIEW PROPERTY</td><td><input type="checkbox" id="view_property" class="form-control input-sm"  ${permissions.view_property == 'TRUE' ? 'checked' : ''}/></td></tr>
		</table>
	</div>


	<h2 class="accordion-header">UNIT<span class="pull-right"><input type="checkbox" id="unit" class="form-control input-sm"  ${permissions.unit == 'TRUE' ? 'checked' : ''}/></span></h2>
	<div class="accordion-content">
		<p>Access the Unit registered through the portal</p>
		<table class="table table-responsive table-striped">
			<tr><td>ADD UNIT</td><td><input type="checkbox" id="add_unit" class="form-control input-sm"  ${permissions.add_unit == 'TRUE' ? 'checked' : ''}/></td></tr>
			<tr><td>VIEW UNIT</td><td><input type="checkbox" id="view_unit" class="form-control input-sm"  ${permissions.view_unit == 'TRUE' ? 'checked' : ''}/></td></tr>
			<tr><td>VIEW UNIT GRID</td><td><input type="checkbox" id="view_unit_grid" class="form-control input-sm"  ${permissions.view_unit_grid == 'TRUE' ? 'checked' : ''}/></td></tr>
<%--			<tr><td>VIEW OCCUPIED UNITS</td><td><input type="checkbox" id="view_occupied_unit" class="form-control input-sm"  ${permissions.view_occupied_unit == 'TRUE' ? 'checked' : ''}/></td></tr>--%>
		</table>
	</div>
	<%--<h2 class="accordion-header">SERVICE CHARGES<span class="pull-right"><input type="checkbox" id="service_charge" class="form-control input-sm"  ${permissions.service_charge == 'TRUE' ? 'checked' : ''}/></span></h2>
	<div class="accordion-content">
		<p>Access the Service Charges registered through the portal</p>
		<table class="table table-responsive table-striped">
			<tr><td>VIEW SERVICE CHARGE</td><td><input type="checkbox" id="view_service_charge" class="form-control input-sm"  ${permissions.view_service_charge == 'TRUE' ? 'checked' : ''}/></td></tr>
		</table>
	</div>--%>

	<h2 class="accordion-header">RENT<span class="pull-right"><input type="checkbox" id="rent" class="form-control input-sm"  ${permissions.rent == 'TRUE' ? 'checked' : ''}/></span></h2>
	<div class="accordion-content">
		<p>Access the Rent</p>
		<table class="table table-responsive table-striped">
			<tr><td>VIEW RENT PAID</td><td><input type="checkbox" id="view_rent_paid" class="form-control input-sm"  ${permissions.view_rent_paid == 'TRUE' ? 'checked' : ''}/></td></tr>
			<tr><td> VIEW RENT ARREARS</td><td><input type="checkbox" id="view_rent_arrears" class="form-control input-sm"  ${permissions.view_rent_arrears == 'TRUE' ? 'checked' : ''}/></td></tr>
			<tr><td>VIEW RENT PREPAID</td><td><input type="checkbox" id="view_rent_prepaid" class="form-control input-sm"  ${permissions.view_rent_prepaid == 'TRUE' ? 'checked' : ''}/></td></tr>
		</table>
	</div>


    <h2 class="accordion-header">COMMISSIONS<span class="pull-right"><input type="checkbox" id="commissions" class="form-control input-sm"  ${permissions.commissions == 'TRUE' ? 'checked' : ''}/></span></h2>
    <div class="accordion-content">
        <p>Access the Commissions</p>
        <table class="table table-responsive table-striped">
            <tr><td>VIEW COMMISSIONS</td><td><input type="checkbox" id="view_commissions" class="form-control input-sm"  ${permissions.view_commissions == 'TRUE' ? 'checked' : ''}/></td></tr>
        </table>
    </div>

    <h2 class="accordion-header">DEDUCTIONS<span class="pull-right"><input type="checkbox" id="deductions" class="form-control input-sm"  ${permissions.deductions == 'TRUE' ? 'checked' : ''}/></span></h2>
    <div class="accordion-content">
        <p>Access the Deductions</p>
        <table class="table table-responsive table-striped">
            <tr><td>VIEW DEDUCTIONS</td><td><input type="checkbox" id="view_deductions" class="form-control input-sm"  ${permissions.view_deductions == 'TRUE' ? 'checked' : ''}/></td></tr>
        </table>
    </div>


    <h2 class="accordion-header">INVOICES<span class="pull-right"><input type="checkbox" id="invoices" class="form-control input-sm"  ${permissions.invoices == 'TRUE' ? 'checked' : ''}/></span></h2>
    <div class="accordion-content">
        <p>Access the Invoices</p>
        <table class="table table-responsive table-striped">
            <tr><td>VIEW INVOICES</td><td><input type="checkbox" id="view_invoices" class="form-control input-sm"  ${permissions.view_invoices == 'TRUE' ? 'checked' : ''}/></td></tr>
        </table>
    </div>

    <h2 class="accordion-header">RECEIPTS<span class="pull-right"><input type="checkbox" id="receipts" class="form-control input-sm"  ${permissions.receipts == 'TRUE' ? 'checked' : ''}/></span></h2>
    <div class="accordion-content">
        <p>Access the Receipts</p>
        <table class="table table-responsive table-striped">
            <tr><td>VIEW INVOICES</td><td><input type="checkbox" id="view_receipts" class="form-control input-sm"  ${permissions.view_receipts == 'TRUE' ? 'checked' : ''}/></td></tr>
        </table>
    </div>




    <h2 class="accordion-header">LANDLORDS<span class="pull-right"><input type="checkbox" id="portal_landlords" class="form-control input-sm"  ${permissions.portal_landlords == 'TRUE' ? 'checked' : ''}/></span></h2>
     <div class="accordion-content">
          <p>Access the Landlords registered through the portal</p>
          <table class="table table-responsive table-striped">
			<tr><td>REGISTER LANDLORD</td><td><input type="checkbox" id="portal_landlord_add" class="form-control input-sm"  ${permissions.portal_landlord_add == 'TRUE' ? 'checked' : ''}/></td></tr>
			<tr><td>VIEW LANDLORD</td><td><input type="checkbox" id="portal_landlord_view" class="form-control input-sm"  ${permissions.portal_landlord_view == 'TRUE' ? 'checked' : ''}/></td></tr>
			<tr><td>DELETE LANDLORD</td><td><input type="checkbox" id="portal_landlord_delete" class="form-control input-sm"  ${permissions.portal_landlord_delete == 'TRUE' ? 'checked' : ''}/></td></tr>
		  </table>
     </div>

     <h2 class="accordion-header">MEDIA<span class="pull-right"><input type="checkbox" id="media" class="form-control input-sm"  ${permissions.media == 'TRUE' ? 'checked' : ''}/></span></h2>
     <div class="accordion-content">
          <p>Access to uploaded media and files</p>
           <table class="table table-responsive table-striped">
				<tr><td>MEDIA/FILE UPLOAD</td><td><input type="checkbox" id="media_upload" class="form-control input-sm"  ${permissions.media_upload == 'TRUE' ? 'checked' : ''}/></td></tr>
				<tr><td>REMOVE MEDIA/FILE</td><td><input type="checkbox" id="media_remove" class="form-control input-sm"  ${permissions.media_remove == 'TRUE' ? 'checked' : ''}/></td></tr>
			</table>
     </div>
      <h2 class="accordion-header">USER ACCESS CONTROL<span class="pull-right"><input type="checkbox" id="uac" class="form-control input-sm"  ${permissions.uac == 'TRUE' ? 'checked' : ''}/></span></h2>
     <div class="accordion-content">
          <p>Access to user permissions</p>
           <table class="table table-responsive table-striped">
				<tr><td>PROFILE PRIVILEGES</td><td><input type="checkbox" id="profile_privileges" class="form-control input-sm"  ${permissions.profile_privileges == 'TRUE' ? 'checked' : ''}/></td></tr>
				<tr><td>CONFIGURE PROFILE NAMES</td><td><input type="checkbox" id="profile_names" class="form-control input-sm"  ${permissions.profile_names == 'TRUE' ? 'checked' : ''}/></td></tr>
				<tr><td>CONFIGURE CLIENT NAMES</td><td><input type="checkbox" id="client_names" class="form-control input-sm"  ${permissions.client_names == 'TRUE' ? 'checked' : ''}/></td></tr>
				<tr><td>AGENT EDIT PERMISSIONS</td><td><input type="checkbox" id="agent_edit_permissions" class="form-control input-sm"  ${permissions.agent_edit_permissions == 'TRUE' ? 'checked' : ''}/></td></tr>
			    <tr><td>AGENT MENU CONFIGURATION</td><td><input type="checkbox" id="agent_menu_config" class="form-control input-sm"  ${permissions.agent_menu_config == 'TRUE' ? 'checked' : ''}/></td></tr>
			   	<tr><td>AGENT DASHBOARD ITEMS</td><td><input type="checkbox" id="agent_dashboard_items" class="form-control input-sm"  ${permissions.agent_dashboard_items == 'TRUE' ? 'checked' : ''}/></td></tr>
			   	<tr><td>ADMIN DASHBOARD ITEMS</td><td><input type="checkbox" id="admin_dashboard_items" class="form-control input-sm"  ${permissions.admin_dashboard_items == 'TRUE' ? 'checked' : ''}/></td></tr>
				<tr><td>PROFILE LOGIN USERNAME</td><td><input type="checkbox" id="profile_login_username" class="form-control input-sm"  ${permissions.profile_login_username == 'TRUE' ? 'checked' : ''}/></td></tr>
				<tr><td>CLIENT SETUP CONFIGURATION</td><td><input type="checkbox" id="client_setup_config" class="form-control input-sm"  ${permissions.client_setup_config == 'TRUE' ? 'checked' : ''}/></td></tr>
				<tr><td>PORTAL USERS</td><td><input type="checkbox" id="users" class="form-control input-sm"  ${permissions.users == 'TRUE' ? 'checked' : ''}/></td></tr>
				<tr><td>ENABLE / DISABLE PORTAL USER</td><td><input type="checkbox" id="user_enable_disable" class="form-control input-sm"  ${permissions.user_enable_disable == 'TRUE' ? 'checked' : ''}/></td></tr>
				<tr><td>PASSWORD POLICY</td><td><input type="checkbox" id="password_policy" class="form-control input-sm"  ${permissions.password_policy == 'TRUE' ? 'checked' : ''}/></td></tr>
				<tr><td>AUDIT TRAILS</td><td><input type="checkbox" id="audit_trail" class="form-control input-sm"  ${permissions.audit_trail == 'TRUE' ? 'checked' : ''}/></td></tr>
			</table>
     </div>

</div>
<script type="text/javascript">
	$(document).ready(function()
		{
			//Add Inactive Class To All Accordion Headers
			$('.accordion-header').toggleClass('inactive-header');

			//Set The Accordion Content Width
			$('.accordion-content').css({'width' : '100%' });

			//Open The First Accordion Section When Page Loads
			$('.accordion-header').first().toggleClass('active-header').toggleClass('inactive-header');
			$('.accordion-content').first().slideDown().toggleClass('open-content');

			// The Accordion Effect
			$('.accordion-header').click(function () {
				if($(this).is('.inactive-header')) {
					$('.active-header').toggleClass('active-header').toggleClass('inactive-header').next().slideToggle().toggleClass('open-content');
					$(this).toggleClass('active-header').toggleClass('inactive-header');
					$(this).next().slideToggle().toggleClass('open-content');
				}

				else {
					$(this).toggleClass('active-header').toggleClass('inactive-header');
					$(this).next().slideToggle().toggleClass('open-content');
				}
			});

			return false;
	});
</script>