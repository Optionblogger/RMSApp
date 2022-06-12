package com.rentmanagement.dao;

import com.rentmanagement.model.LandlordMenu;

import javax.persistence.EntityManager;
import java.util.List;

public class LandLordMenuDAO extends GenericDAOImpl<LandlordMenu, Long> {


    private EntityManager em;

    public LandLordMenuDAO(EntityManager entityManager) {
        super(LandlordMenu.class, entityManager);
    }

    public LandlordMenu find() {
        List<LandlordMenu> menuList = this.findAll();
        return menuList.size() > 0 ? menuList.get(0) : null;
    }

    public LandlordMenu findByProfile(String profile) {
        // TODO Auto-generated method stub

        @SuppressWarnings("unchecked")
        List<LandlordMenu> permissions = em.createQuery("SELECT p FROM LandlordMenu p WHERE p.profile=:profile").setParameter("profile", profile).getResultList();
        return permissions != null && permissions.size() > 0 ? permissions.get(0) : null;
    }
}
