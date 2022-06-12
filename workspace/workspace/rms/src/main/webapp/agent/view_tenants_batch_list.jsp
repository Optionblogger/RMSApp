<%--
  Created by IntelliJ IDEA.
  User: machinelearning
  Date: 8/16/18
  Time: 6:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container-fluid section">

    <table class="table table-responsive table-striped">
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

            <th>NAME</th>
            <th>UNIT NO</th>
            <th>PROPERTY</th>
            <th>STATUS</th>
            <th>EMAIL</th>
            <th>PHONE</th>
            <th>SERVICE CHARGE</th>
            <th>DATE JOINED</th>
        </tr>
        <c:forEach var="tenancyAgreement" items="${tenancyAgreements}">

            <tr>
                <td>${ tenancyAgreement.name }</td>
                <td>${ tenancyAgreement.unit.unitNumber }</td>
                <td>${ tenancyAgreement.emailAddress }</td>
                <td>${ tenancyAgreement.phoneNumber }</td>
                <td>${ tenancyAgreement.serviceCharge }</td>
                <td>${ tenancyAgreement.dateJoined }</td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

