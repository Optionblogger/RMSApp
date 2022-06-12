package com.rentmanagement.dao;

import com.rentmanagement.model.Company;

import javax.persistence.EntityManager;
import java.util.List;

public class CompanyDAO extends GenericDAOImpl<Company, Long> {
    public CompanyDAO(EntityManager entityManager)
    {
        super(Company.class, entityManager);
    }

    public Company find()
    {
        List<Company> companyList = findAll();
        if(companyList != null) {
            return companyList.size() > 0 ? companyList.get(0) : null;
        }
        return null;
    }
}
