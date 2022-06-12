package com.rentmanagement.beans;


import com.rentmanagement.dao.MemberPermissionDAO;
import com.rentmanagement.model.AgentPermission;

import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 */
@Local
@Stateless
public class AgentPermissionBean implements AgentPermissionBeanI {


    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public AgentPermission edit(AgentPermission agentPermission) {
        MemberPermissionDAO dao = new MemberPermissionDAO(entityManager);
        return dao.merge(agentPermission);
    }

    @Override
    public AgentPermission find() {
        MemberPermissionDAO dao = new MemberPermissionDAO(entityManager);
        return dao.find();
    }
}
