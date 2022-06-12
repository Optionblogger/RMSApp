package com.rentmanagement.dao;


import com.rentmanagement.model.Help;

import javax.persistence.EntityManager;
import java.util.List;

public class HelpDAO extends GenericDAOImpl<Help, Long> {
    private final EntityManager em;
    public HelpDAO(EntityManager entityManager)
    {
        super(Help.class, entityManager);
        em = entityManager;
    }

    @SuppressWarnings("unchecked")
    public Help findHelp(String page)
    {
        // TODO Auto-generated method stub
        List<Help> results = em.createQuery("SELECT h FROM Help h WHERE h.page=:page").setParameter("page", page).getResultList();

        if (results.isEmpty()) {

            return null;

        }  else {

            return results.get(0);

        }
    }
}
