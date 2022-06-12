package com.rentmanagement.dao;


import javax.persistence.EntityManager;
import java.util.List;
import com.rentmanagement.model.UsedPassword;


public class UsedPasswordDAO extends GenericDAOImpl<UsedPassword, Long> {
    private final EntityManager em;
    public UsedPasswordDAO(EntityManager entityManager)
    {
        super(UsedPassword.class, entityManager);
        em = entityManager;
    }

    public boolean isUsed(String password)
    {
        @SuppressWarnings("unchecked")
        List<UsedPassword> usedPassword = em.createQuery("SELECT u FROM UsedPassword u WHERE password=:password").setParameter("password", password).getResultList();
        return usedPassword != null && usedPassword.size() > 0;
    }
}
