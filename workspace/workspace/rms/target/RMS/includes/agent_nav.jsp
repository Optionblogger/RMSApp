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
                        <li><a href="javascript:void(0);" id="change-pwd-li"><i
                                class="fa fa-lock"></i>&nbsp;&nbsp;Change Password</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="javascript:void(0);" id="logout-li"><i
                                class="fa fa-power-off"></i>&nbsp;&nbsp;Logout</a></li>

                    </ul>
                </div>
                <div class="logo-element">
                    RMS+
                </div>
            </li>
            <li class="">
                <a href="#"><i class="fa fa-home"></i> <span class="nav-label">HOME</span> <span
                        class="fa arrow"></span></a>
            </li>
            <li class="">
                <a href="#"><i class="fa fa-info-circle"></i> <span class="nav-label">INFO</span> <span
                        class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li id="personal-information-li"><a href="javascript:void(0);"><i
                            class="glyphicon glyphicon-user"></i>&nbsp;<i
                            class="fa fa-chevron-right"></i> PERSONAL INFORMATION</a>
                    </li>
                </ul>
            </li>


            <li>
                <a href="#"><i class="fa fa-user-circle-o"></i> <span class="nav-label">TENANTS</span><span
                        class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <c:if test="${agentMenu.addContract == 'TRUE'}">
                        <li id="add-contract-li"><a href="javascript:void(0);"><i
                                class="fa fa-plus-circle"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i> ADD TENANCY AGREEMENT</a></li>
                    </c:if>
                    <c:if test="${agentMenu.addContractBatch == 'TRUE'}">
                        <li id="add-contract-batch-li"><a href="javascript:void(0);"><i
                                class="fa fa-cloud-upload"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i> ADD TENANCY AGREEMENT BATCH</a></li>
                    </c:if>

                    <c:if test="${agentMenu.viewContractGrid == 'TRUE'}">
                        <li id="view-contract-grid-li"><a href="javascript:void(0);"><i
                                class="fa fa-th"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i> VIEW TENANCY AGREEMENTS GRID</a></li>
                    </c:if>

                    <c:if test="${agentMenu.viewContract == 'TRUE'}">
                        <li id="view-contract-li"><a href="javascript:void(0);"><i
                                class="fa fa-th-list"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i> VIEW TENANCY AGREEMENTS</a></li>
                    </c:if>

                </ul>
            </li>


            <li>
                <a href="#"><i class="fa fa-id-card"></i> <span class="nav-label">RENT</span><span
                        class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <c:if test="${agentMenu.recordRent == 'TRUE'}">
                        <li id="record-rent-li"><a href="javascript:void(0);"> <i class="fa fa-file-o"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>RECORD RENT</a></li>
                    </c:if>
                    <c:if test="${agentMenu.uploadRent == 'TRUE'}">
                        <li id="upload-rent-li"><a href="javascript:void(0);"><i class="fa fa-cloud-upload"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>RENT BATCH UPLOAD</a></li>
                    </c:if>
                    <c:if test="${agentMenu.issueReceipts == 'TRUE'}">
                        <li id="issue-receipts-li"><a href="javascript:void(0);"><i class="fa fa-file-text"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i> ISSUE RECEIPTS</a></li>
                    </c:if>


                    <c:if test="${agentMenu.viewRentPaidGrid == 'TRUE'}">
                        <li id="view-rent-paid-grid-li"><a href="javascript:void(0);"><i class="fa fa-th"></i>
                            &nbsp;<i
                                    class="fa fa-chevron-right"></i>RENT PAID IN CERTAIN PERIOD</a></li>
                    </c:if>

                    <c:if test="${agentMenu.viewRentPaid == 'TRUE'}">
                        <li id="view-rent-paid-li"><a href="javascript:void(0);"> <i class="fa fa-list-alt"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i> ALL RENT PAID</a></li>
                    </c:if>
                    <c:if test="${agentMenu.viewRentArrearsGrid == 'TRUE'}">
                        <li id="view-rent-arrears-grid-li"><a href="javascript:void(0);"> <i class="fa fa-th"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i> VIEW RENT ARREARS IN CERTAIN PERIOD </a></li>
                    </c:if>

                    <c:if test="${agentMenu.viewRentArrears == 'TRUE'}">
                        <li id="view-rent-arrears-li"><a href="javascript:void(0);"><i
                                class="fa fa-list-alt"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i> ALL RENT ARREARS</a></li>
                    </c:if>

                    <c:if test="${agentMenu.viewprepaidRentGrid == 'TRUE'}">
                        <li id="vew-rent-prepaid-grid-li"><a href="javascript:void(0);"> <i
                                class="fa fa-th"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i> VIEW RENT PREPAID IN CERTAIN PERIOD </a></li>
                    </c:if>


                    <c:if test="${agentMenu.viewprepaidRent == 'TRUE'}">
                        <li id="view-rent-prepaid-li"><a href="javascript:void(0);"><i
                                class="fa fa-list-alt"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i> ALL RENT PREPAID</a></li>
                    </c:if>


                </ul>
            </li>

            <li>
                <a href="#"><i class="fa fa-university"></i> <span class="nav-label">UNITS</span><span
                        class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <c:if test="${agentMenu.viewUnitGrid == 'TRUE'}">
                        <li id="view-unit-grid-li"><a href="javascript:void(0);"><i
                                class="fa fa-th"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i> VIEW UNITS GRID</a></li>
                    </c:if>

                    <c:if test="${agentMenu.viewUnit == 'TRUE'}">
                        <li id="view-unit-li"><a href="javascript:void(0);"><i
                                class="fa fa-list-alt"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i> VIEW UNITS</a></li>
                    </c:if>

                    <c:if test="${agentMenu.releaseUnit == 'TRUE'}">
                        <li id="add-unit-liabilities-li"><a href="javascript:void(0);"><i
                                class="fa fa-id-card"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>ADD LIABILITIES</a></li>
                    </c:if>
                    <c:if test="${agentMenu.releaseUnit == 'TRUE'}">
                        <li id="view-unit-liabilities-li"><a href="javascript:void(0);"><i
                                class="fa fa-th"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>VIEW LIABILITIES GRID</a></li>
                    </c:if>
                    <c:if test="${agentMenu.releaseUnit == 'TRUE'}">
                        <li id="view-unit-lib-grid"><a href="javascript:void(0);"><i
                                class="fa fa-list-alt"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>VIEW LIABILITIES </a></li>
                    </c:if>
                    <c:if test="${agentMenu.releaseUnit == 'TRUE'}">
                        <li id="release-unit-li"><a href="javascript:void(0);"><i
                                class="fa fa-unlock"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>RELEASE UNIT</a></li>
                    </c:if>

                </ul>
            </li>
            <%--<li>
                <a href="#"><i class="fa fa-cc-mastercard"></i> <span class="nav-label">RECEIPTS & INVOICES</span><span
                        class="fa arrow"></span></a>
                <ul class="nav nav-second-level">

                    <c:if test="${agentMenu.uploadReceipts == 'TRUE'}">
                        <li id="upload-receipts-li"><a href="javascript:void(0);"><i
                                class="glyphicon glyphicon-record"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i> UPLOAD RECEIPTS</a></li>
                    </c:if>
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

            <%--<li>
                <a href="#"><i class="fa fa-bar-chart-o"></i> <span
                        class="nav-label">SERVICE CHARGERS</span><span
                        class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <c:if test="${agentMenu.viewServiceChargeGrid == 'TRUE'}">
                        <li id="view-service-charge-grid-li"><a href="javascript:void(0);"><i
                                class="glyphicon glyphicon-record"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i> VIEW SERVICE CHARGES GRID</a></li>
                    </c:if>

                    <c:if test="${agentMenu.viewServiceCharge == 'TRUE'}">
                        <li id="view-service-charge-li"><a href="javascript:void(0);"><i
                                class="glyphicon glyphicon-record"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i> VIEW SERVICE CHARGES</a></li>
                    </c:if>
                </ul>
            </li>--%>
            <li>
                <a href="#"><i class="fa fa-bell"></i><span
                        class="nav-label">OTHERS </span><span
                        class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <c:if test="${agentMenu.sendNotification == 'TRUE'}">
                        <li id="send-notification-tenants-li"> <a href="javascript:void(0);">
                            <i
                                class="fa fa-bell"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>SEND NOTIFICATION T0 TENANTS</a>
                        </li>
                    </c:if>

                    <c:if test="${agentMenu.sendNotification == 'TRUE'}">
                        <li id="send-notification-landlord-li"><a href="javascript:void(0);"><i
                                class="fa fa-bell"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>SEND NOTIFICATION T0 LANDLORS</a></li>
                    </c:if>

                    <c:if test="${agentMenu.media == 'TRUE'}">
                        <li id="media-files-li"><a href="javascript:void(0);"><i
                                class="glyphicon glyphicon-briefcase"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i> MEDIA &amp; FILES</a></li>
                    </c:if>
                    <c:if test="${agentMenu.document == 'TRUE'}">
                        <li id="document-files-li"><a href="javascript:void(0);"><i
                                class="glyphicon glyphicon-briefcase"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i> DOCUMENTS</a></li>
                    </c:if>

                </ul>
            </li>
            <li>
                <a href="mailbox.html"><i class="fa fa-envelope"></i> <span class="nav-label">Mailbox </span><span
                        class="label label-warning pull-right">16/24</span></a>
                <ul class="nav nav-second-level collapse">
                    <li><a href="../agent/mailbox.jsp">Inbox</a></li>
                    <li><a href="../agent/mail_detail.jsp">Email view</a></li>
                    <li><a href="../agent/mail_compose.jsp">Compose email</a></li>
                </ul>
            </li>


        </ul>

    </div>
</nav>

