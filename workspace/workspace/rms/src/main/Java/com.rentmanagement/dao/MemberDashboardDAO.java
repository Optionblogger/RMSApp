package com.rentmanagement.dao;



import com.rentmanagement.model.AgentDashboardItems;

import javax.persistence.EntityManager;
import java.util.List;

public class MemberDashboardDAO extends GenericDAOImpl<AgentDashboardItems, Long> {

    public MemberDashboardDAO(EntityManager entityManager)
    {
        super(AgentDashboardItems.class, entityManager);
    }

    public AgentDashboardItems find()
    {
        List<AgentDashboardItems> agentDashboardItems = this.findAll();
        return agentDashboardItems.size() > 0 ? agentDashboardItems.get(0) : null;
    }
}
