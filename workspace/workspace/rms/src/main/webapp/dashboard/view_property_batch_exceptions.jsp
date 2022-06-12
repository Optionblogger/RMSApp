<%--
  Created by IntelliJ IDEA.
  User: machinelearning
  Date: 5/30/18
  Time: 12:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container-fluid section">
    <h3 class="text-center main-title" id="title">
        <i class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;BATCH EXCEPTIONS
    </h3>
    <table class="table table-striped">
        <thead>
        <tr>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th>PROPERTY NUMBER</th>
            <th>COMPANY NAME</th>
            <th>PROPERTY NAME</th>
            <th>CATEGORY</th>
            <th>LEASE</th>
            <th>AGENT</th>
            <th>LAND RATES</th>
            <th>EXCEPTION</th>

        </tr>

        <c:forEach var="prop" items="${properties}">
            <tr>
                <td>${ prop.propertyNo }</td>
                <td>${ prop.companyName }</td>
                <td>${ prop.name }</td>
                <td>${ prop.propertyCategory }</td>
                <td>${ prop.lease }</td>
                <td>${ prop.agent.name }</td>
                <td>${ prop.landRates}</td>
                <td>${ prop.exceptions}</td>


            </tr>

        </c:forEach>
        </tbody>
    </table>
</div>

