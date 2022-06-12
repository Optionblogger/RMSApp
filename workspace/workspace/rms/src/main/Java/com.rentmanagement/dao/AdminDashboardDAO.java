package com.rentmanagement.dao;


import com.rentmanagement.model.LandloardDashboardItems;

import javax.persistence.EntityManager;
import java.util.List;

public class AdminDashboardDAO extends GenericDAOImpl<LandloardDashboardItems, Long> {

    public AdminDashboardDAO(EntityManager entityManager)
    {
        super(LandloardDashboardItems.class, entityManager);
    }

    public LandloardDashboardItems find()
    {
        List<LandloardDashboardItems> adminDashboardItemses = this.findAll();
        return adminDashboardItemses.size() > 0 ? adminDashboardItemses.get(0) : null;
    }
}
