<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="tab-pane active" id="AGENT">
    <div class="row">
        <div class="modal-dialog large-modal">
            <div class="modal-content">
                <div class="modal-body">
                    <h2 class="heading">
                        NEW SERVICE CHARGE</h2>
                    <form class="form-horizontal" method="post" id="form-add-servicecharge">
                        <fieldset>
                            <div class="col-sm-5">
                                <div class="form-group">
                                    <label for="serviceName" class="control-label"> Name:</label>
                                    <input
                                            type="text" name="serviceName" class="form-control"
                                            id="serviceName"
                                            placeholder="">
                                </div>
                                <div class="form-group">
                                    <label for="serviceAmount" class="control-label">Amount:</label>
                                    <input
                                            type="number" name="serviceAmount" class="form-control"
                                            id="serviceAmount"
                                            placeholder="">
                                </div>





                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-6">

                                <div class="form-group">
                                    <label for="serviceDescription" class="control-label">Description:</label>
                                    <textarea rows="6" cols="10" class="form-control" id="serviceDescription" name="serviceDescription">
                                    </textarea>

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

