package com.rentmanagement.beans;


import com.rentmanagement.common.Constants;

import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import com.rentmanagement.model.PasswordPolicy;
import com.rentmanagement.dao.PasswordPolicyDAO;
import java.util.List;

/**
 */
@Local
@Stateless
public class PasswordPolicyBean implements PasswordPolicyBeanI {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public PasswordPolicy edit(PasswordPolicy passwordPolicy) {
        PasswordPolicyDAO dao = new PasswordPolicyDAO(entityManager);
        return dao.merge(passwordPolicy);
    }

    @Override
    public PasswordPolicy find() {
        PasswordPolicyDAO dao = new PasswordPolicyDAO(entityManager);
        List<PasswordPolicy> passwordPolicyList = dao.findAll();
        return passwordPolicyList.size() > 0 ? passwordPolicyList.get(0) : null;
    }
}
