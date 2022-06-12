package com.rentmanagement.beans;


import com.rentmanagement.common.Constants;

import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;
import com.rentmanagement.model.ProfileName;
import com.rentmanagement.dao.ProfileNameDAO;


@Stateless
@Local
public class ProfileNameBean implements ProfileNameBeanI {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public ProfileName edit(ProfileName profileName) {
        ProfileNameDAO dao = new ProfileNameDAO(entityManager);
        return dao.merge(profileName);
    }

    @Override
    public List<ProfileName> find() {
        ProfileNameDAO dao = new ProfileNameDAO(entityManager);
        return dao.findAll();
    }
}
