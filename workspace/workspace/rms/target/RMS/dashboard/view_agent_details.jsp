<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container-fluid section">
    <h3 class="text-center main-title">
        <i class="glyphicon glyphicon-film"></i>&nbsp;&nbsp;VIEW &nbsp; AGENT DETAILS
    </h3>
    <fieldset>
        <div class="col-sm-5">
                    <div class="form-group">
                        <input type="hidden" value="${agent.id}" name="agentId" id="agentId">

                        <label for="agentName" class="control-label">Name:</label>
                        <input
                                type="text" name="agentName" class="form-control"
                                id="agentName" value="${agent.name}"
                                placeholder="Name">
                    </div>

                    <div class="form-group">
                        <label for="agentCellNumber" class="control-label">PHONE
                            NUMBER</label>
                        <div class="form-inline">
                            <select class="form-control pull-left agent-edit-country-code"
                                    name="country-code" style="width: 35%;"></select>
                            <input type="text" name="agentCellNumber"
                                   class="form-control" value="${agent.phoneNumber}"
                                   id="agentCellNumber" placeholder="Phone Number"
                                   style="width:65%"
                                   oninput="this.value=this.value.toUpperCase()">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="agentEmailaddress" class="control-label">Email Address:</label>
                        <input
                                type="text" name="agentEmailaddress"
                                class="form-control"
                                id="agentEmailaddress" value="${agent.emailAddress}"
                                placeholder="Email Address">
                    </div>
                    <div class="form-group">
                        <label for="agentPostalAddress" class="control-label">Postal
                            Address:</label> <input type="text" name="agentPostalAddress"
                                                    class="form-control" id="agentPostalAddress" value="${agent.address.postalAddress}"
                                                    placeholder="Postal Address ">
                    </div>
                </div>
                <div class="col-sm-1"></div>
                <div class="col-sm-6">





                    <div class="form-group">
                        <label for="agentTown" class="control-label">Town
                            :</label> <input type="text" name="agentTown"
                                             class="form-control" id="agentTown" value="${agent.address.town}"
                                             placeholder="Town">
                    </div>
                    <div class="form-group">
                        <label for="agentZipcode" class="control-label">Zip
                            Code:</label> <input type="text" name="agentZipcode"
                                                 class="form-control" id="agentZipcode" value="${agent.address.zipcode}"
                                                 placeholder="Zip Code">
                    </div>
                    <div class="form-group">
                        <label for="agentBuilding" class="control-label">Building:
                        </label> <input type="text" name="agentBuilding"
                                        class="form-control" id="agentBuilding" value="${agent.address.building}"
                                        placeholder="Bulding">
                    </div>
                    <div class="form-group">
                        <label for="agentRoad" class="control-label">Road:
                        </label> <input type="text" name="agentRoad"
                                        class="form-control" id="agentRoad" value="${agent.address.road}"
                                        placeholder="Bulding">
                    </div>
                </div>


            </fieldset>


    </div>
