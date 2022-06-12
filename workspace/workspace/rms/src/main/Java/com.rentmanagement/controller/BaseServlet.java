package com.rentmanagement.controller;



import com.rentmanagement.beans.*;
import com.rentmanagement.common.*;
import com.rentmanagement.common.Helper;
import com.rentmanagement.common.JLogger;
import com.rentmanagement.model.ActivityLog;
import com.rentmanagement.model.AuditTrail;
import com.rentmanagement.model.Permission;
import com.rentmanagement.model.*;

import org.json.JSONObject;

import javax.ejb.EJB;
import javax.servlet.http.*;
import java.io.IOException;

import java.security.SecureRandom;
import java.util.Date;

import java.util.UUID;


public class BaseServlet extends HttpServlet {
    private final JLogger jLogger = new JLogger(this.getClass());
    final Helper helper = new Helper();
    @EJB
    CountryBeanI countryBeanI;
    @EJB
    SettingBeanI settingBeanI;


    @EJB
    LandlordBeanI landlordBeanI;

    @EJB
    AgentBeanI agentBeanI;
    @EJB
    GenderBeanI genderBeanI;


    @EJB
    EmailsBeanI emailsBeanI;

    @EJB
    PermissionBeanI permissionBeanI;

    String get(HttpServletRequest req, String param) {
        return helper.toString(req.getParameter(param));
    }



    @EJB
    AuditTrailBeanI auditTrailBeanI;

    private void logAuditTrail(String username, Date date, String profile, String description) {
        AuditTrail at = new AuditTrail();
        at.setDescription(description);
        at.setProfile(profile);
        at.setUsername(username);
        at.setDatetime(date);
        auditTrailBeanI.add(at);
    }

    @EJB
    ActivityLogBeanI activityLogBeanI;

    void logActivity(String access_menu, String description, String userID, String userProfile) {
        activityLogBeanI.add(new ActivityLog(description, new Date(), helper.toLong(userID), access_menu, userProfile));

    }

    @EJB
    UserBeanI userBeanI;

    void resetAttempt(String username) {
        User user = userBeanI.findByUsername(username);
        if (user != null) {
            user.setAttempt(0);
        }
        userBeanI.edit(user);
    }

    @EJB
    PasswordPolicyBeanI passwordPolicyBeanI;

    void logAttempt(String username) {
        User user = userBeanI.findByUsername(username);
        PasswordPolicy policy = passwordPolicyBeanI.find();
        if (user != null) {
            user.setAttempt(user.getAttempt() + 1);
            jLogger.i("Attempt is: " + user.getAttempt() + ", Policy Count is: " + policy.getLock_after_count_of());
            if (user.getAttempt() >= policy.getLock_after_count_of()) {
                user.setStatus(false);
            }
            userBeanI.edit(user);
        }
    }

    void audit(HttpSession session, String description) {
        if (session != null)
            logAuditTrail(session.getAttribute(Constants.USER).toString(), new Date(), session.getAttribute(Constants.U_PROFILE).toString(), description);
    }

    Permission getPermissions(HttpServletRequest request) {
        Permission permissions;



            permissions = permissionBeanI.findByProfile(getSessKey(request, Constants.U_PROFILE));

        return permissions;
    }
    private static SecureRandom random = new SecureRandom();

    public static String generatePassword(int len, String dic) {
        String result = "";
        for (int i = 0; i < len; i++) {
            int index = random.nextInt(dic.length());
            result += dic.charAt(index);
        }
        return result;
    }


    void createAgent(HttpServletRequest request, HttpServletResponse response) {
        Gender gender = genderBeanI.findById(helper.toLong(get(request, "gender")));

        Agent agent = new Agent();
        PasswordPolicy policy = passwordPolicyBeanI.find();
        User user = new User();
        Address address = new Address();
        agent.setName(get(request, "name"));

        agent.setPhoneNumber(get(request, "phoneNumber"));
        agent.setEmailAddress(get(request, "emailAddress"));
        address.setPostalAddress(get(request, "postalAddress"));
        address.setTown(get(request, "town"));
        address.setZipcode(get(request, "zipcode"));
        address.setBuilding(get(request, "bulding"));
        address.setRoad(get(request, "road"));
        agent.setAddress(address);
        User u = userBeanI.findByUsername(get(request, "emailAddress"));

        if (u == null ){

            if (agentBeanI.add(agent) != null) {
                User user1 = createUser(request, policy, user, agent.getId(), Constants.AGENT_PROFILE);
                emailsBeanI.sendEmail("Dear, Agent " + "You have been registered Successfuly to the RMS System. "
                        + "Here is your username :" + "" + user1.getUsername() + " and password: " + user1.getPassword() + "." + "\nYou can change your password later.", u.getUsername(), "Agent Registration", "wilfredkim5@gmail.com", null);
                this.respond(response, true, "Agent details were successfully saved", null);

            } else {
                this.respond(response, false, "Could not save agent details", null);

            }

        } else {
            this.respond(response, false, "Agent already exists", null);

        }
    }

    void createLandlord(HttpServletRequest request, HttpServletResponse response) {
        Gender gender = genderBeanI.findById(helper.toLong(get(request, "gender")));

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
                        + "Here is your username :" + "" + user1.getUsername() + " and password: " + user1.getPassword() + "." + "\nYou can change your password later.", u.getUsername(), "LandLord Registration", "wilfredkim5@gmail.com", null);
                this.respond(response, true, "Landlord details were successfully saved", null);
            } else {

                this.respond(response, false, "Could not save landlord details", null);
            }
        } else {
            this.respond(response, false, "Landlord already exists", null);

        }


    }

    void createAdmin(HttpServletRequest request, HttpServletResponse response) {

        PasswordPolicy policy = passwordPolicyBeanI.find();
        String idNumber = this.get(request, "idNumber");
        if (helper.isValidPhone(idNumber)) {

            String zero = "0";
            String plus = "+";
            String adminPhone = idNumber;
            if (adminPhone.startsWith(zero)) {
//                     idNumber =memberPhone.substring(1);
            } else if (idNumber.startsWith(plus)) {
                idNumber = adminPhone;
            } else {

                idNumber = adminPhone;

            }

        }

        User user = userBeanI.findUserByUsernameAndProfile(idNumber, Constants.ADMIN_PROFILE);
        if (user == null) {
            User user1 = new User();
            String profile = Constants.ADMIN_PROFILE;
            user1.setUserProfile(profile);
            user1.setUsername(this.get(request, "idNumber"));
            jLogger.i("am here registering");
            user1.setPassword(helper.hash(this.get(request, "password")));
            Date password_expiry = helper.addDays(new Date(), policy.getExpiry_days());
            user1.setPassword_expiry(password_expiry);
            String securityCode = UUID.randomUUID().toString();
            user1.setSecurityCode(securityCode);
            user1.setStatus(true);
            userBeanI.edit(user1);

            this.respond(response, true, "Admin details were successfully saved", null);
        } else {
            this.respond(response, false, "Admin already exists", null);

        }


    }


    private User createUser(HttpServletRequest request, PasswordPolicy policy, User user, Long id, String agentProfile) {
        user.setProfileID(id);
        user.setUserProfile(agentProfile);
        user.setUsername(this.get(request, "emailAddress"));
        jLogger.i("am here registering");
        user.setPassword(helper.hash(this.get(request, "password")));
        Date password_expiry = helper.addDays(new Date(), policy.getExpiry_days());
        user.setPassword_expiry(password_expiry);
        String securityCode = UUID.randomUUID().toString();
        user.setSecurityCode(securityCode);
        user.setStatus(true);
        return userBeanI.edit(user);

    }


    void recoverAccount(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false);

        jLogger.i("Being passed from frontend ======================>  " + session.getAttribute("membershipNumber"));
        jLogger.i("Being passed from frontend ======================>  " + session.getAttribute("phone"));
        jLogger.i("Being passed from frontend ======================>  " + session.getAttribute("email"));


        JSONObject result = null;
        //  String memberId = String.valueOf(session.getAttribute("memberId"));
        String phone = String.valueOf(session.getAttribute("phone"));
        String email = String.valueOf(session.getAttribute("email"));

//        User  u = new User();
//        u=  userBeanI.findByUsername(String.valueOf(session.getAttribute("existingPhoneNumber")));
//      //  m.setEmailAddress(email);
//       u.setUsername(phone);
//
//        boolean status;
//        status = apiEJB.saveOrUpdateSponsor(xtractMemberAccount(request, session).toString());
//        this.respond(response, status, status ? "Member details have been successfully saved." : "Member details could not be saved. We apologise for the inconvenience.", null);


    }


    void respond(HttpServletResponse resp, boolean status, String message, JSONObject json) {
        if (json != null)
            jLogger.i("Object is : " + json.toString());
        try {
            String response = helper.result(status, message, json);
            jLogger.i(response);
            resp.getWriter().write(response);

        } catch (IOException ioe) {
            jLogger.e("Problem sending response" + ioe.getMessage());
        }


    }


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

    String baseUrl() {
        return getServletContext().getContextPath() + "/";
    }

    String getSessKey(HttpServletRequest req, String param) {
        HttpSession session = req.getSession(false);
        return session != null ? helper.toString(session.getAttribute(param)) : null;
    }

    String getBasePath() {
        return getServletContext().getRealPath("/") + "/";
    }

    void redirect(HttpServletResponse resp, String page) {
        try {
            resp.sendRedirect(getServletContext().getContextPath() + page);
        } catch (IOException ioe) {
            jLogger.e("Sorry, we have an io exception: " + ioe.getMessage());
        }
    }
}
