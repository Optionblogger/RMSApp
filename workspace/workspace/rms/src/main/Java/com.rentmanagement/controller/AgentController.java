package com.rentmanagement.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.rentmanagement.beans.*;
import com.rentmanagement.common.Constants;
import com.rentmanagement.common.*;
import com.rentmanagement.dto.ReleaseDTO;
import com.rentmanagement.dto.RentDTO;
import com.rentmanagement.model.*;
import org.json.JSONObject;

import javax.ejb.EJB;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet(name = "AgentController", urlPatterns = {"/agent"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
public class AgentController extends BaseServlet implements Serializable {
    /**
     *
     */
    @EJB
    AdminDashboardI adminDashboardI;

    private static final long serialVersionUID = 1L;
    private static String BATCH_PATH = "batch-uploads";
    Helper helper = new Helper();
    @EJB
    UserBeanI userBeanI;
    @EJB
    protected SequenceGenI sequenceEJB;

    @EJB
    CountryBeanI countryBeanI;

    @EJB
    SettingBeanI settingBeanI;
    @EJB
    GenderBeanI genderBeanI;

    @EJB
    UnitBeanI unitBeanI;

    @EJB
    MonthBeanI monthBeanI;

    @EJB
    RentBeanI rentBeanI;
    @EJB
    CompanyBeanI companyBeanI;
    @EJB
    EmailsBeanI emailsBeanI;
    @EJB
    SocialBeanI socialBeanI;

    @EJB
    ThemeBeanI themeBeanI;
    @EJB
    HelpBeanI helpBeanI;
    @EJB
    AgentDashboardBeanI agentDashboardBeanI;

    @EJB
    private TenantBeanI tenantBeanI;


    PageContentBeanI pageContentBeanI;

    @EJB
    ProfileLoginFieldBeanI profileLoginFieldBeanI;
    @EJB
    ImageBannerBeanI imageBannerBeanI;
    @EJB
    UnitLiabilityBeanI unitLiabilityBeanI;
    private final JLogger jLogger = new JLogger(this.getClass());

    //    private FileBean batchSchedule;
    private List<Rent> batchRent = new ArrayList<>();
    private List<Rent> rentExceptions = new ArrayList<>();
    private List<TenancyAgreement> batchTenancyAgreement = new ArrayList<>();
    private List<TenancyAgreement> batchTenancyAgreementExceptions = new ArrayList<>();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        /* configuring the http headers */
        response.addHeader("X-XSS-Protection", "1; mode=block");
        response.addHeader("X-Frame-Options", "DENY");
        response.addHeader("X-Content-Type-Options", "nosniff");

        /* Check if user is already authenticated */
        HttpSession session = request.getSession(false);
        try {
            if (session != null) {
                if (!(session.getAttribute(Constants.LOGIN).equals(true) && (this.getSessKey(request, Constants.U_PROFILE).equals(Constants.AGENT_PROFILE)
                ))) {
                    response.sendRedirect(getServletContext().getContextPath() + "/sign-in");
                } else {

                    List<ActivityLog> activityLogs = activityLogBeanI.findAllByUserID(this.getSessKey(request, Constants.UID));
                    request.setAttribute("activityLogs", activityLogs);
                    Company company = companyBeanI.find();
                    request.setAttribute("company", company);
                    Emails email = emailsBeanI.find();
                    request.setAttribute("email", email);
                    request.setAttribute("username", this.getSessKey(request, Constants.USER));
                    request.setAttribute("path", "agent");

                    String user = this.getSessKey(request, Constants.USER).trim();
                    jLogger.w("user....................>" + user);

                    jLogger.i("Email/Phone hopefully ============ " + user);


                    Agent agent = agentBeanI.findByUser(user);
                    request.setAttribute("agent", agent);

              /*      DBMenu dbMenu = dbMenuBeanI.find();
                    request.setAttribute("dbMenu", dbMenu);*/

                    AgentMenu agentMenu = agentMenuBeanI.find();
                    request.setAttribute("agentMenu", agentMenu);


                    if (propertyBeanI.findPropByAgentId(Long.valueOf((this.getSessKey(request, Constants.PROFILE_ID)))) != null) {
                        List<Property> properties = propertyBeanI.findPropByAgentId(Long.valueOf((this.getSessKey(request, Constants.PROFILE_ID))));

                        jLogger.w("The properties size is " + properties.size());
                        request.setAttribute("properties", properties);
                        if (properties != null && properties.size() == 1) {
                            jLogger.i("Executing this script: 1");
                            try {

                                if (this.getSessKey(request, Constants.PROPERTY_ID) == null) {
                                    session.setAttribute(Constants.PROPERTY_ID, properties.get(0).getId().toString());
                                    request.setAttribute("property_id", properties.get(0).getId().toString());
                                } else {
                                    request.setAttribute("property_id", this.getSessKey(request, Constants.PROPERTY_ID));
                                }
                            } catch (NullPointerException npe) {
                                jLogger.e("NullPointerException was detected: " + npe.getMessage());
                                session.setAttribute(Constants.PROPERTY_ID, String.valueOf(properties.get(0).getId()));
                            }
                        } else if (this.getSessKey(request, Constants.PROPERTY_ID) != null) {
                            jLogger.i("Executing this script: 2");
                            if (properties != null)
                                for (Property property : properties) {
                                    if (property.getId() == helper.toLong(this.getSessKey(request, Constants.PROPERTY_ID))) {
                                        try {

                                            if (this.getSessKey(request, Constants.PROPERTY_ID) == null) {
                                                session.setAttribute(Constants.PROPERTY_ID, property.getId().toString());
                                                request.setAttribute("property_id", property.getId().toString());
                                            } else {
                                                request.setAttribute("property_id", this.getSessKey(request, Constants.PROPERTY_ID));
                                            }
                                        } catch (NullPointerException npe) {
                                            jLogger.e("NullPointerException was detected: " + npe.getMessage());
                                            session.setAttribute(Constants.PROPERTY_ID, String.valueOf(property.getId()));
                                        }
                                    }
                                }
                        }


                    }

                    request.setAttribute("profile", this.getSessKey(request, Constants.U_PROFILE));
                    AgentDashboardItems agentDashboardItems = agentDashboardBeanI.find();
                    request.setAttribute("agentDashboard", agentDashboardItems);
                    List<ContactCategory> contactReasons = contactCategoryBeanI.find();
                    request.setAttribute("contactReasons", contactReasons);
                    PasswordPolicy policy = passwordPolicyBeanI.find();
                    request.setAttribute("policy", policy);
                    request.getRequestDispatcher("agent_dashboard.jsp").forward(request, response);
                }
            } else
                response.sendRedirect(getServletContext().getContextPath() + "/sign-in");
        } catch (NullPointerException npe) {
            jLogger.e("NullPointerException or JSONException was detected: " + npe.getMessage());
            response.sendRedirect(getServletContext().getContextPath() + "/sign-in");
        }
    }

    @EJB
    PasswordPolicyBeanI passwordPolicyBeanI;
    @EJB
    AgentMenuBeanI agentMenuBeanI;
    @EJB
    ContactCategoryBeanI contactCategoryBeanI;

    @EJB
    PropertyBeanI propertyBeanI;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {

        /* configuring the http headers */
        response.addHeader("X-XSS-Protection", "1; mode=block");
        //Enable and block pages with XSS
        response.addHeader("X-Frame-Options", "DENY");
        // prevents any domain from framing the content
        response.addHeader("X-Content-Type-Options", "nosniff");
        /* Used to stop browser from using MIME-sniffing
             to determine content-type of a resource  */
        String MEDIA_DIR = "media";
        String doc_folder = null;
        String FILE_SEPERATOR = System.getProperty("file.separator");
        String RMS_DOC_ROOT_FOLDER = "RMS_docs";

        HttpSession session = request.getSession(false);

        String action = this.get(request, "ACTION");
        try {
            switch (action) {


                case Actions.PRE_CHANGE_PASSWORD:
                    preChangePassword(request, response, session);
                    break;
                case Actions.LOGOUT:
                    logout(request, response, session);
                    break;

                case Actions.RECORD_RENT:
                    recordRent(request, response, session);
                    break;
                case Actions.VP:
                    viewProperty(request, response, session);
                    break;

                case Actions.UD:
                    viewUnitData(request, response, session);
                    break;
                case Actions.AU:
                    addUnit(request, response, session);
                    break;

                case Actions.INVOICE_GRID:
                    viewInvoices(request, response, session);
                    break;

                case Actions.ASC:
                    addServiceCharge(request, response, session);
                    break;


                case Actions.UR:
                    uploadReceipts(request, response, session);
                    break;


                case Actions.CHANGE_PROPERTY:
                    changeProperty(request, response, session);
                    break;
                case Actions.ADD_TENANANCY_AGREEMENT:
                    addTenancyAgreement(request, response, session);
                    break;

                case Actions.RENT_BATCH:
                    addRentBatch(request, response, session, MEDIA_DIR, doc_folder, FILE_SEPERATOR, RMS_DOC_ROOT_FOLDER);
                    break;
                case Actions.VIEW_RENT_BATCH:
                    showRentBatchList(request, response);
                    break;
                case Actions.VIEW_RENT_BATCH_EXCEPTIONS:
                    showRentBatchExceptions(request, response);
                    break;
                case Actions.SAVE_BATCH_RENT:
                    saveBatchRent(request, response, session);
                case Actions.SAVE_BATCH_TENANT:
                    saveBatchTenant(request, response, session);
                    break;
                case Actions.TENANT_BATCH:
                    addTenancyAgreementBatch(request, response, session, MEDIA_DIR, doc_folder, FILE_SEPERATOR, RMS_DOC_ROOT_FOLDER);
                case Actions.VIEW_TENANTS_BATCH:
                    showTenantBatchList(request, response);
                    break;
                case Actions.VIEW_TENANT_BATCH_EXCEPTIONS:
                    showTenantBatchExceptionList(request, response);
                    break;
                case Actions.VIEW_UNIT_DETAILS:
                    viewUnitDetails(request, response, session);
                    break;
                case Actions.EDIT_UNITINFO:
                    editDetails(request, response, session);
                    break;
                case Actions.DELETE_TENANT:
                    deleteTenancyAgreement(request, response, session);
                    break;
                case Actions.EDIT_TENANT:
                    editTenancyAgreement(request, response, session);
                    break;
                case Actions.EDIT_TENANTINFO:
                    save_editTenancyAgreement(request, response, session);
                    break;
                case Actions.VIEW_RENT_PAID_GRID:
                    view_rent_paid_grid(request, response, session);
                    break;
                case Actions.VIEW_RENT_ARREARS_GRID:
                    view_rent_arrears_grid(request, response, session);
                    break;
                case Actions.VIEW_RENT_PREPAID_GRID:
                    view_rent_prepaid_grid(request, response, session);
                    break;
                case Actions.ADD_UNIT_LIABILITY:
                    add_unit_liability(request, response, session);
                case Actions.REMOVE_UNIT_LIABILITY:
                    remove_unit_liability(request, response, session);
                case Actions.VIEW_UNIT_LIABILITY_DETAILS:
                    view_unit_liability_details(request, response, session);
                case Actions.EDIT_UNITLIABILITY:
                    edit_unit_liability_details(request, response, session);
                case Actions.GET_UNIT_RELEASE_DETAILS:
                    get_unit_release_details(request, response, session);
                case Actions.RELEASE_UNIT:
                    release_unit(request, response, session);
                case Actions.ISSUE_RECEIPTS:
                    issue_receipts(request, response, session);
                case Actions.SEND_LANDLORD_NOTIFICATION:
                    send_landlord_notification(request, response, session);
                case Actions.SEND_TENANTS_NOTIFICATION:
                    send_tenants_notification(request, response, session);


            }

        } catch (Exception e) {
            e.printStackTrace();

        }
    }

    private void add_unit_liability(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        jLogger.w("saving here---" + get(request, "unitNumber"));
        UnitLiability unitLiability = new UnitLiability();
        Unit unit = unitBeanI.searchByUnitNumber(this.get(request, "unitNumber"));
        if (unit == null) {
            this.respond(response, true, "The selected unit does not exist", null);
        } else {
            unitLiability.setUnit(unit);
            unitLiability.setElectricityCost(new BigDecimal(this.get(request, "electricity")));
            unitLiability.setWaterCost(new BigDecimal(this.get(request, "water")));
            unitLiability.setGeneralUnitMismanagement(new BigDecimal(this.get(request, "mismanagement")));
            unitLiability.setDescription((this.get(request, "unitLiabiltyDescription")));
            if (unitLiabilityBeanI.add(unitLiability) != null) {
                audit(session, "Added Unit Liability ");
                this.respond(response, true, "Liability added successfully", null);
            } else {
                this.respond(response, true, "An error Ocurred while saving Liability", null);
            }


        }
    }

    private void remove_unit_liability(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        UnitLiability unitLiability = unitLiabilityBeanI.findById(Long.valueOf(get(request, "unitLiabilityId")));
        if (unitLiability != null) {
            if (unitLiabilityBeanI.delete(unitLiability)) {
                this.respond(response, true, "Successfully Deleted!", null);
            } else {
                this.respond(response, true, "An error Ocurred while deleting Liability!", null);
            }
        } else {
            this.respond(response, true, "Unit Liability not found", null);
        }
    }

    private void view_unit_liability_details(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        Long id = Long.valueOf(this.get(request, "unitLiability"));
        jLogger.w("id is ----->" + id);
        UnitLiability unitLiability = unitLiabilityBeanI.findById(id);
        Long unitId = Long.valueOf(this.getSessKey(request, Constants.PROPERTY_ID));
        List<Unit> units = unitBeanI.searchByPropertyId(unitId);
        request.setAttribute("units", units);
        if (unitLiability != null) {
            jLogger.w("FOUND!!!!!!");
            request.setAttribute("unitLiability", unitLiability);
            request.getRequestDispatcher("agent/view_unit_liability_details.jsp").forward(request, response);

        } else {
            this.respond(response, true, "Unit Liability not found", null);

            //request.setAttribute("unitLiability", null);
            // request.getRequestDispatcher("agent/view_unit_liability_details.jsp").forward(request, response);
        }
    }

    private void edit_unit_liability_details(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        String unitNumber = get(request, "unitNumber");
        jLogger.w("The number of Liability is .....>" + unitNumber);
        Long id = Long.valueOf(get(request, "unitLiabilityId"));
        jLogger.w("The id of Liability is .....>" + id);
        UnitLiability unitLiability = unitLiabilityBeanI.findById(id);
        if (unitLiability != null) {
            Unit unit = unitBeanI.searchByUnitNumber(this.get(request, "unitNumber"));
            if (unit == null) {
                this.respond(response, true, "Unit does not exist!", null);
            } else {
                unitLiability.setUnit(unit);
                unitLiability.setElectricityCost(new BigDecimal(this.get(request, "electricity")));
                unitLiability.setWaterCost(new BigDecimal(this.get(request, "water")));
                unitLiability.setGeneralUnitMismanagement(new BigDecimal(this.get(request, "mismanagement")));
                unitLiability.setDescription((this.get(request, "unitLiabiltyDescription")));
                if (unitLiabilityBeanI.edit(unitLiability) != null) {
                    audit(session, "Updated Unit Liability ");
                    this.respond(response, true, "Liability Updated successfully", null);
                } else {
                    this.respond(response, true, "An error Ocurred while saving Liability", null);
                }

            }
        } else {
            this.respond(response, true, "Unit Liability does not exist!", null);

        }

    }

    private void send_tenants_notification(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        jLogger.w("TENANTS_____________________>");
        Emails emails = emailsBeanI.find();
        String message = request.getParameter("message");
        String subject = request.getParameter("subject");
        String to = request.getParameter("to");
        List<TenancyAgreement> tenancyAgreements = tenantBeanI.findActiveTenants(to);
        if (tenancyAgreements != null) {
            for (TenancyAgreement tenancyAgreement : tenancyAgreements) {
                if (tenancyAgreement.getEmailAddress() != null) {
                    if (emailsBeanI.sendEmail(message, tenancyAgreement.getEmailAddress(),
                            subject, emails.getDefaultEmail(), null)) {
                        this.respond(response, true, "Email Notification is Successfull!", null);

                    } else {
                        this.respond(response, true, "Could not send the notification please try again!", null);
                    }

                }
            }

        } else {
            this.respond(response, true, " Tenants  not available!", null);
        }
    }

    private void get_unit_release_details(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        String unitNumber = (get(request, "unitNumber"));
        jLogger.w("the selected id is " + unitNumber);
        List<Object[]> releaseDTOS = unitLiabilityBeanI.findReleaseDetails(unitNumber);
        if (releaseDTOS == null) {
            response.sendError(400, "selected unit is not occupied!");
            //this.respond(response, true, "selected unit is not occupied!", null);
        } else {
            StringBuffer sb = new StringBuffer(1000);
            sb.append("{\"totalCount\":").append("\"" + releaseDTOS.size()).append("\",\n");
            sb.append("\"rows\":[");
            for (Object[] releaseDTO : releaseDTOS) {
                String tenantNameStr = releaseDTO[0] != null ? releaseDTO[0].toString() : "";
                String deposit = releaseDTO[1] != null ? releaseDTO[1].toString() : "0";
                String liabilities = releaseDTO[2] != null ? releaseDTO[2].toString() : "0";
                String balanceStr = releaseDTO[3] != null ? releaseDTO[3].toString() : "";
                ReleaseDTO releaseDTO1 = new ReleaseDTO();
                releaseDTO1.setBalance(new BigDecimal(balanceStr));
                releaseDTO1.setTenantName(tenantNameStr);
                releaseDTO1.setLiabilities(new BigDecimal(liabilities));
                releaseDTO1.setDeposit(new BigDecimal(deposit));
                sb.append(releaseDTO1.toJson());
            }
            sb.append("]}");
            final String resp = sb.toString();
            JSONObject obj = new JSONObject(resp);
            jLogger.w("json" + obj);
            this.respond(response, true, "", obj);
        }


    }

    private void issue_receipts(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        String unitNumber = (get(request, "unitNumber"));
        Long month = Long.valueOf((get(request, "month")));
        int year = Integer.parseInt((get(request, "year")));
        Long propId = Long.valueOf(this.getSessKey(request, Constants.PROPERTY_ID));
        List<RentDTO> rentDTOS = rentBeanI.issueReceipts(unitNumber, month, year, propId);
        if (rentDTOS == null) {
            //this.respond(response, true, "No  prepaid for selected period! ", null);
            response.sendError(400, "No receipt for selected period!");
        } else {
            request.setAttribute("rents", rentDTOS);
           /* StringBuffer sb = new StringBuffer(1000);
            sb.append("{\"totalCount\":").append("\"" + rentDTOS.size()).append("\",\n");
            sb.append("\"rows\":[");
            for (RentDTO t : rentDTOS) {
                sb.append(t.toJson());
            }
            sb.append("]}");
            final String resp = sb.toString();
            JSONObject obj = new JSONObject(resp);
*/
            request.getRequestDispatcher("agent/view_rent_paid_details.jsp").forward(request, response);
        }
    }


    private void send_landlord_notification(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        jLogger.w("LANLORD_________________________>");
        Emails emails = emailsBeanI.find();
        String message = request.getParameter("message");
        String subject = request.getParameter("subject");
        String to = request.getParameter("to");
        List<Landlord> landlords = landlordBeanI.findByEmails(to);
        if (landlords != null) {
            for (Landlord landlord : landlords) {
                if (landlord.getEmailAddress() != null) {
                    if (emailsBeanI.sendEmail(message, landlord.getEmailAddress(),
                            subject, emails.getDefaultEmail(), null)) {
                        this.respond(response, true, "Email Notification is Successfull!", null);

                    } else {
                        this.respond(response, true, "Could not send the notification please try again!", null);
                    }

                }
            }

        } else {
            this.respond(response, true, "Landlord not available!", null);
        }
    }


    private void release_unit(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        String dateleft_string = request.getParameter("dateLeft");
        DateFormat df = new SimpleDateFormat("yy-mm-dd", Locale.ENGLISH);
        Date leftDate = null;
        try {
            leftDate = df.parse(dateleft_string);
        } catch (Exception e) {
            e.printStackTrace();
        }
        Unit unit = unitBeanI.searchByUnitNumber(get(request, "unitNumber"));
        if (unit != null) {
            TenancyAgreement tenancyAgreement = tenantBeanI.searchByUnitNumber(unit.getUnitNumber());
            if (tenancyAgreement != null) {
                unit.setBooked(YesNo.NO);
                unit.setOccupancyStatus(OccupancyStatus.VACANT);
                tenancyAgreement.setTenantStatus(TenantStatus.LEFT);
                tenancyAgreement.setDateOfExit(leftDate);
                unitBeanI.edit(unit);
                tenantBeanI.edit(tenancyAgreement);
                this.respond(response, true, "Successfully release the room", null);
            } else {
                this.respond(response, true, "No tenant in the selected room!", null);
            }

        } else {
            this.respond(response, true, "Unit  does not exits", null);
        }

    }

    private void recordRent(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        jLogger.w("I am here");

        Rent rent = new Rent();
        Unit unit = unitBeanI.searchByUnitNumber(this.get(request, "unitNumber"));
        Month month = monthBeanI.findById(Long.parseLong(this.get(request, "monthId")));
        BigDecimal monthlyRent = unitBeanI.getMonthlyRent(this.get(request, "unitNumber"));

        TenancyAgreement agreement = tenantBeanI.searchByUnitNumber(this.get(request, "unitNumber"));
        if (unit != null) {
            rent.setUnit(unit);

            jLogger.w("The monthly rent is " + monthlyRent);
            jLogger.w("The rent paid   is " + this.get(request, "rentAmount"));
            jLogger.w("The Unit    is " + unit.getUnitNumber());
        }
        BigDecimal zero = BigDecimal.ZERO;
        BigDecimal amountPaid = zero;
        if (this.get(request, "rentAmount").isEmpty() || this.get(request, "rentAmount").equalsIgnoreCase("")) {
            amountPaid = zero;
        } else {
            amountPaid = new BigDecimal(this.get(request, "rentAmount"));
        }


        String date_string = request.getParameter("datePaid");
        DateFormat format = new SimpleDateFormat("yy-mm-dd", Locale.ENGLISH);
        Date date = null;
        try {
            date = format.parse(date_string);
            rent.setDatePaid(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        if (month != null) {
            rent.setMonth(month);
        }
        rent.setTenancyAgreement(agreement);

        rent.setAmountPaid(amountPaid);

        rent.setYear(Integer.parseInt(this.get(request, "year")));

        if (monthlyRent.compareTo(amountPaid) > 0)
            rent.setPrepaidAmount(monthlyRent.subtract(amountPaid));
        if (monthlyRent.compareTo(amountPaid) < 0)
            rent.setArrears(amountPaid.subtract(monthlyRent));

        Rent ren = rentBeanI.add(rent);
        if (ren != null) {
            Rent rent1 = rentBeanI.findById(ren.getId());
            rent1.setPaid(YesNo.YES);
            rentBeanI.edit(rent1);
            audit(session, "Added Rent ");
            this.respond(response, true, "Rent successfully saved", null);
        } else
            this.respond(response, false, "Rent could not be saved", null);


    }

    private void addTenancyAgreement(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

        TenancyAgreement tenancyAgreement = new TenancyAgreement();
        Unit unit = unitBeanI.searchByUnitNumber(this.get(request, "unitNumber"));
        if (unit != null) {
            tenancyAgreement.setUnit(unit);
        }

        String date_string = request.getParameter("dateJoined");

        DateFormat df = new SimpleDateFormat("Y-m-d", Locale.ENGLISH);
        Date date = null;
        try {
            date = df.parse(date_string);
            tenancyAgreement.setDateJoined(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        jLogger.w("Am here");
        Address address = new Address();

        address.setTown(this.get(request, "tenantTown"));
        address.setPostalAddress(this.get(request, "tenantPostalAddress"));

        tenancyAgreement.setName(this.get(request, "name"));
        tenancyAgreement.setDateJoined(date);
        tenancyAgreement.setEmailAddress(this.get(request, "tenantEmailaddress"));
        tenancyAgreement.setServiceCharge(new BigDecimal(this.get(request, "serviceCharge")));
        tenancyAgreement.setPhoneNumber(this.get(request, "tenantCellNumber"));
        tenancyAgreement.setTenantStatus(TenantStatus.ACTIVE);
        tenancyAgreement.setAddress(address);

        if (tenantBeanI.add(tenancyAgreement) != null) {
            audit(session, "Added TenancyAgreement ");
            this.respond(response, true, "TenancyAgreement successfully saved", null);
        } else
            this.respond(response, false, "TenancyAgreement could not be saved", null);

    }

    private void addTenancyAgreementBatch(HttpServletRequest request, HttpServletResponse response, HttpSession session, String MEDIA_DIR, String doc_folder, String FILE_SEPERATOR, String RMS_DOC_ROOT_FOLDER) throws Exception {
        String fileName = "";
        ServletContext context = request.getSession().getServletContext();
        File f = new File(context.getRealPath("/"));
        if (doc_folder == null) {
            doc_folder = f.getParentFile().getParentFile().getParentFile().getParentFile().getParentFile().getParentFile().getPath() + FILE_SEPERATOR + RMS_DOC_ROOT_FOLDER;
        }
        jLogger.w("The folder is ///////////////////////////////" + doc_folder);
        try {
            Part part = request.getPart("tenantBatch");
            fileName = extractFileName(part);
            jLogger.w("The file name: " + fileName);
            if (!fileName.equals("")) {
                String savePath = doc_folder;
                File fileSaveDir = new File(savePath);
                if (!fileSaveDir.exists()) {
                    fileSaveDir.mkdir();
                    jLogger.i("Directory Created");
                }
                savePath = doc_folder + File.separator + new Date() + fileName;
                jLogger.w("The folder created is ....................." + savePath);
                part.write(savePath);
                jLogger.i("Complete file path is: " + savePath);
                File file = new File(savePath);
                jLogger.w("The file is " + file.getName());
                TemplateType t = TemplateType.DEFAULT;
                DateFormat df = new SimpleDateFormat("yy-mm-dd", Locale.ENGLISH);
                List<Vector<String>> res = (t == TemplateType.DEFAULT ? ExcellExtractor.extract(file, 1) : ExcellExtractor.extract(file, 3));
                int count = 1;

                jLogger.w("The Excel vector is :" + res);
                for (Vector<String> v : res) {
                    TenancyAgreement tenancyAgreement = new TenancyAgreement();
                    count++;
                    String unitNumber = v.get(0);
                    String tenanatName = v.get(1);
                    String doj = v.get(2);
                    String phoneNumber = v.get(3);
                    String emailAddress = v.get(4);
                    String postalAddress = v.get(5);
                    String town = v.get(6);
                    String service_charge = v.get(7);
                    jLogger.w("Unit Number " + unitNumber);

                    if (unitNumber.trim().isEmpty()) {
                        tenancyAgreement.setExceptions("Unit Number Not Found for row number\t" + count);
                    } else {
                        Unit unit = unitBeanI.searchByUnitNumber(unitNumber);
                        if (unit != null) {
                            if ((tenanatName.trim().isEmpty()))
                                tenancyAgreement.setExceptions("Tenant name Not Found for row number\t" + count);
                            if ((doj.trim().isEmpty()))
                                tenancyAgreement.setExceptions(" Date Joined Not Found for row number\t" + count);
                            if ((phoneNumber.trim().isEmpty()))
                                tenancyAgreement.setExceptions("Phone Number Not Found for row number\t" + count);
                            if ((emailAddress.trim().isEmpty()))
                                tenancyAgreement.setExceptions("EmailAddress Not Found for row number\t" + count);
                            if ((postalAddress.trim().isEmpty()))
                                tenancyAgreement.setExceptions("Postal Address Not Found for row number\t" + count);
                            if ((town.trim().isEmpty()))
                                tenancyAgreement.setExceptions("Town Not Found for row number\t" + count);


                            if (service_charge == null || service_charge.isEmpty())
                                tenancyAgreement.setServiceCharge(BigDecimal.ZERO);
                            else
                                tenancyAgreement.setServiceCharge(new BigDecimal(service_charge));


                        } else {
                            tenancyAgreement.setExceptions("Unit Number does not exist for row number\t" + count);
                        }
                        tenancyAgreement.setUnit(unit);
                        tenancyAgreement.setName(tenanatName);
                        tenancyAgreement.setDateJoined(df.parse(doj));
                        tenancyAgreement.setPhoneNumber(phoneNumber);
                        tenancyAgreement.setEmailAddress(emailAddress);
                        Address address = new Address();
                        address.setPostalAddress(postalAddress);
                        address.setTown(town);
                        tenancyAgreement.setAddress(address);
                    }

                    if (tenancyAgreement.getExceptions() == null) {
                        batchTenancyAgreement.add(tenancyAgreement);
                    } else {
                        batchTenancyAgreementExceptions.add(tenancyAgreement);
                    }


                }
                if (batchTenancyAgreementExceptions != null && batchTenancyAgreementExceptions.size() > 0) {

                    jLogger.w("Exception List size is " + batchTenancyAgreementExceptions.size());
                    response.sendError(400, "Uploaded Batch has exceptions!");

                } else {
                    if (batchTenancyAgreementExceptions != null && batchTenancyAgreementExceptions.size() > 0) {
                        response.sendError(400, "Uploaded Batch has exceptions!");
                    }
                    for (TenancyAgreement tenancyAgreement : batchTenancyAgreement) {
                        tenancyAgreement.setTenantStatus(TenantStatus.ACTIVE);
                        tenantBeanI.add(tenancyAgreement);

                    }
                    audit(session, "Tenant Batch save");
                    this.respond(response, true, "Saved", null);

                }


            }
            // }
        } catch (IOException e) {
            e.printStackTrace();
            this.respond(response, false, "Error Occured!", null);
        }


    }

    private void addRentBatch(HttpServletRequest request, HttpServletResponse response, HttpSession session, String MEDIA_DIR, String doc_folder, String FILE_SEPERATOR, String RMS_DOC_ROOT_FOLDER) throws Exception {
        String fileName = "";
        ServletContext context = request.getSession().getServletContext();
        File f = new File(context.getRealPath("/"));
        if (doc_folder == null) {
            doc_folder = f.getParentFile().getParentFile().getParentFile().getParentFile().getParentFile().getParentFile().getPath() + FILE_SEPERATOR + RMS_DOC_ROOT_FOLDER;
        }
        jLogger.w("The folder is ///////////////////////////////" + doc_folder);
        try {
            Part part = request.getPart("rentBatch");
            fileName = extractFileName(part);
            jLogger.w("The file name: " + fileName);
            if (!fileName.equals("")) {
                String savePath = doc_folder;
                File fileSaveDir = new File(savePath);
                if (!fileSaveDir.exists()) {
                    fileSaveDir.mkdir();
                    jLogger.i("Directory Created");
                }
                savePath = doc_folder + File.separator + new Date() + fileName;
                jLogger.w("The folder created is ....................." + savePath);
                part.write(savePath);
                jLogger.i("Complete file path is: " + savePath);
                File file = new File(savePath);
                jLogger.w("The file is " + file.getName());
                TemplateType t = TemplateType.DEFAULT;
                DateFormat df = new SimpleDateFormat("yy-mm-dd", Locale.ENGLISH);
                List<Vector<String>> res = (t == TemplateType.DEFAULT ? ExcellExtractor.extract(file, 1) : ExcellExtractor.extract(file, 3));
                int count = 1;

                jLogger.w("The Excel vector is :" + res);
                for (Vector<String> v : res) {
                    Rent rent = new Rent();
                    count++;
                    String unitNumber = v.get(0);
                    String tenanatName = v.get(1);
                    String amount = v.get(2);
                    String receiptNo = v.get(3);
                    String datePaid = v.get(4);
                    String amountToRgl = v.get(5);
                    String amountToLandlord = v.get(6);
                    String month = v.get(7);
                    String balance = v.get(8);
                    jLogger.w("Unit Number " + unitNumber);
                    BigDecimal monthlyRent = BigDecimal.ZERO;

                    if (unitNumber.trim().isEmpty()) {
                        rent.setExceptions("Unit Number Not Found for row number\t" + count);
                    } else {
                        Unit unit = unitBeanI.searchByUnitNumber(unitNumber);
                        if (unit != null) {
                            monthlyRent = unitBeanI.getMonthlyRent(unit.getUnitNumber());
                            if ((tenanatName.trim().isEmpty()))
                                rent.setExceptions("Tenant name Not Found for row number\t" + count);
                            if ((amount.trim().isEmpty()))
                                rent.setExceptions("Amount Not Found for row number\t" + count);
                            if ((receiptNo.trim().isEmpty()))
                                rent.setExceptions("receiptNo Not Found for row number\t" + count);
                            if ((datePaid.trim().isEmpty()))
                                rent.setExceptions("datePaid Not Found for row number\t" + count);
                            if ((amountToRgl.trim().isEmpty()))
                                rent.setExceptions("amountToRgl Not Found for row number\t" + count);
                            if ((amountToLandlord.trim().isEmpty()))
                                rent.setExceptions("amountToLandlord Not Found for row number\t" + count);
                            if ((month.trim().isEmpty()))
                                rent.setExceptions("month Not Found for row number\t" + count);


                        } else {
                            rent.setExceptions("Unit Number does not exist for row number\t" + count);
                        }
                        BigDecimal amountPaid = new BigDecimal(amount);
                        rent.setUnit(unit);
                        rent.setAmountPaid(amountPaid);

                        if (monthlyRent.compareTo(amountPaid) > 0)
                            rent.setPrepaidAmount(monthlyRent.subtract(amountPaid));
                        /*if (monthlyRent.compareTo(amountPaid) < 0)
                            rent.setArrears(amountPaid.subtract(monthlyRent));*/
                        rent.setArrears(balance == null || balance.isEmpty() ? BigDecimal.ZERO : new BigDecimal(balance));
                        Month month1 = monthBeanI.findByName(month);
                        TenancyAgreement tenancyAgreement = tenantBeanI.searchByUnitNumber(unitNumber);
                        if (month1 != null) {
                            rent.setMonth(month1);
                        } else {
                            rent.setExceptions("Month name does not exist for row number  " + count);
                        }
                        rent.setDatePaid(df.parse(datePaid));
                        Calendar cal = Calendar.getInstance();
                        cal.setTime(df.parse(datePaid));
                        int year = cal.get(Calendar.YEAR);
                        rent.setYear(year);
                        rent.setTenancyAgreement(tenancyAgreement);
                        rent.setReceiptNo(receiptNo);
                        rent.setAmountToLandlord(new BigDecimal(amountToLandlord));
                        rent.setAmountToRgl(new BigDecimal(amountToRgl));

                    }

                    if (rent.getExceptions() == null) {
                        batchRent.add(rent);
                    } else {
                        rentExceptions.add(rent);

                    }


                }

                if (rentExceptions != null && rentExceptions.size() > 0) {

                    jLogger.w("Exception List size is " + rentExceptions.size());
                    response.sendError(400, "Uploaded Batch has exceptions!");
                } else {
                    if (rentExceptions != null && rentExceptions.size() > 0) {
                        response.sendError(400, "Uploaded Batch has exceptions!");
                    }
                    for (Rent rent : batchRent) {
                        if (rent.getUnit().getMonthlyRent().compareTo(rent.getAmountPaid()) > 0)
                            rent.setExcessAmount(rent.getUnit().getMonthlyRent().subtract(rent.getAmountPaid()));

                        if (rent.getUnit().getMonthlyRent().compareTo(rent.getAmountPaid()) < 0)
                            rent.setExcessAmount(rent.getUnit().getMonthlyRent().subtract(rent.getAmountPaid()));
                        Gson gsonBuilder = new GsonBuilder().create();
                        Rent ren = rentBeanI.add(rent);
                        if (ren != null) {
                            Rent rent1 = rentBeanI.findById(ren.getId());
                            rent1.setPaid(YesNo.YES);
                            rentBeanI.edit(rent1);
                        }

                    }
                    audit(session, "Rent Batch save");
                    this.respond(response, true, "Saved", null);

                }


            }
            // }
        } catch (IOException e) {
            e.printStackTrace();
            this.respond(response, false, "Error Occured!", null);
        }


    }

    private void showRentBatchList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String REPO_FOLDER = "agent";
        List<Rent> rents = getBatchRent();
        jLogger.w("List size" + rents.size());
        request.setAttribute("rents", rents);
        request.getRequestDispatcher(REPO_FOLDER + "/view_rent_batch_list.jsp").forward(request, response);
    }

    private void showTenantBatchList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String REPO_FOLDER = "agent";
        List<TenancyAgreement> tenancyAgreements = getBatchTenancyAgreement();
        jLogger.w("List size" + tenancyAgreements.size());
        request.setAttribute("tenancyAgreements", tenancyAgreements);
        request.getRequestDispatcher(REPO_FOLDER + "/view_tenants_batch_list.jsp").forward(request, response);
    }

    private void showTenantBatchExceptionList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String REPO_FOLDER = "agent";
        List<TenancyAgreement> tenancyAgreements = getBatchTenancyAgreementExceptions();
        jLogger.w("List size-------------(HAPA)" + tenancyAgreements.size());
        request.setAttribute("tenancyAgreements", tenancyAgreements);
        request.getRequestDispatcher(REPO_FOLDER + "/view_tenants_batch_exception.jsp").forward(request, response);
    }

    private void showRentBatchExceptions(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String REPO_FOLDER = "agent";
        List<Rent> rents = getRentExceptions();
        jLogger.w("List size" + rents.size());
        request.setAttribute("rents", rents);
        request.getRequestDispatcher(REPO_FOLDER + "/view_rent_batch_exceptions.jsp").forward(request, response);
    }

    private void saveBatchRent(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
        if (rentExceptions != null && rentExceptions.size() > 0) {
            this.respond(response, false, "You are not allowed to save with exceptions!", null);
        }
        for (Rent rent : batchRent) {
            rentBeanI.add(rent);

        }
        audit(session, "Rent Batch save");
        this.respond(response, true, "Saved", null);
    }

    private void saveBatchTenant(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
        if (batchTenancyAgreementExceptions != null && batchTenancyAgreementExceptions.size() > 0) {
            this.respond(response, false, "You are not allowed to save with exceptions!", null);
        }
        for (TenancyAgreement tenancyAgreement : getBatchTenancyAgreement()) {
            tenantBeanI.add(tenancyAgreement);

        }
        audit(session, "Tenant Batch save");
        this.respond(response, true, "Saved", null);
    }

    private void viewUnitDetails(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws
            Exception {
        Long id = Long.valueOf(this.get(request, "unitId"));

        jLogger.w("The unit id is " + id);
        Unit unit = unitBeanI.findById(id);
        UnitType unitType = UnitType.RESIDENTIAL;
        if (!unit.getUnitType().equals(unitType))
            unitType = UnitType.COMMERCIAL;
        request.setAttribute("unit", unit);
        request.setAttribute("unitType", unitType);
        request.getRequestDispatcher("agent/view_unit_details.jsp").forward(request, response);

    }

    private void editDetails(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws
            Exception {
        Unit unit = new Unit();
        String type = get(request, "unitType");
        if (type.equalsIgnoreCase("RESIDENTIAL"))
            unit.setUnitType(UnitType.RESIDENTIAL);
        else
            unit.setUnitType(UnitType.COMMERCIAL);
        unit.setUnitNumber(get(request, "unitNumber"));
        Property property = propertyBeanI.findById(Long.valueOf(get(request, "propertyId")));
        unit.setProperty(property);
        unit.setBlockNo(get(request, "unitFloor"));
        Long deposit = Long.valueOf(get(request, "unitDeposit"));
        Long rent = Long.valueOf(get(request, "unitMonthlyRent"));

        unit.setDeposit(new BigDecimal(deposit));
        unit.setMonthlyRent(new BigDecimal(rent));
        unit.setDescription(get(request, "unitDescription"));

        if (unitBeanI.add(unit) != null) {
            audit(session, "UNIT ADDED");
            this.respond(response, true, "Unit details were successfully saved", null);
        } else {
            this.respond(response, true, "Could save the Unit! ", null);

        }
    }


    private void viewInvoices(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

        String date_string = request.getParameter("asAt");
        DateFormat format = new SimpleDateFormat("MM-dd-yyyy", Locale.ENGLISH);
        Date date = null;
        try {
            date = format.parse(date_string);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        List<RentDTO> rentDTOS = rentBeanI.findAllByAllInvoicesAsat(Long.valueOf(this.getSessKey(request, Constants.PROPERTY_ID)), date);
        StringBuffer sb = new StringBuffer(1000);
        sb.append("{\"totalCount\":").append("\"" + rentDTOS.size()).append("\",\n");
        sb.append("\"rows\":[");
        for (RentDTO t : rentDTOS) {
            sb.append(t.toJson());
        }
        sb.append("]}");
        final String resp = sb.toString();
        JSONObject obj = new JSONObject(resp);

        this.respond(response, true, "Success", obj);


        //logActivity(Actions.SN, "Send Notification", null, null);
        request.getRequestDispatcher("agent/viewTenant.jsp").forward(request, response);
    }


    private void viewProperty(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

        logActivity(Actions.AT, "View Property", null, null);
        request.getRequestDispatcher("agent/viewTenant.jsp").forward(request, response);
    }

    private void viewUnitData(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        String jsonFromPojo = "";
        List<LandloardDashboardItems> adminDashboardItems = adminDashboardI.findAll();
        for (LandloardDashboardItems items : adminDashboardItems) {
            Gson gsonBuilder = new GsonBuilder().create();
            jsonFromPojo = gsonBuilder.toJson(items);
        }
        JSONObject jsonObj = new JSONObject(jsonFromPojo);

        request.setAttribute("adminDashboard", adminDashboardItems);
        logActivity(Actions.UD, "View Unit Data", null, null);
        //this.respond(response, false, "Success", jsonObj);
    }

    private void addServiceCharge(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

        logActivity(Actions.ASC, "Add Service Charge", null, null);
        request.getRequestDispatcher("agent/addServiceCharge.jsp").forward(request, response);
    }

    private void addUnit(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

        logActivity(Actions.AU, "Add Unit", null, null);
        request.getRequestDispatcher("agent/addUnit.jsp").forward(request, response);
    }


    private void deleteTenancyAgreement(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

        Long id = Long.valueOf(this.get(request, "tenantId"));
        jLogger.w("id is  " + id);
        TenancyAgreement tenancyAgreement = tenantBeanI.findById(id);
        jLogger.w("Id to be deleted--" + tenancyAgreement);
        try {
            if (tenantBeanI.delete(tenancyAgreement)) {
                response.setStatus(200);
                //  this.respond(response, true, "Tenant Deleted successfully", null);
                audit(session, "Deleted Tenant");
            }
        } catch (Exception e) {
            response.sendError(400, "");
            //this.respond(response, false, "An error occured while deleting tenant", null);
            jLogger.e("We have a  exception deleting tenant  " + e.getMessage());

        }

    }

    private void editTenancyAgreement(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

        Long id = Long.valueOf(this.get(request, "tenantId"));
        TenancyAgreement tenancyAgreement = tenantBeanI.findById(id);
        request.setAttribute("tenancyAgreement", tenancyAgreement);
        request.getRequestDispatcher("agent/editTenant.jsp").forward(request, response);
    }

    private void save_editTenancyAgreement(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

        TenancyAgreement tenancyAgreement = tenantBeanI.findById(Long.parseLong(this.get(request, "tenantId")));
        Unit unit = unitBeanI.searchByUnitNumber(this.get(request, "unitNumber"));
        if (unit != null) {
            tenancyAgreement.setUnit(unit);
        }

        String date_string = request.getParameter("dateJoined");
        DateFormat format = new SimpleDateFormat("MM-dd-yyyy", Locale.ENGLISH);
        /*Date date = null;
        try {
            date = format.parse(date_string);
            tenancyAgreement.setDateJoined(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }*/
        Address address = new Address();
        address.setTown(this.get(request, "tenantTown"));
        address.setPostalAddress(this.get(request, "tenantPostalAddress"));
        tenancyAgreement.setName(this.get(request, "name"));
//        tenancyAgreement.setDateJoined(date);
        tenancyAgreement.setEmailAddress(this.get(request, "tenantEmailaddress"));
        tenancyAgreement.setServiceCharge(new BigDecimal(this.get(request, "serviceCharge")));
        tenancyAgreement.setPhoneNumber(this.get(request, "tenantCellNumber"));
        tenancyAgreement.setTenantStatus(TenantStatus.ACTIVE);
        tenancyAgreement.setAddress(address);


        if (tenantBeanI.edit(tenancyAgreement) != null) {
            audit(session, "Edited TenancyAgreement ");
            this.respond(response, true, "TenancyAgreement successfully saved", null);
        } else
            this.respond(response, false, "TenancyAgreement could not be saved", null);

    }

    private void uploadReceipts(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

        logActivity(Actions.UR, "Upload Receipts", null, null);
        request.getRequestDispatcher("agent/.jsp").forward(request, response);
    }

    private void view_rent_paid_grid(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        jLogger.w("AM HERE MAN -----");
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");

        jLogger.w("The date is................" + fromDate);

        List<RentDTO> rents = rentBeanI.findPaidRent(Long.valueOf(this.getSessKey(request, Constants.PROPERTY_ID)), fromDate, toDate);

        jLogger.w("rent size.................................." + rents.size());
        if (rents == null) {
            jLogger.w("rent is null...............................");//this.respond(response, true, "No rent paid for selected period! ", null);
            response.sendError(400, "No rent paid for selected period!");
        } else {
            jLogger.w("else part..................................");
            request.setAttribute("rents", rents);
           /* StringBuffer sb = new StringBuffer(1000);
            sb.append("{\"totalCount\":").append("\"" + rents.size()).append("\",\n");
            sb.append("\"rows\":[");
            for (RentDTO t : rents) {
                sb.append(t.toJson());
            }
            sb.append("]}");
            final String resp = sb.toString();
            JSONObject obj = new JSONObject(resp);

            this.respond(response, true, "", obj);*/
            request.getRequestDispatcher("agent/view_rent_paid_details.jsp").forward(request, response);
        }

    }

    private void view_rent_arrears_grid(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        jLogger.w("AM HERE MAN -----");
        String datefrom_string = request.getParameter("fromDate");
        String dateto_string = request.getParameter("toDate");

        List<RentDTO> rents = rentBeanI.findRentArrears(Long.valueOf(this.getSessKey(request, Constants.PROPERTY_ID)), datefrom_string, dateto_string);
        if (rents == null) {
            //this.respond(response, true, "No arrears for selected period! ", null);
            response.sendError(400, "No arrears for selected period!");
        } else {
            request.setAttribute("rents", rents);
            request.getRequestDispatcher("agent/view_rent_arrears_details.jsp").forward(request, response);
            /*StringBuffer sb = new StringBuffer(1000);
            sb.append("{\"totalCount\":").append("\"" + rents.size()).append("\",\n");
            sb.append("\"rows\":[");
            for (RentDTO t : rents) {
                sb.append(t.toJson());
            }
            sb.append("]}");
            final String resp = sb.toString();
            JSONObject obj = new JSONObject(resp);

            this.respond(response, true, "", obj);*/
        }

    }

    private void view_rent_prepaid_grid(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        jLogger.w("AM HERE MAN -----");
        String datefrom_string = request.getParameter("fromDate");
        String dateto_string = request.getParameter("toDate");

        List<RentDTO> rents = rentBeanI.findRentPrepaid(Long.valueOf(this.getSessKey(request, Constants.PROPERTY_ID)), datefrom_string, dateto_string);
        if (rents == null) {
            //this.respond(response, true, "No  prepaid for selected period! ", null);
            response.sendError(400, "No prepaid for selected period!");
        } else {
            request.setAttribute("rents", rents);
            request.getRequestDispatcher("agent/view_prepaid_rent_details.jsp").forward(request, response);
            /*StringBuffer sb = new StringBuffer(1000);
            sb.append("{\"totalCount\":").append("\"" + rents.size()).append("\",\n");
            sb.append("\"rows\":[");
            for (RentDTO t : rents) {
                sb.append(t.toJson());
            }
            sb.append("]}");
            final String resp = sb.toString();
            JSONObject obj = new JSONObject(resp);

            this.respond(response, true, "", obj);*/
        }

    }


    private void changeProperty(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        audit(session, "Switched between Properties from property #" + this.getSessKey(request, Constants.PROPERTY_ID)
                + " to Property #" + this.get(request, "propertyID"));
        jLogger.i("Switched between Properties from property #" + this.getSessKey(request, Constants.PROPERTY_ID)
                + " to Property #" + this.get(request, "propertyID"));
        session.setAttribute(Constants.PROPERTY_ID, this.get(request, "propertyID"));

        this.respond(response, true, "Property changed successfully", null);
    }

    /**/
    private void preChangePassword(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        User u = userBeanI.find(this.getSessKey(request, Constants.USER), this.getSessKey(request, Constants.U_PROFILE));
        String userProfile = u.getUserProfile();
        String userName = u.getUsername();
        jLogger.w("User found: " + u.getUsername());
        Emails emails = emailsBeanI.find();

        String recipient = u.getUsername();


        try {
            if (helper.isEmailAddress(userName)) {
                String securityCode = UUID.randomUUID().toString();
                u.setSecurityCode(securityCode);
                userBeanI.edit(u);
                List<String> recipients = new ArrayList<>();
                recipients.add(userName);

                jLogger.w("Recepient is :" + recipient);
                boolean status = emailsBeanI.sendEmail("Dear " + u.getUsername() + ", " + "You recently requested to change your password. "
                        + "Here is your security code:" + "" + securityCode
                        + "\nYou will require it to be able to change your password", recipient, "Change password Request", emails.getDefaultEmail(), null);

                if (status) {
                    this.respond(response, true, "The change password instructions have been sent to your email address", null);
                } else {
                    this.respond(response, false, "We are sorry, we were unable to send you the change password instructions", null);
                }

            }
        } catch (NullPointerException e1) {
            this.respond(response, false,
                    "We are sorry, we encountered a problem obtaining your User Name. Please try again", null);
        }


    }

    private void logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        logActivity("", "logged out", null, this.getSessKey(request, Constants.U_PROFILE));
        session.invalidate();
        this.respond(response, true, "Logout was successful", null);
    }

    public List<Rent> getBatchRent() {
        return batchRent;
    }

    public void setBatchRent(List<Rent> batchRent) {
        this.batchRent = batchRent;
    }

    public List<Rent> getRentExceptions() {
        return rentExceptions;
    }

    public void setRentExceptions(List<Rent> rentExceptions) {
        this.rentExceptions = rentExceptions;
    }

    public List<TenancyAgreement> getBatchTenancyAgreement() {
        return batchTenancyAgreement;
    }

    public void setBatchTenancyAgreement(List<TenancyAgreement> batchTenancyAgreement) {
        this.batchTenancyAgreement = batchTenancyAgreement;
    }

    public List<TenancyAgreement> getBatchTenancyAgreementExceptions() {
        return batchTenancyAgreementExceptions;
    }

    public void setBatchTenancyAgreementExceptions(List<TenancyAgreement> batchTenancyAgreementExceptions) {
        this.batchTenancyAgreementExceptions = batchTenancyAgreementExceptions;
    }
}
