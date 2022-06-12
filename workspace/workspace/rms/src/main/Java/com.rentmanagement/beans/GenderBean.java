package com.rentmanagement.beans;

import com.rentmanagement.common.Constants;
import com.rentmanagement.dao.GenderDAO;
import com.rentmanagement.model.Gender;

import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Stateless
@Local
public class GenderBean implements GenderBeanI {


    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Gender add(Gender gender) {
        GenderDAO dao = new GenderDAO(entityManager);
        return dao.save(gender);
    }

    @Override
    public Gender edit(Gender gender) {
        GenderDAO dao = new GenderDAO(entityManager);
        return dao.merge(gender);
    }

    @Override
    public List<Gender> find() {
        GenderDAO dao = new GenderDAO(entityManager);
        return dao.findAll();
    }

    @Override
    public boolean delete(Gender gender) {
        GenderDAO dao = new GenderDAO(entityManager);
        return dao.remove(gender);
    }
    @Override
    public Gender findById(long id) {
        GenderDAO dao = new GenderDAO(entityManager);
        return dao.findById(id);
    }
}
