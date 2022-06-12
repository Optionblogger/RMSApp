package com.rentmanagement.dao;


import javax.persistence.EntityManager;
import com.rentmanagement.model.ProfileName;


public class ProfileNameDAO extends GenericDAOImpl<ProfileName, Long> {
    public ProfileNameDAO(EntityManager entityManager)
    {
        super(ProfileName.class, entityManager);
    }
}
