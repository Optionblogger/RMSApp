package com.rentmanagement.controller;

import com.rentmanagement.beans.*;
import com.rentmanagement.common.Constants;
import com.rentmanagement.common.Helper;
import com.rentmanagement.common.JLogger;
import com.rentmanagement.model.*;
import org.json.JSONException;
import org.json.JSONObject;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.Serializable;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

@WebServlet(name = "SignIn", urlPatterns = {"/sign-in"})
public class SignIn extends BaseServlet implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    JLogger jLogger = new JLogger(this.getClass());
    Helper helper = new Helper();
    @EJB
    ProfileNameBeanI profileNameBeanI;
    @EJB
    LogoBeanI logoBeanI;
    @EJB
    UserBeanI userBeanI;
    @EJB
    CountryBeanI countryBeanI;
    @EJB
    SettingBeanI settingBeanI;
    @EJB
    GenderBeanI genderBeanI;
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
    PageContentBeanI pageContentBeanI;

    @EJB
    ProfileLoginFieldBeanI profileLoginFieldBeanI;
    @EJB
    ImageBannerBeanI imageBannerBeanI;
    @EJB
    PermissionBeanI permissionBeanI;

    @EJB
    PropertyBeanI propertyBeanI;


    public SignIn() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        /* configuring the http headers */
        response.addHeader("X-XSS-Protection", "1; mode=block");
        response.addHeader("X-Frame-Options", "DENY");
        response.addHeader("X-Content-Type-Options", "nosniff");

        HttpSession session = request.getSession(false);
        boolean proceed;

        if (session != null) {
            try {
                if ((session.getAttribute(Constants.LOGIN).equals(true) && (this.getSessKey(request, Constants.U_PROFILE).equals(Constants.AGENT_PROFILE)

                        ))) {
                    response.sendRedirect("agent");
                    proceed = false;
                } else
                    proceed = true;
            } catch (NullPointerException npe) {

                proceed = true;

            }
        } else {
            proceed = true;
        }
        if (proceed) {

            Company company = companyBeanI.find();
            request.setAttribute("company", company);
            Emails email = emailsBeanI.find();
            request.setAttribute("email", email);
            Social social = socialBeanI.find();
            request.setAttribute("social", social);
            Setting settings = settingBeanI.find();
            request.setAttribute("settings", settings);
            List<ProfileLoginField> plf = profileLoginFieldBeanI.find();
            Set set = new HashSet(plf);
            request.setAttribute("loginFields", plf);


            Theme theme = themeBeanI.find();
            request.setAttribute("theme", theme);
            request.setAttribute("noMenu", false);
            Help help = helpBeanI.findHelp(Constants.PAGE_SIGN_IN);
            request.setAttribute("help", help);
            List<Logo> logos = logoBeanI.find();
            request.setAttribute("logos", logos);
            logActivity(Constants.PAGE_SIGN_IN, "accesed home page", null, null);
            request.getRequestDispatcher("login.jsp").forward(request, response);

        }
    }



    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {

        /* configuring the http headers */
        response.addHeader("X-XSS-Protection", "1; mode=block");
        response.addHeader("X-Frame-Options", "DENY");
        response.addHeader("X-Content-Type-Options", "nosniff");
//ACTIVATE_ACCOUNT_ADMIN
        if (this.get(request, "ACTION").equals("ACTIVATE_ACCOUNT")) {

            String code = this.get(request, "code");
            jLogger.i("The Code is " + code);

            User usr = userBeanI.findByActivationCode(code);


            if (usr != null && !usr.isStatus()) {
                usr.setStatus(true);
                usr.setSmsActivationCode(null);
                userBeanI.edit(usr);
                request.setAttribute("success", true);

                this.respond(response, true, "<strong>Activation Successful</strong><br /> " +

                        "Congratulations! Your account has been Activated on the portal. You can now Login", null);

            } else {
                request.setAttribute("success", false);
                this.respond(response, false, "Sorry, the Code you entered is invalid. Please try again", null);
            }
        } else if (this.get(request, "ACTION").equals("ACTIVATE_ACCOUNT_ADMIN")) {

            String code = this.get(request, "code");
            jLogger.i("The Code is " + code);

            User usr = userBeanI.findByActivationCode(code);


            if (usr != null && !usr.isStatus()) {
                usr.setStatus(true);
                usr.setSmsActivationCode(null);


                userBeanI.edit(usr);
                request.setAttribute("success", true);

                this.respond(response, true, "<strong>Activation Successful</strong><br /> " +

                        "Congratulations! Your account has been Activated on the portal. You can now Login", null);

            } else {
                request.setAttribute("success", false);
                this.respond(response, false, "Sorry, the Code you entered is invalid. Please try again", null);
            }
        } else {

            HttpSession session = request.getSession();
            String code = this.get(request, "countryCode");


            String userId = this.get(request, "username");
//			userId=code+userId;
            jLogger.i("USER ID" + userId);


            User u = userBeanI.findUser(userId, this.get(request, "password"));
            jLogger.i("FOUND USER");


            if (u != null) {

                String userName = u.getUsername();

                jLogger.i("=============USERNAME" + userName);
                String zero = "0";
                String plus = "+";
                String memberPhone = userName;
                if (memberPhone.startsWith(zero)) {
                    userName = memberPhone.substring(1);
                    jLogger.i("Appending");
                } else if (userName.startsWith(plus)) {
                    userName = memberPhone;
                } else {


                    userName = u.getUsername();
                }

                if (u.isStatus()) {
                    try {


                        if (u.getUserProfile().equals(Constants.AGENT_PROFILE)) {
                            Agent agent = agentBeanI.findByUser(userName);
                           // List<Property> property = propertyBeanI.findPropByAgentId(agent.getId());
                            session.setAttribute(Constants.USER, userName);
                            session.setAttribute(Constants.UID, u.getId());
                            session.setAttribute(Constants.PROFILE_ID, agent.getId());
                            session.setAttribute(Constants.LOGIN, true);
                            session.setAttribute(Constants.U_PROFILE, u.getUserProfile());
                            if (propertyBeanI.findPropByAgentId(agent.getId()) != null) {
                                 List<Property> property = propertyBeanI.findPropByAgentId(agent.getId());

                                session.setAttribute(Constants.PROPERTY_ID, property.get(0).getId());

                            } else {
                                session.setAttribute(Constants.PROPERTY_ID, null);

                            }

                            resetAttempt(this.get(request, "username"));

                            logActivity(Constants.ML, "successfully logged in",null, u.getUserProfile());


                            this.respond(response, true, "successfully Logged In", null);
                            jLogger.i(" Am here Now : ");

                        } else {
                            logActivity(Constants.ML, "login attempt", null, null);

                            this.respond(response, false, "Login Failed!<br />Sorry, but we could not establish your existence in RMS", null);


                        }

                    } catch (NullPointerException npje) {
                        npje.printStackTrace();
                        // TODO Auto-generated catch block
                        logActivity(Constants.ML, "login attempt",null, null);

                        this.respond(response, false, "Login Failed!<br />Invalid username and/or password<br />Please try again", null);

                    }
                } else {
                    logAttempt(this.get(request, "username"));

                    this.respond(response, false, "Login Failed!<br />You account has been locked or de-activated. Please use the forget password button to reset your account", null);

                }

            } else {
                logActivity(Constants.ML, "login attempt", null, null);
                logAttempt(this.get(request, "username"));

                this.respond(response, false, "Login Failed!<br />Invalid username and/or password<br />Please try again", null);


            }
        }
    }

}
