<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid section">
    <div id="sidebar-left">
        <h2 class="text-center">
            <small>MAIN MENU</small>
        </h2>
        <ul id="main-menu" class="nav">
            <li id="agent-dashboard-li" class="active"><a href="javascript:void(0);"><i
                    class="glyphicon glyphicon-dashboard"></i>&nbsp;<i
                    class="fa fa-chevron-right"></i> DASHBOARD</a></li>
            <li id="personal-information-li"><a href="javascript:void(0);"><i
                    class="glyphicon glyphicon-user"></i>&nbsp;<i
                    class="fa fa-chevron-right"></i> PERSONAL INFORMATION</a>
            </li>
            <c:if test="${agentMenu.viewUnitGrid == 'TRUE'}">
                <li id="view-unit-grid-li"><a href="javascript:void(0);"><i
                        class="glyphicon glyphicon-record"></i>&nbsp;<i
                        class="fa fa-chevron-right"></i> VIEW UNITS GRID</a></li>
            </c:if>

            <c:if test="${agentMenu.viewUnit == 'TRUE'}">
                <li id="view-unit-li"><a href="javascript:void(0);"><i
                        class="glyphicon glyphicon-record"></i>&nbsp;<i
                        class="fa fa-chevron-right"></i> VIEW UNITS</a></li>
            </c:if>


            <c:if test="${agentMenu.addContract == 'TRUE'}">
                <li id="add-contract-li"><a href="javascript:void(0);"><i
                        class="glyphicon glyphicon-record"></i>&nbsp;<i
                        class="fa fa-chevron-right"></i> ADD TENANCY AGREEMENT</a></li>
            </c:if>
            <c:if test="${agentMenu.addContractBatch == 'TRUE'}">
                <li id="add-contract-batch-li"><a href="javascript:void(0);"><i
                        class="glyphicon glyphicon-record"></i>&nbsp;<i
                        class="fa fa-chevron-right"></i> ADD TENANCY AGREEMENT BATCH</a></li>
            </c:if>

            <c:if test="${agentMenu.viewContractGrid == 'TRUE'}">
                <li id="view-contract-grid-li"><a href="javascript:void(0);"><i
                        class="glyphicon glyphicon-record"></i>&nbsp;<i
                        class="fa fa-chevron-right"></i> VIEW TENANCY AGREEMENTS GRID</a></li>
            </c:if>

            <c:if test="${agentMenu.viewContract == 'TRUE'}">
                <li id="view-contract-li"><a href="javascript:void(0);"><i
                        class="glyphicon glyphicon-record"></i>&nbsp;<i
                        class="fa fa-chevron-right"></i> VIEW TENANCY AGREEMENTS</a></li>
            </c:if>
            <c:if test="${agentMenu.recordRent == 'TRUE'}">
                <li id="record-rent-li"><a href="javascript:void(0);"><i
                        class="glyphicon glyphicon-record"></i>&nbsp;<i
                        class="fa fa-chevron-right"></i>RECORD RENT</a></li>
            </c:if>
            <c:if test="${agentMenu.uploadRent == 'TRUE'}">
                <li id="upload-rent-li"><a href="javascript:void(0);"><i
                        class="glyphicon glyphicon-record"></i>&nbsp;<i
                        class="fa fa-chevron-right"></i>RENT BATCH UPLOAD</a></li>
            </c:if>
            <c:if test="${agentMenu.releaseUnit == 'TRUE'}">
                <li id="release-unit-li"><a href="javascript:void(0);"><i
                        class="glyphicon glyphicon-record"></i>&nbsp;<i
                        class="fa fa-chevron-right"></i>RELEASE UNIT</a></li>
            </c:if>
            <c:if test="${agentMenu.printInvoice == 'TRUE'}">
                <li id="print-invoice-li"><a href="javascript:void(0);"><i
                        class="glyphicon glyphicon-record"></i>&nbsp;<i
                        class="fa fa-chevron-right"></i> PRINT INVOICE</a></li>
            </c:if>
            <c:if test="${agentMenu.uploadReceipts == 'TRUE'}">
                <li id="upload-receipts-li"><a href="javascript:void(0);"><i
                        class="glyphicon glyphicon-record"></i>&nbsp;<i
                        class="fa fa-chevron-right"></i> UPLOAD RECEIPTS</a></li>
            </c:if>
            <c:if test="${agentMenu.issueReceipts == 'TRUE'}">
                <li id="issue-receipts-li"><a href="javascript:void(0);"><i
                        class="glyphicon glyphicon-record"></i>&nbsp;<i
                        class="fa fa-chevron-right"></i> ISSUE RECEIPTS</a></li>
            </c:if>
            <c:if test="${agentMenu.viewRentPaidGrid == 'TRUE'}">
                <li id="view-rent-paid-grid-li"><a href="javascript:void(0);"><i
                        class="glyphicon glyphicon-record"></i>&nbsp;<i
                        class="fa fa-chevron-right"></i> VIEW RENT PAID GRID</a></li>
            </c:if>

            <c:if test="${agentMenu.viewRentPaid == 'TRUE'}">
                <li id="view-rent-paid-li"><a href="javascript:void(0);"><i
                        class="glyphicon glyphicon-record"></i>&nbsp;<i
                        class="fa fa-chevron-right"></i> VIEW RENT PAID</a></li>
            </c:if>
            <c:if test="${agentMenu.viewRentArrearsGrid == 'TRUE'}">
                <li id="view-rent-arrears-grid-li"><a href="javascript:void(0);"><i
                        class="glyphicon glyphicon-record"></i>&nbsp;<i
                        class="fa fa-chevron-right"></i> VIEW RENT ARREARS GRID</a></li>
            </c:if>

            <c:if test="${agentMenu.viewRentArrears == 'TRUE'}">
                <li id="view-rent-arrears-li"><a href="javascript:void(0);"><i
                        class="glyphicon glyphicon-record"></i>&nbsp;<i
                        class="fa fa-chevron-right"></i> VIEW RENT ARREARS</a></li>
            </c:if>

            <c:if test="${agentMenu.viewprepaidRentGrid == 'TRUE'}">
                <li id="view-rent-prepaid-grid-li"><a href="javascript:void(0);"><i
                        class="glyphicon glyphicon-record"></i>&nbsp;<i
                        class="fa fa-chevron-right"></i> VIEW RENT PREPAID GRID</a></li>
            </c:if>



            <c:if test="${agentMenu.viewprepaidRent == 'TRUE'}">
                <li id="view-rent-prepaid-li"><a href="javascript:void(0);"><i
                        class="glyphicon glyphicon-record"></i>&nbsp;<i
                        class="fa fa-chevron-right"></i> VIEW RENT PREPAID</a></li>
            </c:if>


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

            <c:if test="${agentMenu.sendNotification == 'TRUE'}">
                <li id="send-notification-li"><a href="javascript:void(0);"><i
                        class="glyphicon glyphicon-record"></i>&nbsp;<i
                        class="fa fa-chevron-right"></i>SEND NOTIFICATION</a></li>
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
    </div>
</div>