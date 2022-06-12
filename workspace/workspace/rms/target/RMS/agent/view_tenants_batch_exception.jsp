<%--
  Created by IntelliJ IDEA.
  User: willy
  Date: 9/27/18
  Time: 8:45 PM
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container-fluid section">
    <h3 class="text-center main-title" id="title">
        <i class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;BATCH EXCEPTIONS
    </h3>
    <table class="table table-striped">
        <thead>
        <tr>
            <th width="20%"></th>
            <th width="20%"></th>
            <th width="20%"></th>
            <th width="20%"></th>
            <th width="20%"></th>


        </tr>

        </thead>
        <tbody>
        <tr>

            <th width="20%">NAME</th>
            <th width="20%">UNIT NO</th>
            <th width="20%">EMAIL</th>
            <th width="20%">PHONE</th>
            <th width="20%">EXCEPTION</th>
        </tr>
        <c:forEach var="tenancyAgreement" items="${tenancyAgreements}">

            <tr>
                <td width="20%">${ tenancyAgreement.name }</td>
                <td width="20%">${ tenancyAgreement.unit.unitNumber }</td>
                <td width="20%">${ tenancyAgreement.emailAddress }</td>
                <td width="20%">${ tenancyAgreement.phoneNumber }</td>
                <td width="20%">${ tenancyAgreement.exceptions }</td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
