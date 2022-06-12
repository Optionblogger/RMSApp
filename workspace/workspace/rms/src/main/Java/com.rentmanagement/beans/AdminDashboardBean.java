package com.rentmanagement.beans;


import com.rentmanagement.dao.AdminDashboardDAO;
import com.rentmanagement.model.LandloardDashboardItems;

import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;


@Local
@Stateless
public class AdminDashboardBean implements AdminDashboardI {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public LandloardDashboardItems find() {
        AdminDashboardDAO dao = new AdminDashboardDAO(entityManager);
        return dao.find();
    }

    public List<LandloardDashboardItems> findAll(){
        AdminDashboardDAO dao = new AdminDashboardDAO(entityManager);
        return dao.findAll();
    }

    @Override
    public LandloardDashboardItems edit(LandloardDashboardItems adminDashboardItems) {
        AdminDashboardDAO dao = new AdminDashboardDAO(entityManager);
        return dao.merge(adminDashboardItems);
    }
}
