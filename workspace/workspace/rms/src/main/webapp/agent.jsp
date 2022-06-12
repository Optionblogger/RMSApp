<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% pageContext.setAttribute("currentYear", java.util.Calendar.getInstance().get(java.util.Calendar.YEAR)); %>
<jsp:include page="includes/partial/admin_header.jsp" />

<div class="container-fluid navigation-bar">
    <div class="container-fluid">
        <div class="col-md-2">
            <jsp:include page="agent/default_menu.jsp"/>
        </div>

        <div class="col-md-8" id="dashboard">
            <jsp:include page="agent/dashboard.jsp"/>
        </div>
        <div class="col-md-2">
            <div class="sidebar-right section">
                <p>&nbsp;</p>
                <div class="sidebar-right section text-center">
                    <h3 class="text-center">
                        <small><i
                                class="glyphicon glyphicon-comment"></i>&nbsp;QUICK CONTACT
                        </small>
                    </h3>
                    <button class="btn btn-primary btn-block" id="send-email-btn">SEND AN EMAIL</button>
                </div>
                <p>&nbsp;</p>
                <div class="sidebar-right section">
                    <h3 class="text-center">
                        <small><i
                                class="glyphicon glyphicon-align-justify"></i>&nbsp;RECENT ACTIVITY
                        </small>

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
            </div>
        </div>
    </div>
    <hr>
    <footer>
        <p>&copy; Copyright <c:out value="${currentYear}"/>. All Rights Reserved. KenPoze Ltd.</p>
    </footer>
</div>
<jsp:include page="includes/partial/admin_footer.jsp" />
