package com.rentmanagement.beans;

import com.rentmanagement.model.LandloardDashboardItems;

import java.util.List;

public interface AdminDashboardI {

    LandloardDashboardItems find();
    List<LandloardDashboardItems> findAll();
    LandloardDashboardItems edit(LandloardDashboardItems adminDashboardItems);
}
