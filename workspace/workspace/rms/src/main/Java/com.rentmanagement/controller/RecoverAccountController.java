package com.rentmanagement.controller;


import com.rentmanagement.beans.*;
import com.rentmanagement.common.*;
import com.rentmanagement.common.Helper;
import com.rentmanagement.common.JLogger;

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


@WebServlet(name = "RecoverAccountController", urlPatterns = {"/recover-account"})
public class RecoverAccountController extends BaseServlet implements Serializable {

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

        /* configuring the http headers */
        response.addHeader("X-XSS-Protection", "1; mode=block");
        response.addHeader("X-Frame-Options", "DENY");
        response.addHeader("X-Content-Type-Options", "nosniff");

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("recover-account.jsp");
        requestDispatcher.forward(request,response);

    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {

       /* configuring the http headers */
        response.addHeader("X-XSS-Protection", "1; mode=block");
        response.addHeader("X-Frame-Options", "DENY");
        response.addHeader("X-Content-Type-Options", "nosniff");

        HttpSession session = request.getSession();

        String email = this.get(request, "email");//membershipNumber
        String phone = this.get(request, "phoneNumber");//membershipNumber
        String ssnitNumber  =this.get(request, "ssnit");
        String membershipNumber = String.valueOf(session.getAttribute("membershipNumber"));
        String memberId = String.valueOf(session.getAttribute("memberId"));
        String operationType = "ACCOUNT_RECOVERY";
        String operationStatus = "";


        jLogger.i("The email set is===================================> " + email);
        jLogger.i("The phone set is===================================> " + phone);
        jLogger.i("The ssnitNumber set is===================================> " + ssnitNumber);
        jLogger.i("The membershipNumber set is===================================> " + membershipNumber);
        jLogger.i("The memberId is===================================> " + memberId);


        boolean status;


     /*   status =apiEJB.saveMemberAccountBySchemeAndMembershipNumber(email,phone,ssnitNumber,membershipNumber,null);
        if (status) {
            apiEJB.sendSMS(phone,"Member details have been successfully saved. You Can Now Register To MSS Portal");

            
             operationStatus="SUCCESS";
        
              apiEJB.mssAccountOperation(memberId, operationType, operationStatus,email,phone,ssnitNumber);
              this.respond(response, true, "Member details have been successfully saved. You Can Now Register To MSS Portal" , null);
        }*/
       /* else{
              operationStatus="FAILED";
        
              apiEJB.mssAccountOperation(memberId, operationType, operationStatus,email,phone,ssnitNumber);
              this.respond(response, false, "Member details could not be saved. We apologise for the inconvenience.", null);
             
        
        }*/

     //   this.recoverAccount(request,response);



    }
}

