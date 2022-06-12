package com.rentmanagement.beans;


import com.rentmanagement.model.Emails;

import javax.ejb.Local;


@Local
public interface EmailsBeanI {

    Emails edit(Emails emails);
    Emails find();
    boolean sendEmail(String message,String to,String subject);
    boolean sendEmail(String message,String to,String subject,String from,String[] attachFiles);
}
