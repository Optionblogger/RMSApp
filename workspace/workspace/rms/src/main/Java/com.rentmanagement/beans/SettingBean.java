package com.rentmanagement.beans;



import com.rentmanagement.common.Constants;
import com.rentmanagement.dao.SettingDAO;
import com.rentmanagement.model.Setting;

import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 */
@Local
@Stateless
public class SettingBean implements SettingBeanI {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Setting find() {
        SettingDAO dao = new SettingDAO(entityManager);
        return dao.find();
    }

    @Override
    public Setting edit(Setting setting) {
        SettingDAO dao = new SettingDAO(entityManager);
        return dao.merge(setting);
    }
}
