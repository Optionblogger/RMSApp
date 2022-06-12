package com.rentmanagement.controller;


import com.rentmanagement.beans.*;
import com.rentmanagement.common.*;
import com.rentmanagement.common.JLogger;
import com.rentmanagement.model.*;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serializable;
import java.util.List;

/**
 */
@WebServlet(name = "Faq", urlPatterns = {"/faq"})
public class FaqController extends BaseServlet implements Serializable {

    private static final long serialVersionUID = 1L;

    Helper helper = new Helper();
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
    FaqContentBeanI faqContentBeanI;
    @EJB
    SettingBeanI settingBeanI;



    private final JLogger jLogger = new JLogger(this.getClass());

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        /* configuring the http headers */
        response.addHeader("X-XSS-Protection", "1; mode=block");
        response.addHeader("X-Frame-Options", "DENY");
        response.addHeader("X-Content-Type-Options", "nosniff");

        Company company = companyBeanI.find();
        request.setAttribute("company", company);
        Social social = socialBeanI.find();
        request.setAttribute("social", social);

        Theme theme = themeBeanI.find();
        request.setAttribute("theme", theme);
        request.setAttribute("noMenu", false);
        List<FaqContent> content = faqContentBeanI.find();
        request.setAttribute("content", content);
        Setting settings = settingBeanI.find();
        request.setAttribute("settings", settings);
        logActivity(Constants.PAGE_FAQ, "accessed faq page", null, null);
        request.getRequestDispatcher("faq.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        /* configuring the http headers */
        response.addHeader("X-XSS-Protection", "1; mode=block");
        response.addHeader("X-Frame-Options", "DENY");
        response.addHeader("X-Content-Type-Options", "nosniff");


    }
}
