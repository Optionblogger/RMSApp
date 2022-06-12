<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../includes/partial/header.jsp"/>
<div class="container-fluid section">
    <fieldset>
        <div class="col-sm-5">
            <div class="form-group">
                <input type="hidden" value="${units.id}" name="unitId" hidden="true">
                <label for="unitNumber" class="control-label">Unit Number:</label>
                <input
                        type="text" name="unitNumber" class="form-control"
                        id="unitNumber" value="${units.unitNumber}"
                        placeholder="Unit Number">
            </div>
            <div class="form-group">
                <label for="unitType" class="control-label">Unit Type:</label>
                <select
                        name="unitType" id="unitType" class="form-control"
                        required>
                    <option value="${units.unitType.name}"></option>
                    <option value="residential"> RESIDENTIAL</option>
                    <option value="commercial">COMMERCIAL</option>

                </select>
            </div>
            <div class="form-group">
                <label for="unitFloor" class="control-label">Floor Number:</label> <input
                    type="text" name="unitFloor"
                    class="form-control"
                    id="unitFloor" value="${units.blockNo}"
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
                        id="unitDeposit" value="${units.deposit}"
                        placeholder="Unit Deposit">
            </div>
            <div class="form-group">
                <label for="unitMonthlyRent" class="control-label">Monthly Rent:</label>
                <input type="number" name="unitMonthlyRent" class="form-control" value="${units.monthlyRent}"
                       id="unitMonthlyRent" placeholder="Monthly Rent">
            </div>
            <div class="form-group">
                <label for="unitDescription" class="control-label">Description:</label>
                <textarea rows="6" cols="10" class="form-control" id="unitDescription"
                          name="unitDescription">${units.description}
                                    </textarea>

            </div>


        </div>
    </fieldset>
</div>

