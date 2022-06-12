package com.rentmanagement.dao;

import com.rentmanagement.model.Logo;
import javax.persistence.EntityManager;

public class LogoDAO extends GenericDAOImpl<Logo, Long> {
	
	public LogoDAO(EntityManager entityManager)
	
    {
        super(Logo.class, entityManager);
    }

}
