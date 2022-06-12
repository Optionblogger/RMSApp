package com.rentmanagement.beans;



import com.rentmanagement.common.Constants;
import com.rentmanagement.dao.UsedPasswordDAO;
import com.rentmanagement.model.UsedPassword;
import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 */
@Local
@Stateless
public class UsedPasswordBean implements UsedPasswordBeanI {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public boolean isUsed(String password) {
        UsedPasswordDAO dao = new UsedPasswordDAO(entityManager);
        return dao.isUsed(password);
    }

    @Override
    public UsedPassword add(UsedPassword usedPassword) {
        UsedPasswordDAO dao = new UsedPasswordDAO(entityManager);
        return dao.save(usedPassword);
    }
}
