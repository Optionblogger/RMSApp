package com.rentmanagement.beans;



import com.rentmanagement.common.Constants;
import com.rentmanagement.dao.PermissionDAO;
import com.rentmanagement.model.Permission;

import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


@Stateless
@Local
public class PermissionBean implements PermissionBeanI {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Permission findByProfile(String profile) {
        PermissionDAO dao = new PermissionDAO(entityManager);
        return dao.findByProfile(profile);
    }

    @Override
    public Permission edit(Permission permission) {
        PermissionDAO dao = new PermissionDAO(entityManager);
        return dao.merge(permission);
    }
}
