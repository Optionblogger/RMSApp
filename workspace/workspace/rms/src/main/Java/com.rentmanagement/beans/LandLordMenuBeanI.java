package com.rentmanagement.beans;

import com.rentmanagement.model.LandlordMenu;

import javax.ejb.Local;
import java.util.List;

@Local
public interface LandLordMenuBeanI {
    List<LandlordMenu> find();

    LandlordMenu edit(LandlordMenu landLordMenu);

    LandlordMenu add(LandlordMenu landlordMenu);

    LandlordMenu findByProfile(String profile);
}
