package com.rentmanagement.dao;


import com.rentmanagement.model.PageContent;

import javax.persistence.EntityManager;
import java.util.List;

public class PageContentDAO extends GenericDAOImpl<PageContent, Long> {
    private final EntityManager em;
    public PageContentDAO(EntityManager entityManager)
    {
        super(PageContent.class, entityManager);
        em = entityManager;
    }

    @SuppressWarnings("unchecked")
    public PageContent findPageContent(String page)
    {
        // TODO Auto-generated method stub
        List<PageContent> results = em.createQuery("SELECT p FROM PageContent p WHERE p.page=:page").setParameter("page", page).getResultList();

        if (results.isEmpty()) {

            return null;

        }  else {

            return results.get(0);

        }
    }
}
