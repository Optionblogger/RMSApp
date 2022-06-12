<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container-fluid section">
    <h3 class="text-center main-title">
        <i class="glyphicon glyphicon-film"></i>&nbsp;&nbsp;VIEW &nbsp; UNIT DETAILS
    </h3>
    <fieldset>
        <div class="col-sm-5">
            <div class="form-group">
                <input type="hidden" value="${unit.id}" name="unitId" id="unitId">
                <label for="unitNumber" class="control-label">Unit Number:</label>
                <input
                        type="text" name="unitNumber" class="form-control"
                        id="unitNumber" value="${unit.unitNumber}"
                        placeholder="Unit Number">
            </div>
            <div class="form-group">
                <label for="unitType" class="control-label">Unit Type:</label>
                <select
                        name="unitType" id="unitType" class="form-control"
                        required>
                    <option value="${unitType.name}"/>
                    </option
                    <option value="residential"> RESIDENTIAL</option>
                    <option value="commercial">COMMERCIAL</option>

                </select>
            </div>
            <div class="form-group">
                <label for="unitFloor" class="control-label">Floor Number:</label> <input
                    type="text" name="unitFloor"
                    class="form-control"
                    id="unitFloor" value="${unit.blockNo}"
                    placeholder="Floor Number">
            </div>

        </div>
        <div class="col-sm-1"></div>
        <div class="col-sm-6">
            <div class="form-group">
                <label for="unitDeposit" class="control-label">Unit Deposit:</label>
                <input
                        type="number" name="unitDeposit"
                        class="form-control"
                        id="unitDeposit" value="${unit.deposit}"
                        placeholder="Unit Deposit">
            </div>
            <div class="form-group">
                <label for="unitMonthlyRent" class="control-label">Monthly Rent:</label>
                <input type="number" name="unitMonthlyRent" value="${unit.monthlyRent}" class="form-control"
                       id="unitMonthlyRent" placeholder="Monthly Rent">
            </div>
            <div class="form-group">
                <label for="unitDescription" class="control-label">Description:</label>
                <textarea rows="6" cols="10" class="form-control" id="unitDescription"
                          name="unitDescription">${unit.description}
                </textarea>

            </div>


        </div>
    </fieldset>
</div>


