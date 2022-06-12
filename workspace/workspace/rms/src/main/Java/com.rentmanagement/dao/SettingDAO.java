package com.rentmanagement.dao;

import com.rentmanagement.model.Setting;

import javax.persistence.EntityManager;
import java.util.List;


public class SettingDAO extends GenericDAOImpl<Setting, Long> {
	
    public SettingDAO(EntityManager entityManager)
    {
        super(Setting.class, entityManager);
    }

    public Setting find()
    {
        List<Setting> settingList = this.findAll();
        return settingList != null && settingList.size() > 0 ? settingList.get(0) : null;
    }
}
