package com.rentmanagement.dao;


import com.rentmanagement.model.AgentMenu;

import javax.persistence.EntityManager;
import java.util.List;

public class AgentMenuDAO extends GenericDAOImpl<AgentMenu, Long> {

    public AgentMenuDAO(EntityManager entityManager)
    {
        super(AgentMenu.class, entityManager);
    }

    public AgentMenu find()
    {
        List<AgentMenu> menuList = this.findAll();
        return menuList.size() > 0 ? menuList.get(0) : null;
    }
}
