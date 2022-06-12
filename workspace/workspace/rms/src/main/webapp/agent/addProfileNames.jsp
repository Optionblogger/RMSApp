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
                        ADD PROFILE NAMES</h2>
                    <form class="form-horizontal" method="post" id="form-add-profile_names">
                        <fieldset>
                            <div class="col-sm-5">
                                <div class="form-group">
                                    <label for="name" class="control-label"> Name:</label>
                                    <input
                                            type="text" name="name" class="form-control"
                                            id="name"
                                            placeholder="">
                                </div>
                                <div class="form-group">
                                    <label for="profile" class="control-label"> Profile:</label>
                                    <input
                                            type="text" name="profile" class="form-control"
                                            id="profile"
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

