package com.rentmanagement.beans;


import com.rentmanagement.model.Agent;

import javax.ejb.Local;
import java.util.List;

@Local
public interface AgentBeanI {
    Agent edit(Agent agent);

    Agent add(Agent Agent);

    Agent findById(long id);

    List<Agent> find();

    int getCount(Long propId);

    boolean delete(Agent agent);

/*
    Agent findByIdnumber(String idnumber);
*/

    Agent findByUser(String username);
    Agent findByNumber(String agentNo);




}
