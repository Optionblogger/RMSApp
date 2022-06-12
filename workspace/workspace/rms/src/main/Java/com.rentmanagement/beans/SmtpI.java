package com.rentmanagement.beans;


import com.rentmanagement.model.SmtpSetup;

import javax.ejb.Local;

@Local
public interface SmtpI {
    SmtpSetup getSmtpSetup();
    SmtpSetup saveSmtpSetup(SmtpSetup smtpSetup);
}
