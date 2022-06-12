package com.rentmanagement.dao;


import com.rentmanagement.model.Gender;

import javax.persistence.EntityManager;


public class GenderDAO extends GenericDAOImpl<Gender, Long> {
    public GenderDAO(EntityManager entityManager)
    {
        super(Gender.class, entityManager);
    }
}
