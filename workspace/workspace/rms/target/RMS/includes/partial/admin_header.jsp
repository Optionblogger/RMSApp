<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html class="no-js">

<head>
    <title style="font-size: 14px">${ company.name } -
        <c:choose>
            <c:when test="${ profile =='AGENT' }">Agent Portal</c:when>
            <c:otherwise>Administration</c:otherwise>
        </c:choose>
    </title>
    <!-- Bootstrap -->
    <link href="static/bootstrap-3.3.5/css/bootstrap.min.css"
          rel="stylesheet" media="screen">
    <link href="static/bootstrap-3.3.5/css/bootstrap-responsive.min.css"
          rel="stylesheet" media="screen">
    <!--export to pdf css files -->

    <link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css" rel="stylesheet">

    <!--export to pdf css files -->
    <!-- DataTables CSS-->
    <link href="static/datatables/css/datatables.min.css"
          rel="stylesheet" media="screen">
    <link href="static/datatables/css/dataTables.bootstrap.min.css"
          rel="stylesheet" media="screen">

    <link
            href="static/custom/vendors/easypiechart/jquery.easy-pie-chart.css"
            rel="stylesheet" media="screen">
    <link href="static/custom/assets/styles.css" rel="stylesheet"
          media="screen">
    <link href="static/custom/css/vallenato.css" rel="stylesheet"
          media="screen">
    <link href="static/custom/js/ui/trumbowyg.min.css" rel="stylesheet"
          media="screen">
    <link rel="stylesheet" type="text/css"
          href="static/bootstrap-3.3.5/css/bootstrap-datetimepicker.min.css"/>
    <link rel="stylesheet" type="text/css"
          href="static/bootstrap-3.3.5/css/bootstrap-colorpicker.min.css"/>
    <link rel="stylesheet" type="text/css" href="static/font-awesome-4.3.0/css/font-awesome.min.css"/>
    <!--<link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900' rel='stylesheet' type='text/css'>-->
    <link href='static/custom/css/fonts.css?family=Lato:100,300,400,700,900' rel='stylesheet' type='text/css'>

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <link rel="icon" href="static/images/logo.png">
    <script src="static/custom/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    <script type="text/javascript" src="static/jquery/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="static/jquery/datePicker.js"></script>
    <script type="text/javascript" src="static/bootstrap-3.3.5/js/colorpicker-color.js"></script>

    <!-- DataTables JS-->
    <script type="text/javascript" src="static/datatables/js/datatables.min.js"></script>
    <script type="text/javascript" src="static/datatables/js/dataTables.bootstrap.min.js"></script>

    <!-- this is mine-->
    <script type="text/javascript" src="static/custom/js/html2canvas.min.js"></script>
    <script type="text/javascript" src="static/custom/js/jspdf.min.js"></script>


    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>


    <!-- this is mine-->

</head>

<body oncontextmenu="return false">
<input type="hidden" id="path" value="${ path }"/>
<!-- SEND EMAIL -->
<div class="modal fade" id="modal-send-email" tabindex="-1" role="dialog" aria-labelledby="myModalLabelSendEmail"
     aria-hidden="true">
    <form role="form" id="form-send-email">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabelSendEmail">
                        <i class="glyphicon glyphicon-envelope"></i>&nbsp;&nbsp;DROP US AN EMAIL
                    </h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="ACTION" id="ACTION" value="EMAIL"/>

                    <div class="form-group">
                        <label class="control-label" for="recipient">Send To:</label>
                        <select id="recipient" name="recipient" class="form-control">
                            <option value="" disabled>--Select Recipient--</option>

                            <c:if test="${email.defaultEmailActive == 'TRUE'}">
                                <option value="defaultEmail">Administrator</option>
                            </c:if>
                            <c:if test="${email.marketingEmailActive == 'TRUE'}">
                                <option value="marketingEmail">Marketing</option>
                            </c:if>
                            <c:if test="${email.supportEmailActive == 'TRUE'}">
                                <option value="supportEmail">Support</option>
                            </c:if>
                            <c:if test="${email.crmEmailActive == 'TRUE'}">
                                <option value="crmEmail">Customer Relationship Manager</option>
                            </c:if>
                        </select>
                    </div>

                    <div class="form-group">
                        <label class="control-label" for="subject">Category:</label>
                        <select class="form-control" name="category" id="category">
                            <c:forEach var="reason" items="${ contactReasons }">
                                <option>${ reason.name }</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label" for="subject">Subject:</label>
                        <input type="text" class="form-control" name="subject" id="subject"/>
                    </div>
                    <div class="form-group">
                        <label class="control-label" for="message">Message:</label>
                        <textarea name="message" id="message" class="form-control"></textarea>
                    </div>
                    <div class="form-group">
                        <label class="control-label" for="attachment">Attachment:</label>
                        <input type="file" id="attachment" name="attachment"/>
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-warning" data-dismiss="modal">Cancel</a>
                    <input class="btn btn-primary" type="submit"
                           value="Send Email" id="btn-email">
                </div>
            </div>
        </div>
    </form>
</div>

<!--  CHANGE PASSWORD -->
<div class="modal fade" id="modal-change-pwd" tabindex="-1"
     role="dialog" aria-labelledby="myModalLabelPwd" aria-hidden="true">
    <form role="form" id="form-change-password">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabelPwd">
                        <i class="fa fa-lock"></i>&nbsp;&nbsp;CHANGE PASSWORD
                    </h4>
                </div>
                <div class="modal-body">
                    <p class="text-center">You should check your email to obtain the security code requested herein</p>
                    <div class="form-group">
                        <label class="control-label" for="currentPassword">Current
                            Password:</label> <input type="password" class="form-control"
                                                     id="currentPassword" name="currentPassword"
                                                     placeholder="Current Password">
                    </div>
                    <div class="form-group">
                        <label class="control-label" for="securityCode">Security Code/ SMS code:</label> <input
                            type="password" class="form-control"
                            id="securityCode" name="securityCode"
                            placeholder="Security Code / SMS code (Get from your email or phone)">
                    </div>
                    <div class="form-group">
                        <label class="control-label" for="newPassword">New
                            Password:</label> <input type="password" class="form-control"
                                                     id="newPassword" name="newPassword" placeholder="New Password">
                    </div>
                    <div class="form-group">
                        <label class="control-label" for="confirmPassword">Confirm
                            Password:</label> <input type="password" class="form-control"
                                                     id="confirmPassword" name="confirmPassword"
                                                     placeholder="Confirm New Password">
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-warning" data-dismiss="modal">Cancel</a>
                    <input class="btn btn-primary" type="submit"
                           value="Change Password" id="pwd_btn">
                </div>
            </div>
        </div>
    </form>
</div>

<!--  End Change Password -->

<nav id="main-nav" class="navbar navbar-default navbar-fixed-top" role="imageBanner">
    <div class="container-fluid section" style="background-color: #5e0231;color: #283018; font-size: 14px;height: 100px">
        <c:choose>
            <c:when test="${ profile == 'AGENT' }">
                <div class="navbar-header pull-left col-md-2">
                    <button type="button" class="navbar-toggle" data-toggle="collapse"
                            data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span> <span
                            class="icon-bar"></span> <span class="icon-bar"></span> <span
                            class="icon-bar"></span>
                    </button>
                    <a href="javascript:void(0);" class="navbar-brand" style="font-size: 12px">${ company.name } -
                        <c:choose>
                            <c:when test="${ profile == 'AGENT' }">Agent Portal</c:when>
                            <c:otherwise>Administration</c:otherwise>
                        </c:choose>
                    </a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="navbar-header pull-left col-md-3">
                    <a href="javascript:void(0);" class="navbar-brand">${ company.name } -
                        <c:choose>
                            <c:when test="${ profile == 'AGENT' }">Agent Portal</c:when>
                            <c:otherwise>Administration</c:otherwise>
                        </c:choose>
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
        <c:choose>
        <c:when test="${ profile == 'AGENT' }">
        <div class="navbar-header col-md-4" style="margin-top: 10px">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span> <span
                    class="icon-bar"></span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span>
            </button>

            <div class="input-group" style="font-weight: bold; font-size: 14px">
					<span class="input-group-addon">
						Choose Property:
					</span>
                <select class="form-control" name="property_id" id="property2_id" onchange="reloadAgent();" style="font-size: 14px">
                    <c:forEach var="property" items="${ properties }">
                        <c:choose>
                            <c:when test="${property_id == property.id }">
                                <option value="${property.id }" selected="selected">${ property.name }</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${property.id }">${ property.name }</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
            </div>
        </div>

    </c:when>
    <c:otherwise>
        <div class="navbar-header col-md-4" style="margin-top: 10px">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span> <span
                    class="icon-bar"></span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span>
            </button>
            <div class="input-group" style="font-weight: bold; font-size: 14px">
					<span class="input-group-addon">
						Choose Property:
					</span>
                <select class="form-control" name="property_id" id="property_id" onchange="adminreload();" style="font-size: 14px">
                    <c:forEach var="property" items="${properties}">
                        <c:choose>
                            <c:when test="${property_id == property.id }">
                                <option value="${property.id }" selected="selected">${ property.name }</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${property.id }">${ property.name }</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
            </div>

        </div>
    </c:otherwise>
    </c:choose>


    <c:choose>


        <c:when test="${ profile == 'AGENT' }">
            <div class="navbar-header pull-right col-md-3">
                <div class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">PROFILE: ${ profile }</a></li>
                        <li><a href="#">Hi </a></li>
                        <li class="dropdown"><a href="#" class="dropdown-toggle"
                                                data-toggle="dropdown" role="button" aria-haspopup="true"
                                                aria-expanded="false"><i
                                class="fa fa-user"></i>&nbsp;&nbsp; ${ username }<span
                                class="caret"></span></a>
                            <ul class="dropdown-menu bolden">
                                <li><a href="javascript:void(0);" id="change-pwd-li"><i
                                        class="fa fa-lock"></i>&nbsp;&nbsp;Change Password</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="javascript:void(0);" id="logout-li"><i
                                        class="fa fa-power-off"></i>&nbsp;&nbsp;Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="navbar-header pull-right col-md-5">
                <div class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">PROFILE: ${ profile }</a></li>
                        <li><a href="#">Hi </a></li>
                        <li class="dropdown"><a href="#" class="dropdown-toggle"
                                                data-toggle="dropdown" role="button" aria-haspopup="true"
                                                aria-expanded="false"><i
                                class="fa fa-user"></i>&nbsp;&nbsp; ${ username }<span
                                class="caret"></span></a>
                            <ul class="dropdown-menu bolden">
                                <li><a href="javascript:void(0);" id="change-pwd-li"><i
                                        class="fa fa-lock"></i>&nbsp;&nbsp;Change Password</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="javascript:void(0);" id="logout-li"><i
                                        class="fa fa-power-off"></i>&nbsp;&nbsp;Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>

        </c:otherwise>
    </c:choose>
    </div>
    <!--/.container-->
</nav>

<!--/nav-->