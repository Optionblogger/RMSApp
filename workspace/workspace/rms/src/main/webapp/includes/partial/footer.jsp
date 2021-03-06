<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% pageContext.setAttribute("currentYear", java.util.Calendar.getInstance().get(java.util.Calendar.YEAR)); %>

<div class="modal fade " id="modal-pwd-reset" tabindex="-1"
     role="dialog" aria-labelledby="myModalLabelReset" aria-hidden="true">
    <form role="form" id="form-password-reset">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title text-center" id="myModalLabelReset">
                        <i class="fa fa-bookmark"></i>&nbsp;&nbsp;<small>Please provide your username</small>
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="Username" class="control-label">Email:</label>
                        <c:forEach var="field" items="${loginFields}">
                            <c:choose>
                                <c:when test="${field.profile == 'AGENT' }">
                                    <c:if test="${ field.ordinal== 'PHONE' }">
                                        <div class="form-inline">
                                            <select class="form-control pull-left reset-country-code"
                                                    name="country-code" style="width: 25%;"></select>
                                            <div class="form-inline">

                                                <input type="text" name="Username" class="form-control"
                                                       id="Username" placeholder="CELL ${ field.ordinal}"
                                                       style="width: 75%;">
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${ field.ordinal== 'EMAIL'}">
                                        <span class="form-helper">${field.ordinal}</span>
                                        <input
                                                class="form-control" type="text"
                                                placeholder="${ field.ordinal}" name="Username" id="Username">
                                    </c:if>
                                </c:when>
                            </c:choose>
                        </c:forEach>
                    </div>
                    <p>We will send you instructions on how to reset your password</p>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-success">REQUEST PASSWORD RESET</button>
                </div>
            </div>
        </div>
    </form>
</div>


<%--RESET PASSWORD ADMIN--%>

<div class="modal fade " id="modal-pwd-reset-admin" tabindex="-1"
     role="dialog" aria-labelledby="myModalLabelReset" aria-hidden="true">
    <form role="form" id="form-password-reset-admin">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title text-center" id="myModalLabelResetAdmin">
                        <i class="fa fa-bookmark"></i>&nbsp;&nbsp;<small>Please provide your username</small>
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="AUsername" class="control-label"> </label>
                        <c:forEach var="field" items="${loginFields}">
                            <c:choose>
                                <c:when test="${field.profile == 'ADMINISTRATOR' }">
                                    <c:if test="${ field.ordinal== 'PHONE' }">
                                        <div class="form-inline">
                                            <select class="form-control pull-left admin-reset-country-code"
                                                    name="country-code" style="width: 25%;"></select>
                                            <input type="text" name="AUsername" class="form-control pull-right"
                                                   id="AUsername" placeholder="CELL ${ field.ordinal}"
                                                   style="width: 75%;">
                                        </div>
                                    </c:if>
                                    <c:if test="${ field.ordinal== 'EMAIL'}">
                                        <span class="form-helper">${field.ordinal}</span>
                                        <input
                                                class="form-control" type="text"
                                                placeholder="${ field.ordinal}" name="AUsername" id="AUsername">
                                    </c:if>
                                </c:when>

                            </c:choose>
                        </c:forEach>
                    </div>
                    <p>We will send you instructions on how to reset your password</p>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-success">REQUEST PASSWORD RESET</button>
                </div>
            </div>
        </div>
    </form>
</div>

<div class="container-fluid footer">
    <p>&copy; Copyright <c:out value="${currentYear}"/>. All Rights Reserved. KenPoze Ltd.</p>
</div>
<div class="modal fade" id="wait-dialog" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-body">
        <p class="text-center masked-bg"><img src="static/images/wait.gif" alt="Please wait..."/><br/>Please
            wait...<br/>
            <small onclick="stop_wait();">cancel</small>
        </p>
    </div>
</div>
<input type="hidden" id="base_url" value="<%=request.getContextPath()%>/"/>
<script src="static/custom/vendors/jquery-1.9.1.min.js"></script>
<script type="text/javascript"
        src="static/bootstrap-3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript"
        src="static/bootstrap-3.3.5/js/bootstrapValidator.min.js"></script>
<script src="static/bootstrap-3.3.5/js/bootstrap-filestyle.min.js"></script>
<script type="text/javascript"
        src="static/bootstrap-3.3.5/js/bootstrap-multiselect.js"></script>
<script type="text/javascript"
        src="static/bootstrap-3.3.5/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript"
        src="static/custom/js/bootbox.min.js"></script>
<script type="text/javascript" src="static/custom/js/scripts.js"></script>
<script type="text/javascript" src="static/custom/js/form-scripts.js"></script>
<script type="text/javascript" src="static/custom/js/highcharts-custom.js"></script>
<script type="text/javascript" src="static/custom/js/core.js"></script>
<script type="text/javascript" src="static/custom/js/plugins/jquery.appear/jquery.appear.js"></script>
<script type="text/javascript">
    $(document).ready(function () {

        $("#resendCodeBtn").click(function () {

//            $('#modal-resend-code').modal('show');


        });

        function init() {
            if ($('#message').val() != '') {
                bootbox.alert("<p class='text-center'>" + $('#message').val() + "</p>");
            }
        }

        init();
    });
</script>

</body>
</html>