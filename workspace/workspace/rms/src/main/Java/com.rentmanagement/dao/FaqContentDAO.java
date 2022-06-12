package com.rentmanagement.dao;

import com.rentmanagement.model.FaqContent;

import javax.persistence.EntityManager;
import java.util.List;

public class FaqContentDAO extends GenericDAOImpl<FaqContent, Long> {

    private final EntityManager em;

    public FaqContentDAO(EntityManager entityManager)
    {
        super(FaqContent.class, entityManager);
        em = entityManager;
    }

    public FaqContent findPageContent(String title)
    {
        // TODO Auto-generated method stub
        List<FaqContent> results = em.createQuery("SELECT p FROM FaqContent p WHERE p.title=:title").setParameter("title", title).getResultList();

        if (results.isEmpty()) {

            return null;

        }  else {

            return results.get(0);

        }
    }

    public FaqContent findQuestions()
    {
        // TODO Auto-generated method stub
        List<FaqContent> results = em.createQuery("SELECT distinct title from FaqContent").getResultList();

        if (results.isEmpty()) {

            return null;

        }  else {

            return results.get(0);

        }
    }
}
