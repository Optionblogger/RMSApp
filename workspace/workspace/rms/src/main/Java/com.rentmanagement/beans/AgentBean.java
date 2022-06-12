package com.rentmanagement.beans;

import com.rentmanagement.dao.AgentDAO;
import com.rentmanagement.model.Agent;

import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Stateless
@Local
public class AgentBean implements AgentBeanI {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Agent edit(Agent agent) {
        AgentDAO dao = new AgentDAO(entityManager);
        return dao.merge(agent);
    }

    @Override
    public Agent add(Agent agent) {
        AgentDAO dao = new AgentDAO(entityManager);
        return dao.save(agent);
    }

    @Override
    public Agent findById(long id) {
        AgentDAO dao = new AgentDAO(entityManager);
        return dao.findById(id);
    }

    @Override
    public List<Agent> find() {
        AgentDAO dao = new AgentDAO(entityManager);
        return dao.findAll();
    }

    @Override
    public boolean delete(Agent agent) {
        AgentDAO dao = new AgentDAO(entityManager);
        return dao.remove(agent);
    }
/*
    @Override
    public Agent findByIdnumber(String idnumber) {
        AgentDAO dao = new AgentDAO(entityManager);
        return dao.findByIdnumber(idnumber);
    }*/

    @Override
    public Agent findByUser(String username) {
        AgentDAO dao = new AgentDAO(entityManager);
        return dao.findByUser(username);
    }

    @Override
    public Agent findByNumber(String agentNo) {
        AgentDAO dao = new AgentDAO(entityManager);
        return dao.findByNumber(agentNo);
    }

    @Override
    public int getCount(Long propId) {
        AgentDAO dao = new AgentDAO(entityManager);

        return dao.getCount(propId);
    }
}
