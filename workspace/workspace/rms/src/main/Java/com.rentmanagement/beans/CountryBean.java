package com.rentmanagement.beans;


import com.rentmanagement.common.Constants;
import com.rentmanagement.dao.CountryDAO;
import com.rentmanagement.model.Country;

import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

/**
 */
@Stateless
@Local
public class CountryBean implements CountryBeanI {


    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Country add(Country country) {
        CountryDAO dao = new CountryDAO(entityManager);
        return dao.save(country);
    }

    @Override
    public Country findById(long id) {
        CountryDAO dao = new CountryDAO(entityManager);
        return dao.findById(id);
    }

    @Override
    public Country edit(Country country) {
        CountryDAO dao = new CountryDAO(entityManager);
        return dao.merge(country);
    }

    @Override
    public List<Country> find() {
        CountryDAO dao = new CountryDAO(entityManager);
        return dao.findAll();
    }

    @Override
    public boolean delete(Country country) {
        CountryDAO dao = new CountryDAO(entityManager);
        return dao.remove(country);
    }
}
