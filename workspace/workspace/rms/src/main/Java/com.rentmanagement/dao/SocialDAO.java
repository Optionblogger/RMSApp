package com.rentmanagement.dao;

import com.rentmanagement.model.Social;

import javax.persistence.EntityManager;


public class SocialDAO extends GenericDAOImpl<Social, Long> {
    public SocialDAO(EntityManager entityManager)
    {
        super(Social.class, entityManager);
    }
}
