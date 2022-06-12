<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container-fluid section">
    <h3 class="text-center main-title" id="title">
        <i class="glyphicon glyphicon-edit"></i>&nbsp;EDIT PROPERTY DETAILS
    </h3>
    <div class="row">
        <fieldset>
            <div class="col-sm-5">
                <div class="form-group">
                    <input type="text" name="propertyId" id="propertyId" value="${property.id}" hidden="true">
                    <label for="propertyName" class="control-label">Property Name:</label>

                    <input
                            type="text" name="propertyName" class="form-control"
                            id="propertyName" value="${property.name}"
                            placeholder="">
                </div>
                <div class="form-group">
                    <label for="propertyLocation" class="control-label">Location:</label>
                    <input
                            type="text" name="propertyLocation" class="form-control"
                            id="propertyLocation" value="${property.location}"
                            placeholder="">
                </div>


                <div class="form-group">
                    <label for="propertyRoad" class="control-label">Road:</label> <input
                        type="text" name="propertyRoad"
                        class="form-control"
                        id="propertyRoad" value="${property.address.road}"
                        placeholder="">
                </div>
                <div class="form-group">
                    <label for="propertyTown" class="control-label">Town:</label> <input
                        type="text" name="propertyTown"
                        class="form-control"
                        id="propertyTown" value="${property.address.town}"
                        placeholder="">
                </div>
                <div class="form-group">
                    <label for="propertyLrNumber" class="control-label">LR Number:</label> <input
                        type="text" name="propertyLrNumber"
                        class="form-control"
                        id="propertyLrNumber" value="${property.landNumber}"
                        placeholder="">
                </div>


            </div>
            <div class="col-sm-1"></div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label for="propertyUnitNo" class="control-label">Number of Units:</label> <input
                        type="number" name="propertyUnitNo"
                        class="form-control"
                        id="propertyUnitNo" value="${property.numberOfUnits}"
                        placeholder="">
                </div>
                <div class="form-group">
                    <label for="propertyAreaSF" class="control-label">Area Square Feet:</label> <input
                        type="number" name="propertyAreaSF"
                        class="form-control"
                        id="propertyAreaSF" value="${property.totalArea}"
                        placeholder="">
                </div>
             <%--   <div class="form-group">
                    <label for="agentName" class="control-label">Agent to Manage:</label> <input
                        type="text" name="agentName"
                        class="form-control"
                        id="agentName" value="${property.agent.name}"
                        placeholder="">
                </div>--%>

                <div class="form-group">
                    <label for="agentName" class="control-label">Agent to Manage:</label> <select
                        name="agentName" id="agentName" class="form-control">
                    <option value="${property.agent.name}"></option>
                    <c:forEach var="agent" items="${agents}">
                        <option value="${agent.id}">
                                ${agent.name}
                        </option>
                    </c:forEach>
                </select>
                </div>
            </div>
        </fieldset>
    </div>
</div>
