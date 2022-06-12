package com.rentmanagement.dao;

import com.rentmanagement.model.Emails;

import javax.persistence.EntityManager;
import java.util.List;


public class EmailsDAO extends GenericDAOImpl<Emails, Long> {
    public EmailsDAO(EntityManager entityManager) {super(Emails.class, entityManager);}

    public Emails find() {
        List<Emails> emailsList = findAll();
        if (emailsList != null) {
            return emailsList.size() > 0 ? emailsList.get(0) : null;
        }
        return null;
    }
}
