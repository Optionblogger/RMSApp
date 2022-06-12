package com.rentmanagement.beans;


import com.rentmanagement.model.AgentPermission;

import javax.ejb.Local;

@Local
public interface AgentPermissionBeanI {

    AgentPermission edit(AgentPermission agentPermission);
    AgentPermission find();

}
