package com.rentmanagement.dao;

import com.rentmanagement.common.*;
import com.rentmanagement.model.ActivityLog;

import javax.persistence.EntityManager;
import java.util.ArrayList;
import java.util.List;


public class ActivityLogDAO extends GenericDAOImpl<ActivityLog, Long> {
    private final EntityManager em;
    Helper helper = new Helper();
    private final JLogger jLogger = new JLogger(this.getClass());
    public ActivityLogDAO(EntityManager entityManager)
    {
        super(ActivityLog.class, entityManager);
        em = entityManager;
    }

    public List<ActivityLog> findAllByUserID(String user_id) {
        // TODO Auto-generated method stub

        @SuppressWarnings("unchecked")
        List<ActivityLog> logs = em.createQuery("SELECT a FROM ActivityLog a WHERE a.userID=:user_id order by a.id desc").setParameter("user_id", helper.toLong(user_id)).setMaxResults(10).getResultList();

        return logs;
    }






}
