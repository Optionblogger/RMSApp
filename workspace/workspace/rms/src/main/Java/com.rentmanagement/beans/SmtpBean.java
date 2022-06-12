package com.rentmanagement.beans;


import com.rentmanagement.common.Constants;
import com.rentmanagement.common.Helper;
import com.rentmanagement.common.JLogger;
import com.rentmanagement.model.SmtpSetup;

import java.util.List;
import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


@Local
@Stateless
public class SmtpBean implements SmtpI {
    @PersistenceContext
    private EntityManager entityManager;
    JLogger jLogger = new JLogger(this.getClass());
    Helper helper = new Helper();

    @Override
    public SmtpSetup getSmtpSetup() {
        List<SmtpSetup> smtpSetup=entityManager.createQuery("SELECT S FROM SmtpSetup S").getResultList();
        if(smtpSetup.size()>0)
            return smtpSetup.get(0);
        return null;


    }

    @Override
    public SmtpSetup saveSmtpSetup(SmtpSetup smtpSetup) {

        return entityManager.merge(smtpSetup);
    }

}
