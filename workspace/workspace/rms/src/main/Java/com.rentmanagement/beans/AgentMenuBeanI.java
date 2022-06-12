package com.rentmanagement.beans;


import com.rentmanagement.model.AgentMenu;

import javax.ejb.Local;



@Local
public interface AgentMenuBeanI {
    AgentMenu find();
    AgentMenu edit(AgentMenu agentMenu);
}
