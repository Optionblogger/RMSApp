package com.rentmanagement.dao;

import com.rentmanagement.dto.ReleaseDTO;
import com.rentmanagement.model.Unit;
import com.rentmanagement.model.UnitLiability;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;

public class UnitLiabilityDAO extends GenericDAOImpl<UnitLiability, Long> {

    private final EntityManager em;

    public UnitLiabilityDAO(EntityManager entityManager) {
        super(UnitLiability.class, entityManager);
        em = entityManager;
    }

    @SuppressWarnings("unchecked")
    public UnitLiability searchByUnitNumber(String unitNumber) {
        String sql = "select u from UnitLiability u WHERE  u.unit.unitNumber=:unitNumber";
        Query query = em.createQuery(sql);
        query.setParameter("unitNumber", unitNumber);
        return query.getResultList().size() > 0 ? (UnitLiability) query.getResultList().get(0) : null;
    }

    public List<UnitLiability> searchByPropertyId(Long propertyId) {
        String sql = "select u from UnitLiability u WHERE  u.unit.property.id=:propertyId";
        Query query = em.createQuery(sql);
        query.setParameter("propertyId", propertyId);
        return query.getResultList().size() > 0 ? query.getResultList() : null;
    }

    public List<Object[]> findReleaseDetails(String unitNumber) {
        Session session = (Session) em.getDelegate();
        // String sql = "select t2.name \"tenantName\",(coalesce(u.deposit,0)) \"deposit\",(coalesce(lib.electricityCost,0)+ coalesce(lib.waterCost,0)+ coalesce(lib.generalUnitMismanagement,0)) \"liabilities\",(coalesce(coalesce(u.deposit,0)-(coalesce(lib.electricityCost,0)+ coalesce(lib.waterCost,0)+ coalesce(lib.generalUnitMismanagement,0)),0)) \"balance\" FROM tbl_units u inner join tbl_tenants t2 ON u.id = t2.unit_id INNER JOIN tbl_unit_liabilities  lib on u.id = lib.unit_id WHERE u.unitNumber="+unitNumber;
        String sql = "select t2.name name,(coalesce(u.deposit,0))deposit,coalesce(lib.electricityCost,0)+\n" +
                "                                                   coalesce(lib.waterCost,0)+ coalesce(lib.generalUnitMismanagement,0)liabilities,\n" +
                "  coalesce(coalesce(u.deposit,0)-(coalesce(lib.electricityCost,0)+ coalesce(lib.waterCost,0)+ coalesce(lib.generalUnitMismanagement,0)),0)balance\n" +
                "from tbl_units u inner join tbl_tenants t2 ON u.id = t2.unit_id\n" +
                "  INNER JOIN tbl_unit_liabilities  lib on u.id = lib.unit_id\n" +
                "WHERE u.unitNumber=:unitNumber and u.occupancy_status='OCCUPIED' and t2.tenantStatus='ACTIVE'";
       /* org.hibernate.Query query = session.createSQLQuery(sql)
                .setResultTransformer(Transformers.aliasToBean(ReleaseDTO.class));
        List<ReleaseDTO> releaseDTOS = query.list();*/
        Query query = em.createNativeQuery(sql);
        query.setParameter("unitNumber", unitNumber);
        List<Object[]> releaseDTOS = query.getResultList();
        if (releaseDTOS.size() > 0) {
            return releaseDTOS;
        } else {
            return null;
        }


    }

}
