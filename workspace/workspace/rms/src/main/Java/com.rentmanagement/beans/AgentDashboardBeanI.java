package com.rentmanagement.beans;


import com.rentmanagement.model.AgentDashboardItems;

import javax.ejb.Local;


@Local
public interface AgentDashboardBeanI {

    AgentDashboardItems find();
    AgentDashboardItems edit(AgentDashboardItems agentDashboardItems);
}
