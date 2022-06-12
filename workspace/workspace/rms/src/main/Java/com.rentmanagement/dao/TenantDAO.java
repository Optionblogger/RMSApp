package com.rentmanagement.dao;

import com.rentmanagement.common.JLogger;
import com.rentmanagement.dto.ServiceChargeDTO;
import com.rentmanagement.dto.TenancyAgreementDTO;
import com.rentmanagement.model.*;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceException;
import javax.persistence.Query;
import java.math.BigInteger;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

public class TenantDAO extends GenericDAOImpl<TenancyAgreement, Long> {
    com.rentmanagement.common.JLogger logger = new JLogger(TenantDAO.class);
    private final EntityManager em;

    public TenantDAO(EntityManager entityManager) {
        super(Unit.class, entityManager);
        em = entityManager;
    }

    boolean rentRoom(Unit unit, TenancyAgreement tenancyAgreement, Rent rent, Agent agent) {
        try {
            String sql = "UPDATE  tbl_units set status=1 WHERE  tenant_id=:tenant and id=:unit";
            Query query = em.createNativeQuery(sql, Unit.class);
            query.setParameter("unit", unit.getId());
            query.setParameter("tenancyAgreement", tenancyAgreement.getId());
            query.executeUpdate();
            return true;
        } catch (PersistenceException pe) {
            pe.printStackTrace();
            return false;
        }

    }

    public int countActiveTenants(Long propId) {
        Query q = em.createQuery("SELECT COUNT(t) FROM  TenancyAgreement t where t.tenantStatus=:status and t.unit.property.id=:id");
        q.setParameter("status", TenantStatus.ACTIVE);
        q.setParameter("id", propId);

        return ((Long) q.getSingleResult()).intValue();


    }

    public List<TenancyAgreementDTO> findAllByProperty(Long propertyId) {
        try {
            Session session = (Session) em.getDelegate();
            String sql = "";
            sql = "select t.id \"id\",t.name \"name\",t.emailAddress \"emailAddress\",t.phoneNumber \"phoneNumber\", t.dateJoined \"dateJoined\"," +
                    "t.dateOfExit \"dateOfExit\",t.tenantStatus \"status\",t.serviceCharge \"serviceCharge\",u.unitNumber \"unitNumber\" ,p.name \"property\"" +
                    "from tbl_tenants t inner join tbl_units u  on u.id = t.unit_id inner join tbl_properties p on u.property_id = p.id  where u.property_id=" + propertyId;
            logger.w("The query is " + sql);
            org.hibernate.Query query = session.createSQLQuery(sql)
                    .setResultTransformer(Transformers.aliasToBean(TenancyAgreementDTO.class));
            List<TenancyAgreementDTO> tenancyAgreementDTOS = query.list();
            logger.w("size is " + query.list().size());
            if (tenancyAgreementDTOS.size() < 1)
                return null;
            else
                return tenancyAgreementDTOS;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    public TenancyAgreement findByTenantId(Long id) {
        String sql = "SELECT * FROM tbl_tenants WHERE id=:id";
        Query query = em.createNativeQuery(sql, TenancyAgreement.class);
        query.setParameter("id", id);
        return query.getResultList().size() > 0 ? (TenancyAgreement) query.getResultList().get(0) : null;
    }

    public TenancyAgreement findByTenantNo(String tenantNo) {
        String sql = "SELECT * FROM tbl_tenants WHERE tenantNumber=:tenantNo";
        Query query = em.createNativeQuery(sql, TenancyAgreement.class);
        query.setParameter("tenantNo", tenantNo);
        return query.getResultList().size() > 0 ? (TenancyAgreement) query.getResultList().get(0) : null;
    }

    public List<TenancyAgreement> findActiveTenants(String to) {
        String sql = "select * from tbl_tenants t WHERE t.tenantStatus='ACTIVE'";
        if (to != null) {
            sql = sql+" and t.emailAddress LIKE '"+to+"'";
        }
        Query query = em.createNativeQuery(sql, TenancyAgreement.class);
        return query.getResultList().size() > 0 ? query.getResultList() : null;
    }


    public TenancyAgreement searchByUnitNumber(String unitNumber) {
        String sql = "SELECT t FROM TenancyAgreement t WHERE t.unit.unitNumber=:unitNumber";
        Query query = em.createQuery(sql);
        query.setParameter("unitNumber", unitNumber);
        return query.getResultList().size() > 0 ? (TenancyAgreement) query.getResultList().get(0) : null;
    }


    public List<ServiceChargeDTO> findServiceChargeByProperty(Long propertyId) {
        Session session = (Session) em.getDelegate();
        String sql = "";
        sql = "select t.id \"id\",t.name \"tenantName\"," +
                "t.tenantStatus \"status\",t.serviceCharge \"serviceCharge\",u.unitNumber \"unitNumber\" ,p.name \"property\"" +
                "from tbl_tenants t left join tbl_units u  on t.id = u.tenancyAgreement_id inner join tbl_properties p on u.property_id = p.id  where u.property_id=" + propertyId;
        logger.w("The query is " + sql);
        org.hibernate.Query query = session.createSQLQuery(sql)
                .setResultTransformer(Transformers.aliasToBean(ServiceChargeDTO.class));
        List<ServiceChargeDTO> serviceChargeDTOS = query.list();
        if (serviceChargeDTOS.size() < 1)
            return null;
        else
            return serviceChargeDTOS;
    }
}



