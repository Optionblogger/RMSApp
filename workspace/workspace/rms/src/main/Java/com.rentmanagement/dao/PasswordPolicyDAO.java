package com.rentmanagement.dao;

import com.rentmanagement.model.PasswordPolicy;

import javax.persistence.EntityManager;

public class PasswordPolicyDAO extends GenericDAOImpl<PasswordPolicy, Long> {
    public PasswordPolicyDAO(EntityManager entityManager)
    {
        super(PasswordPolicy.class, entityManager);
    }
}
