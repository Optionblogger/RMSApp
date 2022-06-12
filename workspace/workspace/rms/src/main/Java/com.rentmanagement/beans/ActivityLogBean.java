package com.rentmanagement.beans;


import com.rentmanagement.model.ActivityLog;
import com.rentmanagement.dao.ActivityLogDAO;

import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;


@Stateless
@Local
public class ActivityLogBean implements ActivityLogBeanI {

    @PersistenceContext
    private EntityManager entityManager;
    @Override
    public void add(ActivityLog activityLog) {
        ActivityLogDAO dao = new ActivityLogDAO(entityManager);
        dao.save(activityLog);
    }

    @Override
    public List<ActivityLog> findAllByUserID(String user_id) {
        ActivityLogDAO dao = new ActivityLogDAO(entityManager);
        return dao.findAllByUserID(user_id);
    }


}
