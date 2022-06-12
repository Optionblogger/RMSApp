package com.rentmanagement.dao;

import com.rentmanagement.model.Property;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;

public class PropertyDAO extends GenericDAOImpl<Property, Long> {
    private final EntityManager em;

    public PropertyDAO(EntityManager entityManager) {
        super(Property.class, entityManager);
        em = entityManager;
    }

    public int getCount() {
        Query q = em.createQuery("SELECT COUNT(n) FROM  Property n");
        return ((Long) q.getSingleResult()).intValue();


    }


    public Property findByAgentId(Long id) {
        Query q = em.createQuery("SELECT n FROM  Property n where n.agent.id=:id");
        q.setParameter("id", id);
        return q.getResultList().size() > 0 ? (Property) q.getResultList().get(0) : null;


    }

    public Property findPropPropertyNumber(String  propNo) {
        Query q = em.createQuery("SELECT n FROM  Property n where n.propertyNo=:id");
        q.setParameter("id", propNo);
        return q.getResultList().size() > 0 ? (Property) q.getResultList().get(0) : null;


    }

    public List<Property> findPropByAgentId(Long id) {
        Query q = em.createQuery("SELECT n FROM  Property n where n.agent.id=:id");
        q.setParameter("id", id);
        if (q.getResultList().size() > 0)
            return q.getResultList();
        else
            return null;
    }
}
