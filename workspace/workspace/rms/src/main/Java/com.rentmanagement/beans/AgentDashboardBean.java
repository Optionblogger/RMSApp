package com.rentmanagement.beans;

import com.rentmanagement.dao.MemberDashboardDAO;
import com.rentmanagement.model.AgentDashboardItems;

import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Local
@Stateless
public class AgentDashboardBean implements AgentDashboardBeanI {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public AgentDashboardItems find() {
        MemberDashboardDAO dao = new MemberDashboardDAO(entityManager);
        return dao.find();
    }

    @Override
    public AgentDashboardItems edit(AgentDashboardItems agentDashboardItems) {
        MemberDashboardDAO dao = new MemberDashboardDAO(entityManager);
        return dao.merge(agentDashboardItems);
    }
}
