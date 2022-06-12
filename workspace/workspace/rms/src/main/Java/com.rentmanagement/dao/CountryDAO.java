package com.rentmanagement.dao;


import com.rentmanagement.model.Country;

import javax.persistence.EntityManager;


public class CountryDAO extends GenericDAOImpl<Country, Long> {
    public CountryDAO(EntityManager entityManager)
    {
        super(Country.class, entityManager);
    }
    
    
}
