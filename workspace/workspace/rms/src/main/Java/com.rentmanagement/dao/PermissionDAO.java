package com.rentmanagement.dao;

import com.rentmanagement.model.Permission;

import javax.persistence.EntityManager;
import java.util.List;

public class PermissionDAO extends GenericDAOImpl<Permission, Long> {
    private final EntityManager em;
    public PermissionDAO(EntityManager entityManager)
    {
        super(Permission.class, entityManager);
        em = entityManager;
    }

    public Permission findByProfile(String profile) {
        // TODO Auto-generated method stub

        @SuppressWarnings("unchecked")
        List<Permission> permissions = em.createQuery("SELECT p FROM Permission p WHERE p.profile=:profile").setParameter("profile", profile).getResultList();
        return permissions != null && permissions.size() > 0 ? permissions.get(0) : null;
    }
}
