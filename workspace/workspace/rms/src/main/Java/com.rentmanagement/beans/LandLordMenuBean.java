package com.rentmanagement.beans;

import com.rentmanagement.dao.LandLordMenuDAO;
import com.rentmanagement.model.LandlordMenu;

import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;


@Local
@Stateless
public class LandLordMenuBean implements LandLordMenuBeanI {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<LandlordMenu> find() {
        LandLordMenuDAO dao = new LandLordMenuDAO(entityManager);
        return dao.findAll();
    }

    @Override
    public LandlordMenu edit(LandlordMenu landLordMenu) {
        LandLordMenuDAO dao = new LandLordMenuDAO(entityManager);
        return dao.merge(landLordMenu);
    }

    @Override
    public LandlordMenu add(LandlordMenu landlordMenu) {
        LandLordMenuDAO dao = new LandLordMenuDAO(entityManager);
        return dao.save(landlordMenu);
    }

    @Override
    public LandlordMenu findByProfile(String profile) {
        LandLordMenuDAO dao = new LandLordMenuDAO(entityManager);
        return dao.findByProfile(profile);
    }
}
