package com.rentmanagement.controller;


import com.rentmanagement.beans.*;
import com.rentmanagement.common.*;
import com.rentmanagement.common.Helper;
import com.rentmanagement.common.JLogger;
import com.rentmanagement.model.*;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.Serializable;
import java.util.List;

@WebServlet(name = "FindMemberAccount", urlPatterns = {"/find-agent-account"})
public class FindMemberAccount extends BaseServlet implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = -608556717440895L;

    Helper helper = new Helper();
    private final JLogger jLogger = new JLogger(this.getClass());

    @EJB
    UserBeanI userBeanI;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {




        if(this.get(request, "ACTION").equals("FIND_MEMBER")) {


            HttpSession session = request.getSession();


            String memberId = this.get(request, "memberNo");//membershipNumber

            request.getSession().setAttribute("membershipNumber", memberId);
            //  String ssnit = this.get(request, "ssnit");

            jLogger.i("The Membership Number is " + memberId);
            // jLogger.i("The SSNIT Number is " + ssnit);


            if (memberId != null) {

            //    member = apiEJB.checkMemberAccount(this.get(request, "category"), memberId);
               // String memberId1=agent.getId();

            }else this.respond(response,false,"MemberId is Null" ,null);

            if (memberId=="") {

              /*  String memberExistingEmail = member.getEmailAddress();
//                session.setAttribute(Constants.SCHEME_ID, member.getSchemeId());
                session.setAttribute("existingPhoneNumber" , member.getPhoneNumber());
                session.setAttribute("memberExistingEmail" , memberExistingEmail);
                session.setAttribute("memberId" , member.getId());
//*/
//
//                List<Sponsor> sponsors = apiEJB.getMemberSponsor(memberId);
//                session.setAttribute(Constants.SPONSOR_ID, sponsors.get(0).getId().toString());
//
//
//                request.getSession().setAttribute("sponsorName", sponsors.get(0).getCompanyName());
//

                this.respond(response, true, "<strong>Member Account Found  </strong><br /> " +
                        " You will be redirected to Account recovery Page", null);

            }else this.respond(response,false,"Member NOT found" , null);
        }

        /* configuring the http headers */
        response.addHeader("X-XSS-Protection", "1; mode=block");
        response.addHeader("X-Frame-Options", "DENY");
        response.addHeader("X-Content-Type-Options", "nosniff");

    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {

       /* configuring the http headers */
        response.addHeader("X-XSS-Protection", "1; mode=block");
        response.addHeader("X-Frame-Options", "DENY");
        response.addHeader("X-Content-Type-Options", "nosniff");





    }
}

