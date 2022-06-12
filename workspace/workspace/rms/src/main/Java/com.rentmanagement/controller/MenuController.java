package com.rentmanagement.controller;


import com.rentmanagement.beans.*;
import com.rentmanagement.common.Actions;
import com.rentmanagement.common.Constants;
import com.rentmanagement.common.Helper;
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
@WebServlet(name = "MenuController", urlPatterns = {"/menu"})
public class MenuController extends BaseServlet implements Serializable {
	public MenuController() {
		// TODO Auto-generated constructor stub
	}
	private static final long serialVersionUID = 1L;

    Helper helper = new Helper();
    JLogger jLogger = new JLogger(this.getClass());

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
    EmailsBeanI emailsBeanI;
    @EJB
    SocialBeanI socialBeanI;

    @EJB
    AccountRecoveryBeanI accountRecoveryBeanI;


    @EJB
    AgentMenuBeanI agentMenuBeanI;

    @EJB
    AgentDashboardBeanI agentDashboardBeanI;
    @EJB
    AdminDashboardI adminDashboardI;
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
    @EJB
    PermissionBeanI permissionBeanI;
    @EJB
    PasswordPolicyBeanI passwordPolicyBeanI;

    @EJB
    AgentPermissionBeanI agentPermissionBeanI;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

	    /* configuring the http headers */
        response.addHeader("X-XSS-Protection", "1; mode=block");
        response.addHeader("X-Frame-Options", "DENY");
        response.addHeader("X-Content-Type-Options", "nosniff");

		String REPO_FOLDER = "menu";
        String action = this.get(request, REPO_FOLDER);
        switch (action) {
            case Actions.DASHBOARD_SETUP:
                showSetup(request, response, REPO_FOLDER);
                break;

          /*  case Actions.DASHBOARD_CALC_LOGS:
                showCalcLog(request, response, REPO_FOLDER);
                break;*/
            case Actions.CONTENT:
                showContent(request, response, REPO_FOLDER);
                break;

            case Actions.MEDIA:
                showMedia(request, response, REPO_FOLDER);
                break;
            case Actions.UAC:
                showUserAccessControl(request, response, REPO_FOLDER);
                break;

        }
    }

    private void showUserAccessControl(HttpServletRequest request, HttpServletResponse response, String REPO_FOLDER) throws ServletException, IOException {
        AgentPermission agentPermission = agentPermissionBeanI.find();
        request.setAttribute("agentPermission", agentPermission);

        AgentMenu agentMenu = agentMenuBeanI.find();
        request.setAttribute("agentMenu", agentMenu);
        AgentDashboardItems agentDashboardItems = agentDashboardBeanI.find();
        request.setAttribute("agentDashboard", agentDashboardItems);
        LandloardDashboardItems adminDashboardItems = adminDashboardI.find();
        request.setAttribute("adminDashboard", adminDashboardItems);
        List<ProfileLoginField> pfs = profileLoginFieldBeanI.find();
        request.setAttribute("plfs", pfs);

        List<ProfileName> profileNames = profileNameBeanI.find();
        request.setAttribute("profileNames", profileNames);

        List<Ordinal> ordinals = helper.getOrdinals();
        jLogger.i("Ordinals are >>>>>>>>>>> " + ordinals + " <<<<<<<<<<<<<<");
        request.setAttribute("ordinals", ordinals);


         Permission permissions = getPermissions(request);
        request.setAttribute("permissions", permissions);
        PasswordPolicy policy = passwordPolicyBeanI.find();
        request.setAttribute("policy", policy);
        request.getRequestDispatcher(REPO_FOLDER + "/uac.jsp").forward(request, response);
    }
    private void showMedia(HttpServletRequest request, HttpServletResponse response, String REPO_FOLDER) throws ServletException, IOException {
        List<ProfileName> profiles = profileNameBeanI.find();
        request.setAttribute("profiles", profiles);
        String profile = this.getSessKey(request, Constants.U_PROFILE);
        request.setAttribute("profile", profile);
//        List<Scheme> schemes = apiEJB.getProfileSchemes(this.getSessKey(request, Constants.USER),
//                this.getSessKey(request, Constants.U_PROFILE));
//        request.setAttribute("schemes", schemes);


        jLogger.i("The profile is: " + profile);

        request.getRequestDispatcher(REPO_FOLDER + "/media.jsp").forward(request, response);
    }
    private void showMember(HttpServletRequest request, HttpServletResponse response, String REPO_FOLDER) throws ServletException, IOException {
        AgentMenu agentMenu = agentMenuBeanI.find();
        request.setAttribute("agentMenu", agentMenu);
        request.getRequestDispatcher(REPO_FOLDER + "/agent.jsp").forward(request, response);
    }
    private void showContent(HttpServletRequest request, HttpServletResponse response, String REPO_FOLDER) throws ServletException, IOException {
        Permission permissions = getPermissions(request);
        request.setAttribute("permissions", permissions);
        request.getRequestDispatcher(REPO_FOLDER + "/content.jsp").forward(request, response);
    }

    private void showSetup(HttpServletRequest request, HttpServletResponse response, String REPO_FOLDER) throws ServletException, IOException {
        List<Country> countries = countryBeanI.find();
        request.setAttribute("countries",  countries);
        Company company = companyBeanI.find();
        request.setAttribute("company", company);
        Emails email = emailsBeanI.find();
        request.setAttribute("email", email);
        Social social = socialBeanI.find();
        request.setAttribute("social", social);

        AccountRecovery accountRecovery =accountRecoveryBeanI.find();
        request.setAttribute("accountRecovery", accountRecovery);


        Setting settings = settingBeanI.find();
        request.setAttribute("settings", settings);
        Theme theme = themeBeanI.find();
        request.setAttribute("theme", theme);
        List<ImageBanner> imageBanners = imageBannerBeanI.find();
        request.setAttribute("imageBanners", imageBanners);
        List<Logo> logos = logoBeanI.find();
        request.setAttribute("logos", logos);
        List<Ordinal> ordinals = helper.getOrdinals();
        request.setAttribute("ordinals", ordinals);
        Permission permissions = getPermissions(request);
        request.setAttribute("permissions", permissions);
        request.getRequestDispatcher(REPO_FOLDER + "/setup.jsp").forward(request, response);
    }
}
