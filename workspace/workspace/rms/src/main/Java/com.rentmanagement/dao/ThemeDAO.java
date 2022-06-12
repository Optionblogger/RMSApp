package com.rentmanagement.dao;


import com.rentmanagement.model.Theme;

import javax.persistence.EntityManager;
import java.util.List;


public class ThemeDAO extends GenericDAOImpl<Theme, Long> {
    public ThemeDAO (EntityManager entityManager)
    {
        super(Theme.class, entityManager);
    }

    public Theme find()
    {
        List<Theme> themeList = this.findAll();
        return themeList.size() > 0 ? themeList.get(0) : null;
    }
}
