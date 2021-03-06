package com.rentmanagement.beans;

import com.rentmanagement.common.Constants;
import com.rentmanagement.dao.HelpDAO;
import com.rentmanagement.model.Help;

import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Stateless
@Local
public class HelpBean implements HelpBeanI {


    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Help add(Help help) {
        HelpDAO dao = new HelpDAO(entityManager);
        return dao.save(help);
    }

    @Override
    public void edit(Help help) {
        HelpDAO dao = new HelpDAO(entityManager);
        dao.merge(help);
    }

    @Override
    public Help findById(long id) {
        HelpDAO dao = new HelpDAO(entityManager);
        return dao.findById(id);
    }

    @Override
    public List<Help> find() {
        HelpDAO dao = new HelpDAO(entityManager);
        return dao.findAll();
    }

    @Override
    public boolean delete(Help help) {
        HelpDAO dao = new HelpDAO(entityManager);
        return dao.remove(help);
    }

    @Override
    public Help findHelp(String page) {
        HelpDAO dao = new HelpDAO(entityManager);
        return dao.findHelp(page);
    }
}
