<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav metismenu" id="side-menu">
            <li class="nav-header">
                <div class="dropdown profile-element"> <span>
                            <img alt="image" class="img-circle" src="static/images/icons/menu/user.png"/>
                             </span>
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear"> <span class="block m-t-xs"> <strong
                                    class="font-bold">${ username }</strong>
                             </span> <span class="text-muted text-xs block">${profile}<b
                                    class="caret"></b></span> </span> </a>
                    <ul class="dropdown-menu animated fadeInRight m-t-xs">
                        <li><a href="javascript:void(0);" id="change-pwd-li">Change Password</a></li>
                        <li class="divider"></li>
                        <li><a href="javascript:void(0);" id="logout-li">Logout</a></li>
                    </ul>
                </div>
                <div class="logo-element">
                    RMS+
                </div>
            </li>
            <li class="active">
                <a href="#"><i class="glyphicon glyphicon-user"></i> <span class="nav-label">AGENTS</span> <span
                        class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <c:if test="${ permissions.portal_agent_add == 'TRUE' }">
                        <li id="add_agent-li"><a href="javascript:void(0);"><i
                                class="fa fa-plus-circle"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>ADD AGENT</a></li>
                    </c:if>
                    <c:if test="${ permissions.portal_agents == 'TRUE' }">
                        <li id="view_agents-li"><a href="javascript:void(0);"><i
                                class="fa fa-th"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>VIEW AGENT</a></li>
                    </c:if>
                </ul>
            </li>


            <li>
                <a href="#"><i class="fa fa-user-circle-o"></i> <span class="nav-label">TENANTS</span><span
                        class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <c:if test="${ permissions.view_tenant == 'TRUE' }">
                        <li id="view_tenants-main-li"><a href="javascript:void(0);"><i
                                class="fa fa-th"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>VIEW TENANTS</a></li>
                    </c:if>
                </ul>
            </li>
            <li>
                <a href="#"><i class="fas fa-building"></i> <span class="nav-label">PROPERTY</span><span
                        class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <c:if test="${ permissions.add_property == 'TRUE' }">
                        <li id="add_property-main-li"><a href="javascript:void(0);"><i
                                class="fa fa-plus-circle"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>ADD PROPERTY</a></li>
                    </c:if>
                    <c:if test="${ permissions.add_propertyBatch == 'TRUE' }">
                        <li id="add_property-batch-main-li"><a href="javascript:void(0);"><i
                                class="fa fa-cloud-upload"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>ADD BATCH PROPERTY</a></li>
                    </c:if>
                    <c:if test="${ permissions.view_property == 'TRUE' }">
                        <li id="view_property-main-li"><a href="javascript:void(0);"><i
                                class="fa fa-th"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>VIEW PROPERTY</a></li>
                    </c:if>

                </ul>
            </li>


            <li>
                <a href="#"><i class="fa fa-university"></i> <span class="nav-label">UNIT</span><span
                        class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <c:if test="${ permissions.add_unit == 'TRUE' }">
                        <li id="add_unit-main-li"><a href="javascript:void(0);"><i
                                class="fa fa-plus-circle"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>ADD UNIT</a></li>
                    </c:if>


                    <c:if test="${ permissions.view_unit_grid == 'TRUE' }">
                        <li id="view_unit_grid-main-li"><a href="javascript:void(0);"><i
                                class="fa fa-th"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>VIEW UNIT GRID</a></li>
                    </c:if>
                    <c:if test="${ permissions.view_unit == 'TRUE' }">
                        <li id="view_unit-main-li"><a href="javascript:void(0);"><i
                                class="fa fa-list-alt"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>VIEW UNIT</a></li>

                    </c:if>
                </ul>
            </li>

            <li>
                <a href="#"><i class="fa fa-id-card"></i> <span class="nav-label">RENT</span><span
                        class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <c:if test="${ permissions.view_rent_paid == 'TRUE' }">
                        <li id="view_rent_paid-main-li"><a href="javascript:void(0);"><i
                                class="fa fa-th"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>VIEW RENT PAID</a></li>
                    </c:if>


                    <c:if test="${ permissions.view_rent_arrears == 'TRUE' }">
                        <li id="view_rent_arrears-main-li"><a href="javascript:void(0);"><i
                                class="fa fa-th"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>VIEW RENT ARREARS</a></li>
                    </c:if>

                    <c:if test="${ permissions.view_rent_prepaid == 'TRUE' }">
                        <li id="view_rent_prepaid-main-li"><a href="javascript:void(0);"><i
                                class="fa fa-th"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>VIEW RENT PREPAID</a></li>
                    </c:if>

                </ul>
            </li>
            <li>
                <a href="#"><i class="fa fa-bar-chart-o"></i> <span class="nav-label">COMMISSIONS</span><span
                        class="fa arrow"></span></a>
                <ul class="nav nav-second-level">

                    <c:if test="${ permissions.view_commissions == 'TRUE' }">
                        <li id="view_commissions-main-li"><a href="javascript:void(0);"><i
                                class="glyphicon glyphicon-record"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>VIEW COMMISSIONS</a></li>
                    </c:if>
                    <c:if test="${ permissions.view_deductions == 'TRUE' }">
                        <li id="view_deductions-main-li"><a href="javascript:void(0);"><i
                                class="glyphicon glyphicon-record"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>VIEW DEDUCTIONS</a></li>
                    </c:if>


                </ul>
            </li>
            <%--<li>
                <a href="#"><i class="fa fa-bar-chart-o"></i> <span
                        class="nav-label">INVOICES & RECEIPTS</span><span
                        class="fa arrow"></span></a>
                <ul class="nav nav-second-level">

                    <c:if test="${ permissions.view_invoices == 'TRUE' }">
                        <li id="view_invoices-main-li"><a href="javascript:void(0);"><i
                                class="glyphicon glyphicon-record"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>VIEW INVOICES</a></li>
                    </c:if>

                    <c:if test="${ permissions.view_receipts == 'TRUE' }">
                        <li id="view_receipts-main-li"><a href="javascript:void(0);"><i
                                class="glyphicon glyphicon-record"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>VIEW RECEIPTS</a></li>
                    </c:if>


                </ul>
            </li>--%>
            <li>
                <a href="#"><i class="glyphicon glyphicon-user"></i> <span
                        class="nav-label">LANDLORD</span><span
                        class="fa arrow"></span></a>
                <ul class="nav nav-second-level">

                    <c:if test="${ permissions.portal_landlord_view == 'TRUE' }">
                        <li id="view_landlord-main-li"><a href="javascript:void(0);"><i
                                class="fa fa-th"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>VIEW LANDLORD</a></li>
                    </c:if>

                    <c:if test="${ permissions.portal_landlord_add == 'TRUE' }">
                        <li id="add_landlord-main-li"><a href="javascript:void(0);"><i
                                class="fa fa-plus-circle"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>ADD LANDLORD</a></li>
                    </c:if>

                </ul>
            </li>
            <li>
                <a href="#"><i class="glyphicon glyphicon-cog"></i> <span
                        class="nav-label">SETTINGS</span><span
                        class="fa arrow"></span></a>
                <ul class="nav nav-second-level">

                    <c:if test="${ permissions.uac == 'TRUE' }">
                        <li id="uac-main-li"><a href="javascript:void(0);"><i
                                class="glyphicon glyphicon-cog"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i> ACCESS CONTROL</a></li>
                    </c:if>

                    <c:if test="${ permissions.setup == 'TRUE' }">
                        <li id="setup-main-li" class=""><a href="javascript:void(0);"><i
                                class="glyphicon glyphicon-cog"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i> SETUP &amp; CONFIGURATION</a></li>
                    </c:if>

                </ul>
            </li>
            <li>
                <a href="mailbox.html"><i class="fa fa-envelope"></i> <span class="nav-label">Mailbox </span><span
                        class="label label-warning pull-right">16/24</span></a>
                <ul class="nav nav-second-level collapse">
                    <li><a href="mailbox.html">Inbox</a></li>
                    <li><a href="mail_detail.html">Email view</a></li>
                    <li><a href="mail_compose.html">Compose email</a></li>
                    <li><a href="email_template.html">Email templates</a></li>
                </ul>
            </li>


        </ul>

    </div>
</nav>

<%--<script type="text/javascript">
    $(document).ready(function () {


        $('#add_agent-li').click(function () {
            $('#side-menu.nav li').removeClass('active');
            $('#add_agent-li').addClass('active');

            m_switch("ADD_AGENT");
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

        $('#add_landlord-main-li').click(function () {

            $('#side-menu.nav li').removeClass('active');

            $('#add_landlord-main-li').addClass('active');

            m_switch('ADD_LANDLORD');

        });

        $('#add_landlord-main-li').click(function () {

            $('#side-menu.nav li').removeClass('active');

            $('#add_landlord-main-li').addClass('active');

            m_switch('ADD_LANDLORD');

        });


        $('#uac-main-li').click(function () {

            $('#side-menu.nav li').removeClass('active');

            $('#uac-main-li').addClass('active');

            switch_page('UAC');

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
        $('#view_property-main-li').click(function () {

            $('#side-menu.nav li').removeClass('active');

            $('#view_property-main-li').addClass('active');

            m_switch('VIEW_PROPERTY');

        });
        $('#add_unit-main-li').click(function () {

            $('#side-menu.nav li').removeClass('active');

            $('#add_unit-main-li').addClass('active');

            m_switch('ADD_UNIT');

        });$('#agent-dashboard-li').click(function () {

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


        $('#send-notification-li').click(function () {

            $('#side-menu.nav li').removeClass('active');

            $('#send-notification-li').addClass('active');

            m_switch("SN");
        });
        /*   $('#view-property-li').click(function () {

               $('#main-menu.nav li').removeClass('active');

               $('#view-property-li').addClass('active');

               m_switch("VP");
           });*/



        $('#add-unit-li').click(function () {

            $('#side-menu.nav li').removeClass('active');

            $('#add-unit-li').addClass('active');

            m_switch("AU");
        });
        $('#view_unit_grid-main-li').click(function () {

            $('#side-menu.nav li').removeClass('active');

            $('#view_unit_grid-main-li').addClass('active');

            m_switch('VIEW_UNIT_GRID_ADMIN');

        });

        $('#view_unit-main-li').click(function () {

            $('#side-menu.nav li').removeClass('active');

            $('#view_unit-main-li').addClass('active');

            m_switch('VIEW_UNIT_ADMIN');

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

        $('#uac-main-li').click(function () {

            $('#side-menu.nav li').removeClass('active');

            $('#uac-main-li').addClass('active');

            switch_page('UAC');

        });


        $('#setup-main-li').click(function () {

            $('#side-menu.nav li').removeClass('active');

            $('#setup-main-li').addClass('active');

            switch_page('SETUP');

        });



    });

    function m_switch(MODULE) {
        menu_done = true;
        start_wait();
        loadDashboard(MODULE);
    }

    function start_wait() {
        $('#wait-dialog').modal({
            backdrop: 'static',
            keyboard: false
        });
    }




</script>--%>

