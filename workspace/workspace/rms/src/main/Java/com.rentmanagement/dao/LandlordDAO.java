package com.rentmanagement.dao;


import com.rentmanagement.model.Landlord;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;

public class LandlordDAO extends GenericDAOImpl<Landlord, Long> {
    private final EntityManager em;

    public LandlordDAO(EntityManager entityManager) {
        super(Landlord.class, entityManager);
        em = entityManager;
    }

    public Landlord findByIdnumber(String idnumber) {
        String sql = "SELECT * from tbl_landlords WHERE idNumber=:idnumber";
        Query query = em.createNativeQuery(sql, Landlord.class);
        query.setParameter("idnumber", idnumber);
        return query.getResultList().size() > 0 ? (Landlord) query.getResultList().get(0) : null;
    }

    public Landlord findByUser(String username) {
        String sql = "SELECT * from tbl_landlords WHERE emailAddress=:username";
        Query query = em.createNativeQuery(sql, Landlord.class);
        query.setParameter("username", username);
        return query.getResultList().size() > 0 ? (Landlord) query.getResultList().get(0) : null;
    }

    public  List<Landlord> findByEmails(String to) {
        String sql = "SELECT * from tbl_landlords";
        if (to != null) {
            sql = sql + " WHERE emailAddress LIKE '" + to + "'";
        }
        Query query = em.createNativeQuery(sql, Landlord.class);
        return query.getResultList().size() > 0 ? query.getResultList() : null;
    }

}
