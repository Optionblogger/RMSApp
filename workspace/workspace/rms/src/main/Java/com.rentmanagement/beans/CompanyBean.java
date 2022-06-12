package com.rentmanagement.beans;


import com.rentmanagement.common.Constants;
import com.rentmanagement.dao.CompanyDAO;
import com.rentmanagement.model.Company;

import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 */
@Local
@Stateless
public class CompanyBean implements CompanyBeanI {

    @PersistenceContext    private EntityManager entityManager;
    @Override
    public Company edit(Company company) {
        CompanyDAO dao = new CompanyDAO(entityManager);
        return dao.merge(company);
    }

    @Override
    public Company find() {
        CompanyDAO dao = new CompanyDAO(entityManager);
        return dao.find();
    }
}
