package com.rentmanagement.controller;


import com.rentmanagement.beans.*;
import com.rentmanagement.common.*;
import com.rentmanagement.model.*;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.Serializable;
import java.util.List;


@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends BaseServlet implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    Helper helper = new Helper();
    @EJB
    ProfileNameBeanI profileNameBeanI;
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
    private PropertyBeanI propertyBeanI;

    JLogger JLogger = new JLogger(this.getClass());



    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        /* configuring the http headers */
        response.addHeader("X-XSS-Protection", "1; mode=block");
        response.addHeader("X-Frame-Options", "DENY");
        response.addHeader("X-Content-Type-Options", "nosniff");

        /* Check if user is already authenticated */
        HttpSession session = request.getSession(false);

        Company company = companyBeanI.find();
        request.setAttribute("company", company);
        Social social = socialBeanI.find();
        request.setAttribute("social", social);

        Theme theme = themeBeanI.find();
        request.setAttribute("theme", theme);
        Setting settings = settingBeanI.find();
        request.setAttribute("settings", settings);
        Help help = helpBeanI.findHelp(Constants.PAGE_LOGIN);
        request.setAttribute("help", help);
        List<ProfileLoginField> plf = profileLoginFieldBeanI.find();
        jLogger.i("The profile size is " + plf.size());
        request.setAttribute("loginFields", plf);


        if (session != null) {
            try {
                if ((session.getAttribute(Constants.LOGIN).equals(true) && (this.getSessKey(request, Constants.U_PROFILE).equals(Constants.ADMIN_PROFILE) ))) {
                    response.sendRedirect(getServletContext().getContextPath() + "/admin");

                } else {
                    request.setAttribute("noMenu", true);
                    request.getRequestDispatcher("admin_login.jsp").forward(request, response);

                }
            } catch (NullPointerException npe) {
                request.setAttribute("noMenu", true);
                request.getRequestDispatcher("admin_login.jsp").forward(request, response);

            }
        } else {
            request.setAttribute("noMenu", true);
            request.getRequestDispatcher("admin_login.jsp").forward(request, response);

        }
    }

    JLogger jLogger = new JLogger(this.getClass());

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {

        /* configuring the http headers */
        response.addHeader("X-XSS-Protection", "1; mode=block");
        response.addHeader("X-Frame-Options", "DENY");
        response.addHeader("X-Content-Type-Options", "nosniff");
        /* On Successful Authentication */
        HttpSession session = request.getSession();

        User u = userBeanI.findUser(this.get(request, "username"), this.get(request, "password"));

        if (u != null) {
            jLogger.i("User found was " + u.getUsername());

            if (u.isStatus()) {
                try {
                    if (u.getUserProfile().equals(Constants.ADMIN_PROFILE) || u.getUserProfile().equals(Constants.LANDLORD_PROFILE)) {

                        session.setAttribute(Constants.USER, u.getUsername());
                        session.setAttribute(Constants.UID, u.getId());
                        session.setAttribute(Constants.LOGIN, true);
                        session.setAttribute(Constants.U_PROFILE, u.getUserProfile());
                        resetAttempt(this.get(request, "username"));
                        jLogger.w("The profile is" + u.getUserProfile());

                        logActivity(Constants.AL, "successfully logged in", null, u.getUserProfile());

                        this.respond(response, true, "login successful", null);

                    } else {
                        logActivity(Constants.AL, "login attempt", null, null);

                        this.respond(response, false, "Login Failed!<br />Invalid username and/or password<br />Please try again", null);

                    }
                } catch (NullPointerException npe) {
                    // TODO Auto-generated catch block
                    logActivity(Constants.AL, "login attempt", null, null);

                    this.respond(response, false, "Login Failed!<br />Invalid username and/or password<br />Please try again", null);

                }
            } else {
                logAttempt(this.get(request, "username"));

                this.respond(response, false, "Login Failed!<br />You account has been locked or de-activated. Contact the administrator", null);

            }

        } else {
            logActivity(Constants.AL, "login attempt", null, null);
            logAttempt(this.get(request, "username"));

            this.respond(response, false, "Login Failed!<br />Invalid username and/or password<br />Please try again", null);


        }

    }

}
