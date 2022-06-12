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
        </tr>
        </thead>
        <tbody>
        <tr>
            <th>UNIT NUMBER</th>
            <th>TENANT NAME</th>
            <th>AMOUNT PAID</th>
            <th>DATE PAID</th>
            <th>C/R NO</th>
            <th>AMOUNT TO RGL</th>
            <th>AMOUNT TO LANDLORD</th>
            <th>EXCEPTION</th>

        </tr>

        <c:forEach var="rent" items="${rents}">
            <tr>
                <td>${ rent.unit.unitNumber }</td>
                <td>${ rent.tenancyAgreement.name}</td>
                <td>${ rent.amountPaid }</td>
                <td>${ rent.receiptNo }</td>
                <td>${ rent.amountToRgl }</td>
                <td>${ rent.amountToLandlord }</td>
                <td>${ rent.exceptions }</td>


            </tr>

        </c:forEach>
        </tbody>
    </table>
</div>

