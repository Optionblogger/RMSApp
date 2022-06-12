package com.rentmanagement.beans;

import com.rentmanagement.common.Constants;

import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;
import com.rentmanagement.model.ProfileLoginField;
import com.rentmanagement.dao.ProfileLoginFieldDAO;

@Stateless
@Local
public class ProfileLoginFieldBean implements ProfileLoginFieldBeanI {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public ProfileLoginField edit(ProfileLoginField profileLoginField) {
        ProfileLoginFieldDAO dao = new ProfileLoginFieldDAO(entityManager);
        return dao.merge(profileLoginField);
    }

    @Override
    public String findByProfile(String profile) {
        ProfileLoginFieldDAO dao = new ProfileLoginFieldDAO(entityManager);
        ProfileLoginField profileLoginField = dao.findByProfile(profile);
        return profileLoginField == null ? null : profileLoginField.getOrdinal();
    }

    @Override
    public ProfileLoginField find(String profile) {
        ProfileLoginFieldDAO dao = new ProfileLoginFieldDAO(entityManager);
        return dao.findByProfile(profile);
    }
    @Override
    public List<ProfileLoginField> find() {
        ProfileLoginFieldDAO dao = new ProfileLoginFieldDAO(entityManager);
        return dao.findAll();
    }
}
