package com.rentmanagement.beans;

import com.rentmanagement.common.Constants;
import com.rentmanagement.dao.FaqContentDAO;
import com.rentmanagement.model.FaqContent;

import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;


@Stateless
@Local
public class FaqContentBean implements FaqContentBeanI {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public FaqContent edit(FaqContent faqContent) {
        FaqContentDAO dao = new FaqContentDAO(entityManager);
        return dao.merge(faqContent);
    }

    @Override
    public FaqContent findById(long id) {
        FaqContentDAO dao = new FaqContentDAO(entityManager);
        return dao.findById(id);
    }

    @Override
    public List<FaqContent> find() {
        FaqContentDAO dao = new FaqContentDAO(entityManager);
        return dao.findAll();
    }


    @Override
    public FaqContent findPageContent(String page) {
        FaqContentDAO dao = new FaqContentDAO(entityManager);
        return dao.findPageContent(page);
    }
}
