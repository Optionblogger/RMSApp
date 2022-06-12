package com.rentmanagement.controller;


import javax.ejb.EJB;
import javax.persistence.Enumerated;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.Serializable;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;


import com.rentmanagement.beans.*;
import com.rentmanagement.common.*;
import com.rentmanagement.common.JLogger;
import com.rentmanagement.dto.RentDTO;
import com.rentmanagement.dto.ServiceChargeDTO;
import com.rentmanagement.dto.TenancyAgreementDTO;
import com.rentmanagement.model.*;

@WebServlet(name = "Dashboard", urlPatterns = {"/dashboard"})
public class Dashboard extends BaseServlet implements Serializable {

    private static final String YYYY_MM_DD = "yyyy-MM-dd";
    private static final String DD_MM_YYYY = "dd-MM-yyyy";
    private static final long serialVersionUID = 1L;

    Helper helper = new Helper();
    JLogger jLogger = new JLogger(this.getClass());

    @EJB
    AuditTrailBeanI auditTrailBeanI;
    @EJB
    UserBeanI userBeanI;


    @EJB
    MonthBeanI monthBeanI;


    @EJB
    PropertyBeanI propertyBeanI;

    @EJB
    TenantBeanI tenantBeanI;

    @EJB
    UnitBeanI unitBeanI;

    @EJB
    private RentBeanI rentBeanI;
    @EJB
    UnitLiabilityBeanI unitLiabilityBeanI;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        /* configuring the http headers */
        response.addHeader("X-XSS-Protection", "1; mode=block");
        response.addHeader("X-Frame-Options", "DENY");
        response.addHeader("X-Content-Type-Options", "nosniff");

        HttpSession session = request.getSession(false);

        String REPO_FOLDER = "dashboard";

        String action = this.get(request, REPO_FOLDER);
        if (session.getAttribute(Constants.LOGIN).equals(true) && (helper.isManagerial(this.getSessKey(request, Constants.U_PROFILE)))) {
            /* Administrative Dashboards */
            int BATCH = 20;
            int PER_PAGE = 20;
            switch (action) {
                case Actions.DASHBOARD_SETUP:
                    showSetup(request, response, session, REPO_FOLDER);
                    break;

                case Actions.DASHBOARD_HELP:
                    showHelp(request, response, session, REPO_FOLDER);
                    break;
                case Actions.DASHBOARD_USER_ACCESS_REPORTS:
                    showUserAccessReports(request, response, session, REPO_FOLDER);
                    break;
                case Actions.CONTACT_REASONS:
                    showContactReasons(request, response, session, REPO_FOLDER);
                    break;
                case Actions.PAGE_CONTENT:
                    showPageContent(request, response, session, REPO_FOLDER);
                    break;
                case Actions.FAQ_CONTENT:
                    showFaqContent(request, response, session, REPO_FOLDER);
                    break;


                case Actions.CONTENT:
                    showPageContent(request, response, session, REPO_FOLDER);
                    break;

                case Actions.MEDIA:
                    showMedia(request, response, session, REPO_FOLDER);
                    break;

                case Actions.PORTAL_AGENT:
                    showPortalAgents(request, response, REPO_FOLDER, BATCH, PER_PAGE);
                    break;

                case Actions.VIEW_TENANTS:
                    showPortalTenants(request, response, REPO_FOLDER, BATCH, PER_PAGE);
                    break;

                case Actions.ADD_PROPERTY:
                    showAddProperty(request, response, REPO_FOLDER, BATCH, PER_PAGE);
                    break;

                case Actions.ADD_PROPERTY_BATCH:
                    showAddPropertyBatch(request, response, REPO_FOLDER, BATCH, PER_PAGE);
                    break;

                case Actions.VIEW_PROPERTY:
                    showViewProperty(request, response, REPO_FOLDER);
                    break;

                case Actions.ADD_UNIT:
                    showAddUnit(request, response, REPO_FOLDER, BATCH, PER_PAGE);
                    break;

                case Actions.VIEW_UNIT:
                    showViewUnit(request, response, REPO_FOLDER, BATCH, PER_PAGE);
                    break;
                case Actions.VIEW_UNIT_GRID:
                    showViewUnitGrid(request, response, REPO_FOLDER, BATCH, PER_PAGE);
                    break;
                case Actions.VIEW_UNIT_ADMIN:
                    viewUnits(request, response, REPO_FOLDER, BATCH, PER_PAGE);
                    break;
                case Actions.VIEW_UNIT_GRID_ADMIN:
                    viewUnit_grid(request, response, REPO_FOLDER, BATCH, PER_PAGE);
                    break;

                case Actions.VIEW_OCCUPIED_UNIT:
                    showViewOccupiedUnit(request, response, REPO_FOLDER, BATCH, PER_PAGE);
                    break;

                case Actions.VIEW_SERVICE_CHARGE:
                    showViewServiceCharge(request, response, REPO_FOLDER, BATCH, PER_PAGE);
                    break;

                case Actions.VIEW_RENT_PAID:
                    showViewRentPaid(request, response, REPO_FOLDER, BATCH, PER_PAGE);
                    break;


                case Actions.VIEW_RENT_ARREARS:
                    showViewRentArrears(request, response, REPO_FOLDER, BATCH, PER_PAGE);
                    break;


                case Actions.VIEW_RENT_PREPAID:
                    showViewRentPrepaid(request, response, REPO_FOLDER, BATCH, PER_PAGE);
                    break;

                case Actions.VIEW_COMMISSIONS:
                    showViewCommissions(request, response, REPO_FOLDER, BATCH, PER_PAGE);
                    break;

                case Actions.VIEW_DEDUCTIONS:
                    showViewDeductions(request, response, REPO_FOLDER, BATCH, PER_PAGE);
                    break;


                case Actions.VIEW_INVOICES:
                    showViewInvoices(request, response, REPO_FOLDER, BATCH, PER_PAGE);
                    break;


                case Actions.VIEW_RECEIPTS:
                    showViewReceipts(request, response, REPO_FOLDER, BATCH, PER_PAGE);
                    break;


                case Actions.ADD_AGENT:
                    showAddAgent(request, response, REPO_FOLDER, BATCH, PER_PAGE);
                    break;
                case Actions.VIEW_AGENT:
                    showViewAgent(request, response, REPO_FOLDER, BATCH, PER_PAGE);
                    break;


                case Actions.ADD_LANDLORD:
                    showAddLandLord(request, response, REPO_FOLDER, BATCH, PER_PAGE);
                    break;
                case Actions.VIEW_LANDLORD:
                    viewLandLord(request, response, REPO_FOLDER, BATCH, PER_PAGE);
                    break;

                case Actions.LANDLORD:
                    showLandlords(request, response, REPO_FOLDER, BATCH, PER_PAGE);
                    break;

                case Actions.AUDIT_TRAIL:
                    showAuditTrails(request, response, session, REPO_FOLDER, BATCH, PER_PAGE);
                    break;
                case Actions.USER:
                    showUsers(request, response, session, REPO_FOLDER, BATCH, PER_PAGE);
                    break;
                case Actions.UAC:
                    showUserAccessControls(request, response, session, REPO_FOLDER);
                    break;


            }
        }
        if (session.getAttribute("LOGIN").equals(true) && (this.getSessKey(request, Constants.U_PROFILE).equals(Constants.AGENT_PROFILE) || helper.isManagerial(this.getSessKey(request, Constants.U_PROFILE)))) {
            int BATCH = 20;
            int PER_PAGE = 20;
            switch (action) {

                case Actions.AT:
                    try {
                        showTenancyAgreement(request, response, session);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    break;
                case Actions.ATB:
                    try {
                        showTenancyAgreementBatch(request, response, session);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    break;
                case Actions.VT:
                    try {
                        viewTenant(request, response, session);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    break;

                case Actions.VT_GRID:
                    try {
                        viewTenantGrid(request, response, session);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    break;


                case Actions.AGENT_PERSONAL_INFORMATION:
                    showAgentPersonalInformation(request, response, session);
                    break;
                case Actions.MEMBER_MEDIA_FILES:
                    showMemberMedia(request, response, session);
                    break;
                case Actions.DOCUMENTS:
                    showMemberDocument(request, response, session);
                    break;
                case Actions.VC:
                    try {
                        viewContract(request, response, session);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    break;


                case Actions.VC_GRID:
                    try {
                        viewContractGrid(request, response, session);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    break;

                case Actions.VSC_GRID:
                    try {
                        viewServiceChargeGrid(request, response, session);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    break;

                case Actions.VSC:
                    try {
                        viewServiceCharge(request, response, session);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    break;

                case Actions.VRP:
                    try {
                        viewPaidRent(request, response, session);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    break;
                case Actions.VRP_GRID:
                    try {
                        viewPaidRentGrid(request, response, session);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    break;

                case Actions.VRA:
                    try {
                        viewRentArrears(request, response, session);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    break;
                case Actions.VRA_GRID:
                    try {
                        viewRentArrearsGrid(request, response, session);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    break;


                case Actions.VRPP:
                    try {
                        viewRentPrepaid(request, response, session);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    break;


                case Actions.VRPP_GRID:
                    try {
                        viewRentPrepaidGrid(request, response, session);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    break;


                case Actions.RR:
                    try {
                        recordRent(request, response, session);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                case Actions.IR:
                    try {
                        issueReceipts(request, response, session);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                case Actions.RBU:
                    try {
                        uploadRent(request, response, session);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                case Actions.PR:
                    try {
                        viewInvoice(request, response, session);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                case Actions.AUL:
                    try {
                        addUnitLiabilities(request, response, session);
                    } catch (Exception e) {

                    }
                case Actions.VUL:
                    try {
                        viewUnitLiabilities(request, response, session);
                    } catch (Exception e) {

                    }
                case Actions.VUL_GRID:
                    try {
                        viewUnitGridLiabilities(request, response, session);
                    } catch (Exception e) {

                    }
                case Actions.RU:
                    try {
                        releaseUnit(request, response, session);
                    } catch (Exception e) {

                    }
                case Actions.SNT:
                    try {
                        sendNotificationToTenants(request, response, session);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    break;
                case Actions.SNL:
                    try {
                        sendNotificationToLandlords(request, response, session);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    break;


            }
        }

    }


    private void viewContract(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        jLogger.w("Property Id is ------" + this.getSessKey(request, Constants.PROPERTY_ID));

        List<TenancyAgreementDTO> agreementList = tenantBeanI.findAllByProperty(Long.valueOf(this.getSessKey(request, Constants.PROPERTY_ID)));
        if (agreementList != null) {
            request.setAttribute("tenancyAgreements", agreementList);
            logActivity(Actions.VC, "View Tenancy Agreement", null, null);
            request.getRequestDispatcher("agent/view_tenants.jsp").forward(request, response);
        }

        logActivity(Actions.VC, "View Tenancy Agreement", null, null);
        request.getRequestDispatcher("agent/view_tenants.jsp").forward(request, response);

    }


    private void viewContractGrid(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        jLogger.w("Property Id is ------" + this.getSessKey(request, Constants.PROPERTY_ID));

        List<TenancyAgreementDTO> agreementList = tenantBeanI.findAllByProperty(Long.valueOf(this.getSessKey(request, Constants.PROPERTY_ID)));
        if (agreementList != null) {
            request.setAttribute("tenancyAgreements", agreementList);
            logActivity(Actions.VC, "View Tenancy Agreement", null, null);
            request.getRequestDispatcher("agent/viewTenant.jsp").forward(request, response);
        }

        logActivity(Actions.VC_GRID, "View Tenancy Agreement", null, null);
        request.getRequestDispatcher("agent/viewTenant.jsp").forward(request, response);

    }

    private void viewServiceCharge(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        List<ServiceChargeDTO> serviceChargeDTOList = tenantBeanI.findServiceCharge(Long.valueOf(this.getSessKey(request, Constants.PROPERTY_ID)));

        if (serviceChargeDTOList != null) {
            request.setAttribute("serviveCharges", serviceChargeDTOList);
            logActivity(Actions.VSC, "View Service Charge", null, null);
            request.getRequestDispatcher("agent/view_service_charge.jsp").forward(request, response);
        }
        logActivity(Actions.VSC, "View Service Charge", null, null);
        request.getRequestDispatcher("agent/view_service_charge.jsp").forward(request, response);

    }


    private void viewPaidRent(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

        jLogger.w("the property is " + this.getSessKey(request, Constants.PROPERTY_ID));
        List<RentDTO> rents = rentBeanI.findAllPaidRent(Long.valueOf(this.getSessKey(request, Constants.PROPERTY_ID)));
        if (rents != null) {
            request.setAttribute("rents", rents);
            logActivity(Actions.VRP, "View Rent Paid", null, null);
            request.getRequestDispatcher("agent/view_rent_paid.jsp").forward(request, response);
        } else {
            request.setAttribute("rents", rents);
            logActivity(Actions.VRP, "View Rent Paid", null, null);
            request.getRequestDispatcher("agent/view_rent_paid.jsp").forward(request, response);
        }

    }


    private void viewPaidRentGrid(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        List<Month> months = monthBeanI.find();
        request.setAttribute("months", months);
        logActivity(Actions.VRP_GRID, "View Rent Paid", null, null);
        request.getRequestDispatcher("agent/view_rent_paid_grid.jsp").forward(request, response);
    }


    private void viewRentArrears(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        jLogger.w("the property is " + this.getSessKey(request, Constants.PROPERTY_ID));
        List<RentDTO> rents = rentBeanI.findRentArrears(Long.valueOf(this.getSessKey(request, Constants.PROPERTY_ID)));
        if (rents != null) {
            request.setAttribute("rents", rents);
            logActivity(Actions.VRA, "View Rent Arrears", null, null);
            request.getRequestDispatcher("agent/view_rent_arrears.jsp").forward(request, response);
        }else{
            request.setAttribute("rents", rents);
            logActivity(Actions.VRA, "View Rent Arrears", null, null);
            request.getRequestDispatcher("agent/view_rent_arrears.jsp").forward(request, response);
        }

    }

    private void viewRentArrearsGrid(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

        logActivity(Actions.VRA_GRID, "View Rent Arrears", null, null);
        request.getRequestDispatcher("agent/view_rent_arrears_grid.jsp").forward(request, response);
    }


    private void viewRentPrepaid(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        jLogger.w("the property is " + this.getSessKey(request, Constants.PROPERTY_ID));
        List<RentDTO> rents = rentBeanI.findRentPrepaid(Long.valueOf(this.getSessKey(request, Constants.PROPERTY_ID)));
        if (rents != null) {
            request.setAttribute("rents", rents);
            logActivity(Actions.VRPP, "View Rent Prepaid", null, null);
            request.getRequestDispatcher("agent/view_prepaid_rent.jsp").forward(request, response);
        }else{
            request.setAttribute("rents", rents);
            logActivity(Actions.VRPP, "View Rent Prepaid", null, null);
            request.getRequestDispatcher("agent/view_prepaid_rent.jsp").forward(request, response);
        }

    }

    private void viewRentPrepaidGrid(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        logActivity(Actions.VRPP_GRID, "View Rent Prepaid", null, null);
        request.getRequestDispatcher("agent/view_prepaid_rent_grid.jsp").forward(request, response);
    }

    private void viewServiceChargeGrid(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        List<ServiceChargeDTO> serviceChargeDTOList = tenantBeanI.findServiceCharge(Long.valueOf(this.getSessKey(request, Constants.PROPERTY_ID)));

        if (serviceChargeDTOList != null) {
            request.setAttribute("serviveCharges", serviceChargeDTOList);
            logActivity(Actions.VSC, "View Service Charge", null, null);
            request.getRequestDispatcher("agent/view_service_charge_grid.jsp").forward(request, response);
        }
        logActivity(Actions.VSC, "View Service Charge", null, null);
        request.getRequestDispatcher("agent/view_service_charge_grid.jsp").forward(request, response);

    }

    private void recordRent(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        jLogger.w("WE ARE HERE RECORD  RENT");

        /*        List<TenancyAgreementDTO> agreementList = tenantBeanI.findAllByProperty(Long.valueOf(this.getSessKey(request, Constants.PROPERTY_ID)));*/
        List<Unit> units = unitBeanI.searchByPropertyId(Long.valueOf(this.getSessKey(request, Constants.PROPERTY_ID)));
        List<Month> months = monthBeanI.find();
        jLogger.i("Months---" + months.size());
        if (units != null) {
            request.setAttribute("units", units);
            request.setAttribute("months", months);
            logActivity(Actions.RR, "Record Rent", null, null);
            request.getRequestDispatcher("agent/addRent.jsp").forward(request, response);
        }
        logActivity(Actions.RR, "Record Rent", null, null);
        request.getRequestDispatcher("agent/addRent.jsp").forward(request, response);

    }

    private void issueReceipts(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        jLogger.w("am here receipts");
        List<Unit> unit = unitBeanI.searchByPropertyId(Long.valueOf(this.getSessKey(request, Constants.PROPERTY_ID)));
        List<Month> months = monthBeanI.find();
        request.setAttribute("units", unit);
        request.setAttribute("months", months);
        logActivity(Actions.IR, "Issue Receipts", null, null);
        request.getRequestDispatcher("agent/issue_receipts.jsp").forward(request, response);
    }

    private void uploadRent(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {


       /* List<TenancyAgreementDTO> agreementList = tenantBeanI.findAllByProperty(Long.valueOf(this.getSessKey(request, Constants.PROPERTY_ID)));
        List<Month> months = monthBeanI.find();

        jLogger.w("the unit is  heree"+agreementList.get(0).getUnitNumber());

        if (agreementList != null) {
            request.setAttribute("tenants", agreementList);
            jLogger.w("the unit is "+agreementList.get(0).getUnitNumber());
            request.setAttribute("months", months);
            logActivity(Actions.RR, "Record Rent", null, null);
            request.getRequestDispatcher("agent/addRent.jsp").forward(request, response);
        }
        logActivity(Actions.RR, "Record Rent", null, null);
        request.getRequestDispatcher("agent/addRent.jsp").forward(request, response);*/
        try {
            Long id = Long.valueOf(this.getSessKey(request, Constants.PROPERTY_ID));
            Property property = propertyBeanI.findById(id);
            jLogger.w("the property is +" + property.getName());
            if (property != null) {

                jLogger.w("the property is +" + property.getName());

                request.setAttribute("property", property);
                request.getRequestDispatcher("agent/addRentBatch.jsp").forward(request, response);
            }

        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void viewInvoice(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

        List<Month> months = monthBeanI.find();
        request.setAttribute("months", months);
        logActivity(Actions.PR, " View Invoices", null, null);
        request.getRequestDispatcher("agent/view_invoices.jsp").forward(request, response);
    }

    private void addUnitLiabilities(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        jLogger.w("am here");
        List<Gender> genders = genderBeanI.find();
        request.setAttribute("genders", genders);
        List<Country> countries = countryBeanI.find();
        List<Unit> units = unitBeanI.searchByPropertyId(Long.valueOf(this.getSessKey(request, Constants.PROPERTY_ID)));
        if (units == null) {
            request.setAttribute("units", null);
        }
        request.setAttribute("countries", countries);
        request.setAttribute("units", units);
        logActivity(Actions.AUL, "Adding Unit Liabilities", null, null);
        request.getRequestDispatcher("agent/addUnitLiability.jsp").forward(request, response);
    }

    private void viewUnitLiabilities(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        List<UnitLiability> units = unitLiabilityBeanI.searchByPropertyId(Long.valueOf(this.getSessKey(request, Constants.PROPERTY_ID)));
        if (units != null) {
            jLogger.w("the size of units is " + units.size());
            request.setAttribute("units", units);
            logActivity(Actions.VUL, "View Unit Liabilities", null, null);
            request.getRequestDispatcher("agent/view_units_liabilities.jsp").forward(request, response);

        } else {
            request.setAttribute("units", units);
            logActivity(Actions.VIEW_UNIT_GRID, "View Unit", null, null);
            request.getRequestDispatcher("agent/view_units_liabilities.jsp").forward(request, response);
        }

    }

    private void viewUnitGridLiabilities(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

        jLogger.w("ggggggggggggggggggggg");
        List<UnitLiability> units = unitLiabilityBeanI.searchByPropertyId(Long.valueOf(this.getSessKey(request, Constants.PROPERTY_ID)));
        if (units != null) {

            jLogger.w("the size of units is " + units.size());
            request.setAttribute("units", units);
            logActivity(Actions.VUL, "View Unit Liabilities", null, null);
            request.getRequestDispatcher("agent/view_units_liabilities_grid.jsp").forward(request, response);

        } else {
            request.setAttribute("units", units);
            logActivity(Actions.VIEW_UNIT_GRID, "View Unit", null, null);
            jLogger.w("hhhhhhhhhhhhhhhhhhhhhhhhh");
            request.getRequestDispatcher("agent/view_units_liabilities_grid.jsp").forward(request, response);
        }
    }

    private void releaseUnit(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

        List<Unit> units = unitBeanI.searchByPropertyId(Long.valueOf(this.getSessKey(request, Constants.PROPERTY_ID)));
        request.setAttribute("units", units);
        logActivity(Actions.RU, "release unit", null, null);
        request.getRequestDispatcher("agent/release_unit.jsp").forward(request, response);


    }
    private void sendNotificationToTenants(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        jLogger.w("hapa------------>");
        request.getRequestDispatcher("agent/sendNotificationToTenants.jsp").forward(request, response);
    }

    private void sendNotificationToLandlords(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        jLogger.w("hapa------------>L");

        request.getRequestDispatcher("agent/sendNotificationToLandlord.jsp").forward(request, response);
    }
    private void showAgentPersonalInformation(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {


        Agent agent = agentBeanI.findByUser(this.getSessKey(request, Constants.USER));
        request.setAttribute("agent", agent);
        List<Country> countries = countryBeanI.find();
        request.setAttribute("countries", countries);
        List<Gender> genders = genderBeanI.find();
        request.setAttribute("genders", genders);
        Company company = companyBeanI.find();
        request.setAttribute("company", company);
        Social social = socialBeanI.find();
        request.setAttribute("social", social);

        AgentPermission agentPermission = agentPermissionBeanI.find();
        request.setAttribute("agentPermission", agentPermission);
        request.setAttribute("profile", this.getSessKey(request, Constants.U_PROFILE));


        // logActivity("AGENT PERSONAL INFORMATION", "Viewed editable Agent personal information", this.getSessKey(request, Constants.UID), this.getSessKey(request, Constants.SCHEME_ID), this.getSessKey(request, Constants.U_PROFILE));
        this.audit(session, "Viewed  editable  Agent personal information");
        request.getRequestDispatcher("agent/personal_information.jsp").forward(request, response);
    }

    private void showTenancyAgreement(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        jLogger.w("am here");
        List<Gender> genders = genderBeanI.find();
        request.setAttribute("genders", genders);
        List<Country> countries = countryBeanI.find();
        List<Unit> units = unitBeanI.searchByPropertyId(Long.valueOf(this.getSessKey(request, Constants.PROPERTY_ID)));
        if (units == null) {
            request.setAttribute("units", null);
        }
        request.setAttribute("countries", countries);
        request.setAttribute("units", units);
        logActivity(Actions.AT, "View TenancyAgreement Form", null, null);
        request.getRequestDispatcher("agent/addTenancyAgreement.jsp").forward(request, response);
    }


    private void showTenancyAgreementBatch(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        jLogger.w("am here");
        List<Gender> genders = genderBeanI.find();
        request.setAttribute("genders", genders);
        List<Country> countries = countryBeanI.find();
        List<Unit> units = unitBeanI.searchByPropertyId(Long.valueOf(this.getSessKey(request, Constants.PROPERTY_ID)));
        if (units == null) {
            request.setAttribute("units", null);
        }
        request.setAttribute("countries", countries);
        request.setAttribute("units", units);
        logActivity(Actions.AT, "View TenancyAgreement Batch Form", null, null);
        request.getRequestDispatcher("agent/addTenantsBatch.jsp").forward(request, response);
    }


    private void viewTenant(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

        jLogger.w("View TenancyAgreement......................");
        List<TenancyAgreement> tenancyAgreements = tenantBeanI.findAll();
        jLogger.w("Size TenancyAgreement......................" + tenancyAgreements.size());
        request.setAttribute("tenancyAgreements", tenancyAgreements);
        logActivity(Actions.VT, "View TenancyAgreement", null, null);
        request.getRequestDispatcher("agent/view_tenants.jsp").forward(request, response);
    }


    private void viewTenantGrid(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

        jLogger.w("View TenancyAgreement......................");
        List<TenancyAgreement> tenancyAgreements = tenantBeanI.findAll();
        jLogger.w("Size TenancyAgreement......................" + tenancyAgreements.size());
        request.setAttribute("tenancyAgreements", tenancyAgreements);
        logActivity(Actions.VT, "View TenancyAgreement", null, null);
        request.getRequestDispatcher("agent/viewTenant.jsp").forward(request, response);
    }

    @EJB
    MediaBeanI mediaBeanI;

    private void showMemberMedia(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {

        String schemeId = "";
        //schemeId = this.getSessKey(request, Constants.SCHEME_ID);
        jLogger.i("============ Member Scheme ID is: " + schemeId + " ===================");
        request.setAttribute("scheme_id", schemeId);

        //List<Media> medias = mediaBeanI.findAll(this.getSessKey(request, Constants.SCHEME_ID), this.getSessKey(request, Constants.U_PROFILE), this.getSessKey(request, Constants.PROFILE_ID));
        boolean status = true;
        String profile = this.getSessKey(request, Constants.U_PROFILE);
        String memberId = this.getSessKey(request, Constants.PROFILE_ID);
        jLogger.i("Member ID: " + memberId);
        List<Media> medias = mediaBeanI.findByStatusAndProfile(schemeId, status, profile);
        jLogger.i("Medias found: " + medias.size());

        if (medias == null || medias.size() < 1) {
            medias = mediaBeanI.findByMemberId(schemeId, memberId);
        }
        jLogger.i("Medias found 2: " + medias.size());
        request.setAttribute("medias", medias);

        for (Media media : medias) {
            String mediaScheme = media.getSchemeID();
            jLogger.i("============ Doc Scheme ID is: " + mediaScheme + " ===================");
            jLogger.i("Medias found: " + media);
        }

        //  logActivity("MEDIA FILES", "Accessed media & files (documents)", this.getSessKey(request, Constants.UID), this.getSessKey(request, Constants.SCHEME_ID), this.getSessKey(request, Constants.U_PROFILE));
        this.audit(session, "Accessed media & files (documents)");
        request.getRequestDispatcher("agent/media_files.jsp").forward(request, response);
    }

    private void showMemberDocument(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {

        String schemeId = "";
        // schemeId = this.getSessKey(request, Constants.SCHEME_ID);
        jLogger.i("============ Member Scheme ID is: " + schemeId + " ===================");
        request.setAttribute("scheme_id", schemeId);

        //List<Media> medias = mediaBeanI.findAll(this.getSessKey(request, Constants.SCHEME_ID), this.getSessKey(request, Constants.U_PROFILE), this.getSessKey(request, Constants.PROFILE_ID));
        boolean status = true;
        String profile = this.getSessKey(request, Constants.U_PROFILE);
        String memberId = this.getSessKey(request, Constants.PROFILE_ID);
        request.setAttribute("member_id", memberId);
        //
        //XiMember member = apiEJB.memberExists(profile, this.getSessKey(request, Constants.USER));
        /// String nationalPenNo = member.getNationalPenNo();

        jLogger.i("Member ID: " + memberId);
        //List<Media> documents = mediaBeanI.findByNationalPenNo(nationalPenNo);
     /*   jLogger.i("Medias found: " + documents.size());

        if (documents == null || documents.size() < 1) {
            documents = mediaBeanI.findByMemberId(schemeId, memberId);
        }
        jLogger.i("Medias found 2: " + documents.size());
        request.setAttribute("documents", documents);

        for (Media document : documents) {
            String mediaScheme = document.getSchemeID();
            jLogger.i("============ Doc Scheme ID is: " + mediaScheme + " ===================");
            jLogger.i("Medias found: " + document);
        }*/

        //logActivity("DOCUMENT FILES", "Accessed media & files (documents)", this.getSessKey(request, Constants.UID), this.getSessKey(request, Constants.SCHEME_ID), this.getSessKey(request, Constants.U_PROFILE));
        this.audit(session, "Accessed media & files (documents)");
        request.getRequestDispatcher("agent/document_file.jsp").forward(request, response);
    }

    @EJB
    SocialBeanI socialBeanI;

    @EJB
    GenderBeanI genderBeanI;

    @EJB
    CompanyBeanI companyBeanI;
    @EJB
    EmailsBeanI emailsBeanI;
    @EJB
    AgentPermissionBeanI agentPermissionBeanI;

    @EJB
    AgentBeanI agentBeanI;


    private void showUserAccessControls(HttpServletRequest request, HttpServletResponse response, HttpSession session, String REPO_FOLDER) throws ServletException, IOException {
        Permission permissions = getPermissions(request);
        request.setAttribute("permissions", permissions);

        //logActivity("USER ACCESS CONTROL", "Accessed User Access Control Panel", this.getSessKey(request, Constants.UID), this.getSessKey(request, Constants.SCHEME_ID), this.getSessKey(request, Constants.U_PROFILE));
        this.audit(session, "Accessed User Access Control Panel");
        request.getRequestDispatcher(REPO_FOLDER + "/uac.jsp").forward(request, response);
    }

    private void showUsers(HttpServletRequest request, HttpServletResponse response, HttpSession session, String REPO_FOLDER, int BATCH, int PER_PAGE) throws ServletException, IOException {
        List<User> users;
        int page;
        try {
            page = Integer.parseInt(this.get(request, "page"));
        } catch (NumberFormatException nfe) {
            nfe.printStackTrace();
            page = 1;
        }
        String search = this.get(request, "search");
        int batch;
        try {
            batch = Integer.parseInt(this.get(request, "batch"));
        } catch (NumberFormatException nfe) {
            batch = 1;
        }
        int count = userBeanI.countAll(search);
        int pages = (count / PER_PAGE);
        int start = (PER_PAGE * (page - 1)) * (batch - 1);
        int begin = ((batch * BATCH) - BATCH) + 1;
        if (begin < 1) {
            begin = 1;
        }
        request.setAttribute("begin", begin);
        request.setAttribute("pages", pages);
        request.setAttribute("batch", batch);
        request.setAttribute("page", page);
        request.setAttribute("per_page", PER_PAGE);
        request.setAttribute("search", search);
        request.setAttribute("pages", pages);
        users = userBeanI.findAll(search, start, PER_PAGE);
        request.setAttribute("users", users);
        Permission permissions = getPermissions(request);
        request.setAttribute("permissions", permissions);
        //logActivity("USERS", "Viewed portal users", this.getSessKey(request, Constants.UID), this.getSessKey(request, Constants.SCHEME_ID), this.getSessKey(request, Constants.U_PROFILE));
        this.audit(session, "Viewed portal users");
        request.getRequestDispatcher(REPO_FOLDER + "/users.jsp").forward(request, response);
    }

    private void showAuditTrails(HttpServletRequest request, HttpServletResponse response, HttpSession session, String REPO_FOLDER, int BATCH, int PER_PAGE) throws ServletException, IOException {
        Permission permissions = getPermissions(request);
        request.setAttribute("permissions", permissions);
        int page;
        try {
            page = Integer.parseInt(this.get(request, "page"));
        } catch (NumberFormatException nfe) {
            nfe.printStackTrace();
            page = 1;
        }
        String search = this.get(request, "search");
        int batch;
        try {
            batch = Integer.parseInt(this.get(request, "batch"));
        } catch (NumberFormatException nfe) {
            batch = 1;
        }
        int count = auditTrailBeanI.countAll(search);
        int pages = (count / PER_PAGE);
        int start = (PER_PAGE * (page - 1)) * (batch - 1);
        int begin = ((batch * BATCH) - BATCH) + 1;
        if (begin < 1) {
            begin = 1;
        }
        request.setAttribute("begin", begin);
        request.setAttribute("pages", pages);
        request.setAttribute("batch", batch);
        request.setAttribute("page", page);
        request.setAttribute("per_page", PER_PAGE);
        request.setAttribute("search", search);
        List<AuditTrail> auditTrails = auditTrailBeanI.findAll(search, start, PER_PAGE);
        request.setAttribute("auditTrails", auditTrails);
        request.setAttribute("pages", pages);
        // logActivity("AUDIT TRAIL", "Viewed Audit Trails", this.getSessKey(request, Constants.UID), this.getSessKey(request, Constants.SCHEME_ID), this.getSessKey(request, Constants.U_PROFILE));
        this.audit(session, "Viewed Audit Trails");
        request.getRequestDispatcher(REPO_FOLDER + "/audit_trail.jsp").forward(request, response);
    }


    private void showLandlords(HttpServletRequest request, HttpServletResponse response, String REPO_FOLDER, int BATCH, int PER_PAGE) throws ServletException, IOException {
        Permission permissions = getPermissions(request);
        request.setAttribute("permissions", permissions);
        int page;
        try {
            page = Integer.parseInt(this.get(request, "page"));
        } catch (NumberFormatException nfe) {
            nfe.printStackTrace();
            page = 1;
        }
        String search;
        try {
            search = this.get(request, "search");
        } catch (NumberFormatException nfe) {
            search = null;
        }
        int batch;
        try {
            batch = Integer.parseInt(this.get(request, "batch"));
        } catch (NumberFormatException nfe) {
            batch = 1;
        }
        //int count = sponsorBeanI.countAll(search);
        // int pages = (count / PER_PAGE);
        int start = (PER_PAGE * (page - 1)) * (batch - 1);
        int begin = ((batch * BATCH) - BATCH) + 1;
        if (begin < 1) {
            begin = 1;
        }
        request.setAttribute("begin", begin);
        //request.setAttribute("pages", pages);
        request.setAttribute("batch", batch);
        request.setAttribute("page", page);
        request.setAttribute("per_page", PER_PAGE);
        request.setAttribute("search", search);
        String agentId = null;
        if (this.getSessKey(request, Constants.U_PROFILE).equals(Constants.AGENT_PROFILE)) {
            agentId = this.getSessKey(request, Constants.PROFILE_ID);
        }
//        List<Sponsor> sponsors = sponsorBeanI.findAll(agentId, search, start, PER_PAGE);
//        request.setAttribute("sponsors", sponsors);


        List<Country> countries = countryBeanI.find();
        request.setAttribute("countries", countries);
        //request.setAttribute("pages", pages);

        request.getRequestDispatcher(REPO_FOLDER + "/portal_sponsors.jsp").forward(request, response);
    }

    private void showAddLandlords(HttpServletRequest request, HttpServletResponse response, String REPO_FOLDER, int BATCH, int PER_PAGE) throws ServletException, IOException {
        Permission permissions = getPermissions(request);
        request.setAttribute("permissions", permissions);
        int page;
        try {
            page = Integer.parseInt(this.get(request, "page"));
        } catch (NumberFormatException nfe) {
            nfe.printStackTrace();
            page = 1;
        }
        String search;
        try {
            search = this.get(request, "search");
        } catch (NumberFormatException nfe) {
            search = null;
        }
        int batch;
        try {
            batch = Integer.parseInt(this.get(request, "batch"));
        } catch (NumberFormatException nfe) {
            batch = 1;
        }
        //int count = sponsorBeanI.countAll(search);
        // int pages = (count / PER_PAGE);
        int start = (PER_PAGE * (page - 1)) * (batch - 1);
        int begin = ((batch * BATCH) - BATCH) + 1;
        if (begin < 1) {
            begin = 1;
        }
        request.setAttribute("begin", begin);
        //request.setAttribute("pages", pages);
        request.setAttribute("batch", batch);
        request.setAttribute("page", page);
        request.setAttribute("per_page", PER_PAGE);
        request.setAttribute("search", search);
        String agentId = null;
        if (this.getSessKey(request, Constants.U_PROFILE).equals(Constants.AGENT_PROFILE)) {
            agentId = this.getSessKey(request, Constants.PROFILE_ID);
        }
//        List<Sponsor> sponsors = sponsorBeanI.findAll(agentId, search, start, PER_PAGE);
//        request.setAttribute("sponsors", sponsors);


        List<Country> countries = countryBeanI.find();
        request.setAttribute("countries", countries);
        //request.setAttribute("pages", pages);

        request.getRequestDispatcher(REPO_FOLDER + "/portal_sponsors.jsp").forward(request, response);
    }


    private void showPortalAgents(HttpServletRequest request, HttpServletResponse response, String REPO_FOLDER, int BATCH, int PER_PAGE) throws ServletException, IOException {
        request.getRequestDispatcher("/agent").forward(request, response);
    }

    private void showPortalTenants(HttpServletRequest request, HttpServletResponse response, String REPO_FOLDER, int BATCH, int PER_PAGE) throws ServletException, IOException {
        jLogger.w("Property Id is ------" + this.getSessKey(request, Constants.PROPERTY_ID));

        List<TenancyAgreementDTO> agreementList = tenantBeanI.findAllByProperty(Long.valueOf(this.getSessKey(request, Constants.PROPERTY_ID)));
        if (agreementList != null) {
            request.setAttribute("tenancyAgreements", agreementList);
            logActivity(Actions.VC, "View Tenancy Agreement", null, null);
            request.getRequestDispatcher(REPO_FOLDER + "/view_tenants.jsp").forward(request, response);
        }

        logActivity(Actions.VC, "View Tenancy Agreement", null, null);
        request.getRequestDispatcher(REPO_FOLDER + "/view_tenants.jsp").forward(request, response);
    }

    private void showAddProperty(HttpServletRequest request, HttpServletResponse response, String REPO_FOLDER, int BATCH, int PER_PAGE) throws ServletException, IOException {
        List<Agent> agents = agentBeanI.find();
        request.setAttribute("agents", agents);
        request.getRequestDispatcher(REPO_FOLDER + "/addProperty.jsp").forward(request, response);
    }

    private void showAddPropertyBatch(HttpServletRequest request, HttpServletResponse response, String REPO_FOLDER, int BATCH, int PER_PAGE) throws ServletException, IOException {
        List<Agent> agents = agentBeanI.find();
        request.setAttribute("agents", agents);
        request.getRequestDispatcher(REPO_FOLDER + "/addPropertyBatch.jsp").forward(request, response);
    }

    private void showViewProperty(HttpServletRequest request, HttpServletResponse response, String REPO_FOLDER) throws ServletException, IOException {
        List<Property> property = propertyBeanI.findAll();
        jLogger.w("List size" + property.size());
        request.setAttribute("properties", property);
        request.getRequestDispatcher(REPO_FOLDER + "/view_property.jsp").forward(request, response);
    }

    private void showAddUnit(HttpServletRequest request, HttpServletResponse response, String REPO_FOLDER, int BATCH, int PER_PAGE) throws ServletException, IOException {
        try {
            Long id = Long.valueOf(this.getSessKey(request, Constants.PROPERTY_ID));
            Property property = propertyBeanI.findById(id);
            jLogger.w("the property is +" + property.getName());
            if (property != null) {

                jLogger.w("the property is +" + property.getName());

                request.setAttribute("property", property);
                request.getRequestDispatcher(REPO_FOLDER + "/addUnit.jsp").forward(request, response);
            }

        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void viewUnits(HttpServletRequest request, HttpServletResponse response, String REPO_FOLDER, int BATCH, int PER_PAGE) {

        try {
            Long id = Long.valueOf(this.getSessKey(request, Constants.PROPERTY_ID));
            List<Unit> units = unitBeanI.searchByPropertyId(id);
            request.setAttribute("units", units);
            request.getRequestDispatcher(REPO_FOLDER + "/view_units_per_property.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void viewUnit_grid(HttpServletRequest request, HttpServletResponse response, String REPO_FOLDER, int BATCH, int PER_PAGE) {

        try {
            Long id = Long.valueOf(this.getSessKey(request, Constants.PROPERTY_ID));
            List<Unit> units = unitBeanI.searchByPropertyId(id);
            request.setAttribute("units", units);
            request.getRequestDispatcher(REPO_FOLDER + "/view_units_per_property_grid.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void showViewUnit(HttpServletRequest request, HttpServletResponse response, String REPO_FOLDER, int BATCH, int PER_PAGE) throws ServletException, IOException {
        Permission permissions = getPermissions(request);
        request.setAttribute("permissions", permissions);

        List<Unit> units = unitBeanI.searchByPropertyId(Long.valueOf(this.getSessKey(request, Constants.PROPERTY_ID)));
        if (units != null) {
            jLogger.w("the size of units is " + units.size());
            request.setAttribute("units", units);
            logActivity(Actions.VIEW_UNIT, "View Unit", null, null);
            request.getRequestDispatcher("agent/view_units.jsp").forward(request, response);

        } else {
            request.setAttribute("units", units);
            logActivity(Actions.VIEW_UNIT, "View Unit", null, null);
            request.getRequestDispatcher("agent/view_units.jsp").forward(request, response);
        }
    }

    private void showViewUnitGrid(HttpServletRequest request, HttpServletResponse response, String REPO_FOLDER, int BATCH, int PER_PAGE) throws ServletException, IOException {
        Permission permissions = getPermissions(request);
        request.setAttribute("permissions", permissions);

        List<Unit> units = unitBeanI.searchByPropertyId(Long.valueOf(this.getSessKey(request, Constants.PROPERTY_ID)));
        if (units != null) {
            jLogger.w("the size of units is " + units.size());
            request.setAttribute("units", units);
            logActivity(Actions.VIEW_UNIT_GRID, "View Unit", null, null);
            request.getRequestDispatcher("agent/view_units_grid.jsp").forward(request, response);

        } else {
            request.setAttribute("units", units);
            logActivity(Actions.VIEW_UNIT_GRID, "View Unit", null, null);
            request.getRequestDispatcher("agent/view_units_grid.jsp").forward(request, response);
        }
    }

    private void showViewOccupiedUnit(HttpServletRequest request, HttpServletResponse response, String REPO_FOLDER, int BATCH, int PER_PAGE) throws ServletException, IOException {
        Permission permissions = getPermissions(request);
        request.setAttribute("permissions", permissions);
        int page;
        try {
            page = Integer.parseInt(this.get(request, "page"));
        } catch (NumberFormatException nfe) {
            page = 1;
        }
        String search = this.get(request, "search");
        int batch;
        try {
            batch = Integer.parseInt(this.get(request, "batch"));
        } catch (NumberFormatException nfe) {
            batch = 1;
        }
        //  int count = memberBeanI.countAll(search);
        //int pages = (count / PER_PAGE);
        int start = (PER_PAGE * (page - 1)) * (batch - 1);
        int begin = ((batch * BATCH) - BATCH) + 1;
        if (begin < 1) {
            begin = 1;
        }
        request.setAttribute("begin", begin);
        // request.setAttribute("pages", pages);
        request.setAttribute("batch", batch);
        request.setAttribute("page", page);
        request.setAttribute("per_page", PER_PAGE);
        request.setAttribute("search", search);
        String agentId = null;
        if (this.getSessKey(request, Constants.U_PROFILE).equals(Constants.AGENT_PROFILE)) {
            agentId = this.getSessKey(request, Constants.PROFILE_ID);
        }
//        List<Member> members = memberBeanI.findAll(agentId, search, start, PER_PAGE);
//        request.setAttribute("members", members);
        //request.setAttribute("pages", pages);
        List<Country> countries = countryBeanI.find();
        request.setAttribute("countries", countries);
        List<Gender> genders = genderBeanI.find();
        request.setAttribute("genders", genders);
        request.getRequestDispatcher(REPO_FOLDER + "/portal_members.jsp").forward(request, response);
    }

    private void showViewServiceCharge(HttpServletRequest request, HttpServletResponse response, String REPO_FOLDER, int BATCH, int PER_PAGE) throws ServletException, IOException {
        Permission permissions = getPermissions(request);
        request.setAttribute("permissions", permissions);
        int page;
        try {
            page = Integer.parseInt(this.get(request, "page"));
        } catch (NumberFormatException nfe) {
            page = 1;
        }
        String search = this.get(request, "search");
        int batch;
        try {
            batch = Integer.parseInt(this.get(request, "batch"));
        } catch (NumberFormatException nfe) {
            batch = 1;
        }
        //int count = memberBeanI.countAll(search);
        // int pages = (count / PER_PAGE);
        int start = (PER_PAGE * (page - 1)) * (batch - 1);
        int begin = ((batch * BATCH) - BATCH) + 1;
        if (begin < 1) {
            begin = 1;
        }
        request.setAttribute("begin", begin);
        //request.setAttribute("pages", pages);
        request.setAttribute("batch", batch);
        request.setAttribute("page", page);
        request.setAttribute("per_page", PER_PAGE);
        request.setAttribute("search", search);
        String agentId = null;
        if (this.getSessKey(request, Constants.U_PROFILE).equals(Constants.AGENT_PROFILE)) {
            agentId = this.getSessKey(request, Constants.PROFILE_ID);
        }
//        List<Member> members = memberBeanI.findAll(agentId, search, start, PER_PAGE);
//        request.setAttribute("members", members);
        // request.setAttribute("pages", pages);
        List<Country> countries = countryBeanI.find();
        request.setAttribute("countries", countries);
        List<Gender> genders = genderBeanI.find();
        request.setAttribute("genders", genders);
        request.getRequestDispatcher(REPO_FOLDER + "/portal_members.jsp").forward(request, response);
    }

    private void showViewRentPaid(HttpServletRequest request, HttpServletResponse response, String REPO_FOLDER, int BATCH, int PER_PAGE) throws ServletException, IOException {
        List<Month> months = monthBeanI.find();
        request.setAttribute("months", months);
        logActivity(Actions.VRP_GRID, "View Rent Paid", null, null);
        request.getRequestDispatcher(REPO_FOLDER + "/view_rent_paid.jsp").forward(request, response);

    }

    private void showViewRentArrears(HttpServletRequest request, HttpServletResponse response, String REPO_FOLDER, int BATCH, int PER_PAGE) throws ServletException, IOException {
        logActivity(Actions.VRA_GRID, "View Rent Arrears", null, null);
        request.getRequestDispatcher(REPO_FOLDER + "/view_rent_arrears.jsp").forward(request, response);

    }

    private void showViewRentPrepaid(HttpServletRequest request, HttpServletResponse response, String REPO_FOLDER, int BATCH, int PER_PAGE) throws ServletException, IOException {
        logActivity(Actions.VRPP_GRID, "View Rent Prepaid", null, null);
        request.getRequestDispatcher(REPO_FOLDER + "/view_rent_prepaid.jsp").forward(request, response);
    }

    private void showViewCommissions(HttpServletRequest request, HttpServletResponse response, String REPO_FOLDER, int BATCH, int PER_PAGE) throws ServletException, IOException {
        Permission permissions = getPermissions(request);
        request.setAttribute("permissions", permissions);
        int page;
        try {
            page = Integer.parseInt(this.get(request, "page"));
        } catch (NumberFormatException nfe) {
            page = 1;
        }
        String search = this.get(request, "search");
        int batch;
        try {
            batch = Integer.parseInt(this.get(request, "batch"));
        } catch (NumberFormatException nfe) {
            batch = 1;
        }
       /* int count = memberBeanI.countAll(search);
        int pages = (count / PER_PAGE);
        int start = (PER_PAGE * (page - 1)) * (batch - 1);
        int begin = ((batch * BATCH) - BATCH) + 1;
        if (begin < 1) {
            begin = 1;
        }
        request.setAttribute("begin", begin);
        request.setAttribute("pages", pages);
        request.setAttribute("batch", batch);
        request.setAttribute("page", page);
        request.setAttribute("per_page", PER_PAGE);
        request.setAttribute("search", search);
        String agentId = null;
        if (this.getSessKey(request, Constants.U_PROFILE).equals(Constants.AGENT_PROFILE)) {
            agentId = this.getSessKey(request, Constants.PROFILE_ID);
        }
//        List<Member> members = memberBeanI.findAll(agentId, search, start, PER_PAGE);
//        request.setAttribute("members", members);
        request.setAttribute("pages", pages);*/
        List<Country> countries = countryBeanI.find();
        request.setAttribute("countries", countries);
        List<Gender> genders = genderBeanI.find();
        request.setAttribute("genders", genders);

        request.getRequestDispatcher(REPO_FOLDER + "/portal_members.jsp").forward(request, response);
    }

    private void showViewDeductions(HttpServletRequest request, HttpServletResponse response, String REPO_FOLDER, int BATCH, int PER_PAGE) throws ServletException, IOException {
        Permission permissions = getPermissions(request);
        request.setAttribute("permissions", permissions);
        int page;
        try {
            page = Integer.parseInt(this.get(request, "page"));
        } catch (NumberFormatException nfe) {
            page = 1;
        }
        String search = this.get(request, "search");
        int batch;
        try {
            batch = Integer.parseInt(this.get(request, "batch"));
        } catch (NumberFormatException nfe) {
            batch = 1;
        }
        //int count = memberBeanI.countAll(search);
        // int pages = (count / PER_PAGE);
        int start = (PER_PAGE * (page - 1)) * (batch - 1);
        int begin = ((batch * BATCH) - BATCH) + 1;
        if (begin < 1) {
            begin = 1;
        }
        request.setAttribute("begin", begin);
        //  request.setAttribute("pages", pages);
        request.setAttribute("batch", batch);
        request.setAttribute("page", page);
        request.setAttribute("per_page", PER_PAGE);
        request.setAttribute("search", search);
        String agentId = null;
        if (this.getSessKey(request, Constants.U_PROFILE).equals(Constants.AGENT_PROFILE)) {
            agentId = this.getSessKey(request, Constants.PROFILE_ID);
        }
//        List<Member> members = memberBeanI.findAll(agentId, search, start, PER_PAGE);
//        request.setAttribute("members", members);
        //request.setAttribute("pages", pages);
        List<Country> countries = countryBeanI.find();
        request.setAttribute("countries", countries);
        List<Gender> genders = genderBeanI.find();
        request.setAttribute("genders", genders);
        request.getRequestDispatcher(REPO_FOLDER + "/portal_members.jsp").forward(request, response);
    }

    private void showViewInvoices(HttpServletRequest request, HttpServletResponse response, String REPO_FOLDER, int BATCH, int PER_PAGE) throws ServletException, IOException {
        Permission permissions = getPermissions(request);
        request.setAttribute("permissions", permissions);
        int page;
        try {
            page = Integer.parseInt(this.get(request, "page"));
        } catch (NumberFormatException nfe) {
            page = 1;
        }
        String search = this.get(request, "search");
        int batch;
        try {
            batch = Integer.parseInt(this.get(request, "batch"));
        } catch (NumberFormatException nfe) {
            batch = 1;
        }
        //   int count = memberBeanI.countAll(search);
        // int pages = (count / PER_PAGE);
        int start = (PER_PAGE * (page - 1)) * (batch - 1);
        int begin = ((batch * BATCH) - BATCH) + 1;
        if (begin < 1) {
            begin = 1;
        }
        request.setAttribute("begin", begin);
        //request.setAttribute("pages", pages);
        request.setAttribute("batch", batch);
        request.setAttribute("page", page);
        request.setAttribute("per_page", PER_PAGE);
        request.setAttribute("search", search);
        String agentId = null;
        if (this.getSessKey(request, Constants.U_PROFILE).equals(Constants.AGENT_PROFILE)) {
            agentId = this.getSessKey(request, Constants.PROFILE_ID);
        }
//        List<Member> members = memberBeanI.findAll(agentId, search, start, PER_PAGE);
//        request.setAttribute("members", members);
        // request.setAttribute("pages", pages);
        List<Country> countries = countryBeanI.find();
        request.setAttribute("countries", countries);
        List<Gender> genders = genderBeanI.find();
        request.setAttribute("genders", genders);
        request.getRequestDispatcher(REPO_FOLDER + "/portal_members.jsp").forward(request, response);
    }

    private void showViewReceipts(HttpServletRequest request, HttpServletResponse response, String REPO_FOLDER, int BATCH, int PER_PAGE) throws ServletException, IOException {
        Permission permissions = getPermissions(request);
        request.setAttribute("permissions", permissions);
        int page;
        try {
            page = Integer.parseInt(this.get(request, "page"));
        } catch (NumberFormatException nfe) {
            page = 1;
        }
        String search = this.get(request, "search");
        int batch;
        try {
            batch = Integer.parseInt(this.get(request, "batch"));
        } catch (NumberFormatException nfe) {
            batch = 1;
        }
        // int count = memberBeanI.countAll(search);
        //int pages = (count / PER_PAGE);
        int start = (PER_PAGE * (page - 1)) * (batch - 1);
        int begin = ((batch * BATCH) - BATCH) + 1;
        if (begin < 1) {
            begin = 1;
        }
        request.setAttribute("begin", begin);
        //   request.setAttribute("pages", pages);
        request.setAttribute("batch", batch);
        request.setAttribute("page", page);
        request.setAttribute("per_page", PER_PAGE);
        request.setAttribute("search", search);
        String agentId = null;
        if (this.getSessKey(request, Constants.U_PROFILE).equals(Constants.AGENT_PROFILE)) {
            agentId = this.getSessKey(request, Constants.PROFILE_ID);
        }
//        List<Member> members = memberBeanI.findAll(agentId, search, start, PER_PAGE);
//        request.setAttribute("members", members);
        ///request.setAttribute("pages", pages);
        List<Country> countries = countryBeanI.find();
        request.setAttribute("countries", countries);
        List<Gender> genders = genderBeanI.find();
        request.setAttribute("genders", genders);
        request.getRequestDispatcher(REPO_FOLDER + "/portal_members.jsp").forward(request, response);
    }

    private void showAddAgent(HttpServletRequest request, HttpServletResponse response, String REPO_FOLDER, int BATCH, int PER_PAGE) throws ServletException, IOException {
        List<Gender> genders = genderBeanI.find();
        request.setAttribute("genders", genders);
        request.getRequestDispatcher(REPO_FOLDER + "/addAgent.jsp").forward(request, response);
    }

    private void showViewAgent(HttpServletRequest request, HttpServletResponse response, String REPO_FOLDER, int BATCH, int PER_PAGE) throws ServletException, IOException {
        List<Gender> genders = genderBeanI.find();
        request.setAttribute("genders", genders);
        List<Agent> agentList = agentBeanI.find();
        request.setAttribute("agents", agentList);
        request.getRequestDispatcher(REPO_FOLDER + "/viewAgents.jsp").forward(request, response);
    }

    private void showAddLandLord(HttpServletRequest request, HttpServletResponse response, String REPO_FOLDER, int BATCH, int PER_PAGE) throws ServletException, IOException {
        List<Gender> genders = genderBeanI.find();
        request.setAttribute("genders", genders);
        request.getRequestDispatcher(REPO_FOLDER + "/addLandLord.jsp").forward(request, response);

    }

    private void viewLandLord(HttpServletRequest request, HttpServletResponse response, String REPO_FOLDER, int BATCH, int PER_PAGE) throws ServletException, IOException {
        List<Gender> genders = genderBeanI.find();
        request.setAttribute("genders", genders);
        List<Landlord> landlords = landlordBeanI.findAll();
        request.setAttribute("landlords", landlords);
        request.getRequestDispatcher(REPO_FOLDER + "/view_landlord.jsp").forward(request, response);

    }

    private void showMedia(HttpServletRequest request, HttpServletResponse response, HttpSession session, String REPO_FOLDER) throws ServletException, IOException {

        List<Media> medias = new ArrayList<>();

        String profile = this.getSessKey(request, Constants.U_PROFILE);
        request.setAttribute("profile", profile);

        jLogger.i("The profile is: " + profile);
        boolean status = true;

        if (!profile.equalsIgnoreCase(Constants.ADMIN_PROFILE)) {

            //schemeId = this.getSessKey(request, Constants.SCHEME_ID);
            // jLogger.i("============ Scheme ID is: " + schemeId + " ===================");
            // medias = mediaBeanI.findByStatusAndProfile(schemeId, status, profile);
        } else {

            // medias = mediaBeanI.findAll(this.getSessKey(request, Constants.SCHEME_ID), this.getSessKey(request, Constants.U_PROFILE), this.getSessKey(request, Constants.PROFILE_ID));
        }
        //request.setAttribute("scheme_id", schemeId);
        request.setAttribute("medias", medias);
       /* List<Scheme> schemes = apiEJB.getProfileSchemes(this.getSessKey(request, Constants.USER),
                this.getSessKey(request, Constants.U_PROFILE));
        request.setAttribute("schemes", schemes);*/
        Permission permissions = getPermissions(request);
        request.setAttribute("permissions", permissions);

        // logActivity("MEDIA & FILES", "Accessed media & files (documents)", this.getSessKey(request, Constants.UID), this.getSessKey(request, Constants.SCHEME_ID), this.getSessKey(request, Constants.U_PROFILE));
        this.audit(session, "Accessed media & files (documents)");
        request.getRequestDispatcher(REPO_FOLDER + "/media.jsp").forward(request, response);
    }

    private int getIntegerFromString(String value) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException nfe) {
            return 1;
        }
    }


    private Date getDateFromString(HttpServletRequest request, String attribute, String param) {
        DateFormat format = new SimpleDateFormat("dd-MM-yyyy", Locale.ENGLISH);
        String date_from_string;
        Date date_from;
        try {
            date_from_string = this.get(request, param);
            date_from = format.parse(date_from_string);
            request.setAttribute(attribute, date_from_string);
        } catch (ParseException pe) {

            date_from = null;
        }
        return date_from;
    }


    @EJB
    PageContentBeanI pageContentBeanI;

    private void showPageContent(HttpServletRequest request, HttpServletResponse response, HttpSession session, String REPO_FOLDER) throws ServletException, IOException {
        List<PageContent> contents = pageContentBeanI.find();
        request.setAttribute("contents", contents);
        // logActivity("PAGE CONTENT", "Accessed page content", this.getSessKey(request, Constants.UID), this.getSessKey(request, Constants.SCHEME_ID), this.getSessKey(request, Constants.U_PROFILE));
        this.audit(session, "Accessed page content");
        request.getRequestDispatcher(REPO_FOLDER + "/page_content.jsp").forward(request, response);
    }

    @EJB
    FaqContentBeanI faqContentBeanI;

    private void showFaqContent(HttpServletRequest request, HttpServletResponse response, HttpSession session, String REPO_FOLDER) throws ServletException, IOException {
        List<FaqContent> contents = faqContentBeanI.find();
        request.setAttribute("contents", contents);
        //logActivity("FAQ CONTENT", "Accessed faq content", this.getSessKey(request, Constants.UID), this.getSessKey(request, Constants.SCHEME_ID), this.getSessKey(request, Constants.U_PROFILE));
        this.audit(session, "Accessed faq content");
        request.getRequestDispatcher(REPO_FOLDER + "/faq_content.jsp").forward(request, response);
    }

    @EJB
    ContactCategoryBeanI contactCategoryBeanI;

    private void showContactReasons(HttpServletRequest request, HttpServletResponse response, HttpSession session, String REPO_FOLDER) throws ServletException, IOException {
        List<ContactCategory> contactReasons = contactCategoryBeanI.find();
        request.setAttribute("contactReasons", contactReasons);
        //logActivity("CONTACT CATEGORIES", "Viewed email contact categories", this.getSessKey(request, Constants.UID), this.getSessKey(request, Constants.SCHEME_ID), this.getSessKey(request, Constants.U_PROFILE));
        this.audit(session, "Viewed email contact categories");
        request.getRequestDispatcher(REPO_FOLDER + "/contact_reasons.jsp").forward(request, response);
    }

    private void showUserAccessReports(HttpServletRequest request, HttpServletResponse response, HttpSession session, String REPO_FOLDER) throws ServletException, IOException {
        //logActivity("USER ACCESS REPORTS", "Accessed user access reports", this.getSessKey(request, Constants.UID), this.getSessKey(request, Constants.SCHEME_ID), this.getSessKey(request, Constants.U_PROFILE));
        this.audit(session, "Accessed user access reports");
        request.getRequestDispatcher(REPO_FOLDER + "/user_access_reports.jsp").forward(request, response);
    }


    @EJB
    HelpBeanI helpBeanI;

    private void showHelp(HttpServletRequest request, HttpServletResponse response, HttpSession session, String REPO_FOLDER) throws ServletException, IOException {
        List<Help> helps = helpBeanI.find();
        request.setAttribute("helps", helps);
        // logActivity("HELP CONTENT", "Accessed help content", this.getSessKey(request, Constants.UID), this.getSessKey(request, Constants.SCHEME_ID), this.getSessKey(request, Constants.U_PROFILE));
        this.audit(session, "Accessed help content");
        request.getRequestDispatcher(REPO_FOLDER + "/help.jsp").forward(request, response);
    }


    private void showSetup(HttpServletRequest request, HttpServletResponse response, HttpSession session, String REPO_FOLDER) throws ServletException, IOException {
        Company company = companyBeanI.find();
        request.setAttribute("company", company);
        Emails email = emailsBeanI.find();
        request.setAttribute("email", email);

        //logActivity("SETUP", "Accessed setup menu and details", this.getSessKey(request, Constants.UID), this.getSessKey(request, Constants.SCHEME_ID), this.getSessKey(request, Constants.U_PROFILE));
        this.audit(session, "Accessed setup menu and details");
        request.getRequestDispatcher(REPO_FOLDER + "/setup.jsp").forward(request, response);
    }


}
