package com.rentmanagement.beans;

import com.rentmanagement.dao.MonthDao;
import com.rentmanagement.model.Month;

import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Stateless
@Local
public class MonthBean implements MonthBeanI{


    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Month add(Month month) {
        MonthDao dao = new MonthDao(entityManager);
        return dao.save(month);
    }
    @Override
    public Month edit(Month month) {
        MonthDao dao = new MonthDao(entityManager);
        return dao.merge(month);
    }

    @Override
    public List<Month> find() {
        MonthDao dao = new MonthDao(entityManager);
        return dao.findAll();
    }

    @Override
    public boolean delete(Month month) {
        MonthDao dao = new MonthDao(entityManager);
        return dao.remove(month);
    }
    @Override
    public Month findById(long id) {
        MonthDao dao = new MonthDao(entityManager);
        return dao.findById(id);
    }

    @Override
    public Month findByName(String name) {
        MonthDao dao = new MonthDao(entityManager);
        return dao.findByName(name);
    }

    public EntityManager getEntityManager() {
        return entityManager;
    }

    public void setEntityManager(EntityManager entityManager) {
        this.entityManager = entityManager;
    }
}
