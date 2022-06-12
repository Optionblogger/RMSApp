package com.rentmanagement.beans;

import com.rentmanagement.common.Constants;
import com.rentmanagement.model.AccountRecovery;
import com.rentmanagement.dao.AccountRecoveryDao;

import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
@Local
public class AccountRecoveryBean implements AccountRecoveryBeanI {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public AccountRecovery find() {
        AccountRecoveryDao dao = new AccountRecoveryDao(entityManager);
        return dao.find();
    }

    @Override
    public AccountRecovery edit(AccountRecovery accountRecovery) {
        AccountRecoveryDao dao = new AccountRecoveryDao(entityManager);
        return dao.merge(accountRecovery);
    }
}
