package com.rentmanagement.beans;



import com.rentmanagement.common.Constants;
import com.rentmanagement.dao.ThemeDAO;
import com.rentmanagement.model.Theme;

import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 */
@Local
@Stateless
public class ThemeBean implements ThemeBeanI {
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Theme find() {
        ThemeDAO dao = new ThemeDAO(entityManager);
        return dao.find();
    }

    @Override
    public Theme edit(Theme theme) {
        ThemeDAO dao = new ThemeDAO(entityManager);
        return dao.merge(theme);
    }

    @Override
    public Theme findById(long id) {
        ThemeDAO dao = new ThemeDAO(entityManager);
        return dao.findById(id);
    }
}
