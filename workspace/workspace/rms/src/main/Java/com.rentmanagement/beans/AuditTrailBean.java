package com.rentmanagement.beans;


import com.rentmanagement.common.Constants;
import com.rentmanagement.dao.AuditTrailDAO;
import com.rentmanagement.model.AuditTrail;

import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Local
@Stateless
public class AuditTrailBean implements AuditTrailBeanI {

    @PersistenceContext    private EntityManager entityManager;
    @Override
    public List<AuditTrail> findAllByUserName(String username) {
        AuditTrailDAO dao = new AuditTrailDAO(entityManager);
        return dao.findAllByUserName(username);
    }

    @Override
    public List<AuditTrail> frequenters(String from, String to) {
        AuditTrailDAO dao = new AuditTrailDAO(entityManager);
        return dao.frequenters(from, to);
    }

    @Override
    public List<AuditTrail> findAll(String search, int offset, int limit) {
        AuditTrailDAO dao = new AuditTrailDAO(entityManager);
        return dao.findAll();
    }

    @Override
    public int countAll(String search) {
        AuditTrailDAO dao = new AuditTrailDAO(entityManager);
        return dao.countAll(search);
    }
    @Override
    public void add(AuditTrail auditTrail) {
        AuditTrailDAO dao = new AuditTrailDAO(entityManager);
        dao.save(auditTrail);
    }
}
