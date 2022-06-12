package com.rentmanagement.controller;



import com.rentmanagement.beans.*;
import com.rentmanagement.common.*;
import com.rentmanagement.common.Helper;
import com.rentmanagement.model.*;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serializable;
import java.util.List;

@WebServlet(name = "Activate", urlPatterns = {"/activate/*"})
public class Activate extends BaseServlet implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -347116347501412506L;
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
	LogoBeanI logoBeanI;
    Helper helper = new Helper();
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {  
		User u = userBeanI.findBySecurityCode(request.getQueryString());
                //u.getProfileID();
		if(u != null && !u.isStatus())
		{
			u.setStatus(true);
			userBeanI.edit(u);
			request.setAttribute("success", true);
			if(u.getUserProfile().equals(Constants.AGENT_PROFILE))
				request.setAttribute("page", "sign-in");
			else
				request.setAttribute("page", "login");
		}
		else
		{
			request.setAttribute("success", false);
		}

		List<Country> countries = countryBeanI.find();
		request.setAttribute("countries",  countries);
		List<Gender> genders = genderBeanI.find();
		request.setAttribute("genders",  genders);
		Company company = companyBeanI.find();
		request.setAttribute("company", company);
		Social social = socialBeanI.find();
		request.setAttribute("social", social);
		Setting settings = settingBeanI.find();
		request.setAttribute("settings", settings);
		String plf = profileLoginFieldBeanI.findByProfile(Constants.AGENT_PROFILE);
		request.setAttribute("plf", plf);
		List<ImageBanner> imageBanners = imageBannerBeanI.find();
		request.setAttribute("imageBanners", imageBanners);
		List<Logo> logos = logoBeanI.find();
		request.setAttribute("logos", logos);
		Theme theme = themeBeanI.find();
		request.setAttribute("theme", theme);
		Help help = helpBeanI.findHelp(Constants.PAGE_HOME);
		request.setAttribute("help", help);
		PageContent content = pageContentBeanI.findPageContent(Constants.PAGE_HOME);
                
                String memberId=u.getProfileID().toString();
                String operationType="ACCOUNT_ACTIVATION";
                String operationStatus="SUCCESS";
                
                //api call
               // apiEJB.mssAccountOperation(memberId,operationType,operationStatus,null,null,null);
                

		/* configuring the http headers */

		request.setAttribute("content", content);
		request.setAttribute("noMenu", false);
		response.addHeader("X-XSS-Protection", "1; mode=block");
		response.addHeader("X-Frame-Options", "DENY");
		response.addHeader("X-Content-Type-Options", "nosniff");


		request.getRequestDispatcher("activate.jsp").forward(request, response);
	}
}
