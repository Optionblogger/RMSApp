<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container-fluid section">
    <div class="col-md-6">
        <fieldset>
            <div class="form-group">

                <label for="name" class="control-label">Unit Number:</label>
                <input
                        type="text" name="name" class="form-control"
                        id="unitNumber" value="${tenancyAgreement.unit.unitNumber}"
                        placeholder="Tenant Name" readonly="true">

            </div>
            <input type="hidden" value="${tenancyAgreement.id}" name="tenantId" id="tenantId" hidden="true">
            <div class="form-group">
                <label for="name" class="control-label">Tenant Name:</label>
                <input
                        type="text" name="name" class="form-control"
                        id="name" value="${tenancyAgreement.name}"
                        placeholder="Tenant Name">

            </div>

    <%--        <div class="form-group">
                <label for="dateJoinedE" class="control-label">Date Joined:</label>
                <input type="text" name="dateJoinedE" class="form-control" id="dateJoinedE"
                       placeholder="Date Joined" value="${tenancyAgreement.dateJoined}" readonly>
            </div>--%>


            <div class="form-group">
                <label for="serviceCharge" class="control-label">Service Charge:</label>

                <input
                        type="number" name="serviceCharge" class="form-control"
                        id="serviceCharge" value="${tenancyAgreement.serviceCharge}"
                        placeholder="Service charge">

            </div>
            <div class="form-group">
                <label for="tenantCellNumber" class="control-label">PHONE
                    NUMBER</label>
                <div class="form-inline">
                    <select class="form-control pull-left tenant-country-code"
                            name="country-code" style="width: 35%;"></select>
                    <input type="text" name="tenantCellNumber"
                           class="form-control" value="${tenancyAgreement.phoneNumber}"
                           id="tenantCellNumber" placeholder="Phone Number"
                           style="width:65%"
                           oninput="this.value=this.value.toUpperCase()">
                </div>
            </div>
        </fieldset>
    </div>
    <div class="col-md-6">
        <fieldset>

            <div class="form-group">
                <label for="tenantEmailaddress" class="control-label">Email Address:</label>

                <input
                        type="email" name="tenantEmailaddress"
                        class="form-control" value="${tenancyAgreement.emailAddress}"
                        id="tenantEmailaddress" placeholder="Email ">

            </div>
            <div class="form-group">
                <label for="tenantPostalAddress" class="control-label">Postal
                    Address:</label>

                <input type="text" name="tenantPostalAddress"
                       class="form-control" id="tenantPostalAddress" value="${tenancyAgreement.address.postalAddress}"
                       placeholder="Postal Address ">

            </div>
            <div class="form-group">
                <label for="tenantTown" class="control-label">Town
                    :</label>

                <input type="text" name="tenantTown"
                       class="form-control" id="tenantTown" value="${tenancyAgreement.address.town}"
                       placeholder="Town">


            </div>
        </fieldset>
    </div>

</div>




