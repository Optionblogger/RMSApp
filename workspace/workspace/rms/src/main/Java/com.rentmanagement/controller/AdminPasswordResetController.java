package com.rentmanagement.controller;



import com.rentmanagement.beans.*;
import com.rentmanagement.common.*;
import com.rentmanagement.model.*;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;



@WebServlet(name = "AdminPasswordResetController", urlPatterns = {"/password-reset-admin"})
public class AdminPasswordResetController extends BaseServlet implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = -6085562604717440895L;

    Helper helper = new Helper();
    private final JLogger jLogger = new JLogger(this.getClass());

    @EJB
    UsedPasswordBeanI usedPasswordBeanI;
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
    PasswordPolicyBeanI passwordPolicyBeanI;


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

		/* configuring the http headers */
        response.addHeader("X-XSS-Protection", "1; mode=block");
        response.addHeader("X-Frame-Options", "DENY");
        response.addHeader("X-Content-Type-Options", "nosniff");

        Company company = companyBeanI.find();
        request.setAttribute("company", company);
        Setting settings = settingBeanI.find();
        request.setAttribute("settings", settings);
        Social social = socialBeanI.find();
        request.setAttribute("social", social);

        Theme theme = themeBeanI.find();
        request.setAttribute("theme", theme);
        request.setAttribute("noMenu", false);
        request.getRequestDispatcher("password-reset-admin.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {


        /* configuring the http headers */
        response.addHeader("X-XSS-Protection", "1; mode=block");
        response.addHeader("X-Frame-Options", "DENY");
        response.addHeader("X-Content-Type-Options", "nosniff");

        if (this.get(request, "ACTION").equals("RESET_PASSWORD_ADMIN")) {
            PasswordPolicy policy = passwordPolicyBeanI.find();
            String resetCode = this.get(request, "resetCodeA");
            User u = userBeanI.findByActivationCode(resetCode);
            if (u != null) {
                if (u.getSmsActivationCode().equalsIgnoreCase(resetCode)) {
                    if (!(usedPasswordBeanI.isUsed(this.get(request, "newPassword")) && policy.isPassword_reuse())) {
                        Date password_expiry = helper.addDays(new Date(), policy.getExpiry_days());
                        u.setPassword_expiry(password_expiry);
                        u.setPassword(helper.hash(this.get(request, "newPassword")));
                        u.setSmsActivationCode(null);
                        if (userBeanI.edit(u) != null)
                        {
                           // apiEJB.mssAccountOperation(u.getProfileID().toString(), "PASSWORD_RESET", "SUCCESS", null, null, null);

                            this.respond(response, true, "Your password has been reset successfully", null);
                        } else {
                           // apiEJB.mssAccountOperation(u.getProfileID().toString(), "PASSWORD_RESET", "FAILED", null, null, null);

                            this.respond(response, false, "Sorry, your password could not be reset", null);
                        }
                    } else {
                        //apiEJB.mssAccountOperation(u.getProfileID().toString(),"PASSWORD_RESET", "FAILED", null, null, null);

                        this.respond(response, false, "Sorry, the new password entered has already been used once. You cannot re-use the password.", null);

                    }

                } else {
                   // apiEJB.mssAccountOperation(u.getProfileID().toString(), "PASSWORD_RESET", "FAILED", null, null, null);

                    this.respond(response, false, "Sorry, your security code is invalid. Please enter a valid security code.", null);

                }
            } else {

                u = userBeanI.findBySecurityCode(resetCode);
                if (u != null) {
                    if (u.getSecurityCode().equalsIgnoreCase(resetCode)) {
                        if (!(usedPasswordBeanI.isUsed(this.get(request, "newPassword")) && policy.isPassword_reuse())) {
                            Date password_expiry = helper.addDays(new Date(), policy.getExpiry_days());
                            u.setPassword_expiry(password_expiry);
                            u.setPassword(helper.hash(this.get(request, "newPassword")));
                            u.setSecurityCode(null);
                            if (userBeanI.edit(u) != null)
                                this.respond(response, true, "Your password has been reset successfully", null);
                            else
                                this.respond(response, false, "Sorry, your password could not be reset", null);
                        } else {
                            this.respond(response, false, "Sorry, the new password entered has already been used once. You cannot re-use the password.", null);

                        }

                    } else {
                        this.respond(response, false, "Sorry, your security code is invalid. Please enter a valid security code.", null);

                    }
                } else {
                    //apiEJB.mssAccountOperation(u.getProfileID().toString(), "PASSWORD_RESET", "FAILED", null, null, null);

                    this.respond(response, false, "The security code you entered is wrong. Please try again.", null);

                }

            }
        } else if (this.get(request, "ACTION").equals("REQUEST_RESET_ADMIN")) {
            Setting settings = settingBeanI.find();
            Constants.BASE_URL = request.getContextPath() + "password-reset-admin";

            String username = this.get(request, "AUsername");//case employerid   EF45353535
            jLogger.i("The Username " + username);
            User usr = userBeanI.findByUsername(username);
            if (usr != null) {
                String userProfile = usr.getUserProfile();

                if (helper.isValidPhone(username) || username!=null && !helper.isEmailAddress(username)) {

                    String resetCode = helper.randomNumber().toString();
                    usr.setSmsActivationCode(resetCode);
                    usr.setAttempt(0);
                    usr.setStatus(true);

                    Company company = companyBeanI.find();
                    String phone = null;

                    //XiMember member = null;

                    if (usr.getUserProfile().equals(Constants.AGENT_PROFILE)) {
                        //member = apiEJB.getMemberDetails(usr.getProfileID().toString(), null);
                        //phone = member.getPhoneNumber();
                        jLogger.i("PHONENUMBER IS " + phone);

                    } else {
                        //member = apiEJB.memberExists(userProfile, username);
                        //phone = member.getPhoneNumber();
                        jLogger.i("PHONENUMBER IS " + phone);


                    }

                    boolean status = false;

                    try {

                  /*      status = apiEJB.sendSMS(phone, "Dear " + usr.getUserProfile() + " ,"
                                + "You have requested to change your password. "
                                + "Your Reset code is: " + resetCode
                        );*/

                        jLogger.i("Your Status is ====== " + status);
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }

                    if (status) {
                        if (userBeanI.edit(usr) != null) {
                            // apiEJB.mssAccountOperation(usr.getProfileID().toString(), " PASSWORD_RESET", "SUCCESS", null, null, null);
                            this.respond(response, true, "The password reset instructions have been sent to your Phone Number", null);
                        } else {
                            //apiEJB.mssAccountOperation(usr.getProfileID().toString(), " PASSWORD_RESET", "FAILED", null, null, null);

                            this.respond(response, false, "We are sorry, but we were unable to send you the password reset instructions", null);

                        }

                    } else {
                        //apiEJB.mssAccountOperation(usr.getProfileID().toString(), " PASSWORD_RESET", "FAILED", null, null, null);

                        this.respond(response, false, "We are sorry, but we were unable to send you the password reset instructions", null);

                    }

                }else  if (helper.isEmailAddress(username)) {
                    String securityCode = UUID.randomUUID().toString();
                    usr.setSecurityCode(securityCode);
                    usr.setAttempt(0);
                    usr.setStatus(true);
                    Company company = companyBeanI.find();
                    Emails emails = emailsBeanI.find();

                    String sender = emails.getDefaultEmail();
                    //XiMember m = null;



                    boolean status = false;
                    String recipient = usr.getUsername();

                    try {
                        status = emailsBeanI.sendEmail("Dear " + usr.getUsername() + ", " + "You recently requested to change your password. "
                                + "Here is your security code:" + "" + securityCode
                                + "\nYou will require it to be able to change your password", recipient, "Change password Request", emails.getDefaultEmail(), null);
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }


                    if (status) {
                        if (userBeanI.edit(usr) != null)
                            this.respond(response, true, "The password reset instructions have been sent to your email address", null);
                        else
                            this.respond(response, false, "We are sorry,  we were unable to send you the password reset instructions", null);
                    } else {
                        this.respond(response, false, "We are sorry,  we were unable to send you the password reset instructions", null);

                    }
                }else {
                    this.respond(response, false, "We are sorry, We could not Find the User with the Username provided", null);

                }
            } else {
                this.respond(response, false, "We are sorry, We could not Find the User with the Username provided", null);

            }
        }

    }
}
