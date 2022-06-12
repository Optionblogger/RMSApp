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
import java.util.*;

@WebServlet(name = "Register", urlPatterns = {"/register"})
public class Register extends BaseServlet implements Serializable {


    Helper helper = new Helper();
    @EJB
    ProfileNameBeanI profileNameBeanI;
    @EJB
    LogoBeanI logoBeanI;

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
    AccountRecoveryBeanI accountRecoveryBeanI;

    @EJB
    UserBeanI userBeanI;

    private static final long serialVersionUID = 1L;

    JLogger jLogger = new JLogger(this.getClass());

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        /* configuring the http headers */
        response.addHeader("X-XSS-Protection", "1; mode=block");
        response.addHeader("X-Frame-Options", "DENY");
        response.addHeader("X-Content-Type-Options", "nosniff");

        List<Country> countries = countryBeanI.find();
        request.setAttribute("countries", countries);
        List<Gender> genders = genderBeanI.find();
        request.setAttribute("genders", genders);
        Company company = companyBeanI.find();
        request.setAttribute("company", company);
        Social social = socialBeanI.find();
        request.setAttribute("social", social);
        List<ProfileName> profileNames = profileNameBeanI.find();
        request.setAttribute("profileNames", profileNames);
//        List<Scheme> sponsorSchemes = apiEJB.getSchemeBySchemeModeAndPlanType(UMBRELLA, INDIVIDUAL_PENSION_FUND);
//        request.setAttribute("sponsorSchemes", sponsorSchemes);
//
//        List<Scheme> memberSchemes = (apiEJB.getSchemeByPlanType(INDIVIDUAL_PENSION_FUND) != null ? apiEJB.getSchemeByPlanType(INDIVIDUAL_PENSION_FUND) : apiEJB.getSchemeByPlanType(DEFINED_CONTRIBUTION));
//        request.setAttribute("memberSchemes", memberSchemes);


        AccountRecovery accountRecovery = accountRecoveryBeanI.find();
        request.setAttribute("accountRecovery", accountRecovery);

        Setting settings = settingBeanI.find();
        request.setAttribute("settings", settings);
        List<ProfileLoginField> plf = profileLoginFieldBeanI.find();
        request.setAttribute("loginFields", plf);
        Theme theme = themeBeanI.find();
        request.setAttribute("theme", theme);
        request.setAttribute("noMenu", false);
        Help help = helpBeanI.findHelp(Constants.PAGE_REGISTER);
        request.setAttribute("help", help);
        PageContent content = pageContentBeanI.findPageContent(Constants.PAGE_REGISTER);
        request.setAttribute("content", content);
        PasswordPolicy policy = passwordPolicyBeanI.find();
        request.setAttribute("policy", policy);

        int adminCounts = userBeanI.countAdministrators(Constants.ADMIN_PROFILE);
        request.setAttribute("admincounts", adminCounts);
        List<Logo> logos = logoBeanI.find();
        request.setAttribute("logos", logos);
        logActivity(Constants.PAGE_REGISTER, "accesed registration page", null, null);
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {

        /* configuring the http headers */
        response.addHeader("X-XSS-Protection", "1; mode=block");
        response.addHeader("X-Frame-Options", "DENY");
        response.addHeader("X-Content-Type-Options", "nosniff");
        response.addHeader("Content-type", "text/html; charset=UTF-8");

        // Get the request params.
        @SuppressWarnings("rawtypes")
        Map paramMap = request.getParameterMap();
        if (paramMap.isEmpty()) {
            response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "Post method not allowed without parameters.");
            return;
        }
        String[] arr2 = (String[]) paramMap.get("inCaptchaChars");
        if (arr2 == null) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Expected parameters were not found.");
            return;
        }

        String sessId = request.getSession().getId();
        //  String inputChars = arr2.length > 0 ? arr2[0] : "";

        // Check validity and consistency of the data.
        if (sessId == null) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Browser must support session cookies.");
            return;
        }

        // Validate whether input from user is correct.
        // System.out.println("Validating - inputChars are: " + inputChars);

        HttpSession session = request.getSession(true);
        //Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
        request.setCharacterEncoding("UTF-8"); // Do this so we can capture non-Latin chars

        //boolean passedCaptchaTest = captcha.isCorrect(inputChars);
        session.invalidate();

//        if (passedCaptchaTest) {
        Setting settings = settingBeanI.find();
        if (this.get(request, "type").equalsIgnoreCase("agent")) {
            this.createAgent(request, response);
        } else if (this.get(request, "type").equalsIgnoreCase("landlord")) {
            this.createLandlord(request, response);
        } else if (this.get(request, "type").equalsIgnoreCase("admin")) {
            this.createAdmin(request, response);
        }

//        } else {
//            this.respond(response, false, "<strong>Authorization Failed!</strong><br /> You did not pass our robot test.", null);
//
//        }

    }

}
