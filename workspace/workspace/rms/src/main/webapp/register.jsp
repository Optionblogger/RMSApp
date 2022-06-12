<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="includes/partial/header.jsp"/>
<input type="hidden" id="minimum" value="${ policy.length }"/>
<input type="hidden" id="lowercase" value="${ policy.lowercase }"/>
<input type="hidden" id="uppercase" value="${ policy.uppercase }"/>
<input type="hidden" id="numbers" value="${ policy.numbers }"/>
<div class="main-content">
    <div class="container">

        <div class="row">
            <input type="hidden" name="hidCaptchaID" id="hidCaptchaID" value="<%= session.getId() %>"/>
            <ul class="nav nav-pills nav-justified">
                <li class="active"><a data-toggle="pill" href="#existing">RMS REGISTRATION</a></li>

            </ul>
            <p>&nbsp;</p>
            <div class="tab-content">
                <div id="existing" class="tab-pane fade in active border-top">
                    <div class="col-sm-2 col-md-2 col-lg-2"> <!-- required for floating -->
                        <!-- Nav tabs -->
                        <c:set var="count" value="0" scope="page"/>
                        <ul class="nav nav-tabs tabs-left">
                            <c:forEach var="field" items="${loginFields}">
                                <c:if test="${ field.published }">
                                    <c:if test="${ count == 0 }">
                                        <li class="active">
                                            <a href="#${field.profile }" data-toggle="tab">
                                                <c:forEach var="pn" items="${profileNames }">
                                                    <c:if test="${ pn.profile == field.profile }">
                                                        ${ pn.name }
                                                    </c:if>
                                                </c:forEach>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${ count > 0 }">
                                        <c:if test="${admincounts>2}">
                                            <c:choose>
                                                <c:when test="${field.profile=='ADMINISTRATOR'}">

                                                </c:when>
                                                <c:otherwise>
                                                    <li>
                                                        <a href="#${field.profile }"
                                                           data-toggle="tab">
                                                            <c:forEach var="pn"
                                                                       items="${profileNames }">
                                                                <c:if test="${ pn.profile == field.profile }">
                                                                    ${ pn.name }
                                                                </c:if>
                                                            </c:forEach>
                                                        </a>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:if>
                                    </c:if>
                                    <c:set var="count" value="${count + 1}" scope="page"/>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>

                    <div class="col-sm-10 col-md-10 col-lg-10">
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div class="tab-pane" id="ADMINISTRATOR">
                                <div class="row">

                                    <form class="form-horizontal" method="post" id="form-admin">

                                        <div class="modal-dialog large-modal">
                                            <div class="modal-content">
                                                <div class="modal-body">
                                                    <h2 class="heading">
                                                        <c:forEach var="pn" items="${profileNames }">
                                                            <c:if test="${ pn.profile == 'ADMINISTRATOR'}">
                                                                ${ pn.name }
                                                            </c:if>
                                                        </c:forEach>
                                                        REGISTRATION</h2>
                                                    <fieldset>
                                                        <div class="form-group">
                                                            <c:forEach var="field" items="${loginFields}">
                                                                <c:choose>
                                                                    <c:when test="${field.profile == 'ADMINISTRATOR' }">
                                                                        <label for="adminIdNumber"
                                                                               class="control-label">${ field.ordinal }:</label>
                                                                        <c:if test="${ field.ordinal== 'PHONE' }">
                                                                            <div class="form-inline">
                                                                                <select class="form-control pull-left admin-country-code"
                                                                                        name="country-code"
                                                                                        style="width: 25%;"></select>
                                                                                <input type="text" name="adminIdNumber"
                                                                                       class="form-control"
                                                                                       id="adminIdNumber"
                                                                                       placeholder="CELL ${ field.ordinal}"
                                                                                       style="width: 75%;">
                                                                            </div>
                                                                        </c:if>
                                                                        <c:if test="${ field.ordinal== 'EMAIL'}">
                                                                            <input type="email" name="adminIdNumber"
                                                                                   class="form-control input-sm"
                                                                                   id="adminIdNumber"
                                                                                   placeholder="${ field.ordinal}">
                                                                        </c:if>

                                                                    </c:when>
                                                                </c:choose>
                                                            </c:forEach>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="adminPassword"
                                                                   class="control-label">Password:</label>
                                                            <input type="password" name="adminPassword"
                                                                   class="form-control input-sm"
                                                                   id="adminPassword" placeholder="Enter Password">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="adminConfirmPassword" class="control-label">Confirm
                                                                Password:</label>
                                                            <input type="password" name="adminConfirmPassword"
                                                                   class="form-control input-sm"
                                                                   id="adminConfirmPassword"
                                                                   placeholder="Confirm Password">
                                                        </div>
                                                        <div class="col-md-6 CaptchaImage" id="adminCaptchaImage">
                                                            <img src="<%=request.getContextPath()%>/captcha"
                                                                 alt="captcha"/>
                                                        </div>
                                                        <div class="col-md-6 form-group">
                                                            <label class="control-label">Enter the text to your left
                                                                here</label>
                                                            <input type="text" class="form-control"
                                                                   name="adminCaptchaChars" id="adminCaptchaChars"/>
                                                        </div>
                                                        <button class="btn btn-warning btn-block">REGISTER NOW</button>
                                                    </fieldset>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                            </div>
                            <div class="tab-pane active" id="AGENT">
                                <div class="row">
                                    <div class="modal-dialog large-modal">
                                        <div class="modal-content">
                                            <div class="modal-body">
                                                <h2 class="heading">
                                                    <c:forEach var="pn" items="${profileNames }">
                                                        <c:if test="${ pn.profile == 'AGENT'}">
                                                            ${ pn.name }
                                                        </c:if>
                                                    </c:forEach> REGISTRATION</h2>
                                                <form class="form-horizontal" method="post" id="form-agent">
                                                    <fieldset>
                                                        <div class="col-sm-5">
                                                            <div class="form-group">
                                                                <label for="agentFirstname" class="control-label">Firstname:</label>
                                                                <input
                                                                        type="text" name="agentFirstname"
                                                                        class="form-control"
                                                                        id="agentFirstname"
                                                                        placeholder="Firstname">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="agentSurname"
                                                                       class="control-label">Surname:</label>
                                                                <input
                                                                        type="text" name="agentSurname"
                                                                        class="form-control"
                                                                        id="agentSurname"
                                                                        placeholder="Surname">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="agentOthernames" class="control-label">Othernames:</label>
                                                                <input type="text" name="agentOthernames"
                                                                       class="form-control"
                                                                       id="agentOthernames" placeholder="Othernames">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="agentGender"
                                                                       class="control-label">Gender:</label> <select
                                                                    name="agentGender" id="agentGender"
                                                                    class="form-control">
                                                                <option value="">Select gender...</option>
                                                                <c:forEach var="gender" items="${genders}">
                                                                    <option value="${gender.id}">
                                                                            ${gender.name}
                                                                    </option>
                                                                </c:forEach>
                                                            </select>
                                                            </div>

                                                            <div class="form-group">
                                                                <label for="agentPassword" class="control-label">Password:</label>
                                                                <input
                                                                        type="password" name="agentPassword"
                                                                        class="form-control"
                                                                        id="agentPassword"
                                                                        placeholder="Password">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="agentConfirmPassword" class="control-label">Confirm
                                                                    Password:</label> <input
                                                                    type="password" name="agentConfirmPassword"
                                                                    class="form-control"
                                                                    id="agentConfirmPassword"
                                                                    placeholder="Confirm Password">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="agentCellNumber" class="control-label">PHONE
                                                                    NUMBER</label>
                                                                <div class="form-inline">
                                                                    <select class="form-control pull-left agent-country-code"
                                                                            name="country-code"
                                                                            style="width: 35%;"></select>
                                                                    <input type="text" name="agentCellNumber"
                                                                           class="form-control"
                                                                           id="agentCellNumber"
                                                                           placeholder="Phone Number"
                                                                           style="width:65%"
                                                                           oninput="this.value=this.value.toUpperCase()">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-1"></div>
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <label for="agentIdnumber" class="control-label">ID
                                                                    Number:</label>
                                                                <input type="text" name="agentIdnumber"
                                                                       class="form-control"
                                                                       id="agentIdnumber" placeholder="ID Number">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="agentEmailaddress" class="control-label">Email
                                                                    Address:</label> <input
                                                                    type="text" name="agentEmailaddress"
                                                                    class="form-control"
                                                                    id="agentEmailaddress"
                                                                    placeholder="Email Address">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="agentPostalAddress" class="control-label">Postal
                                                                    Address:</label> <input type="text"
                                                                                            name="agentPostalAddress"
                                                                                            class="form-control"
                                                                                            id="agentPostalAddress"
                                                                                            placeholder="Postal Address ">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="agentTown" class="control-label">Town
                                                                    :</label> <input type="text" name="agentTown"
                                                                                     class="form-control" id="agentTown"
                                                                                     placeholder="Town">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="agentZipcode" class="control-label">Zip
                                                                    Code:</label> <input type="text" name="agentZipcode"
                                                                                         class="form-control"
                                                                                         id="agentZipcode"
                                                                                         placeholder="Zip Code">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="agentBuilding" class="control-label">Building:
                                                                </label> <input type="text" name="agentBuilding"
                                                                                class="form-control" id="agentBuilding"
                                                                                placeholder="Bulding">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="agentRoad" class="control-label">Road:
                                                                </label> <input type="text" name="agentRoad"
                                                                                class="form-control" id="agentRoad"
                                                                                placeholder="Bulding">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 CaptchaImage" id="agentCaptchaImage">
                                                            <img src="<%=request.getContextPath()%>/captcha"
                                                                 alt="captcha"/>
                                                        </div>
                                                        <div class="col-md-6 form-group">
                                                            <label class="control-label">Enter the text to your left
                                                                here</label>
                                                            <input type="text" class="form-control"
                                                                   name="agentCaptchaChars" id="agentCaptchaChars"/>
                                                        </div>
                                                        <button class="btn btn-warning pull-right">REGISTER NOW</button>

                                                        <%--<c:if test="${accountRecovery.accountRecoveryActive == 'TRUE'}">--%>
                                                        <%--<a--%>
                                                        <%--href="<%=request.getContextPath()%>/find-agent-account.jsp"--%>
                                                        <%--class="btn btn-info pull-left"--%>
                                                        <%--style="font-size: 12px"--%>
                                                        <%-->${ accountRecovery.accountRecoveryName }</a>--%>
                                                        <%--</c:if>--%>
                                                        <%--<a  href="<%=request.getContextPath()%>/find-agent-account.jsp"  class="btn btn-info pull-right"--%>
                                                        <%--style="font-size: 12px">Account Recovery</a>--%>

                                                    </fieldset>

                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="tab-pane" id="LANDLORD">
                                <div class="row">

                                    <div class="modal-dialog large-modal">
                                        <div class="modal-content">
                                            <div class="modal-body">
                                                <h2 class="heading">
                                                    <c:forEach var="pn" items="${profileNames }">
                                                        <c:if test="${ pn.profile == 'LANDLORD'}">
                                                            ${ pn.name }
                                                        </c:if>
                                                    </c:forEach> REGISTRATION</h2>
                                                <form class="form-horizontal" method="post" id="form-landlord">
                                                    <fieldset>
                                                        <div class="col-sm-5">
                                                            <div class="form-group">
                                                                <label for="landLordFirstname" class="control-label">Firstname:</label>
                                                                <input
                                                                        type="text" name="landLordFirstname"
                                                                        class="form-control"
                                                                        id="landLordFirstname"
                                                                        placeholder="Firstname">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="landLordSurname" class="control-label">Surname:</label>
                                                                <input
                                                                        type="text" name="landLordSurname"
                                                                        class="form-control"
                                                                        id="landLordSurname"
                                                                        placeholder="Surname">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="landLordothernames" class="control-label">Othernames:</label>
                                                                <input type="text" name="landLordothernames"
                                                                       class="form-control"
                                                                       id="landLordothernames" placeholder="Othernames">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="landlordGender" class="control-label">Gender:</label>
                                                                <select
                                                                        name="landlordGender" id="landlordGender"
                                                                        class="form-control">
                                                                    <option value="">Select gender...</option>
                                                                    <c:forEach var="gender" items="${genders}">
                                                                        <option value="${gender.id}">
                                                                                ${gender.name}
                                                                        </option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>


                                                            <div class="form-group">
                                                                <label for="landlordPassword" class="control-label">Password:</label>
                                                                <input
                                                                        type="password" name="landlordPassword"
                                                                        class="form-control"
                                                                        id="landlordPassword"
                                                                        placeholder="Password">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="landLordConfirmPassword"
                                                                       class="control-label">Confirm Password:</label>
                                                                <input
                                                                        type="password" name="landLordConfirmPassword"
                                                                        class="form-control"
                                                                        id="landLordConfirmPassword"
                                                                        placeholder="Confirm Password">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="landlordCellNumber" class="control-label">PHONE
                                                                    NUMBER</label>
                                                                <div class="form-inline">
                                                                    <select class="form-control pull-left agent-country-code"
                                                                            name="country-code"
                                                                            style="width: 35%;"></select>
                                                                    <input type="text" name="landlordCellNumber"
                                                                           class="form-control"
                                                                           id="landlordCellNumber"
                                                                           placeholder="Phone Number"
                                                                           style="width:65%"
                                                                           oninput="this.value=this.value.toUpperCase()">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-1"></div>
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <label for="landlordIdnumber" class="control-label">ID
                                                                    Number:</label>
                                                                <input type="text" name="landlordIdnumber"
                                                                       class="form-control"
                                                                       id="landlordIdnumber" placeholder="ID Number">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="landLordEmailaddress" class="control-label">Email
                                                                    Address:</label> <input
                                                                    type="text" name="landLordEmailaddress"
                                                                    class="form-control"
                                                                    id="landLordEmailaddress"
                                                                    placeholder="Email Address">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="landlordPostalAddress"
                                                                       class="control-label">Postal
                                                                    Address:</label> <input type="text"
                                                                                            name="landlordPostalAddress"
                                                                                            class="form-control"
                                                                                            id="landlordPostalAddress"
                                                                                            placeholder="Postal Address ">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="landlordTown" class="control-label">Town
                                                                    :</label> <input type="text" name="landlordTown"
                                                                                     class="form-control"
                                                                                     id="landlordTown"
                                                                                     placeholder="Town">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="landlordZipcode" class="control-label">Zip
                                                                    Code:</label> <input type="text"
                                                                                         name="landlordZipcode"
                                                                                         class="form-control"
                                                                                         id="landlordZipcode"
                                                                                         placeholder="Zip Code">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="landlordBuilding" class="control-label">Building:
                                                                </label> <input type="text" name="landlordBuilding"
                                                                                class="form-control"
                                                                                id="landlordBuilding"
                                                                                placeholder="Bulding">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="landlordRoad" class="control-label">Road:
                                                                </label> <input type="text" name="landlordRoad"
                                                                                class="form-control" id="landlordRoad"
                                                                                placeholder="Bulding">
                                                            </div>
                                                        </div>

                                                        <div class="col-md-6 CaptchaImage"
                                                             id="landlordImageCaptchaChars">
                                                            <img src="<%=request.getContextPath()%>/captcha"
                                                                 alt="captcha"/>
                                                        </div>
                                                        <div class="col-md-6 form-group">
                                                            <label class="control-label">Enter the text to your left
                                                                here</label>
                                                            <input type="text" class="form-control"
                                                                   name="landlordCaptchaChars"
                                                                   id="landlordCaptchaChars"/>
                                                        </div>
                                                        <button class="btn btn-warning btn-block">REGISTER NOW</button>
                                                    </fieldset>

                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>

    </div>
    <jsp:include page="includes/partial/footer.jsp"/>

