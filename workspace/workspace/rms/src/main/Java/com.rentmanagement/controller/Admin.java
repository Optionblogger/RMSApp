package com.rentmanagement.controller;


import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.rentmanagement.beans.*;
import com.rentmanagement.common.*;
import com.rentmanagement.dto.RentDTO;
import com.rentmanagement.model.ActivityLog;
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
import java.io.*;
import java.math.BigDecimal;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;


@WebServlet(name = "Admin", urlPatterns = {"/admin"})
@MultipartConfig
public class Admin extends BaseServlet implements Serializable {

    private static final String ALPHA_CAPS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private static final String ALPHA = "abcdefghijklmnopqrstuvwxyz";
    private static final String NUMERIC = "0123456789";
    private static final String SPECIAL_CHARS = "!@#$%^&*_=+-/";
    private static final String REQUEST_ACTION = "ACTION";

    private static final String ADMIN_SWITCH_PROPERTY = "SWITCH_PROPERTY";
    private static final String PROPERTY_BATCH = "PROPERTY_BATCH";
    private static final String VIEW_PROPERTY_BATCH_EXCEPTIONS = "VIEW_PROPERTY_BATCH_EXCEPTIONS";
    private static final String ADMIN_COMPANY = "COMPANY";
    private static final String ADMIN_EMAILS = "EMAILS";
    private static final String ADMIN_PROFILE_NAMES = "PROFILE_NAMES";
    private static final String ADMIN_CLIENT_NAMES = "CLIENT_NAMES";
    private static final String ADMIN_PWD_RESET = "ADMIN_PWD_RESET";
    private static final String UPDATE_AGENT = "UPDATE_AGENT";
    private static final String REMOVE_PROPERTY = "REMOVE_PROPERTY";
    private static final String EDIT_PROPERTYINFO = "EDIT_PROPERTYINFO";
    private static final String VIEW_PROPERTY = "VIEW_PROPERTY";
    private static final String VIEW_UNIT_DETAILS = "VIEW_UNIT_DETAILS";
    private static final String ADD_PROPERTY_UNIT = "ADD_PROPERTY_UNIT";
    private static final String VIEW_UNITS = "VIEW_UNITS";
    private static final String EDIT_UNITINFO = "EDIT_UNITINFO";
    private static final String VIEW_UNITS_PER_PROPERTY = "VIEW_UNITS_PER_PROPERTY";
    private static final String REMOVE_UNIT = "REMOVE_UNIT";
    private static final String ADD_PROPERTY = "ADD_PROPERTY";
    private static final String ADD_AGENT = "ADD_AGENT";
    private static final String ADD_LANDLORD = "ADD_LANDLORD";
    private static final String SAVE_UNIT = "SAVE_UNIT";
    private static final String REMOVE_AGENT = "REMOVE_AGENT";
    private static final String REMOVE_LANDLORD = "REMOVE_LANDLORD";
    private static final String VIEW_AGENT_DETAILS = "VIEW_AGENT_DETAILS";
    private static final String VIEW_LANDLORD_DETAILS = "VIEW_LANDLORD_DETAILS";
    private static final String EDIT_AGENTINFO = "EDIT_AGENTINFO";
    private static final String EDIT_LANDLORDINFO = "EDIT_LANDLORDINFO";
    private static final String CHANGE_PROPERTY = "CHANGE_PROPERTY";
    private static final String VIEW_RENT_PAID_GRID_ADMIN = "VIEW_RENT_PAID_GRID_ADMIN";
    private static final String VIEW_RENT_ARREARS_GRID_ADMIN = "VIEW_RENT_ARREARS_GRID_ADMIN";
    private static final String VIEW_RENT_PREPAID_GRID_ADMIN = "VIEW_RENT_PREPAID_GRID_ADMIN";


    private static final String ADD_TENANT = "ADD_TENANT";


    private static final String GET_PERMISSION = "GET_PERMISSION";
    private static final String SAVE_PERMISSION = "SAVE_PERMISSION";
    private static final String SET_PASSWORD_POLICY = "SET_PASSWORD_POLICY";
    private static final String PROFILE_LOGIN_FIELD = "PROFILE_LOGIN_FIELD";
    private static final String CLIENT_SETUP_FIELD = "CLIENT_SETUP_FIELD";

    private static final String USER_TOGGLE = "USER_TOGGLE";

    private static final String PRE_CHANGE_PASSWORD = "PRE_CHANGE_PASSWORD";
    private static final String CHANGE_PASSWORD = "CHANGE_PASSWORD";

    private static final String HELP = "HELP";
    private static final String REMOVE_BANNER = "REMOVE_BANNER";
    private static final String REMOVE_LOGO = "REMOVE_LOGO";
    private static final String PAGE_CONTENT = "PAGE_CONTENT";
    private static final String FAQ_CONTENT = "FAQ_CONTENT";
    private static final String THEME = "THEME";
    private static final String SETTINGS = "SETTINGS";
    private static final String RECOVERY = "RECOVERY";
    private static final String LOGOUT = "LOGOUT";
    private static final String SOCIAL = "SOCIAL";
    private static final String REMOVE_CONTACT_REASON = "REMOVE_CONTACT_REASON";
    private static final String REMOVE_MEDIA = "REMOVE_MEDIA";
    private static final String AGENT_PERMISSION = "AGENT_PERMISSION";
    private static final String AGENT_MENU_CONFIG = "AGENT_MENU_CONFIG";
    private static final String AGENT_DASHBOARD_ITEMS = "AGENT_DASHBOARD_ITEMS";
    private static final String ADMIN_DASHBOARD_ITEMS = "ADMIN_DASHBOARD_ITEMS";
    private static final String PLF = "PLF";
    private static final String CS = "CS";
    private static final String ADD_CONTACT_REASON = "ADD_CONTACT_REASON";
    private static final String LOGO = "LOGO";
    private static final String BANNER = "BANNER";
    private static final String MEDIA = "MEDIA";
    private static final String EMAIL = "EMAIL";

    private final JLogger jLogger = new JLogger(this.getClass());
    @EJB
    MediaBeanI mediaBeanI;
    @EJB
    CompanyBeanI companyBeanI;
    @EJB
    EmailsBeanI emailsBeanI;
    @EJB
    SettingBeanI settingBeanI;
    @EJB
    CountryBeanI countryBeanI;
    @EJB
    ProfileNameBeanI profileNameBeanI;

    @EJB
    ProfileLoginFieldBeanI profileLoginFieldBeanI;

    @EJB
    UserBeanI userBeanI;
    @EJB
    AgentPermissionBeanI agentPermissionBeanI;
    @EJB
    PermissionBeanI permissionBeanI;
    @EJB
    PasswordPolicyBeanI passwordPolicyBeanI;
    @EJB
    RentBeanI rentBeanI;


    @EJB
    UsedPasswordBeanI usedPasswordBeanI;
    @EJB
    HelpBeanI helpBeanI;
    @EJB
    PageContentBeanI pageContentBeanI;
    @EJB
    FaqContentBeanI faqContentBeanI;
    @EJB
    ContactCategoryBeanI contactCategoryBeanI;
    @EJB
    ImageBannerBeanI imageBannerBeanI;
    @EJB
    LogoBeanI logoBeanI;
    @EJB
    ThemeBeanI themeBeanI;
    @EJB
    UnitBeanI unitBeanI;
    @EJB
    AgentBeanI agentBeanI;
    @EJB
    PropertyBeanI propertyBeanI;


    @EJB
    AccountRecoveryBeanI accountRecoveryBeanI;


    @EJB
    AgentMenuBeanI agentMenuBeanI;

    @EJB
    AgentDashboardBeanI agentDashboardBeanI;
    @EJB
    AdminDashboardI adminDashboardI;
    @EJB
    SocialBeanI socialBeanI;

    @EJB
    TenantBeanI tenantBeanI;


    private List<Property> batchProperty = new ArrayList<>();
    private List<Property> propertyExceptions = new ArrayList<>();


    Helper helper = new Helper();
    private static final long serialVersionUID = 1L;
    private File[] fileUpload;

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
                if (!(session.getAttribute(Constants.LOGIN).equals(true) && (helper.isManagerial(this.getSessKey(request, Constants.U_PROFILE))))) {
                    response.sendRedirect(getServletContext().getContextPath() + "/login");
                } else {
                    // Company company = companyBeanI.find();
                    String userName = this.getSessKey(request, Constants.USER);
                    jLogger.i("Username is ===============> " + userName);

                    User usr = userBeanI.findByUsername(userName);
                    List<ActivityLog> activityLogs = activityLogBeanI.findAllByUserID(this.getSessKey(request, Constants.UID));
                    request.setAttribute("activityLogs", activityLogs);
                    //request.setAttribute("company", company);
                    Permission permissions = getPermissions(request);
                    request.setAttribute("permissions", permissions);
                    List<ContactCategory> contactReasons = contactCategoryBeanI.find();
                    request.setAttribute("contactReasons", contactReasons);
                    Emails email = emailsBeanI.find();
                    request.setAttribute("email", email);
                    Company company = companyBeanI.find();
                    request.setAttribute("company", company);
                    LandloardDashboardItems adminDashboardItems = adminDashboardI.find();
                    request.setAttribute("adminDashboard", adminDashboardItems);

                    PasswordPolicy policy = passwordPolicyBeanI.find();
                    request.setAttribute("policy", policy);


                    List<Property> properties = propertyBeanI.findAll();
                    request.setAttribute("properties", properties);

                    if (properties != null && properties.size() > 0) {
                        jLogger.i("We have the properties");

                        if (this.getSessKey(request, Constants.PROPERTY_ID) == null || this.getSessKey(request, Constants.PROPERTY_ID).isEmpty()) {
                            jLogger.i("Session PROPERTY_ID Id is null");
                            session.setAttribute(Constants.PROPERTY_ID, properties.get(0).getId().toString());
                            session.setAttribute(Constants.PROPERTY_NAME, properties.get(0).getName());
                            request.setAttribute("property_id", properties.get(0).getId().toString());  //schemeID
                        } else {
                            jLogger.i("Session properties Id is not null, it is: " + this.getSessKey(request, Constants.PROPERTY_ID));

                            request.setAttribute("property_id", this.getSessKey(request, Constants.PROPERTY_ID));
                        }
                    } else if (this.getSessKey(request, Constants.PROPERTY_ID) != null && !this.getSessKey(request, Constants.PROPERTY_ID).isEmpty()) {
                        jLogger.i("properties ID is null here");
                        if (properties != null)
                            for (Property p : properties) {
                                if (p.getId() == helper.toLong(this.getSessKey(request, Constants.PROPERTY_ID))) {
                                    if (this.getSessKey(request, Constants.PROPERTY_ID) == null) {
                                        session.setAttribute(Constants.PROPERTY_ID, p.getId().toString());
                                        session.setAttribute(Constants.PROPERTY_NAME, p.getName());
                                        request.setAttribute("property_id", p.getId().toString());
                                    } else {

                                        request.setAttribute("property_id", this.getSessKey(request, Constants.PROPERTY_ID));
                                    }
                                }
                            }
                    }


                    Long propId = Long.valueOf(this.getSessKey(request, Constants.PROPERTY_ID));
                    if (propId != null) {
                        jLogger.w("FOUND PROP--------->" + propId);
                        Property property = propertyBeanI.findById(propId);
                        request.setAttribute("nameOfProperty", property.getName());
                        jLogger.w("nameOfProperty>>>>>>>>>>" + property);
                        int agents = agentBeanI.getCount(propId);

                        request.setAttribute("numberOfAgents", agents);
                        jLogger.w("numberOfAgents>>>>>>>>>>" + agents);

                        int tenants = tenantBeanI.countActiveTenants(propId);
                        request.setAttribute("activeTenants", tenants);
                        jLogger.w("activeTenants>>>>>>>>>>" + tenants);

                        int units = unitBeanI.getCount(propId);
                        request.setAttribute("numberOfUnits", units);
                        jLogger.w("numberOfUnits>>>>>>>>>>" + units);

                        int occupiedUnits = unitBeanI.countOccupiedUnits(propId);
                        request.setAttribute("occupiedUnits", occupiedUnits);
                        jLogger.w("occupiedUnits>>>>>>>>>>" + occupiedUnits);

                        int vacantUnits = unitBeanI.countVacantUnits(propId);
                        request.setAttribute("vacantUnits", vacantUnits);


                        jLogger.w("vacantUnits>>>>>>>>>>" + vacantUnits);
                    }

                    if (this.getSessKey(request, Constants.U_PROFILE).equals(Constants.LANDLORD_PROFILE)) {
                        Landlord landlord = landlordBeanI.findByUser(this.getSessKey(request, Constants.USER));
                        request.setAttribute("landlord", landlord);
                    }
                    request.setAttribute("username", this.getSessKey(request, Constants.USER));
                    request.setAttribute("path", "admin");
                    request.setAttribute("profile", this.getSessKey(request, Constants.U_PROFILE));

                    jLogger.i("Profile: " + this.getSessKey(request, Constants.U_PROFILE));
                    request.setAttribute("profileID", this.getSessKey(request, Constants.PROFILE_ID));
                    jLogger.i("Profile_id: " + this.getSessKey(request, Constants.PROFILE_ID));
                    request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);

                }

            } else {
                jLogger.e("We have a problem, the session was null");
                response.sendRedirect(getServletContext().getContextPath() + "/login");
            }
        } catch (NullPointerException jnpe) {
            jnpe.printStackTrace();
            jLogger.e("We have a problem " + jnpe.getMessage());
            response.sendRedirect(getServletContext().getContextPath() + "/login");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        /* configuring the http headers */
        response.addHeader("X-XSS-Protection", "1; mode=block");
        response.addHeader("X-Frame-Options", "DENY");
        response.addHeader("X-Content-Type-Options", "nosniff");

        HttpSession session = request.getSession(false);
        PrintWriter out = response.getWriter();
        String FILE_SEPERATOR = System.getProperty("file.separator");

        String doc_folder = null;

        String RMS_DOC_ROOT_FOLDER = "RMS_docs";

        String MEDIA_DIR = "media";
        String BANNER_DIR = "banner";
        String LOGO_DIR = "logo";
        String action = this.get(request, REQUEST_ACTION);
        switch (action) {
            case ADMIN_SWITCH_PROPERTY:
                switchProperty(request, response, session);
                break;
            case ADMIN_COMPANY:
                updateCompany(request, response, session);
                break;

            case PROPERTY_BATCH:
                try {
                    addPropertyBatch(request, response, session, MEDIA_DIR, doc_folder, FILE_SEPERATOR, RMS_DOC_ROOT_FOLDER);
                    break;
                } catch (Exception e) {
                    e.printStackTrace();
                }

            case VIEW_PROPERTY_BATCH_EXCEPTIONS:
                try {
                    showPropertyBatchExceptions(request, response);
                    break;
                } catch (Exception e) {
                    e.printStackTrace();
                }

            case ADMIN_EMAILS:
                updateEmails(request, response, session);
                break;

            case ADMIN_PROFILE_NAMES:
                updateProfileNames(request, response, session);
                break;

            case ADMIN_PWD_RESET:
                adminPasswordReset(request, response, session);
                break;
            case UPDATE_AGENT:
                updateAgent(request, response, session);
                break;
            case CHANGE_PROPERTY:
                changeProperty(request, response, session);
                break;
            case VIEW_RENT_PAID_GRID_ADMIN:
                try {
                    view_rent_paid_grid(request, response, session);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case VIEW_RENT_ARREARS_GRID_ADMIN:
                try {
                    view_rent_arrears_grid(request, response, session);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case VIEW_RENT_PREPAID_GRID_ADMIN:
                try {
                    view_rent_prepaid_grid(request, response, session);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;


            case REMOVE_PROPERTY:
                removeProperty(request, response, session);
                break;

            case EDIT_PROPERTYINFO:
                editProperty(request, response, session);
                break;
            case EDIT_AGENTINFO:
                editAgent(request, response, session);
                break;
            case EDIT_LANDLORDINFO:
                editLandlord(request, response, session);
                break;

            case ADD_PROPERTY_UNIT:
                addUnit(request, response, session);
                break;

            case VIEW_UNITS:
                viewUnits(request, response, session);
                break;
            case EDIT_UNITINFO:
                editUnits(request, response, session);
                break;
            case VIEW_UNITS_PER_PROPERTY:
                viewUnitsPerProperty(request, response, session);
            case ADD_AGENT:
                addAgent(request, response, session);
                break;
            case ADD_LANDLORD:
                addLandlord(request, response, session);
                break;
            case SAVE_UNIT:
                saveUnit(request, response, session);
                break;
            case REMOVE_AGENT:
                removeAgent(request, response, session);
                break;
            case REMOVE_LANDLORD:
                removeLandlord(request, response, session);
                break;
            case REMOVE_UNIT:
                removeUnit(request, response, session);
                break;
            case ADD_PROPERTY:
                addProperty(request, response, session);
                break;

            case VIEW_PROPERTY:
                try {
                    viewProperty(request, response, session);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case VIEW_UNIT_DETAILS:
                try {
                    viewUnitDetails(request, response, session);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case VIEW_AGENT_DETAILS:
                try {
                    viewAgentDetails(request, response, session);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case VIEW_LANDLORD_DETAILS:
                try {
                    viewLandlordDetails(request, response, session);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case ADD_TENANT:
                addTenant(request, response, session);
                break;

            case GET_PERMISSION:
                showPermissions(request, response);
                break;
            case SAVE_PERMISSION:
                savePermissions(request, response, session);
                break;
            case SET_PASSWORD_POLICY:
                editPasswordPolicy(request, response);
                break;
            case PROFILE_LOGIN_FIELD:
                editProfileLoginFields(request, response, session);
                break;

         /*   case FRONTPAGE_ACCESS:
                getFrontPageAccessByPage(response);
                break;*/


           /* case DELETE_PORTAL_MEMBER:
                deletePortalMember(request, response);
                break;*/

          /*  case PROFILE_ACCESS:
                getProfileAccess(response);
                break;*/
          /*  case MOST_BY_MANAGER:
                getMostAccessedByManagers(response);
                break;*/
       /*     case MOST_BY_MEMBER:
                mostAccessedByMembers(response);
                break;*/
            case USER_TOGGLE:
                toggleUserStatus(request, response, session);
                break;
            case PRE_CHANGE_PASSWORD:
                preChangeUserPassword(request, response);
                break;

            case CHANGE_PASSWORD:
                changePassword(request, response, session);
                break;

            case HELP:
                updateHelpContent(request, response, session);
                break;
            case REMOVE_BANNER:
                deleteImageBanner(request, response);
                break;
            case REMOVE_LOGO:
                deleteLogo(request, response);
                break;
            case PAGE_CONTENT:
                editPageContent(request, response, session);
                break;
            case FAQ_CONTENT:
                editFaqContent(request, response, session);
                break;
            case THEME:
                editTheme(request, response, session);
                break;

            case SETTINGS:
                editPortalSettings(request, response, session);
                break;

            case RECOVERY:
                enableAccountRecovery(request, response, session);
                break;

            case LOGOUT:
                logout(request, response, session);
                break;
            case SOCIAL:
                editSocialMediaSettings(request, response, session);
                break;

            case REMOVE_CONTACT_REASON:
                deleteContactReason(request, response, session);
                break;
            case REMOVE_MEDIA:
                deleteMediaFile(request, response, session);
                break;
            case AGENT_PERMISSION:
                editAgentPermissions(request, response, session);
                break;

            case AGENT_MENU_CONFIG:
                editMemberMenu(request, response, session);
                break;

            case AGENT_DASHBOARD_ITEMS:
                configureAgentDashboard(request, response, session);
                break;
            case ADMIN_DASHBOARD_ITEMS:
                configureAdminDashboard(request, response, session);
                break;
            case PLF:
                updateProfileLoginFields(request, response, session);
                break;

            case ADD_CONTACT_REASON:
                addContactReason(request, response, session);
                break;
            case LOGO:
                addLogo(request, response, session, LOGO_DIR);
                break;
            case BANNER:
                addBanner(request, response, session, BANNER_DIR);
                break;
            case MEDIA:
                addMediaFile(request, response, session, MEDIA_DIR);
                break;

        }
    }


    private void updateProfileLoginFields(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        List<ProfileLoginField> pfs = profileLoginFieldBeanI.find();
        boolean status = true;
        for (ProfileLoginField plf : pfs) {
            plf.setOrdinal(this.get(request, String.valueOf(plf.getId())));
            status = status && profileLoginFieldBeanI.edit(plf) != null;
        }
        if (status) {
            audit(session, "Updated the profile unique login fields for the various user profiles");
            this.respond(response, true, "Profile login ordinals successfully saved", null);
        } else
            this.respond(response, false, "Profile login ordinals could not be saved", null);
    }


/*
    private void sendEmail(HttpServletRequest request, HttpServletResponse response, String MEDIA_DIR) throws IOException, ServletException {
        String url = request.getRequestURL().toString();
        String baseURL = url.substring(0, url.length() - request.getRequestURI().length())
                + request.getContextPath() + "/";
        boolean attachment = false;
        String attachment_url = null;
        String path = getServletContext().getRealPath("/") + MEDIA_DIR;
        for (Part part : request.getParts()) {
            String fileName = extractFileName(part);
            if (!fileName.equals("")) {
                //Get absolute path
                String fullpath = request.getServletContext().getRealPath("");
                //String savePath = fullpath + File.separator + MEDIA_DIR;
                jLogger.i("full path is:" + path);
                File fileSaveDir = new File(path);
                if (!fileSaveDir.exists()) {
                    fileSaveDir.mkdir();
                }
                path = getServletContext().getRealPath("/") + MEDIA_DIR + File.separator + fileName;
                //savePath = fullpath + File.separator + MEDIA_DIR + File.separator + fileName;
                part.write(path);
                jLogger.i("Complete file path is: " + path);
                //attachment_url = baseURL + MEDIA_DIR + File.separator + fileName;
                attachment_url = path;
                attachment = true;
            }
        }
        String recipient = this.get(request, "recipient");
        jLogger.i("Recipient: " + recipient);
        String subject = this.get(request, "subject") + " :" + this.get(request, "category") + "";
        String message = this.get(request, "message");

        Emails emails = emailsBeanI.find();
        //String sendTo = null;
        //List<String> recipients = new L;
        List recipients = new ArrayList();

        if (recipient != null) {
            if (recipient.equalsIgnoreCase("defaultEmail")) {

                recipients.add(emails.getDefaultEmail());
            } else if (recipient.equalsIgnoreCase("marketingEmail")) {
                recipients.add(emails.getMarketingEmail());
                //sendTo = emails.getMarketingEmail();
            } else if (recipient.equalsIgnoreCase("supportEmail")) {
                recipients.add(emails.getSupportEmail());
                //sendTo = emails.getSupportEmail();
            } else if (recipient.equalsIgnoreCase("crmEmail")) {
                recipients.add(emails.getCrmEmail());

            }

        }
        // jLogger.i("Send to: " + recipients);

        */
/*String senderId = this.getSessKey(request, Constants.PROFILE_ID);
        jLogger.i("SENDER ID ========================> " + senderId);*//*


        String userName = this.getSessKey(request, Constants.USER);
        String userName2 = userName;

        if (helper.isValidPhone(userName)) {

            String zero = "0";
            String plus = "+";
            String xiMemPhone = userName;
            if (xiMemPhone.startsWith(plus)) {
                userName = zero + xiMemPhone.substring(4);
            } else if (userName.startsWith(zero)) {
                userName = xiMemPhone;
            } else {

                userName = null;
            }


        }
        // jLogger.i("Username is ===============> " + userName);
        User usr = userBeanI.findByUsername(userName2);
        //jLogger.i("User gotten here is -----------------"+usr);
        String userProfile = usr.getUserProfile();
        XiMember mbr = apiEJB.memberExists(userProfile, userName2);
        String senderEmail = mbr.getEmailAddress();
        if (senderEmail == null) {
            this.respond(response, true, "Sender Email not found, Please Contact support  ", null);
        }
        String u = this.getSessKey(request, Constants.USER).trim();
        XiMember agent = new XiMember();

        if (userProfile.equalsIgnoreCase(Constants.MEMBER_PROFILE)) {
            try {
                if (this.getSessKey(request, Constants.SCHEME_ID) != null) {
                    if (helper.isEmailAddress(u)) {

                        agent = apiEJB.getMemberDetailsByScheme(this.getSessKey(request, Constants.SCHEME_ID), u);

                    } else if (helper.isValidPhone(u)) {

                        agent = apiEJB.getMemberDetailsBySchemeAndPhone(this.getSessKey(request, Constants.SCHEME_ID), u);
                    }
                } else {

                    agent = apiEJB.getMemberDetails(this.getSessKey(request, Constants.PROFILE_ID), null);
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }

            String membershipNo = agent.getMemberNo();
            jLogger.w("MEMBESHIP NUMBER IS " + membershipNo);

            try {

                emailsBeanI.sendEmail("Email from " + senderEmail + " <br/>" + " Membership Number " + membershipNo + " <br/>" + message + " <br/>",
                        (String) recipients.get(0), subject);
                this.respond(response, true, "The email was successfully sent", null);

            } catch (Exception e) {
                this.respond(response, true, "We are sorry, but we were unable to send the email address", null);


            }
        } else if (userProfile.equalsIgnoreCase(Constants.SPONSOR)) {
            String sponsorProdNo = u;
            jLogger.w("SPONSOR PRODUCT NUMBER IS " + sponsorProdNo);

            try {

                emailsBeanI.sendEmail("Email from " + senderEmail + " <br/>" + "Employer ID Number " + sponsorProdNo + " <br/>" + message + " <br/>",
                        (String) recipients.get(0), subject);
                this.respond(response, true, "The email was successfully sent", null);

            } catch (Exception e) {
                this.respond(response, true, "We are sorry, but we were unable to send the email address", null);


            }

        } else {
            this.respond(response, true, "We are sorry, you can not send this email at this time. Try again later", null);

        }


        //XiMember mbr = apiEJB.getMemberDetails(senderId, null);
//        String code = "+233";
//        userName =code+userName.substring(1);
        //jLogger.i("Username is ===============> checking " + userName2);
//        XiMember mbr = apiEJB.memberExists(userProfile, userName2);
//
//        String senderEmail = mbr.getEmailAddress();
//        if (senderEmail==null){
//            this.respond(response, true, "Sending Email Failed, Please Contact support  ", null);
//
//        }
        // jLogger.i("SENDER NAME ======================> " + senderEmail);
//
//        boolean status = apiEJB.sendEmail(recipients, senderEmail, senderEmail, subject, message,
//                this.getSessKey(request, Constants.SCHEME_ID), attachment, attachment_url);
//
//        if (status) {
//            this.respond(response, true, "The email was successfully sent", null);
//        } else {
//            this.respond(response, true, "We are sorry, but we were unable to send the email address", null);
//        }
    }
*/

/*
    private void addBenefitRequestMediaFile(HttpServletRequest request, HttpServletResponse response, HttpSession session, String SCHEME_DOC_ROOT_FOLDER, String FILE_SEPERATOR, String scheme_doc_folder) throws IOException, ServletException {

        jLogger.i("================Saving Document ==================");
        ServletContext context = request.getSession().getServletContext();
        File f = new File(context.getRealPath("/"));
        if (scheme_doc_folder == null) {
            scheme_doc_folder = f.getParentFile().getParentFile().getParentFile().getParentFile().getParentFile().getParentFile().getPath() + FILE_SEPERATOR + SCHEME_DOC_ROOT_FOLDER;
        }

        jLogger.w("The folder is ///////////////////////////////" + scheme_doc_folder);
        for (Part part : request.getParts()) {
            String fileName = extractFileName(part);
            if (!fileName.equals("")) {
                String savePath = scheme_doc_folder;
                File fileSaveDir = new File(savePath);
                if (!fileSaveDir.exists()) {
                    fileSaveDir.mkdir();
                    jLogger.i("Directory Created");
                }

                savePath = scheme_doc_folder + File.separator + fileName;
                jLogger.w("The folder created is ....................." + savePath);
                part.write(savePath);

                jLogger.i("Complete file path is: " + savePath);

                File file = new File(savePath);
                byte[] bFile = new byte[(int) file.length()];

                try {
                    FileInputStream fileInputStream = new FileInputStream(file);

                    //Convert file into array of bytes
                    fileInputStream.read(bFile);
                    fileInputStream.close();

                } catch (Exception ex) {
                    ex.printStackTrace();
                }

                Blob fileBlob;
                try {

                    String mm = String.valueOf(this.get(request, Constants.MEMBER_PROFILE) == null && this.get(request, Constants.MEMBER_PROFILE).equals("on"));
                    jLogger.i("????????????????????????????the value is ?????????????????" + mm);
                    jLogger.i("================ Tuko Hapa ==================" + mm);
                    fileBlob = new javax.sql.rowset.serial.SerialBlob(bFile);
                    Date date = new Date();

                    String schemeId = this.getSessKey(request, Constants.SCHEME_ID);
                    String memberId = this.getSessKey(request, Constants.PROFILE_ID);
                    String memberNo = this.get(request, "MEMBER_NO");

                    Long benefitId = benefitRequestBeanI.findBenefitId();


                    jLogger.w("The agent id  " + memberId);
                    jLogger.w("The scheme id  " + schemeId);

                    Media media = new Media(fileName, schemeId, this.get(request, "description"), this.get(request, "access"), date);

                    media.setFile(fileBlob);
                    media.setPath(savePath);
                    media.setMemberNo(memberNo);
                    media.setBenefitId(benefitId);

                    boolean administrator = true;
                    boolean agent = true;
                    boolean agent = this.get(request, Constants.AGENT_PROFILE) != null && this.get(request, Constants.AGENT_PROFILE).equals("on");
                    boolean sponsor = true;
                    boolean trustee = this.get(request, Constants.TRUSTEE) != null && this.get(request, Constants.TRUSTEE).equals("on");
                    boolean custodian = this.get(request, Constants.CUSTODIAN) != null && this.get(request, "CUSTODIAN").equals("on");
                    boolean crm = this.get(request, Constants.CUSTOMER_RELATIONSHIP_MANAGER) != null && this.get(request, Constants.CUSTOMER_RELATIONSHIP_MANAGER).equals("on");
                    boolean cre = this.get(request, Constants.CUSTOMER_RELATIONSHIP_EXECUTIVE) != null && this.get(request, Constants.CUSTOMER_RELATIONSHIP_EXECUTIVE).equals("on");
                    boolean fm = this.get(request, Constants.FUND_MANAGER) != null && this.get(request, Constants.FUND_MANAGER).equals("on");
                    boolean pensioner = this.get(request, Constants.PENSIONER) != null && this.get(request, Constants.PENSIONER).equals("on");

                    media.setAdministrator(administrator);
                    media.setAgent(agent);
                    media.setCre(cre);
                    media.setCrm(crm);
                    media.setFundManager(fm);
                    media.setCustodian(custodian);
                    media.setPensioner(pensioner);
                    media.setSponsor(sponsor);
                    media.setMember(agent);
                    media.setTrustee(trustee);
                    try {
                        media.setMemberId(Long.parseLong(memberId));
                        jLogger.w("The agent no using api is " + memberId);
                    } catch (NullPointerException | NumberFormatException npe) {
                        media.setMemberId(Long.parseLong("0"));
                    }


                    if (mediaBeanI.add(media) != null) {
                        audit(session, "Uploaded a media file");
                        Media doc = mediaBeanI.findByMember(schemeId, memberId).get(0);
                        JSONObject documents = new JSONObject();
                        try {
                            documents.put("document.memberId", String.valueOf(doc.getMemberId()));
                            documents.put("document.schemeId", doc.getSchemeID());
                            documents.put("document.attachment", doc.getName());
                            documents.put("document.path", doc.getPath());
                            documents.put("document.note", doc.getDescription());
                            documents.put("document.benefitId", String.valueOf(doc.getBenefitId()));
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }

                        if (apiEJB.saveorUpdateBenefitrequestDocument(documents.toString()))
                            this.respond(response, true, "Benefit Request Document successfully uploaded", null);
                    } else
                        this.respond(response, true, "Media file was not uploaded", null);
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
        }
    }
*/

    private void addMediaFile(HttpServletRequest request, HttpServletResponse response, HttpSession session, String MEDIA_DIR) throws IOException, ServletException {
        for (Part part : request.getParts()) {
            String fileName = extractFileName(part);
            if (!fileName.equals("")) {
                // Get absolute path (fullpath)
                String fullpath = request.getServletContext().getRealPath("");
                String savePath = fullpath + File.separator + MEDIA_DIR;

                File fileSaveDir = new File(savePath);
                if (!fileSaveDir.exists()) {
                    fileSaveDir.mkdir();
                }
                savePath = fullpath + File.separator + MEDIA_DIR + File.separator + fileName;
                part.write(savePath);

                jLogger.i("Complete file path is: " + savePath);

                File file = new File(savePath);
                byte[] bFile = new byte[(int) file.length()];

                try {
                    FileInputStream fileInputStream = new FileInputStream(file);

                    //Convert file into array of bytes
                    fileInputStream.read(bFile);
                    fileInputStream.close();

                } catch (Exception ex) {
                    ex.printStackTrace();
                }

                Blob fileBlob;
                try {
                    jLogger.i("================ Tuko Hapa ==================");
                    fileBlob = new javax.sql.rowset.serial.SerialBlob(bFile);
                    Date date = new Date();

                    String schemeId = this.get(request, "scheme");
                    jLogger.i("============ Scheme Id passed: " + schemeId + " ====================");

                    if (schemeId == null || schemeId.isEmpty()) {
                        // schemeId = this.getSessKey(request, Constants.SCHEME_ID);
                    }

                    Media media = new Media(fileName, schemeId, this.get(request, "description"), this.get(request, "access"), date);
                    media.setFile(fileBlob);
                    media.setPath(savePath);
                    boolean administrator = this.get(request, Constants.ADMIN_PROFILE) != null && this.get(request, Constants.ADMIN_PROFILE).equals("on");
                    //boolean member = this.get(request, Constants.MEMBER_PROFILE) != null && this.get(request, Constants.MEMBER_PROFILE).equals("on");
                    boolean agent = this.get(request, Constants.AGENT_PROFILE) != null && this.get(request, Constants.AGENT_PROFILE).equals("on");
                    media.setAdministrator(administrator);
                    media.setAgent(agent);
                    // media.setMember(member);
                    try {
                        media.setMemberId(Long.valueOf(this.get(request, "member_id")));
                    } catch (NullPointerException | NumberFormatException npe) {
                        media.setMemberId(Long.valueOf("0"));
                    }
                    if (mediaBeanI.add(media) != null) {
                        audit(session, "Uploaded a media file");
                        this.respond(response, true, "Media file successfully uploaded", null);
                    } else
                        this.respond(response, true, "Media file was not uploaded", null);
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
        }
    }

    private void addBanner(HttpServletRequest request, HttpServletResponse response, HttpSession session, String BANNER_DIR) throws IOException, ServletException {
        for (Part part : request.getParts()) {
            String fileName = extractFileName(part);
            if (!fileName.equals("")) {
                //Save banner to directory
                String fullpath = request.getServletContext().getRealPath("");
                String savePath = fullpath + File.separator + BANNER_DIR;
                jLogger.i("full path is:" + savePath);
                File fileSaveDir = new File(savePath);
                if (!fileSaveDir.exists()) {
                    fileSaveDir.mkdir();
                }
                savePath = fullpath + File.separator + BANNER_DIR + File.separator + fileName;
                part.write(savePath);
                jLogger.i("Where the banner is saved ================>  " + savePath);

                //Save banner to database as blob
                File file = new File(savePath);
                byte[] bFile = new byte[(int) file.length()];

                try {
                    FileInputStream fileInputStream = new FileInputStream(file);

                    // Convert file into array of bytes
                    fileInputStream.read(bFile);
                    fileInputStream.close();

                } catch (Exception e) {
                    e.printStackTrace();
                }

                //convert to blob
                Blob fileBlob;
                try {
                    fileBlob = new javax.sql.rowset.serial.SerialBlob(bFile);
                    ImageBanner imageBanner = new ImageBanner();
                    imageBanner.setPath(savePath);
                    imageBanner.setName(fileName);
                    imageBanner.setImage(fileBlob);
                    if (imageBannerBeanI.add(imageBanner) != null) {
                        audit(session, "Uploaded a imageBanner for the portal");
                        this.respond(response, true, "ImageBanner image was successfully uploaded", null);
                    } else
                        this.respond(response, false, "ImageBanner image could not be uploaded", null);
                } catch (SQLException sqe) {
                    this.respond(response, false, "ImageBanner image could not be uploaded", null);
                }
            }
        }
    }

    private void addLogo(HttpServletRequest request, HttpServletResponse response, HttpSession session, String LOGO_DIR) throws IOException, ServletException {
        for (Part part : request.getParts()) {
            String fileName = extractFileName(part);
            if (!fileName.equals("")) {
                //Save banner to directory
                String fullpath = request.getServletContext().getRealPath("");
                String savePath = fullpath + File.separator + LOGO_DIR;
                jLogger.i("full path is:" + savePath);
                jLogger.i("Filename is:" + fileName);
                File fileSaveDir = new File(savePath);
                if (!fileSaveDir.exists()) {
                    fileSaveDir.mkdir();
                }
                savePath = fullpath + File.separator + LOGO_DIR + File.separator + fileName;
                part.write(savePath);
                jLogger.i("Where the banner is saved ================>  " + savePath);
                //Save banner to database as blob
                File file = new File(savePath);
                byte[] bFile = new byte[(int) file.length()];

                try {
                    FileInputStream fileInputStream = new FileInputStream(file);

                    // Convert file into array of bytes
                    fileInputStream.read(bFile);
                    fileInputStream.close();

                } catch (Exception e) {
                    e.printStackTrace();
                }

                try {
                    //convert to blob
                    Blob fileBlob;
                    fileBlob = new javax.sql.rowset.serial.SerialBlob(bFile);
                    try {
                        List<Logo> logoz = logoBeanI.findAll();
                        for (Logo logo : logoz) {
                            logoBeanI.delete(logo);
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    Logo logo = new Logo();
                    logo.setPath(savePath);
                    logo.setImage(fileBlob);
                    logo.setName(fileName);
                    if (logoBeanI.add(logo) != null) {
                        audit(session, "Uploaded a logo for the portal");
                        this.respond(response, true, "Logo was successfully uploaded", null);
                    } else
                        this.respond(response, false, "Logo could not be uploaded", null);
                } catch (SQLException sqe) {
                    this.respond(response, false, "Logo could not be uploaded", null);
                }
            }
        }
    }

    private void addContactReason(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        if (this.get(request, "type").equalsIgnoreCase("ADD")) {
            ContactCategory cc = new ContactCategory();
            cc.setName(this.get(request, "name"));
            if (contactCategoryBeanI.add(cc) != null) {
                audit(session, "Added a new contact category " + this.get(request, "name"));
                this.respond(response, true, "Contact category successfully saved", null);
            } else
                this.respond(response, true, "Contact category could not be saved", null);
        } else {
            ContactCategory cc = contactCategoryBeanI.findById(helper.toLong(this.get(request, "id")));
            cc.setName(this.get(request, "name"));
            if (contactCategoryBeanI.edit(cc) != null) {
                audit(session, "Updated a contact category " + this.get(request, "name"));
                this.respond(response, true, "Contact category successfully saved", null);
            } else
                this.respond(response, true, "Contact category could not be saved", null);
        }
    }

    private void editAgentPermissions(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        AgentPermission mp = agentPermissionBeanI.find() == null ? new AgentPermission() : agentPermissionBeanI.find();
        mp.setEmailAddress(this.get(request, "emailAddress").equalsIgnoreCase("true"));
        mp.setName(this.get(request, "name").equalsIgnoreCase("true"));
        mp.setPhoneNumber(this.get(request, "phoneNumber").equalsIgnoreCase("true"));
        mp.setPostalAddress(this.get(request, "postalAddress").equalsIgnoreCase("true"));
        mp.setAgentNo(this.get(request, "agentNo").equalsIgnoreCase("true"));
        mp.setTown(this.get(request, "town").equalsIgnoreCase("true"));
        if (agentPermissionBeanI.edit(mp) != null) {
            audit(session, "Updated Agent edit permissions");
            this.respond(response, true, "Agent edit permissions successfully saved", null);
        } else
            this.respond(response, false, "Agent edit permissions could not be saved", null);
    }


    private void editMemberMenu(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        AgentMenu agentMenu = agentMenuBeanI.find() == null ? new AgentMenu() : agentMenuBeanI.find();

        boolean addTenant = this.get(request, "addTenant").equalsIgnoreCase("true");
        boolean viewTenant = this.get(request, "viewTenant").equalsIgnoreCase("true");
        boolean viewTenantGrid = this.get(request, "viewTenantGrid").equalsIgnoreCase("true");
        boolean sendNotification = this.get(request, "sendNotification").equalsIgnoreCase("true");
        boolean addContract = this.get(request, "addContract").equalsIgnoreCase("true");
        boolean uploadRent = this.get(request, "uploadRent").equalsIgnoreCase("true");
        boolean viewContract = this.get(request, "viewContract").equalsIgnoreCase("true");
        boolean viewContractGrid = this.get(request, "viewContractGrid").equalsIgnoreCase("true");
        boolean addUnit = this.get(request, "addUnit").equalsIgnoreCase("true");
        boolean viewUnit = this.get(request, "viewUnit").equalsIgnoreCase("true");
        boolean viewUnitGrid = this.get(request, "viewUnitGrid").equalsIgnoreCase("true");
        boolean addServiceCharge = this.get(request, "addServiceCharge").equalsIgnoreCase("true");
        boolean viewServiceCharge = this.get(request, "viewServiceCharge").equalsIgnoreCase("true");
        boolean viewServiceChargeGrid = this.get(request, "viewServiceChargeGrid").equalsIgnoreCase("true");
        boolean recordRent = this.get(request, "recordRent").equalsIgnoreCase("true");
        boolean printInvoice = this.get(request, "printInvoice").equalsIgnoreCase("true");
        boolean uploadReceipts = this.get(request, "uploadReceipts").equalsIgnoreCase("true");
        boolean issueReceipts = this.get(request, "issueReceipts").equalsIgnoreCase("true");
        boolean viewRentPaid = this.get(request, "viewRentPaid").equalsIgnoreCase("true");
        boolean viewRentPaidGrid = this.get(request, "viewRentPaidGrid").equalsIgnoreCase("true");
        boolean viewRentArrears = this.get(request, "viewRentArrears").equalsIgnoreCase("true");
        boolean viewRentArrearsGrid = this.get(request, "viewRentArrearsGrid").equalsIgnoreCase("true");
        boolean viewprepaidRent = this.get(request, "viewprepaidRent").equalsIgnoreCase("true");
        boolean viewprepaidRentGrid = this.get(request, "viewprepaidRentGrid").equalsIgnoreCase("true");
        boolean Media = this.get(request, "Media").equalsIgnoreCase("true");
        boolean document = this.get(request, "document").equalsIgnoreCase("true");
        boolean releaseUnit = this.get(request, "releaseUnit").equalsIgnoreCase("true");
        boolean addContractBatch = this.get(request, "addContractBatch").equalsIgnoreCase("true");

        agentMenu.setDocument(document);
        agentMenu.setMedia(Media);
        agentMenu.setAddContract(addContract);
        agentMenu.setUploadRent(uploadRent);
        agentMenu.setAddContractBatch(addContractBatch);
        agentMenu.setAddServiceCharge(addServiceCharge);
        agentMenu.setAddTenant(addTenant);
        agentMenu.setSendNotification(sendNotification);
        agentMenu.setViewContract(viewContract);
        agentMenu.setViewContractGrid(viewContractGrid);
        agentMenu.setViewprepaidRent(viewprepaidRent);
        agentMenu.setViewprepaidRentGrid(viewprepaidRentGrid);
        agentMenu.setViewRentArrears(viewRentArrears);
        agentMenu.setViewRentArrearsGrid(viewRentArrearsGrid);
        agentMenu.setViewRentPaid(viewRentPaid);
        agentMenu.setViewRentPaidGrid(viewRentPaidGrid);
        agentMenu.setUploadReceipts(uploadReceipts);
        agentMenu.setIssueReceipts(issueReceipts);
        agentMenu.setViewUnit(viewUnit);
        agentMenu.setViewUnitGrid(viewUnitGrid);
        agentMenu.setViewServiceCharge(viewServiceCharge);
        agentMenu.setViewServiceChargeGrid(viewServiceChargeGrid);
        agentMenu.setRecordRent(recordRent);
        agentMenu.setPrintInvoice(printInvoice);
        agentMenu.setAddUnit(addUnit);
        agentMenu.setViewTenant(viewTenant);
        agentMenu.setViewTenantGrid(viewTenantGrid);
        agentMenu.setReleaseUnit(releaseUnit);


        if (agentMenuBeanI.edit(agentMenu) != null) {
            audit(session, "Updated Agent Menu configuration settings");
            this.respond(response, true, "Agent Menu configurations successfully saved", null);
        } else
            this.respond(response, true, "Agent Menu configurations could not be saved", null);
    }


    private void configureAgentDashboard(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        AgentDashboardItems agentDashboardItems = agentDashboardBeanI.find() == null ? new AgentDashboardItems() : agentDashboardBeanI.find();
        // boolean name = this.get(request, "name2").equalsIgnoreCase("true");
        boolean agentNumber = this.get(request, "agentNumber2").equalsIgnoreCase("true");
        boolean name = this.get(request, "name2").equalsIgnoreCase("true");
        boolean emailAddress = this.get(request, "emailAddress2").equalsIgnoreCase("true");
        boolean phoneNumber = this.get(request, "phoneNumber2").equalsIgnoreCase("true");
        agentDashboardItems.setName(name);

        agentDashboardItems.setEmailAddress(emailAddress);
        agentDashboardItems.setPhoneNumber(phoneNumber);
        agentDashboardItems.setAgentNumber(agentNumber);

        if (agentDashboardBeanI.edit(agentDashboardItems) != null) {
            audit(session, "Updated Agent Dashboard configuration settings");
            this.respond(response, true, "Agent Dashboard configurations successfully saved", null);
        } else
            this.respond(response, true, "Agent Dashboard configurations could not be saved", null);
    }

    private void configureAdminDashboard(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        LandloardDashboardItems adminDashboardItems = adminDashboardI.find() == null ? new LandloardDashboardItems() : adminDashboardI.find();
        boolean numberOfProperties = this.get(request, "numberOfProperties").equalsIgnoreCase("true");
        boolean numberOfAgents = this.get(request, "numberOfAgents").equalsIgnoreCase("true");
        boolean activeTenants = this.get(request, "activeTenants").equalsIgnoreCase("true");
        boolean vacantUnits = this.get(request, "vacantUnits").equalsIgnoreCase("true");
        boolean numberOfUnits = this.get(request, "numberOfUnits").equalsIgnoreCase("true");
        boolean occupiedUnits = this.get(request, "occupiedUnits").equalsIgnoreCase("true");


        adminDashboardItems.setNumberOfProperties(numberOfProperties);
        adminDashboardItems.setNumberOfAgents(numberOfAgents);
        adminDashboardItems.setActiveTenants(activeTenants);
        adminDashboardItems.setVacantUnits(vacantUnits);
        adminDashboardItems.setNumberOfUnits(numberOfUnits);
        adminDashboardItems.setOccupiedUnits(occupiedUnits);

        if (adminDashboardI.edit(adminDashboardItems) != null) {
            audit(session, "Updated Admin Dashboard configuration settings");
            this.respond(response, true, "Admin Dashboard configurations successfully saved", null);
        } else
            this.respond(response, true, "Admin Dashboard configurations could not be saved", null);
    }

    private void deleteMediaFile(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        Media m = mediaBeanI.findById(helper.toLong(this.get(request, "id")));
        if (mediaBeanI.delete(m)) {
            audit(session, "Deleted a media/file: " + m.getName());
            this.respond(response, true, "Media/File was successfully deleted", null);
        } else
            this.respond(response, true, "Media/File could not be deleted", null);
    }

    private void deleteContactReason(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        ContactCategory cc = contactCategoryBeanI.findById(helper.toLong(this.get(request, "id")));
        if (contactCategoryBeanI.delete(cc)) {
            audit(session, "Deleted a contact category: " + cc.getName());
            this.respond(response, true, "Contact category was successfully deleted", null);
        } else
            this.respond(response, false, "Contact category could not be deleted", null);
    }

    private void editSocialMediaSettings(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        /* Social Media Links Update Request */
        Social social = socialBeanI.find();
        social.setTwitter(this.get(request, "twitter"));
        social.setFacebook(this.get(request, "facebook"));
        social.setLinkedin(this.get(request, "linkedin"));
        social.setGoogle(this.get(request, "google"));
        social.setYoutube(this.get(request, "youtube"));
        social.setPinterest(this.get(request, "pinterest"));
        if (socialBeanI.edit(social) != null) {
            audit(session, "Updated portal social network settings");
            this.respond(response, true, "Social network details successfully saved", null);
        } else
            this.respond(response, false, "Social network details could not be saved", null);
    }


    private void logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        /* Logout Request */
        logActivity("", "logged out", null,
                this.getSessKey(request, Constants.U_PROFILE));
        audit(session, "Logged out of the portal");
        session.invalidate();
        this.respond(response, true, "You have been successfully logged out", null);
    }


    private void enableAccountRecovery(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        boolean accountRecoveryActive = this.get(request, "accountRecoveryActive").equalsIgnoreCase("true");

        AccountRecovery accountRecovery = accountRecoveryBeanI.find();
        accountRecovery.setAccountRecoveryActive(accountRecoveryActive);

        accountRecovery.setAccountRecoveryName(this.get(request, "accountRecoveryName"));

        if (accountRecoveryBeanI.edit(accountRecovery) != null) {
            audit(session, "Updated portal Account recovery configuration settings");
            this.respond(response, true, "Portal Account recovery configurations successfully saved", null);
        } else
            this.respond(response, true, "Portal Account recovery configurations could not be saved", null);
    }


    private void editPortalSettings(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        Setting settings = settingBeanI.find();
        if (this.get(request, "encrypt").equalsIgnoreCase("true")) {
            settings.setXiPath(helper.encrypt(this.get(request, "fundmasterXi")));
            settings.setUsername(helper.encrypt(this.get(request, "username")));
            settings.setPassword(helper.encrypt(this.get(request, "password")));
            settings.setPortalBaseURL(helper.encrypt(this.get(request, "portalBaseURL")));
            settings.setXiReportPath(helper.encrypt(this.get(request, "xiReportPath")));
            settings.setXiReportUsername(helper.encrypt(this.get(request, "xiReportUsername")));
            settings.setXiReportPassword(helper.encrypt(this.get(request, "xiReportPassword")));
        } else {
            settings.setXiPath(this.get(request, "fundmasterXi"));
            settings.setUsername(this.get(request, "username"));
            settings.setPassword(this.get(request, "password"));
            settings.setPortalBaseURL(this.get(request, "portalBaseURL"));
            settings.setXiReportPath(helper.encrypt(this.get(request, "xiReportPath")));
            settings.setXiReportUsername(this.get(request, "xiReportUsername"));
            settings.setXiReportPassword(this.get(request, "xiReportPassword"));
        }
        settings.setMemberOnboarding(this.get(request, "memberOnboarding"));
        settings.setSponsorOnboarding(this.get(request, "sponsorOnboarding"));
        settings.setWhatIfAnalysisFormula(this.get(request, "whatIfAnalysisFormula"));
        settings.setProjectedROR(this.get(request, "projectedROR"));
        settings.setEncrypt(this.get(request, "encrypt").equalsIgnoreCase("true"));
        if (settingBeanI.edit(settings) != null) {
            audit(session, "Updated other portal settings and configurations");
            this.respond(response, true, "Portal Settings & Configurations successfully saved", null);
        } else
            this.respond(response, true, "Portal Settings & Configurations could not be saved", null);
    }


    private void editTheme(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        Theme theme = themeBeanI.findById(helper.toLong(this.get(request, "theme_id")));
        theme.setMajor(this.get(request, "major"));
        theme.setMinor(this.get(request, "minor"));
        theme.setFont(this.get(request, "font"));
        theme.setOther(this.get(request, "other"));
        theme.setHeader(this.get(request, "header"));
        theme.setContent(this.get(request, "content"));
        theme.setFooter(this.get(request, "footer"));
        if (themeBeanI.edit(theme) != null) {
            audit(session, "Updated portal theme settings");
            this.respond(response, true, "Theme settings saved", null);
        } else
            this.respond(response, false, "Theme settings not saved", null);
    }

    private void editPageContent(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        PageContent pc = pageContentBeanI.findById(helper.toLong(this.get(request, "ID")));
        pc.setPage(this.get(request, "page"));
        pc.setText(this.get(request, "description"));
        pc.setPosition(this.get(request, "position"));
        pc.setPublish(this.get(request, "publish").equalsIgnoreCase("true"));
        if (pageContentBeanI.edit(pc) != null) {
            audit(session, "Updated portal page content for page " + this.get(request, "page"));
            this.respond(response, true, "Content was successfully updated", null);
        } else
            this.respond(response, true, "Content could not be updated", null);
    }

    private void editFaqContent(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        FaqContent fc = null;
        String id = this.get(request, "ID");

        if (id == null || id.isEmpty()) {

            fc = new FaqContent();
            fc.setText(this.get(request, "answer"));
            fc.setTitle(this.get(request, "title"));
            fc.setPublish(this.get(request, "publish").equalsIgnoreCase("true"));

        } else {
            fc = faqContentBeanI.findById(helper.toLong(id));
            fc.setText(this.get(request, "answer"));
            fc.setTitle(this.get(request, "title"));
            fc.setPublish(this.get(request, "publish").equalsIgnoreCase("true"));
        }


        if (faqContentBeanI.edit(fc) != null) {
            audit(session, "Updated portal faq content");
            this.respond(response, true, "Content was successfully updated", null);
        } else
            this.respond(response, true, "Content could not be updated", null);
    }

    private void deleteLogo(HttpServletRequest request, HttpServletResponse response) {
        Logo lg = logoBeanI.findById(helper.toLong(this.get(request, "id")));
        if (logoBeanI.delete(lg))
            this.respond(response, true, "Logo successfully deleted", null);
        else
            this.respond(response, false, "Logo could not be deleted", null);
    }

    private void deleteImageBanner(HttpServletRequest request, HttpServletResponse response) {
        ImageBanner b = imageBannerBeanI.findById(helper.toLong(this.get(request, "id")));
        if (imageBannerBeanI.delete(b))
            this.respond(response, true, "ImageBanner image successfully deleted", null);
        else
            this.respond(response, false, "ImageBanner image could not be deleted", null);
    }

    private void updateHelpContent(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        Help h = helpBeanI.findById(helper.toLong(this.get(request, "ID")));
        h.setPage(this.get(request, "page"));
        h.setDescription(this.get(request, "description"));
        helpBeanI.edit(h);
        audit(session, "Updated portal help content for page " + this.get(request, "page"));
        this.respond(response, true, "content edited", null);
    }

    private void preChangeUserPassword(HttpServletRequest request, HttpServletResponse response) {
        Emails emails = emailsBeanI.find();

        User u = userBeanI.find(this.getSessKey(request, Constants.USER), this.getSessKey(request, Constants.U_PROFILE));
        String userProfile = u.getUserProfile();
        String userName = u.getUsername();
        jLogger.i("User found: " + u.getUsername());


        String recipient = u.getUsername();


        try {
            if (helper.isEmailAddress(userName)) {
                String securityCode = UUID.randomUUID().toString();
                u.setSecurityCode(securityCode);
                userBeanI.edit(u);
                List<String> recipients = new ArrayList<>();
                recipients.add(userName);


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


    private void changePassword(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        PasswordPolicy policy = passwordPolicyBeanI.find();
        String securityCode = this.get(request, "securityCode");
        String username = this.getSessKey(request, Constants.USER);
        String password = this.get(request, "currentPassword");
        String new_password = this.get(request, "newPassword");


        User u = userBeanI.findUser(username, password);
        jLogger.i("Am changing the password for user :" + username);

        if (u != null) {
            if (u.getSecurityCode() != null) {
                if (u.getSecurityCode().equalsIgnoreCase(securityCode))
                    setNewPassword(request, response, session, new_password, u);
                else
                    this.respond(response, false, "Sorry, your security code is invalid. Please enter a valid security code.", null);
            } else if (u.getSmsActivationCode() != null) {
                if (u.getSmsActivationCode().equalsIgnoreCase(securityCode))
                    setNewPassword(request, response, session, new_password, u);
                else
                    this.respond(response, false, "Sorry, your sms code is invalid. Please enter a valid  code.", null);
            } else {

                this.respond(response, false, "Sorry, your security code is invalid. Please enter a valid security code.", null);
            }
        } else {
            this.respond(response, false, "The current password you entered is wrong. Please try again.", null);
        }
    }

/*
    private void preChangeUserPassword(HttpServletRequest request, HttpServletResponse response) {

        User u = userBeanI.find(this.getSessKey(request, Constants.USER), this.getSessKey(request, Constants.U_PROFILE));
        String userProfile = u.getUserProfile();
        String userName = u.getUsername();
        jLogger.i("User found: " + u.getUsername());


        //XiMember m = apiEJB.getMemberDetails(u.getProfileID().toString(), null);

        XiMember m = apiEJB.memberExists(userProfile, userName);
        String recipient = m.getPhoneNumber();


        try {
            if (helper.isEmailAddress(userName)) {
                String securityCode = UUID.randomUUID().toString();
                u.setSecurityCode(securityCode);
                userBeanI.edit(u);
                List<String> recipients = new ArrayList<>();
                recipients.add(m.getEmailAddress());
                jLogger.i("Our agent still: " + m.getEmailAddress());


                Emails emails = emailsBeanI.find();
                boolean status = apiEJB.sendEmail(recipients, emails.getDefaultEmail(), null, "Change Password Request",
                        "Dear " + u.getUsername() + ", " + "You recently requested to change your password. "
                                + "Here is your security code:" + "" + securityCode
                                + "\nYou will require it to be able to change your password",
                        this.getSessKey(request, Constants.SCHEME_ID), false, "");
                if (status) {
                    this.respond(response, true, "The change password instructions have been sent to your email address", null);
                } else {
                    this.respond(response, false, "We are sorry, we were unable to send you the change password instructions", null);
                }

            } else if (helper.isValidPhone(recipient) && recipient != null || userName != null) {
                String smsCode = helper.randomNumber().toString();
                u.setSmsActivationCode(smsCode);
                userBeanI.edit(u);
                boolean smsStatus = apiEJB.sendSMS(recipient, "Dear " + u.getUserProfile() + " , " + " You recently requested to change your password."
                        + " Here is your security code: " + "" + smsCode + " You will require it to be able to change your password");
                if (smsStatus) {
                    this.respond(response, true, "The change password instructions have been sent to your phone number", null);
                } else {
                    this.respond(response, false, "We are sorry, we were unable to send you the change password instructions", null);
                }

            }
        } catch (NullPointerException e1) {
            this.respond(response, false,
                    "We are sorry, we encountered a problem obtaining your User Name. Please try again", null);
        }
    }
*/


    private void showMemberInformationView(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {

        AgentPermission memberPermission = agentPermissionBeanI.find();
        request.setAttribute("agentPermission", memberPermission);
        // request.setAttribute("agent", xm);
        //audit(session, "Viewed agent details for agent #" + xm.getName());
        request.getRequestDispatcher("agent/personal_information_view.jsp").forward(request, response);
    }


    @EJB
    GenderBeanI genderBeanI;

/*
    private void showMemberPersonalInformation(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
        XiMember xm;
        xm = apiEJB.getMemberDetails(this.get(request, "memberID"), null);
        List<Country> countries = countryBeanI.find();
        request.setAttribute("countries", countries);
        List<Gender> genders = genderBeanI.find();
        request.setAttribute("genders", genders);
        List<MaritalStatus> marital_statuses = maritalStatusBeanI.find();
        request.setAttribute("maritalStatuses", marital_statuses);
        Company company = companyBeanI.find();
        request.setAttribute("company", company);
        Social social = socialBeanI.find();
        request.setAttribute("social", social);
        List<Sector> sectors = sectorBeanI.find();
        request.setAttribute("sectors", sectors);
        List<Scheme> schemes;
        schemes = apiEJB.getSchemes(0, 10000);
        jLogger.i("Calling Next API");

        List<Beneficiary> beneficiaries = apiEJB.getBeneficiariesList(this.get(request, "memberID"));


        request.setAttribute("beneficiaries", beneficiaries);
        request.setAttribute("schemes", schemes);
        AgentPermission memberPermission = agentPermissionBeanI.find();
        request.setAttribute("memberPermission", memberPermission);
        request.setAttribute("agent", xm);

        audit(session, "Accessed editable view for agent " + xm.getName());
        request.getRequestDispatcher("agent/personal_information.jsp").forward(request, response);
    }
*/


    private void toggleUserStatus(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        User u = userBeanI.findById(helper.toLong(this.get(request, "userID")));
        u.setStatus(!u.isStatus());
        u = userBeanI.edit(u);
        if (u != null) {
            audit(session, "Updated user status for " + u.getUserProfile() + " " + u.getUsername());
            this.respond(response, true, "The user status was successfully changed", null);
        } else
            this.respond(response, false, "We are sorry, the user status could not be changed", null);
    }


    @EJB
    ActivityLogBeanI activityLogBeanI;


    // List<XiMember> searchProfilesBySponsor(String search, String identifier, String profile, String sponsorID, String schemeID);

/*

    private void deletePortalMember(HttpServletRequest request, HttpServletResponse response) {
        Member m = memberBeanI.findById(helper.toLong(this.get(request, "id")));
        if (memberBeanI.delete(m))
            this.respond(response, true, "Potential agent record successfully deleted", null);
        else
            this.respond(response, false, "Potential agent record could not be deleted", null);
    }
*/

/*
    private void getFrontPageAccessByPage(HttpServletResponse response) {
        List<PieObject> poList = activityLogBeanI.findByFrontPageAccess();
        try {
            JSONObject access_list = new JSONObject().put(Fields.SUCCESS, true);
            for (PieObject aPoList : poList) {
                access_list.put(aPoList.getName(), aPoList.getCount());
            }
            this.respond(response, true, "", access_list);
        } catch (JSONException je) {
            this.respond(response, false, "Json exception just occured", null);
        }
    }*/

    private void editProfileLoginFields(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        String[] profiles = helper.listProfiles();
        boolean status = true;
        for (String profile : profiles) {
            ProfileLoginField plf = profileLoginFieldBeanI.find(profile);
            plf.setOrdinal(this.get(request, plf.getProfile()));
            jLogger.i("Ordinal to be set >>>>>>>>>>> " + this.get(request, plf.getProfile()) + " <<<<<<<<<<<<<<<");
            plf.setPublished(this.get(request, plf.getProfile() + "_PUBLISHED").equalsIgnoreCase("true"));
            status = status && profileLoginFieldBeanI.edit(plf) != null;
        }
        if (status) {
            audit(session, "Updated profile login settings");
            this.respond(response, true, "Profile login settings successfully saved", null);
        } else
            this.respond(response, false, "Profile login settings could not be saved", null);
    }


    private void editPasswordPolicy(HttpServletRequest request, HttpServletResponse response) {
        PasswordPolicy p = passwordPolicyBeanI.find();
        p.setExpiry_days(Integer.parseInt(this.get(request, "expiry_days")));
        p.setLength(Integer.parseInt(this.get(request, "length")));
        p.setLock_after_count_of(Integer.parseInt(this.get(request, "lock_after_count_of")));
        p.setLowercase(this.get(request, "lowercase").equalsIgnoreCase("true"));
        p.setNumbers(this.get(request, "numbers").equalsIgnoreCase("true"));
        p.setPassword_reuse(this.get(request, "password_reuse").equalsIgnoreCase("true"));
        p.setUppercase(this.get(request, "uppercase").equalsIgnoreCase("true"));
        if (passwordPolicyBeanI.edit(p) != null)
            this.respond(response, true, "Password policy successfully saved", null);
        else
            this.respond(response, false, "Password policy could not be saved", null);
    }

    private void savePermissions(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        audit(session, "Updated permissions and privileges for " + this.get(request, "profile"));
        Permission perm = permissionBeanI.findByProfile(this.get(request, "profile"));
        perm.setSetup(this.get(request, "setup").equalsIgnoreCase("true"));
        perm.setContent(this.get(request, "content").equalsIgnoreCase("true"));
        perm.setMedia(this.get(request, "media").equalsIgnoreCase("true"));
        perm.setDocument(this.get(request, "document").equalsIgnoreCase("true"));
        perm.setUac(this.get(request, "uac").equalsIgnoreCase("true"));
        perm.setUnit(this.get(request, "unit").equalsIgnoreCase("true"));
        perm.setAdd_unit(this.get(request, "add_unit").equalsIgnoreCase("true"));
        perm.setView_unit(this.get(request, "view_unit").equalsIgnoreCase("true"));
        perm.setView_unit_grid(this.get(request, "view_unit_grid").equalsIgnoreCase("true"));
        perm.setService_charge(this.get(request, "service_charge").equalsIgnoreCase("true"));
        perm.setView_service_charge(this.get(request, "view_service_charge").equalsIgnoreCase("true"));
        perm.setRent(this.get(request, "rent").equalsIgnoreCase("true"));
        perm.setView_rent_paid(this.get(request, "view_rent_paid").equalsIgnoreCase("true"));
        perm.setView_rent_arrears(this.get(request, "view_rent_arrears").equalsIgnoreCase("true"));
        perm.setView_rent_prepaid(this.get(request, "view_rent_prepaid").equalsIgnoreCase("true"));
        perm.setCommissions(this.get(request, "commissions").equalsIgnoreCase("true"));
        perm.setView_commissions(this.get(request, "view_commissions").equalsIgnoreCase("true"));
        perm.setDeductions(this.get(request, "deductions").equalsIgnoreCase("true"));
        perm.setView_deductions(this.get(request, "view_deductions").equalsIgnoreCase("true"));
        perm.setInvoices(this.get(request, "invoices").equalsIgnoreCase("true"));
        perm.setView_invoices(this.get(request, "view_invoices").equalsIgnoreCase("true"));
        perm.setReceipts(this.get(request, "receipts").equalsIgnoreCase("true"));
        perm.setView_receipts(this.get(request, "view_receipts").equalsIgnoreCase("true"));
        perm.setContent_help(this.get(request, "content_help").equalsIgnoreCase("true"));
        perm.setContent_page(this.get(request, "content_page").equalsIgnoreCase("true"));
        perm.setFaq_page(this.get(request, "faq_page").equalsIgnoreCase("true"));
        perm.setMedia_remove(this.get(request, "media_remove").equalsIgnoreCase("true"));
        perm.setMedia_upload(this.get(request, "media_upload").equalsIgnoreCase("true"));
        perm.setMember_edit(this.get(request, "member_edit").equalsIgnoreCase("true"));
        perm.setMember_view(this.get(request, "member_view").equalsIgnoreCase("true"));
        perm.setAdmin_dashboard_items(this.get(request, "admin_dashboard_items").equalsIgnoreCase("true"));
        perm.setProfile_login_username(this.get(request, "profile_login_username").equalsIgnoreCase("true"));
        perm.setClient_setup_config(this.get(request, "client_setup_config").equalsIgnoreCase("true"));
        perm.setProfile_privileges(this.get(request, "profile_privileges").equalsIgnoreCase("true"));
        perm.setProfile_names(this.get(request, "profile_names").equalsIgnoreCase("true"));
        perm.setClient_names(this.get(request, "client_names").equalsIgnoreCase("true"));
        perm.setSetup_banner(this.get(request, "setup_banner").equalsIgnoreCase("true"));
        perm.setSetup_company(this.get(request, "setup_company").equalsIgnoreCase("true"));
        perm.setSetup_email(this.get(request, "setup_email").equalsIgnoreCase("true"));
        perm.setSetup_contact_reason(this.get(request, "setup_contact_reason").equalsIgnoreCase("true"));
        perm.setSetup_interest_rate(this.get(request, "setup_interest_rate").equalsIgnoreCase("true"));
        perm.setEnable_acc_recovery(this.get(request, "enable_acc_recovery").equalsIgnoreCase("true"));
        perm.setSetup_logo(this.get(request, "setup_logo").equalsIgnoreCase("true"));
        perm.setSetup_menu(this.get(request, "setup_menu").equalsIgnoreCase("true"));
        perm.setDb_menu(this.get(request, "db_menu").equalsIgnoreCase("true"));
        perm.setSetup_other(this.get(request, "setup_other").equalsIgnoreCase("true"));
        perm.setSetup_social(this.get(request, "setup_social").equalsIgnoreCase("true"));
        perm.setSetup_theme(this.get(request, "setup_theme").equalsIgnoreCase("true"));
        perm.setUsers(this.get(request, "users").equalsIgnoreCase("true"));
        perm.setUser_enable_disable(this.get(request, "user_enable_disable").equalsIgnoreCase("true"));
        perm.setAudit_trail(this.get(request, "audit_trail").equalsIgnoreCase("true"));

        perm.setPortal_agent_add(this.get(request, "portal_agent_add").equalsIgnoreCase("true"));
        perm.setPortal_agent_delete(this.get(request, "portal_agent_delete").equalsIgnoreCase("true"));
        perm.setPortal_agent_view(this.get(request, "portal_agent_view").equalsIgnoreCase("true"));
        perm.setPortal_agents(this.get(request, "portal_agents").equalsIgnoreCase("true"));
        perm.setPortal_landlord_add(this.get(request, "portal_landlord_add").equalsIgnoreCase("true"));
        perm.setPortal_landlord_delete(this.get(request, "portal_landlord_delete").equalsIgnoreCase("true"));
        perm.setPortal_landlord_view(this.get(request, "portal_landlord_view").equalsIgnoreCase("true"));
        perm.setPortal_landlords(this.get(request, "portal_landlords").equalsIgnoreCase("true"));
        perm.setPassword_policy(this.get(request, "password_policy").equalsIgnoreCase("true"));
        perm.setPortal_landlords(this.get(request, "portal_landlords").equalsIgnoreCase("true"));
        perm.setAdd_property(this.get(request, "add_property").equalsIgnoreCase("true"));
        perm.setAdd_propertyBatch(this.get(request, "add_propertyBatch").equalsIgnoreCase("true"));
        perm.setView_property(this.get(request, "view_property").equalsIgnoreCase("true"));
        perm.setTenants(this.get(request, "tenants").equalsIgnoreCase("true"));

        if (permissionBeanI.edit(perm) != null)
            this.respond(response, true, "Permissions successfully saved", null);
        else
            this.respond(response, false, "Permissions could not be saved", null);
    }

    private void showPermissions(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Permission perm = permissionBeanI.findByProfile(this.get(request, "profile"));
        request.setAttribute("permissions", perm);
        request.getRequestDispatcher("dashboard/permissions.jsp").forward(request, response);
    }





/*

    private void uploadDocument(HttpServletRequest request, HttpServletResponse response, PrintWriter out, String FILE_SEPERATOR, String SCHEME_DOC_ROOT_FOLDER, String scheme_doc_folder) {

        boolean attachment = false;
        String attachment_path = null;
        String attachment_name = null;

        try {

            for (Part part : request.getParts()) {
                String fileName = extractFileName(part);
                if (!fileName.equals("")) {
                    jLogger.i("File name is :::::::::" + fileName);
                    File path = new File(getServletContext().getRealPath("/"));
                    if (scheme_doc_folder == null) {
                        scheme_doc_folder = path.getParentFile().getParentFile().getParentFile().getParentFile().getParentFile().getParentFile().getPath() + FILE_SEPERATOR + SCHEME_DOC_ROOT_FOLDER;
                        helper.createFolderIfNotExists(scheme_doc_folder);
                    }
                    try {
                        // String url = scheme_doc_folder + FILE_SEPERATOR + fileName;
                        String fullpath = scheme_doc_folder + FILE_SEPERATOR + fileName;
                        jLogger.i("full path is:" + fullpath);
                        part.write(fullpath);
                        jLogger.i("Complete file path is: " + fullpath);
                        attachment_name = fileName;
                        attachment_path = fullpath;
                        attachment = true;
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }

            jLogger.i("Attachment has been uploaded >>>>>>>> " + attachment + " <<<<<<<<<<<");

            String attachment_url = attachment_path;
            jLogger.i("Attachment URL is ::::::::::::::::::> " + attachment_url);

            String memberID = this.get(request, "memberID");
            XiMember mbr = apiEJB.getMemberDetails(memberID, null);

            JSONObject agent = new JSONObject();

            try {
                agent.put("agent.attachmentname", attachment_name)
                        .put("agent.id", memberID);
                if (attachment)
                    agent.put("agent.attachment", attachment_url);
                else
                    agent.put("agent.attachment", new ArrayList<String>());

                boolean status_ = apiEJB.uploadMemberDocument(agent.toString());

                this.respond(response, status_, status_ ? "Document was successfully uploaded" : "Document was not uploaded", null);
            } catch (JSONException e) {
                this.respond(response, false, "Sorry, something didn't work out right. Couldn't upload document", null);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }
*/


    private void adminPasswordReset(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        String userID = this.get(request, "userID");
        User u = userBeanI.findById(helper.toLong(userID));
        if (u != null) {
            String password = helper.shorterUUID(UUID.randomUUID().toString(), 0);
            u.setPassword(helper.hash(password));
            String email_address = null;
            List<String> recipients = new ArrayList<>();
            String schemeId = null;
            boolean proceed = false;
            JSONObject res;
            String memberID;
            //XiMember member = apiEJB.memberExists(u.getUserProfile(), u.getUsername());
           /* if (member != null) {
                jLogger.i("memberID " + member.getId() + " u.getProfileID() " + u.getProfileID());
                if (u.getUserProfile().equals(Constants.AGENT_PROFILE)) {
                    member = apiEJB.getMemberDetails(helper.toString(member.getId()), null);
                    session.setAttribute("member_id", member.getId());
                    email_address = member.getEmailAddress();
                    //recipients.add(agent.getEmailAddress());
                    schemeId = member.getSchemeId();
                    proceed = helper.isEmailAddress(email_address);
                } else {
                    member = apiEJB.getMemberDetails(u.getUserProfile(), helper.toString(member.getId()));
                    if (member != null) {
                        session.setAttribute("member_id", member.getId());
                        email_address = member.getEmailAddress();
                        schemeId = member.getSchemeId();
                        proceed = helper.isEmailAddress(email_address);
                    } else
                        proceed = false;
                }*/
            if (proceed) {
                Setting settings = settingBeanI.find();
                Emails emails = emailsBeanI.find();
                recipients.add(email_address);
             /*       apiEJB.sendEmail(recipients, emails.getDefaultEmail(), null, "MSS Portal Password Reset",
                            "Dear " + u.getUserProfile() + ",<br />"
                                    + "Your password has been reset on the FundMaster Xi Member Self Service Portal. Your new password is "
                                    + password + ".<br />Please click this <a href='" + settings.getPortalBaseURL()
                                    + "sign-in'>link</a> to gain access to the Self Service Portal",
                            schemeId, false, null);*/
                if (userBeanI.edit(u) != null)
                    this.respond(response, true,
                            "<strong>Password Reset Successful</strong><br /> Success! The user's password has been reset. An email has been sent to the user with the new password.", null);
                else
                    this.respond(response, false,
                            "We could not complete the requested action as we were unable to obtain the user's email address", null);
            } else {
                this.respond(response, false,
                        "We could not complete the requested action as we were unable to obtain the user's email address", null);
            }
        } else
            this.respond(response, false,
                    "We could not complete the requested action as we were unable to obtain the user's email address", null);
    }


    private void updateProfileNames(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        List<ProfileName> pNames = profileNameBeanI.find();
        boolean status = true;
        for (ProfileName pName : pNames) {
            pName.setName(this.get(request, pName.getProfile()));
            status = status && profileNameBeanI.edit(pName) != null;
        }
        if (status) {
            audit(session, "Updated profile name settings");
            this.respond(response, true, "Profile name settings successfully saved", null);
        } else
            this.respond(response, false, "Profile name settings could not be saved", null);
    }

    private void updateAgent(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        String name = this.get(request, "name");
        String emailAddres = this.get(request, "emailAddres");
        String postalAddress = this.get(request, "postalAddress");
        String agentNo = this.get(request, "agentNo");
        String town = this.get(request, "town");
        String phoneNumber = this.get(request, "phoneNumber");

        Agent agent = agentBeanI.findById(Long.parseLong(this.get(request, "agentId")));
        if (agent != null) {
            Address address = new Address();
            agent.setName(name);
            agent.setAgentNumber(agentNo);
            agent.setEmailAddress(emailAddres);
            agent.setPhoneNumber(phoneNumber);
            address.setTown(town);
            address.setPostalAddress(postalAddress);
            agent.setAddress(address);
            if (agentBeanI.edit(agent) != null) {
                this.respond(response, true, "Agent details were successfully saved", null);
            }
        } else {
            this.respond(response, false, "Sorry, something didn't work out right. Couldn't save the agent details", null);
        }


    }

    private void changeProperty(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        audit(session, "Switched between property from property #" + this.getSessKey(request, Constants.PROPERTY_ID)
                + " to Property #" + this.get(request, "propertyID"));
        session.setAttribute(Constants.PROPERTY_ID, this.get(request, "propertyID"));
        this.respond(response, true, "Property changed successfully", null);
    }

    private void view_rent_paid_grid(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        jLogger.w("AM HERE MAN -----");
        String datefrom_string = request.getParameter("fromDate");
        String dateto_string = request.getParameter("toDate");
        DateFormat df = new SimpleDateFormat("yy-mm-dd", Locale.ENGLISH);
       /* Date fromDate = null;
        Date toDate = null;
        try {
            fromDate = df.parse(datefrom_string);
            toDate = df.parse(dateto_string);
        } catch (ParseException e) {
            e.printStackTrace();
        }*/
        Long id = Long.valueOf(this.get(request, "propertyId"));
        List<RentDTO> rents = rentBeanI.findPaidRent(Long.valueOf(id), datefrom_string, dateto_string);
        if (rents == null) {
            response.sendError(400, "No rent paid for selected period!");
        } else {
            request.setAttribute("rents", rents);
            StringBuffer sb = new StringBuffer(1000);
            sb.append("{\"totalCount\":").append("\"" + rents.size()).append("\",\n");
            sb.append("\"rows\":[");
            for (RentDTO t : rents) {
                sb.append(t.toJson());
            }
            sb.append("]}");
            final String resp = sb.toString();
            JSONObject obj = new JSONObject(resp);

            this.respond(response, true, "", obj);
        }

    }

    private void view_rent_arrears_grid(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        jLogger.w("AM HERE MAN -----");
        String datefrom_string = request.getParameter("fromDate");
        String dateto_string = request.getParameter("toDate");

        List<RentDTO> rents = rentBeanI.findRentArrears(Long.valueOf(this.get(request, "propertyId")), datefrom_string, dateto_string);
        if (rents == null) {
            response.sendError(400, "No rent arrears for selected period!");
        } else {
            request.setAttribute("rents", rents);
            StringBuffer sb = new StringBuffer(1000);
            sb.append("{\"totalCount\":").append("\"" + rents.size()).append("\",\n");
            sb.append("\"rows\":[");
            for (RentDTO t : rents) {
                sb.append(t.toJson());
            }
            sb.append("]}");
            final String resp = sb.toString();
            JSONObject obj = new JSONObject(resp);

            this.respond(response, true, "", obj);
        }
    }


    private void view_rent_prepaid_grid(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        jLogger.w("AM HERE MAN -----");
        String datefrom_string = request.getParameter("fromDate");
        String dateto_string = request.getParameter("toDate");

        List<RentDTO> rents = rentBeanI.findRentPrepaid(Long.valueOf(this.get(request, "propertyId")), datefrom_string, dateto_string);
        if (rents == null) {
            response.sendError(400, "No rent paid prepaid for selected period!");
        } else {
            request.setAttribute("rents", rents);
            StringBuffer sb = new StringBuffer(1000);
            sb.append("{\"totalCount\":").append("\"" + rents.size()).append("\",\n");
            sb.append("\"rows\":[");
            for (RentDTO t : rents) {
                sb.append(t.toJson());
            }
            sb.append("]}");
            final String resp = sb.toString();
            JSONObject obj = new JSONObject(resp);

            this.respond(response, true, "", obj);
        }
    }

    private void removeProperty(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        Long id = Long.valueOf(this.get(request, "propertyId"));
        Property property = propertyBeanI.findById(id);
        if (propertyBeanI.delete(property)) {
            this.respond(response, true, "Property Deleted successfully", null);
            audit(session, "Deleted Property");
        } else {
            this.respond(response, true, "Could not delete Property! Please try again", null);

        }
    }

    private void editProperty(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        Long id = Long.valueOf(this.get(request, "propertyId"));
        jLogger.w("propertyIdpropertyId" + id);
        Property property = propertyBeanI.findById(id);
        property.setName(this.get(request, "name"));
        property.setLocation(this.get(request, "location"));
        Address address = new Address();
        address.setRoad(this.get(request, "road"));
        address.setTown(this.get(request, "town"));

        property.setAddress(address);
        property.setLandNumber(this.get(request, "landNumber"));
        property.setNumberOfUnits(Integer.parseInt(this.get(request, "numberOfUnits")));
        property.setTotalArea(this.get(request, "totalArea"));
        Agent agent = agentBeanI.findById(Long.parseLong(this.get(request, "agent")));
        property.setAgent(agent);
        if (propertyBeanI.edit(property) != null) {
            audit(session, "Edit Property");
            this.respond(response, true, "Property Updated successfully", null);

        } else {
            this.respond(response, true, "Could not Update Property! Please try again", null);

        }
    }

    private void editAgent(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        Long id = Long.valueOf(this.get(request, "agentId"));
        jLogger.w("Agent is >>>>>>>>>" + id);
        Agent agent = agentBeanI.findById(id);
        Address address = new Address();
        agent.setName(get(request, "agentName"));
        agent.setPhoneNumber(get(request, "phoneNumber"));
        agent.setEmailAddress(get(request, "emailAddress"));
        address.setPostalAddress(get(request, "postalAddress"));
        address.setTown(get(request, "town"));
        address.setZipcode(get(request, "zipcode"));
        address.setBuilding(get(request, "bulding"));
        address.setRoad(get(request, "road"));
        agent.setAddress(address);
        if (agentBeanI.edit(agent) != null) {
            audit(session, "Edit AGENT");
            this.respond(response, true, "Agent Updated successfully", null);

        } else {
            this.respond(response, true, "Could not Update Agent! Please try again", null);

        }
    }

    private void editLandlord(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        Long id = Long.valueOf(this.get(request, "landlordId"));
        jLogger.w("Landlord is >>>>>>>>>" + id);
        Landlord landlord = landlordBeanI.findById(id);
        if (landlord != null) {
            Gender gender = genderBeanI.findById(helper.toLong(get(request, "gender")));
            Emails emails = emailsBeanI.find();
            landlord.setFirstname(get(request, "firstName"));
            landlord.setSurname(get(request, "surName"));
            landlord.setOthernames(get(request, "otherName"));
            landlord.setIdNumber(get(request, "idNumber"));
            landlord.setPhoneNumber(get(request, "phoneNumber"));
            landlord.setEmailAddress(get(request, "emailAddress"));
            landlord.setGender(gender);
            Address address = new Address();
            address.setPostalAddress(get(request, "postalAddress"));
            address.setTown(get(request, "town"));
            address.setZipcode(get(request, "zipcode"));
            address.setBuilding(get(request, "bulding"));
            address.setRoad(get(request, "road"));
            landlord.setAddress(address);
            if (landlordBeanI.edit(landlord) != null) {
                audit(session, "Edit landlord");
                this.respond(response, true, "Landlord Updated successfully", null);

            } else {
                this.respond(response, true, "Could not Update Landlord! Please try again", null);

            }
        } else {
            this.respond(response, true, "lanlord does not exist! Please try again", null);
        }

    }

    private void addUnit(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        try {
            Long id = Long.valueOf(this.get(request, "propertyId"));
            Property property = propertyBeanI.findById(id);
            jLogger.w("the property is +" + property.getName());
            if (property != null) {

                jLogger.w("the property is +" + property.getName());

                request.setAttribute("property", property);
                request.getRequestDispatcher("dashboard/addUnit.jsp").forward(request, response);
            }

        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }


    private void viewUnits(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        try {
            Long id = Long.valueOf(this.get(request, "propertyId"));
            List<Unit> units = unitBeanI.searchByPropertyId(id);
            request.setAttribute("units", units);
            request.getRequestDispatcher("dashboard/view_units_per_property.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void editUnits(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        jLogger.w("HERE__________________________");
        Unit unit = unitBeanI.findById(Long.valueOf(get(request, "unitId")));
        jLogger.w("unit found " + unit.getId());
        String type = get(request, "unitType");
        if (type.equalsIgnoreCase("RESIDENTIAL"))
            unit.setUnitType(UnitType.RESIDENTIAL);
        else
            unit.setUnitType(UnitType.COMMERCIAL);
        unit.setUnitNumber(get(request, "unitNumber"));
        //Property property = propertyBeanI.findById(Long.valueOf(get(request, "propertyId")));
        //unit.setProperty(property);
        unit.setBlockNo(get(request, "unitFloor"));
        // Long deposit = Long.valueOf(get(request, "unitDeposit"));
        // Long rent = Long.valueOf(get(request, "unitMonthlyRent"));

        unit.setDeposit(new BigDecimal(get(request, "unitDeposit")));
        unit.setMonthlyRent(new BigDecimal(get(request, "unitMonthlyRent")));
        unit.setDescription(get(request, "unitDescription"));

        if (unitBeanI.edit(unit) != null) {
            audit(session, "UNIT UPDATED");
            this.respond(response, true, "Unit details were successfully saved", null);
        } else {
            this.respond(response, false, "Could save the Unit! ", null);

        }

    }

    private void viewUnitsPerProperty(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        try {
            Long id = Long.valueOf(this.get(request, "unitId"));
            Unit units = unitBeanI.findById(id);
            request.setAttribute("units", units);
            jLogger.w("am here ..............");
            request.getRequestDispatcher("dashboard/units_details.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void addLandlord(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        Gender gender = genderBeanI.findById(helper.toLong(get(request, "gender")));
        Emails emails = emailsBeanI.find();
        Landlord landlord = new Landlord();
        PasswordPolicy policy = passwordPolicyBeanI.find();
        User user = new User();

        landlord.setFirstname(get(request, "firstName"));
        landlord.setSurname(get(request, "surName"));
        landlord.setOthernames(get(request, "otherName"));
        landlord.setIdNumber(get(request, "idNumber"));
        landlord.setPhoneNumber(get(request, "phoneNumber"));
        landlord.setEmailAddress(get(request, "emailAddress"));
        landlord.setGender(gender);


        Address address = new Address();
        address.setPostalAddress(get(request, "postalAddress"));
        address.setTown(get(request, "town"));
        address.setZipcode(get(request, "zipcode"));
        address.setBuilding(get(request, "bulding"));
        address.setRoad(get(request, "road"));
        landlord.setAddress(address);
        User u = userBeanI.findByUsername(get(request, "emailAddress"));

        if (u == null && landlordBeanI.findByIdnumber(get(request, "idNumber")) == null) {

            if (landlordBeanI.add(landlord) != null) {
                User user1 = createUser(request, policy, user, landlord.getId(), Constants.LANDLORD_PROFILE);
                emailsBeanI.sendEmail("Dear, LandLord " + "You have been registered Successfuly to the RMS System. "
                                + "Here is your username :" + "" +
                                user1.getUsername() + " and password: " + user1.getPassword() + "." +
                                "\nYou can change your password later.",
                        u.getUsername(), "LandLord Registration", emails.getDefaultEmail(), null);
                audit(session, "LANDLORD ADDED");
                this.respond(response, true, "Landlord details were successfully saved", null);
            } else {

                this.respond(response, false, "Could not save landlord details", null);
            }
        } else {
            this.respond(response, false, "Landlord already exists", null);

        }


    }

    private void saveUnit(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

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
        unit.setOccupancyStatus(OccupancyStatus.VACANT);
        unit.setBooked(YesNo.NO);
        if (unitBeanI.add(unit) != null) {
            audit(session, "UNIT ADDED");
            this.respond(response, true, "Unit details were successfully saved", null);
        } else {
            this.respond(response, true, "Could save the Unit! ", null);

        }


    }

    private void addAgent(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        Emails emails = emailsBeanI.find();
        Gender gender = genderBeanI.findById(helper.toLong(get(request, "gender")));
        Company company = companyBeanI.find();
        Agent agent = new Agent();
        PasswordPolicy policy = passwordPolicyBeanI.find();
        User user = new User();
        Address address = new Address();
        agent.setName(get(request, "agentName"));


        agent.setPhoneNumber(get(request, "phoneNumber"));
        agent.setEmailAddress(get(request, "emailAddress"));
        address.setPostalAddress(get(request, "postalAddress"));
        address.setTown(get(request, "town"));
        address.setZipcode(get(request, "zipcode"));
        address.setBuilding(get(request, "bulding"));
        address.setRoad(get(request, "road"));
        agent.setAddress(address);
        User u = userBeanI.findByUsername(get(request, "emailAddress"));

        if (u == null) {

            if (agentBeanI.add(agent) != null) {
                User user1 = createUser(request, policy, user, agent.getId(), Constants.AGENT_PROFILE);
                jLogger.w("Email--------->" + user1.getUsername());
                jLogger.w("password--------->" + user1.getTemp_password());
                String message = "Dear, Agent " + "You have been registered Successfuly to the RMS System. "
                        + "Here is your username: " + "" + user1.getUsername() + " and password: " + user1.getTemp_password() + "." + "\nYou can change your password later.";
                String subject = "Agent Registration";
                emailsBeanI.sendEmail(message, user1.getUsername(), subject, emails.getDefaultEmail(), null);
                audit(session, "AGENT ADDED");
                this.respond(response, true, "Agent added successfully, Username and password has been sent to your email", null);

            } else {
                this.respond(response, false, "Could not save agent details", null);

            }

        } else {
            this.respond(response, false, "Agent already exists", null);

        }
    }

    private User createUser(HttpServletRequest request, PasswordPolicy policy, User user, Long id, String agentProfile) {
        user.setProfileID(id);
        user.setUserProfile(agentProfile);
        user.setUsername(this.get(request, "emailAddress"));
        jLogger.i("am here registering");
        user.setTemp_password(generatePassword(10, ALPHA_CAPS + ALPHA + SPECIAL_CHARS));
        user.setPassword(helper.hash(user.getTemp_password()));
        Date password_expiry = helper.addDays(new Date(), policy.getExpiry_days());
        user.setPassword_expiry(password_expiry);
        String securityCode = UUID.randomUUID().toString();
        user.setSecurityCode(securityCode);
        user.setStatus(true);
        return userBeanI.edit(user);

    }

    private void removeAgent(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        Long id = Long.valueOf(this.get(request, "agentId"));
        Agent agent = agentBeanI.findById(id);
        User user = userBeanI.findByUsername(agent.getEmailAddress());
        if (agentBeanI.delete(agent)) {
            if (userBeanI.delete(user)) {
                audit(session, "Deleted Agent ");
                this.respond(response, true, "Agent deleted successfully", null);
            } else {
                this.respond(response, true, "Could not delete User!", null);
            }

        } else {
            this.respond(response, true, "Could not delete Agent!", null);
        }


    }

    private void removeLandlord(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        Long id = Long.valueOf(this.get(request, "landlordId"));
        Landlord landlord = landlordBeanI.findById(id);
        if (landlord != null) {
            if (landlordBeanI.delete(landlord)) {
                audit(session, "Deleted Landlord ");
                this.respond(response, true, "Landlord deleted successfully", null);
            } else {
                this.respond(response, true, "Could not delete Landlord!", null);
            }
        } else {
            this.respond(response, true, "Landlord does not exits!", null);
        }

    }

    private void removeUnit(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        Long id = Long.valueOf(this.get(request, "unitId"));
        Unit unit = unitBeanI.findById(id);
        if (unitBeanI.delete(unit)) {
            audit(session, "Deleted Unit ");
            this.respond(response, true, "Unit deleted successfully", null);
        } else {
            this.respond(response, false, "Could not delete Unit!", null);
        }


    }

    private void addProperty(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        Property property = new Property();
        property.setPropertyNo(this.get(request, "propertyNo"));
        property.setLandRates(this.get(request, "landRates"));

        String lease = this.get(request, "lease");
        if (lease.equalsIgnoreCase("YES"))
            property.setLease(Lease.YES);
        else
            property.setLease(Lease.NO);

        String propertyCategory = this.get(request, "propertyCategory");
        if (propertyCategory.equalsIgnoreCase("COMMERCIAL"))
            property.setPropertyCategory(PropertyCategory.COMMERCIAL);
        else
            property.setPropertyCategory(PropertyCategory.RESIDENTIAL);


        property.setName(this.get(request, "name"));
        property.setLocation(this.get(request, "location"));
        Address address = new Address();
        address.setRoad(this.get(request, "road"));
        address.setTown(this.get(request, "town"));

        property.setAddress(address);
        property.setLandNumber(this.get(request, "landNumber"));
        property.setNumberOfUnits(Integer.parseInt(this.get(request, "numberOfUnits")));
        property.setTotalArea(this.get(request, "totalArea"));
        Agent agent = agentBeanI.findById(Long.parseLong(this.get(request, "agent")));
        property.setAgent(agent);
        if (propertyBeanI.add(property) != null) {
            audit(session, "Added Property");
            this.respond(response, true, "Property successfully Added", null);
        } else {
            this.respond(response, false, "Could not Add Property ", null);

        }


    }


    private void viewProperty(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws
            Exception {
        Long id = Long.valueOf(this.get(request, "propertyId"));
        Property property = propertyBeanI.findById(id);
        List<Agent> agents = agentBeanI.find();
        request.setAttribute("property", property);
        request.setAttribute("agents", agents);
        request.getRequestDispatcher("dashboard/property_view.jsp").forward(request, response);

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
        jLogger.w("am heremmmmmmmmmmmmmmmmmm");
        request.getRequestDispatcher("dashboard/view_unit_details.jsp").forward(request, response);

    }

    private void viewAgentDetails(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws
            Exception {
        Long id = Long.valueOf(this.get(request, "agentId"));

        jLogger.w("The agent id is " + id);
        Agent agent = agentBeanI.findById(id);
        request.setAttribute("agent", agent);
        request.getRequestDispatcher("dashboard/view_agent_details.jsp").forward(request, response);

    }

    private void viewLandlordDetails(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws
            Exception {
        Long id = Long.valueOf(this.get(request, "landlordId"));

        jLogger.w("The landlord id is " + id);
        List<Gender> genders = genderBeanI.find();
        request.setAttribute("genders", genders);
        Landlord landlord = landlordBeanI.findById(id);
        request.setAttribute("landlord", landlord);
        request.getRequestDispatcher("dashboard/view_landlord_details.jsp").forward(request, response);

    }


    private void addTenant(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        String firstName = this.get(request, "tenantFirstname");
        String emailAddres = this.get(request, "tenantEmailaddress");
        String postalAddress = this.get(request, "tenantPostalAddress");
        String gender = this.get(request, "tenantGender");
        String town = this.get(request, "tenantTown");
        String phoneNumber = this.get(request, "tenantCellNumber");

        TenancyAgreement tenancyAgreement = new TenancyAgreement();
        Address address = new Address();
        address.setPostalAddress(postalAddress);
        address.setTown(town);
        tenancyAgreement.setEmailAddress(emailAddres);
        tenancyAgreement.setName(firstName);
        tenancyAgreement.setPhoneNumber(phoneNumber);
        tenancyAgreement.setAddress(address);
        if (tenantBeanI.edit(tenancyAgreement) != null) {
            audit(session, "Added TenancyAgreement ");
            this.respond(response, true, "TenancyAgreement successfully saved", null);
        } else
            this.respond(response, false, "TenancyAgreement could not be saved", null);

    }


    private void switchProperty(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        session.setAttribute(Constants.PROPERTY_ID, this.get(request, "propertyID"));
        this.respond(response, true, "success", null);
    }

    private void updateCompany(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        /* Company Details Update Request */
        Country country = countryBeanI.findById(helper.toLong(this.get(request, "country")));
        Company company = new Company(helper.toLong(this.get(request, "company_id")),
                this.get(request, "companyName"), this.get(request, "streetAddress"),
                this.get(request, "telephone"), this.get(request, "fax"),
                this.get(request, "city"), country, this.get(request, "geolocation"));
        if (companyBeanI.edit(company) != null) {
            audit(session, "Updated company details");
            this.respond(response, true, "success", null);
        } else
            this.respond(response, false, "failed", null);
    }

    private void showPropertyBatchExceptions(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String REPO_FOLDER = "agent";
        List<Property> properties = getPropertyExceptions();
        jLogger.w("List size" + properties.size());
        request.setAttribute("properties", properties);
        request.getRequestDispatcher(REPO_FOLDER + "/view_property_batch_exceptions.jsp").forward(request, response);
    }

    private void addPropertyBatch(HttpServletRequest request, HttpServletResponse response, HttpSession session, String MEDIA_DIR, String doc_folder, String FILE_SEPERATOR, String RMS_DOC_ROOT_FOLDER) throws Exception {
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

                Set<String> uploadedProperty = new HashSet<>();

                jLogger.w("The Excel vector is :" + res);
                for (Vector<String> v : res) {


                    Property property = new Property();
                    count++;
                    String propertyNumber = v.get(0);
                    String companyName = v.get(1);
                    String propertyName = v.get(2);
                    String propertyCategory = v.get(3);
                    String lease = v.get(4);
                    String agent = v.get(5);
                    String landRates = v.get(6);

                    jLogger.w("Property Number " + propertyNumber);

                    if (propertyNumber.trim().isEmpty()) {
                        property.setExceptions("Property Number Not Found for row number\t" + count);
                    } else {
                        if (uploadedProperty.contains(propertyNumber)) {
                            property.setExceptions("Duplicate Property Number  Found for row number\t" + count);
                        }

                        Property property1 = propertyBeanI.findPropPropertyNumber(propertyNumber);
                        if (property1 != null)
                            property.setExceptions("Property  Already Exist for row number\t" + count);
                        if ((companyName.trim().isEmpty()))
                            property.setExceptions("company  name Not Found for row number\t" + count);
                        if ((propertyName.trim().isEmpty()))
                            property.setExceptions("property name Not Found for row number\t" + count);
                        if ((propertyCategory.trim().isEmpty()))
                            property.setExceptions("property category Not Found for row number\t" + count);
                        if ((lease.trim().isEmpty()))
                            property.setExceptions("lease Not Found for row number\t" + count);
                        if ((agent.trim().isEmpty()))
                            property.setExceptions("agent Not Found for row number\t" + count);
                        if ((landRates.trim().isEmpty()))
                            property.setExceptions("land Rates Not Found for row number\t" + count);


                        property.setPropertyNo(propertyNumber);
                        property.setCompanyName(companyName);
                        property.setName(propertyName);

                        if (propertyCategory.equalsIgnoreCase("COMMERCIAL"))
                            property.setPropertyCategory(PropertyCategory.COMMERCIAL);
                        if (propertyCategory.equalsIgnoreCase("RESIDENTIAL"))
                            property.setPropertyCategory(PropertyCategory.RESIDENTIAL);

                        if (lease.equalsIgnoreCase("YES"))
                            property.setLease(Lease.YES);
                        if (lease.equalsIgnoreCase("NO"))
                            property.setLease(Lease.NO);

                        Agent agent1 = agentBeanI.findByNumber(agent);
                        if (agent1 != null)
                            property.setAgent(agent1);

                        property.setLandRates(landRates);


                    }

                    if (property.getExceptions() == null) {
                        batchProperty.add(property);
                    } else {
                        propertyExceptions.add(property);

                    }

                    uploadedProperty.add(propertyNumber);
                }

                if (propertyExceptions != null && propertyExceptions.size() > 0) {

                    jLogger.w("Exception List size is " + propertyExceptions.size());
                    response.sendError(400, "Uploaded Batch has exceptions!");
                } else {
                    audit(session, "Property Batch save");
                    this.respond(response, true, "Saved", null);

                }


            }
            // }
        } catch (IOException e) {
            e.printStackTrace();
            this.respond(response, false, "Error Occured!", null);
        }


    }

    private void updateEmails(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        /* Email Addresses Update Request */

        boolean defaultEmailActive = this.get(request, "defaultEmailActive").equalsIgnoreCase("true");
        boolean marketingEmailActive = this.get(request, "marketingEmailActive").equalsIgnoreCase("true");
        boolean supportEmailActive = this.get(request, "supportEmailActive").equalsIgnoreCase("true");
        boolean crmEmailActive = this.get(request, "crmEmailActive").equalsIgnoreCase("true");
        boolean sendWhatifEmail = this.get(request, "sendWhatifEmail").equalsIgnoreCase("true");

        Emails emails = emailsBeanI.find();

        emails.setDefaultEmailActive(defaultEmailActive);
        emails.setMarketingEmailActive(marketingEmailActive);
        emails.setSupportEmailActive(supportEmailActive);
        emails.setCrmEmailActive(crmEmailActive);

        emails.setSendWhatifEmail(sendWhatifEmail);

        emails.setDefaultEmail(this.get(request, "defaultEmail"));
        emails.setMarketingEmail(this.get(request, "marketingEmail"));
        emails.setSupportEmail(this.get(request, "supportEmail"));
        emails.setCrmEmail(this.get(request, "crmEmail"));

        /*Emails emails = new Emails(helper.toLong(this.get(request, "email_id")), this.get(request, "defaultEmail"),
        this.get(request, "marketingEmail"), this.get(request, "supportEmail"), this.get(request, "sendWhatifEmail").equalsIgnoreCase("true"));*/

        if (emailsBeanI.edit(emails) != null) {
            audit(session, "Updated Email Addresses");
            this.respond(response, true, "success", null);
        } else
            this.respond(response, false, "failed", null);
    }


    private void setNewPassword(HttpServletRequest request, HttpServletResponse response, HttpSession
            session, String newPass, User user) {
        PasswordPolicy policy = passwordPolicyBeanI.find();
        if (!(usedPasswordBeanI.isUsed(newPass) && policy.isPassword_reuse())) {
            user.setPassword(helper.hash(newPass));
            Date password_expiry = helper.addDays(new Date(), policy.getExpiry_days());
            user.setPassword_expiry(password_expiry);
            userBeanI.edit(user);
            audit(session, "Changed password");
            this.respond(response, true, "Your password was changed successfully", null);
        } else {
            this.respond(response, false, "", null);
        }
    }

    /**
     * Extracts file name from HTTP header content-disposition
     */
    String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    public List<Property> getBatchProperty() {
        return batchProperty;
    }

    public void setBatchProperty(List<Property> batchProperty) {
        this.batchProperty = batchProperty;
    }

    public List<Property> getPropertyExceptions() {
        return propertyExceptions;
    }

    public void setPropertyExceptions(List<Property> propertyExceptions) {
        this.propertyExceptions = propertyExceptions;
    }
}
