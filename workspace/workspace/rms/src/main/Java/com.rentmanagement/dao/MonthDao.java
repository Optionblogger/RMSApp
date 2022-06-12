package com.rentmanagement.dao;

import com.rentmanagement.model.Month;

import javax.persistence.EntityManager;
import javax.persistence.Query;

public class MonthDao extends GenericDAOImpl<Month, Long> {


    private final EntityManager em;

    public MonthDao(EntityManager entityManager) {
        super(Month.class, entityManager);
        em = entityManager;
    }


    public Month findByName(String name){
        String sql = "select * from tbl_months u WHERE  u.name LIKE UPPER (:month)";
        Query query = em.createNativeQuery(sql, Month.class);
        query.setParameter("month", name);
        return query.getResultList().size() > 0 ? (Month) query.getResultList().get(0) : null;
    }
}
