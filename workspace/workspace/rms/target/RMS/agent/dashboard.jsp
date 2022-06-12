<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate var="year" value="${now}" pattern="yyyy"/>
<div class="container-fluid section" style="background-color: #f0eceb; color: #0c0c0c">
    <h3 class="text-center main-title">
        <i class="glyphicon glyphicon-dashboard"></i>&nbsp;DASHBOARD PANEL
    </h3>
    <div class="col-md-6">
        <h3 class="text-center">
            <small>AGENT DETAILS</small>
        </h3>
        <table class="table table-responsive table-striped">


            <c:if test="${agentDashboard.idNumber == 'TRUE'}">
                <tr>
                    <td>ID NUMBER</td>
                    <td>${agent.idNumber }</td>
                </tr>
            </c:if>
            <c:if test="${agentDashboard.agentNumber == 'TRUE'}">
                <tr>
                    <td>AGENT NUMBER</td>
                    <td>${agent.agentNumber }</td>
                </tr>
            </c:if>

            <c:if test="${agentDashboard.firstname == 'TRUE'}">
                <tr>
                    <td>FIRSTNAME</td>
                    <td>${agent.firstname }</td>
                </tr>

            </c:if>
            <c:if test="${agentDashboard.surname == 'TRUE'}">
                <tr>
                    <td>SURNAME</td>
                    <td>${agent.surname }</td>
                </tr>

            </c:if>
            <c:if test="${agentDashboard.othernames == 'TRUE'}">
                <tr>
                    <td>OTHERNAMES</td>
                    <td>${agent.othernames }</td>
                </tr>

            </c:if>

            <c:if test="${agentDashboard.emailAddress == 'TRUE'}">
                <tr>
                    <td>EMAIL</td>
                    <td>${agent.emailAddress }</td>
                </tr>
            </c:if>


            <c:if test="${agentDashboard.gender == 'TRUE'}">
                <tr>
                    <td>GENDER</td>
                    <td>${agent.gender.name }</td>
                </tr>
            </c:if>

            <c:if test="${agentDashboard.phoneNumber == 'TRUE'}">
                <tr>
                    <td>PHONE NUMBER</td>
                    <td>${agent.phoneNumber }</td>
                </tr>
            </c:if>

        </table>


    </div>
    <div class="col-md-6 border-left">
        <h3 class="text-center"><small>DISTRIBUTION TO UNITS</small></h3>
        <div id="pie-chart">

        </div>
    </div>

    <div class="col-md-12 border-top">

    </div>


</div>

<script type="text/javascript">
    $(document).ready(function () {
        /* Load Beneficiary Distribution Data */
        $.ajax({
            url: $('#base_url').val() + 'agent',
            type: 'post',
            data: {ACTION: 'UD'},
            dataType: 'json',
            success: function (json) {
                if (json.success)
                {
                    json = $.parseJSON(json.data);
                    pie_chart(json);
                } else
                {
                    stop_wait();
                    bootbox.alert('<p class="text-center">' + json.message + '</p>');
                }

            }
        });
    });

    function pie_chart(json)
    {
        var slices = {
            distributions: []
        };
        var total = 0;
        $.each(json, function (key, value) {
            if (key == 'rows')
            {
                for (var i = 0; i < json.rows.length; i++) {
                    var row = json.rows[i];
                    var dashboard_items = {};
                    dashboard_items["vacantUnits"] = row["vacantUnits"];
                    dashboard_items["occupiedUnits"] = row['occupiedUnits'];
                    slices.distributions.push(dashboard_items);
                }
            }
        });

        var dashboard_items = {};
        dashboard_items["vacantUnits"] = "Vacant-Units";
        dashboard_items["occupiedUnits"] = dashboard_items["numberOfUnits"]  -  dashboard_items["vacantUnits"];
        if (dashboard_items['occupiedUnits'] < 0)
            dashboard_items['occupiedUnits'] = 0;
        slices.distributions.push(dashboard_items);

        $('#pie-chart').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {
                text: ''
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:,.1f}</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
            series: [{
                name: "Distribution",
                colorByPoint: true,
                data: slices.distributions
            }]
        });
    }
</script>