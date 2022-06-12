package com.rentmanagement.beans;


import com.rentmanagement.model.AuditTrail;

import javax.ejb.Local;
import java.util.List;

@Local
public interface AuditTrailBeanI {

    List<AuditTrail>  findAllByUserName(String username);
    List<AuditTrail> frequenters(String from, String to);
    List<AuditTrail> findAll(String search, int offset, int limit);
    int countAll(String search);
    void add(AuditTrail auditTrail);

}
