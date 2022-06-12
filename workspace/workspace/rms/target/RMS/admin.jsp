<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% pageContext.setAttribute("currentYear", java.util.Calendar.getInstance().get(java.util.Calendar.YEAR)); %>
<jsp:include page="includes/partial/admin_header.jsp"/>
<input type="hidden" id="switch_to" value="member"/>
<input type="hidden" name="schemeID" id="schemeID" value="${ scheme_id }"/>
<input type="hidden" name="profile" id="profile" value="${ profile }"/>
<input type="hidden" id="minimum" value="${ policy.length }"/>
<input type="hidden" id="lowercase" value="${ policy.lowercase }"/>
<input type="hidden" id="uppercase" value="${ policy.uppercase }"/>
<input type="hidden" id="numbers" value="${ policy.numbers }"/>
<div class="container-fluid navigation-bar">
    <div class="container-fluid">
        <div class="col-md-2">
            <div id="sidebar-left">
                <h2 class="text-center">
                    <small>MAIN MENU</small>
                </h2>
                <ul id="main-menu" class="nav">
                    <li id="admin-dashboard-li" class="active"><a href="javascript:void(0);"><i
                            class="glyphicon glyphicon-dashboard"></i>&nbsp;<i
                            class="fa fa-chevron-right"></i> DASHBOARD</a></li>
                    <c:if test="${ permissions.setup == 'TRUE' }">
                        <li id="setup-main-li" class=""><a href="javascript:void(0);"><i
                                class="glyphicon glyphicon-cog"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i> SETUP &amp; CONFIGURATION</a></li>
                    </c:if>
                    <c:if test="${ permissions.content == 'TRUE' }">
                        <li id="content-main-li" class=""><a href="javascript:void(0);"><i
                                class="glyphicon glyphicon-cog"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i> CONTENT MANAGEMENT</a></li>
                    </c:if>
                    <c:if test="${ permissions.portal_agent_add == 'TRUE' }">
                        <li id="add_agent-li"><a href="javascript:void(0);"><i
                                class="glyphicon glyphicon-record"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>ADD AGENT</a></li>
                    </c:if>
                    <c:if test="${ permissions.portal_agents == 'TRUE' }">
                        <li id="view_agents-li"><a href="javascript:void(0);"><i
                                class="glyphicon glyphicon-record"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>VIEW AGENT</a></li>
                    </c:if>
                    <c:if test="${ permissions.view_tenant == 'TRUE' }">
                        <li id="view_tenants-main-li"><a href="javascript:void(0);"><i
                                class="glyphicon glyphicon-record"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>VIEW TENANTS</a></li>
                    </c:if>
                    <c:if test="${ permissions.add_property == 'TRUE' }">
                        <li id="add_property-main-li"><a href="javascript:void(0);"><i
                                class="glyphicon glyphicon-record"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>ADD PROPERTY</a></li>
                    </c:if>
                    <c:if test="${ permissions.add_propertyBatch == 'TRUE' }">
                        <li id="add_property-batch-main-li"><a href="javascript:void(0);"><i
                                class="glyphicon glyphicon-record"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>ADD PROPERTY BATCH</a></li>
                    </c:if>
                    <c:if test="${ permissions.view_property == 'TRUE' }">
                        <li id="view_property-main-li"><a href="javascript:void(0);"><i
                                class="glyphicon glyphicon-record"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>VIEW PROPERTY</a></li>
                    </c:if>
                    <c:if test="${ permissions.add_unit == 'TRUE' }">
                        <li id="add_unit-main-li"><a href="javascript:void(0);"><i
                                class="glyphicon glyphicon-record"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>ADD UNIT</a></li>
                    </c:if>


                    <c:if test="${ permissions.view_unit_grid == 'TRUE' }">
                        <li id="view_unit_grid-main-li"><a href="javascript:void(0);"><i
                                class="glyphicon glyphicon-record"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>VIEW UNIT GRID</a></li>
                    </c:if>
                    <c:if test="${ permissions.view_unit == 'TRUE' }">
                        <li id="view_unit-main-li"><a href="javascript:void(0);"><i
                                class="glyphicon glyphicon-record"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>VIEW UNIT</a></li>

                    </c:if>

                    <%-- <c:if test="${ permissions.view_occupied_unit == 'TRUE' }">
                         <li id="view_occupied_unit-main-li"><a href="javascript:void(0);"><i
                                 class="glyphicon glyphicon-record"></i>&nbsp;<i
                                 class="fa fa-chevron-right"></i>VIEW OCCUPIED UNIT</a></li>
                     </c:if>
 --%>

                    <%--<c:if test="${ permissions.view_service_charge == 'TRUE' }">
                        <li id="view_service_charge-main-li"><a href="javascript:void(0);"><i
                                class="glyphicon glyphicon-record"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>VIEW SERVICE CHARGE</a></li>
                    </c:if>--%>


                    <c:if test="${ permissions.view_rent_paid == 'TRUE' }">
                        <li id="view_rent_paid-main-li"><a href="javascript:void(0);"><i
                                class="glyphicon glyphicon-record"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>VIEW RENT PAID</a></li>
                    </c:if>


                    <c:if test="${ permissions.view_rent_arrears == 'TRUE' }">
                        <li id="view_rent_arrears-main-li"><a href="javascript:void(0);"><i
                                class="glyphicon glyphicon-record"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>VIEW RENT ARREARS</a></li>
                    </c:if>

                    <c:if test="${ permissions.view_rent_prepaid == 'TRUE' }">
                        <li id="view_rent_prepaid-main-li"><a href="javascript:void(0);"><i
                                class="glyphicon glyphicon-record"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>VIEW RENT PREPAID</a></li>
                    </c:if>

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

                    <c:if test="${ permissions.portal_landlord_view == 'TRUE' }">
                        <li id="landlords-main-li"><a href="javascript:void(0);"><i
                                class="glyphicon glyphicon-record"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>VIEW LANDLORD</a></li>
                    </c:if>

                    <c:if test="${ permissions.portal_landlord_add == 'TRUE' }">
                        <li id="add_landlord-main-li"><a href="javascript:void(0);"><i
                                class="glyphicon glyphicon-record"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i>ADD LANDLORD</a></li>
                    </c:if>


                    <c:if test="${ permissions.media == 'TRUE' }">
                        <li id="media-main-li"><a href="javascript:void(0);"><i
                                class="glyphicon glyphicon-bookmark"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i> MEDIA</a></li>
                    </c:if>
                    <c:if test="${ permissions.uac == 'TRUE' }">
                        <li id="uac-main-li"><a href="javascript:void(0);"><i
                                class="glyphicon glyphicon-tasks"></i>&nbsp;<i
                                class="fa fa-chevron-right"></i> ACCESS CONTROL</a></li>
                    </c:if>
                </ul>
            </div>
        </div>

        <!--/span-->
        <div class="col-md-8" id="dashboard">
            <jsp:include page="dashboard.jsp" />
        </div>
        <div class="col-md-2">

            <p>&nbsp;</p>
            <div class="sidebar-right section text-center">
                <h3 class="text-center">
                    <small><i
                            class="glyphicon glyphicon-comment"></i>&nbsp;QUICK CONTACT</small>
                </h3>
                <button class="btn btn-primary btn-block" id="send-email-btn">SEND AN EMAIL</button>
            </div>
            <p>&nbsp;</p>
            <div id="sidebar-left">
                <div id="sub-menu">

                </div>
            </div>
            <p>&nbsp;</p>
            <div class="sidebar-right section">
                <h3 class="text-center">
                    <small>ACTIVITY LOG</small>
                </h3>
                <div class="list-group">
                    <c:forEach var="log" items="${ activityLogs }">
                        <a href="#" class="list-group-item">
                            <i class="fa fa-comment fa-fw"></i> ${ log.description }
                            <span class="pull-right text-muted small"><em>${ log.datetime }</em>
	                          </span>
                        </a>
                    </c:forEach>
                </div>
            </div>
            <p>&nbsp;</p>

        </div>
    </div>
</div>
<hr>
<footer style="background-color: #5e0231">
    <p>&copy; Copyright  <c:out value="${currentYear}" />. All Rights Reserved. KenPoze Ltd.</p>
</footer>
<!--/.fluid-container-->
<jsp:include page="includes/partial/admin_footer.jsp" />