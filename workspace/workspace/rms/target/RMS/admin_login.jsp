<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="includes/partial/header.jsp"/>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
            </button>
            <a class="btn btn-success navbar-btn glyphicon glyphicon-arrow-left"
               href="<%=request.getContextPath()%>/"><strong>HOME</strong></a>
        </div>
    </div>
</nav>


<div class="container">

    <div class="col-md-6 col-md-offset-3">
        <div class="login-form">

            <form class="register-form" id="form-login" method="post">
                <fieldset>
                    <legend class="text-center">Please Login Here</legend>
                    <img class="profile-img-card" src="static/images/avatar_2x.png">
                    <div class="form-group">
                        <c:forEach var="field" items="${loginFields}">
                            <c:choose>
                                <c:when test="${field.profile == 'ADMINISTRATOR' || field=='LANDLORD' }">
                                    <%--<c:when test="${ field.profile=='ADMIN' }">--%>

                                    <c:if test="${ field.ordinal== 'PHONE' }">
                                        <div class="form-inline">
                                            <select class="form-control pull-left admin-country-code"
                                                    name="country-code" style="width: 30%;"></select>
                                            <input class="form-control pull-right" type="text"
                                                   placeholder="CELL ${ field.ordinal}" name="username" id="username"
                                                   style="width: 70%;">
                                        </div>
                                    </c:if>
                                    <c:if test="${ field.ordinal== 'EMAIL'}">
                                        <span class="form-helper">${field.ordinal}</span>

                                        <input class="form-control" type="text"
                                               placeholder="${ field.ordinal}" name="username" id="username">
                                    </c:if>

                                    <c:if test="${ field.ordinal== 'EMPLOYER_ID'}">
                                        <%--<span class="form-helper">${field.ordinal}</span>--%>
                                        <input class="form-control" type="text"
                                               placeholder=" ${ field.ordinal}" name="username" id="username">
                                    </c:if>
                                </c:when>
                            </c:choose>
                        </c:forEach>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Password</label> <input
                            class="form-control" type="password" placeholder="Password" id="password"
                            name="password">
                    </div>
                    <button class="btn btn-warning btn-block" type="submit">
                        <strong>LOGIN</strong>
                    </button>
                    <br/>
                    <a href="javascript:void(0);" id="pwd-reset-btn-admin" class="btn btn-info">Forgot Your
                        Password?</a>
                </fieldset>
            </form>

        </div>
    </div>

</div>

<jsp:include page="includes/partial/footer.jsp"/>