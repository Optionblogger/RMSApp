<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="includes/header.jsp"/>

<div id="wrapper">
    <jsp:include page="includes/navigation.jsp"/>

    <div id="page-wrapper" class="gray-bg">

        <div class="row border-bottom">
            <nav class="navbar navbar-static-top white-bg" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i>
                    </a>
                    <form role="search" class="navbar-form-custom" action="search_results.html">
                        <div class="form-group">
                            <input type="text" placeholder="Search for something..." class="form-control"
                                   name="top-search" id="top-search">
                        </div>
                    </form>

                    <div class="input-group" style="font-weight: bold; font-size: 14px">
					<span class="input-group-addon">
						Choose Property:
					</span>
                        <select class="form-control" name="property_id" id="property2_id" onchange="adminreload();"
                                style="font-size: 14px">
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
                <ul class="nav navbar-top-links navbar-right">
                    <li>
                        <span class="m-r-sm text-muted welcome-message">Welcome to ${ company.name }.</span>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-envelope"></i> <span class="label label-warning">16</span>
                        </a>
                        <ul class="dropdown-menu dropdown-messages">


                            <li class="divider"></li>
                            <li>
                                <div class="dropdown-messages-box">
                                    <a href="profile.html" class="pull-left">
                                    </a>
                                    <div class="media-body ">
                                        <small class="pull-right">23h ago</small>
                                        <strong>Monica Smith</strong> love <strong>Kim Smith</strong>. <br>
                                        <small class="text-muted">2 days ago at 2:30 am - 11.06.2014</small>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a href="mailbox.html">
                                        <i class="fa fa-envelope"></i> <strong>Read All Messages</strong>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-bell"></i> <span class="label label-primary">8</span>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a href="mailbox.html">
                                    <div>
                                        <i class="fa fa-envelope fa-fw"></i> You have 16 messages
                                        <span class="pull-right text-muted small">4 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="profile.html">
                                    <div>
                                        <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                        <span class="pull-right text-muted small">12 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>

                            <li>
                                <div class="text-center link-block">
                                    <a href="notifications.html">
                                        <strong>See All Alerts</strong>
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <%--<li><a href="javascript:void(0);" id="logout-li">Logout</a></li>--%>
                </ul>

            </nav>
        </div>

        <div class="wrapper wrapper-content" id="dashboard">
            <div class="row">
                <div class="col-lg-2">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <span class="label label-success pull-right">Monthly</span>
                            <h5>Income</h5>
                        </div>
                        <div class="ibox-content">
                            <h1 class="no-margins">40 886,200</h1>
                            <div class="stat-percent font-bold text-success">98% <i class="fa fa-bolt"></i></div>
                            <small>Total income</small>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>Active Tenants</h5>
                        </div>
                        <div class="ibox-content">
                            <h1 class="no-margins">
                                <c:if test="${adminDashboard.activeTenants == 'TRUE'}">
                                    ${activeTenants}
                                </c:if>

                            </h1>
                            <div class="stat-percent font-bold text-info">20% <i class="fa fa-level-up"></i></div>
                            <small>Tenants</small>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">

                            <h5>Total Units</h5>
                        </div>
                        <div class="ibox-content">
                            <h1 class="no-margins">
                                <c:if test="${adminDashboard.numberOfUnits == 'TRUE'}">
                                    ${numberOfUnits}
                                </c:if>
                            </h1>
                            <div class="stat-percent font-bold text-navy">44% <i class="fa fa-level-up"></i></div>
                            <small>Units</small>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">

                            <h5>Occupied Units</h5>
                        </div>
                        <div class="ibox-content">
                            <h1 class="no-margins">
                                <c:if test="${adminDashboard.occupiedUnits == 'TRUE'}">
                                    ${occupiedUnits}
                                </c:if>

                            </h1>
                            <div class="stat-percent font-bold text-danger">38% <i class="fa fa-level-down"></i></div>
                            <small>Units</small>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">

                            <h5>Vacant Units</h5>
                        </div>
                        <div class="ibox-content">
                            <h1 class="no-margins">
                                <c:if test="${adminDashboard.vacantUnits == 'TRUE'}">
                                    ${vacantUnits}
                                </c:if>

                            </h1>
                            <div class="stat-percent font-bold text-danger">38% <i class="fa fa-level-down"></i></div>
                            <small>Vacant</small>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">

                            <h5>Number Of Agents</h5>
                        </div>
                        <div class="ibox-content">
                            <h1 class="no-margins">
                                <c:if test="${adminDashboard.numberOfAgents == 'TRUE'}">
                                    ${numberOfAgents}
                                </c:if>

                            </h1>
                            <div class="stat-percent font-bold text-danger">38% <i class="fa fa-level-down"></i></div>
                            <small>Agents</small>
                        </div>
                    </div>
                </div>
            </div>

            <div class="wrapper wrapper-content animated fadeInRight">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>Active Tenants Vs Total Rent.
                                    <small>.For Each Month</small>
                                </h5>
                            </div>
                            <div class="ibox-content">
                                <div>
                                    <canvas id="lineChart" height="140"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>Paid Rent vs Arrears For Each Month.</h5>
                            </div>
                            <div class="ibox-content">
                                <div>
                                    <canvas id="barChart" height="140"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
            <div class="small-chat-box fadeInRight animated">

                <div class="heading" draggable="true">
                    <small class="chat-date pull-right">
                        02.19.2015
                    </small>
                    Small chat
                </div>

                <div class="content">

                    <div class="left">
                        <div class="author-name">
                            Monica Jackson
                            <small class="chat-date">
                                10:02 am
                            </small>
                        </div>
                        <div class="chat-message active">
                            Lorem Ipsum is simply dummy text input.
                        </div>

                    </div>
                    <div class="right">
                        <div class="author-name">
                            Mick Smith
                            <small class="chat-date">
                                11:24 am
                            </small>
                        </div>
                        <div class="chat-message">
                            Lorem Ipsum is simpl.
                        </div>
                    </div>
                    <div class="left">
                        <div class="author-name">
                            Alice Novak
                            <small class="chat-date">
                                08:45 pm
                            </small>
                        </div>
                        <div class="chat-message active">
                            Check this stock char.
                        </div>
                    </div>
                    <div class="right">
                        <div class="author-name">
                            Anna Lamson
                            <small class="chat-date">
                                11:24 am
                            </small>
                        </div>
                        <div class="chat-message">
                            The standard chunk of Lorem Ipsum
                        </div>
                    </div>
                    <div class="left">
                        <div class="author-name">
                            Mick Lane
                            <small class="chat-date">
                                08:45 pm
                            </small>
                        </div>
                        <div class="chat-message active">
                            I belive that. Lorem Ipsum is simply dummy text.
                        </div>
                    </div>


                </div>
                <div class="form-chat">
                    <div class="input-group input-group-sm">
                        <input type="text" class="form-control">
                        <span class="input-group-btn"> <button
                                class="btn btn-primary" type="button">Send
                </button> </span></div>
                </div>

            </div>
            <div id="small-chat">

                <span class="badge badge-warning pull-right">5</span>
                <a class="open-small-chat">
                    <i class="fa fa-comments"></i>

                </a>
            </div>
            <div class="small-chat-box fadeInRight animated">

                <div class="heading" draggable="true">
                    <small class="chat-date pull-right">
                        02.19.2015
                    </small>
                    Small chat
                </div>

                <div class="content">

                    <div class="left">
                        <div class="author-name">
                            Monica Jackson
                            <small class="chat-date">
                                10:02 am
                            </small>
                        </div>
                        <div class="chat-message active">
                            Lorem Ipsum is simply dummy text input.
                        </div>

                    </div>
                    <div class="right">
                        <div class="author-name">
                            Mick Smith
                            <small class="chat-date">
                                11:24 am
                            </small>
                        </div>
                        <div class="chat-message">
                            Lorem Ipsum is simpl.
                        </div>
                    </div>
                    <div class="left">
                        <div class="author-name">
                            Alice Novak
                            <small class="chat-date">
                                08:45 pm
                            </small>
                        </div>
                        <div class="chat-message active">
                            Check this stock char.
                        </div>
                    </div>
                    <div class="right">
                        <div class="author-name">
                            Anna Lamson
                            <small class="chat-date">
                                11:24 am
                            </small>
                        </div>
                        <div class="chat-message">
                            The standard chunk of Lorem Ipsum
                        </div>
                    </div>
                    <div class="left">
                        <div class="author-name">
                            Mick Lane
                            <small class="chat-date">
                                08:45 pm
                            </small>
                        </div>
                        <div class="chat-message active">
                            I belive that. Lorem Ipsum is simply dummy text.
                        </div>
                    </div>


                </div>
                <div class="form-chat">
                    <div class="input-group input-group-sm">
                        <input type="text" class="form-control">
                        <span class="input-group-btn"> <button
                                class="btn btn-primary" type="button">Send
                </button> </span></div>
                </div>

            </div>
            <div id="small-chat">

                <span class="badge badge-warning pull-right">5</span>
                <a class="open-small-chat">
                    <i class="fa fa-comments"></i>

                </a>
            </div>
            <div class="small-chat-box fadeInRight animated">

                <div class="heading" draggable="true">
                    <small class="chat-date pull-right">
                        02.19.2015
                    </small>
                    Small chat
                </div>

                <div class="content">

                    <div class="left">
                        <div class="author-name">
                            Monica Jackson
                            <small class="chat-date">
                                10:02 am
                            </small>
                        </div>
                        <div class="chat-message active">
                            Lorem Ipsum is simply dummy text input.
                        </div>

                    </div>
                    <div class="right">
                        <div class="author-name">
                            Mick Smith
                            <small class="chat-date">
                                11:24 am
                            </small>
                        </div>
                        <div class="chat-message">
                            Lorem Ipsum is simpl.
                        </div>
                    </div>
                    <div class="left">
                        <div class="author-name">
                            Alice Novak
                            <small class="chat-date">
                                08:45 pm
                            </small>
                        </div>
                        <div class="chat-message active">
                            Check this stock char.
                        </div>
                    </div>
                    <div class="right">
                        <div class="author-name">
                            Anna Lamson
                            <small class="chat-date">
                                11:24 am
                            </small>
                        </div>
                        <div class="chat-message">
                            The standard chunk of Lorem Ipsum
                        </div>
                    </div>
                    <div class="left">
                        <div class="author-name">
                            Mick Lane
                            <small class="chat-date">
                                08:45 pm
                            </small>
                        </div>
                        <div class="chat-message active">
                            I belive that. Lorem Ipsum is simply dummy text.
                        </div>
                    </div>


                </div>
                <div class="form-chat">
                    <div class="input-group input-group-sm">
                        <input type="text" class="form-control">
                        <span class="input-group-btn"> <button
                                class="btn btn-primary" type="button">Send
                </button> </span></div>
                </div>

            </div>
            <div id="small-chat">

                <span class="badge badge-warning pull-right">5</span>
                <a class="open-small-chat">
                    <i class="fa fa-comments"></i>

                </a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="includes/footer.jsp"/>
