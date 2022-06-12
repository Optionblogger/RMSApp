<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container-fluid section">
    <h3 class="text-center main-title">
        <i class="glyphicon glyphicon-film"></i>&nbsp;&nbsp;VIEW LANDLORD DETAILS
    </h3>
    <fieldset>
        <div class="col-sm-5">
            <div class="form-group">
                <input type="hidden" value="${unitLiability.id}" name="unitLiabilityId" id="unitLiabilityId">
                <label for="unitNumber" class="control-label">Unit No:</label> <select
                    name="unitNumber" id="unitNumber" class="form-control">
                <option value="">${unitLiability.unit.unitNumber}</option>
                <c:forEach var="unit" items="${units}">
                    <option value="${unit.unitNumber}">
                            ${unit.unitNumber}
                    </option>
                </c:forEach>
            </select>

            </div>
            <div class="form-group">
                <label for="electricity" class="control-label">Electricity :</label>
                <input
                        type="number" name="electricity" class="form-control"
                        id="electricity" value="${unitLiability.electricityCost}"
                        placeholder="Electricity Cost">

            </div>
            <div class="form-group">
                <label for="water" class="control-label">Water:</label>
                <input type="number" name="water" class="form-control" id="water" value="${unitLiability.waterCost}"
                       placeholder="Water Cost">
            </div>



        </div>
        <div class="col-sm-1"></div>
        <div class="col-sm-6">
            <div class="form-group">
                <label for="mismanagement" class="control-label">General House Mismanagement:</label>

                <input
                        type="number" name="mismanagement" class="form-control"
                        id="mismanagement" value="${unitLiability.generalUnitMismanagement}"
                        placeholder="General House Mismanagement">

            </div>
            <div class="form-group">
                <label for="unitLiabiltyDescription" class="control-label">Description:</label>
                <textarea rows="6" cols="10" class="form-control" id="unitLiabiltyDescription"
                          name="unitLiabiltyDescription"

                          style="text-align: right"> ${unitLiability.description}
                                    </textarea>

            </div>




        </div>


    </fieldset>


</div>
