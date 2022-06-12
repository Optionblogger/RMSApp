package com.rentmanagement.dao;


import javax.persistence.EntityManager;
import java.util.List;
import com.rentmanagement.model.AccountRecovery;


public class AccountRecoveryDao extends GenericDAOImpl<AccountRecovery, Long> {

public AccountRecoveryDao(EntityManager entityManager)
        {
        super(AccountRecovery.class, entityManager);
        }

public AccountRecovery find()
        {
        List<AccountRecovery> recoveryList = this.findAll();
        return recoveryList.size() > 0 ? recoveryList.get(0) : null;
        }
}
