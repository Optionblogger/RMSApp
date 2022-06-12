package com.rentmanagement.dao;


import com.rentmanagement.model.AgentPermission;

import javax.persistence.EntityManager;
import java.util.List;

public class MemberPermissionDAO extends GenericDAOImpl<AgentPermission, Long> {
    public MemberPermissionDAO(EntityManager entityManager)
    {
        super(AgentPermission.class, entityManager);
    }

    public AgentPermission find()
    {
        List<AgentPermission> agentPermissionList = this.findAll();
        return agentPermissionList.size() > 0 ? agentPermissionList.get(0) : null;
    }
}
