package com.rentmanagement.beans;

import com.rentmanagement.dao.AgentMenuDAO;
import com.rentmanagement.model.AgentMenu;

import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 */
@Stateless
@Local
public class AgentMenuBean implements AgentMenuBeanI {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public AgentMenu find() {
        AgentMenuDAO dao = new AgentMenuDAO(entityManager);
        return dao.find();
    }

    @Override
    public AgentMenu edit(AgentMenu agentMenu) {
        AgentMenuDAO dao = new AgentMenuDAO(entityManager);
        return dao.merge(agentMenu);
    }
}
