package com.rentmanagement.beans;


import javax.ejb.Local;
import java.util.List;

import com.rentmanagement.model.ActivityLog;

@Local
public interface ActivityLogBeanI {

    void add(ActivityLog activityLog);

    List<ActivityLog> findAllByUserID(String user_id);
}
