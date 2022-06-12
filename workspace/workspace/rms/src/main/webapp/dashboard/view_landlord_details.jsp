<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container-fluid section">
    <h3 class="text-center main-title">
        <i class="glyphicon glyphicon-film"></i>&nbsp;&nbsp;VIEW LANDLORD DETAILS
    </h3>
    <fieldset>
        <div class="col-sm-5">
            <div class="form-group">
                <input type="hidden" value="${landlord.id}" name="landlordId" id="landlordId">

                <label for="landLordFirstname" class="control-label">Firstname:</label>
                <input
                        type="text" name="landLordFirstname" class="form-control"
                        id="landLordFirstname" value="${landlord.firstname}"
                        placeholder="Firstname">
            </div>
            <div class="form-group">
                <label for="landLordSurname" class="control-label">Surname:</label>
                <input
                        type="text" name="landLordSurname" class="form-control"
                        id="landLordSurname" value="${landlord.surname}"
                        placeholder="Surname">
            </div>
            <div class="form-group">
                <label for="landLordothernames" class="control-label">Othernames:</label>
                <input type="text" name="landLordothernames" class="form-control"
                       id="landLordothernames" value="${landlord.othernames}" placeholder="Othernames">
            </div>
            <div class="form-group">
                <label for="landlordGender" class="control-label">Gender:</label>
                <select
                        name="landlordGender" id="landlordGender" class="form-control">
                    <option value="">${landlord.gender.name}</option>
                    <c:forEach var="gender" items="${genders}">
                        <option value="${gender.id}">
                                ${gender.name}
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="landlordCellNumber" class="control-label">PHONE
                    NUMBER</label>
                <div class="form-inline">
                    <select class="form-control pull-left landlord-edit-country-code"
                            name="country-code" style="width: 35%;"></select>
                    <input type="text" name="landlordCellNumber"
                           class="form-control"
                           id="landlordCellNumber" value="${landlord.phoneNumber}" placeholder="Phone Number"
                           style="width:65%"
                           oninput="this.value=this.value.toUpperCase()">
                </div>
            </div>
            <div class="form-group">
                <label for="landlordIdnumber" class="control-label">ID Number:</label>
                <input type="text" name="landlordIdnumber" class="form-control"
                       id="landlordIdnumber" value="${landlord.idNumber}" placeholder="ID Number">
            </div>
        </div>
        <div class="col-sm-1"></div>
        <div class="col-sm-6">
            <div class="form-group">
                <label for="landLordEmailaddress" class="control-label">Email Address:</label> <input
                    type="text" name="landLordEmailaddress"
                    class="form-control"
                    id="landLordEmailaddress" value="${landlord.emailAddress}"
                    placeholder="Email Address">
            </div>
            <div class="form-group">
                <label for="landlordPostalAddress" class="control-label">Postal
                    Address:</label> <input type="text" name="landlordPostalAddress"
                                            class="form-control" id="landlordPostalAddress"
                                value="${landlord.address.postalAddress}" placeholder="Postal Address ">
            </div>
            <div class="form-group">
                <label for="landlordTown" class="control-label">Town
                    :</label> <input type="text" name="landlordTown"
                                     class="form-control" id="landlordTown" value="${landlord.address.town}"
                                     placeholder="Town">
            </div>
            <div class="form-group">
                <label for="landlordZipcode" class="control-label">Zip
                    Code:</label> <input type="text" name="landlordZipcode"
                                         class="form-control" id="landlordZipcode" value="${landlord.address.zipcode}"
                                         placeholder="Zip Code">
            </div>
            <div class="form-group">
                <label for="landlordBuilding" class="control-label">Building:
                </label> <input type="text" name="landlordBuilding"
                                class="form-control" id="landlordBuilding" value="${landlord.address.building}"
                                placeholder="Bulding">
            </div>
            <div class="form-group">
                <label for="landlordRoad" class="control-label">Road:
                </label> <input type="text" name="landlordRoad"
                                class="form-control" id="landlordRoad"  value="${landlord.address.road}"
                                placeholder="Bulding">
            </div>


        </div>


    </fieldset>


</div>
