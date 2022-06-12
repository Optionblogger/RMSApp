package com.rentmanagement.dao;


import com.rentmanagement.model.Agent;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.List;

public class AgentDAO extends GenericDAOImpl<Agent, Long> {

    private final EntityManager em;

    public AgentDAO(EntityManager entityManager) {
        super(Agent.class, entityManager);
        em = entityManager;
    }

   /* public Agent findByIdnumber(String idnumber) {
        String sql = "SELECT * from tbl_agents WHERE idNumber =:idnumber";
        Query query = em.createNativeQuery(sql, Agent.class);
        query.setParameter("idnumber", idnumber);
        return query.getResultList().size() > 0 ? (Agent) query.getResultList().get(0) : null;
    }*/

    public Agent findByUser(String username) {

        String sql = "SELECT * from tbl_agents WHERE emailAddress =:username";
        Query query = em.createNativeQuery(sql, Agent.class);
        query.setParameter("username", username);
        return query.getResultList().size() > 0 ? (Agent) query.getResultList().get(0) : null;
    }

    public Agent findByNumber(String agentNo) {

        String sql = "SELECT * from tbl_agents WHERE agentNumber=:agentNo";
        Query query = em.createNativeQuery(sql, Agent.class);
        query.setParameter("agentNo", agentNo);
        return query.getResultList().size() > 0 ? (Agent) query.getResultList().get(0) : null;
    }

    public int getCount(Long propId) {
        /*        Query q = em.createQuery("SELECT COUNT(a) FROM  Agent a  ");*/
        Query q = em.createNativeQuery("SELECT COUNT(*) FROM  tbl_agents a INNER  JOIN tbl_properties tp ON a.id = tp.agent_id WHERE tp.id=:id");
        q.setParameter("id", propId);
        return ((BigInteger) q.getSingleResult()).intValue();


    }

}
