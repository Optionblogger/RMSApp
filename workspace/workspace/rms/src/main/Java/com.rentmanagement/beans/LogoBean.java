package com.rentmanagement.beans;

import com.rentmanagement.common.Constants;

import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;
import com.rentmanagement.model.Logo;
import com.rentmanagement.dao.LogoDAO;

@Local
@Stateless
public class LogoBean implements LogoBeanI {

	@PersistenceContext
	private EntityManager entityManager;

	    @Override
	    public Logo add(Logo logo) {
	    	LogoDAO dao = new LogoDAO(entityManager);
	        return dao.update(logo);
	    }
	    
	    @Override
	    public List<Logo> findAll() {
	    	LogoDAO dao = new LogoDAO(entityManager);
	    	return dao.findAll();
	    }

	    @Override
	    public Logo findById(long id) {
	        LogoDAO dao = new LogoDAO(entityManager);
	        return dao.findById(id);
	    }

	    @Override
	    public boolean delete(Logo logo) {
	        LogoDAO dao = new LogoDAO(entityManager);
	        return dao.remove(logo);
	    }

	    @Override
	    public List<Logo> find() {
	        LogoDAO dao = new LogoDAO(entityManager);
	        return dao.findAll();
	    }
}
