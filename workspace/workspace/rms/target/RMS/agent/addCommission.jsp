<%--
  Created by IntelliJ IDEA.
  User: willy
  Date: 7/24/18
  Time: 2:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="tab-pane active" id="AGENT">
    <div class="row">
        <div class="modal-dialog large-modal">
            <div class="modal-content">
                <div class="modal-body">
                    <h2 class="heading">
                        COMMISSION</h2>
                    <form class="form-horizontal" method="post" id="form-add-commission">
                        <fieldset>
                            <div class="col-sm-5">
                                <div class="form-group">
                                    <label for="commissionAmount" class="control-label"> Amount:</label>
                                    <input
                                            type="number" name="commissionAmount" class="form-control"
                                            id="commissionAmount"
                                            placeholder="">
                                </div>
                                <div class="form-group">
                                    <label for="datePaid" class="control-label"> DatePaid:</label>
                                    <input
                                            type="date" name="datePaid" class="form-control"
                                            id="datePaid"
                                            placeholder="">
                                </div>
                                <div class="form-group">
                                    <label for="arrears" class="control-label">Arrears:</label>
                                    <input
                                            type="number" name="arrears" class="form-control"
                                            id="arrears"
                                            placeholder="">
                                </div>





                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-6">

                                <div class="form-group">
                                    <label for="excessAmount" class="control-label">Excess Amount:</label>
                                    <input
                                            type="number" name="excessAmount" class="form-control"
                                            id="excessAmount"
                                            placeholder="">
                                </div>
                                <div class="form-group">
                                    <label for="deductions" class="control-label">Month:</label>
                                    <input
                                            type="number" name="deductions" class="form-control"
                                            id="deductions"
                                            placeholder="">
                                </div>
                                <div class="form-group">
                                    <label for="receiptNo" class="control-label">ReceiptNo:</label>
                                    <input
                                            type="text" name="receiptNo" class="form-control"
                                            id="receiptNo"
                                            placeholder="">
                                </div>


                            </div>

                            <button class="btn btn-warning pull-right">ADD</button>



                        </fieldset>

                    </form>
                </div>
            </div>
        </div>
    </div>

</div>

