<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="container-fluid section">
    <h3 class="text-center main-title">
        <i
                class="glyphicon glyphicon-dashboard"></i>&nbsp;DASHBOARD PANEL
    </h3>
    <div class="col-md-12">
        <input type="hidden" name="profileID" id="profileID" value="${ profileID }" />
        <div class="col-md-6 border-right">
            <h3 class="text-center"><small>PROPERTY DETAILS</small></h3>
            <table class="table table-responsive table-striped">

                <c:if test="${adminDashboard.numberOfProperties == 'TRUE'}">
                    <tr>
                        <td>PROPERTY NAME</td>
                        <td>${nameOfProperty}</td>
                    </tr>
                </c:if>
                <c:if test="${adminDashboard.numberOfAgents == 'TRUE'}">
                    <tr>
                        <td>AGENTS</td>
                        <td>${numberOfAgents}</td>
                    </tr>
                </c:if>
                <c:if test="${adminDashboard.numberOfUnits == 'TRUE'}">
                    <tr>
                        <td>UNITS</td>
                        <td>${numberOfUnits}</td>
                    </tr>
                </c:if>
                <c:if test="${adminDashboard.activeTenants == 'TRUE'}">
                    <tr>
                        <td>ACTIVE TENANTS</td>
                        <td>${activeTenants}</td>
                    </tr>
                </c:if>
                <c:if test="${adminDashboard.occupiedUnits == 'TRUE'}">
                    <tr>
                        <td>OCCUPIED UNITS</td>
                        <td>${occupiedUnits}</td>
                    </tr>
                </c:if>
                <c:if test="${adminDashboard.vacantUnits == 'TRUE'}">
                    <tr>
                        <td>VACANT UNITS</td>
                        <td>${ vacantUnits }</td>
                    </tr>
                </c:if>

            </table>
        </div>
        <%--<div class="col-md-6 border-left">
            <h3 class="text-center">
                <small>DISTRIBUTION OF UNITS</small>
            </h3>
            <div id="pie-chart">

            </div>--%>

    </div>
    </div>
    <input type="hidden" name="profile" id="profile" value="${ profile }"/>
