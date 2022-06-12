package com.rentmanagement.beans;


import com.rentmanagement.common.Constants;
import com.rentmanagement.dao.SocialDAO;
import com.rentmanagement.model.Social;

import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;


@Local
@Stateless
public class SocialBean implements SocialBeanI {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Social edit(Social social) {
        SocialDAO dao = new SocialDAO(entityManager);
        return dao.merge(social);
    }

    @Override
    public Social find() {
        SocialDAO dao = new SocialDAO(entityManager);
        List<Social> socialList = dao.findAll();
        return socialList.size() > 0 ? socialList.get(0) : null;
    }
}
