package com.rentmanagement.dao;


import javax.persistence.EntityManager;
import java.util.List;
import com.rentmanagement.model.ProfileLoginField;


public class ProfileLoginFieldDAO extends GenericDAOImpl<ProfileLoginField, Long> {
    private final EntityManager em;
    public ProfileLoginFieldDAO(EntityManager entityManager)
    {
        super(ProfileLoginField.class, entityManager);
        em = entityManager;
    }

    public ProfileLoginField findByProfile(String profile) {
        // TODO Auto-generated method stub
        @SuppressWarnings("unchecked")
        List<ProfileLoginField> logs = em.createQuery("SELECT p FROM ProfileLoginField p WHERE p.profile=:profile").setParameter("profile", profile).setMaxResults(5).getResultList();


        return logs.size() > 0 ? logs.get(0) : null;
    }

}
