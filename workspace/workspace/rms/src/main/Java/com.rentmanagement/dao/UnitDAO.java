package com.rentmanagement.dao;

import com.rentmanagement.model.Unit;
import com.rentmanagement.model.YesNo;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.List;

public class UnitDAO extends GenericDAOImpl<Unit, Long> {
    private final EntityManager em;

    public UnitDAO(EntityManager entityManager) {
        super(Unit.class, entityManager);
        em = entityManager;
    }

    @SuppressWarnings("unchecked")
    public Unit searchByUnitNumber(String UnitNumber) {
        String sql = "select * from tbl_units u WHERE  u.unitNumber=:unitNumber";
        Query query = em.createNativeQuery(sql, Unit.class);
        query.setParameter("unitNumber", UnitNumber);
        return query.getResultList().size()>0 ? (Unit) query.getResultList().get(0) : null;
    }


    @SuppressWarnings("unchecked")
    public List<Unit> searchByPropertyId(Long propertyId) {
        String sql = "select u from Unit u WHERE  u.property.id=:propId";
        Query query = em.createQuery(sql);
        query.setParameter("propId", propertyId);
        return query.getResultList().size() > 0 ? query.getResultList() : null;
    }

    @SuppressWarnings("unchecked")
    public List<Unit> viewAvailableUnits() {
        String sql = "select * from tbl_units u WHERE u.status=0";
        Query query = em.createNativeQuery(sql, Unit.class);
        return query.getResultList().size() > 0 ? query.getResultList() : null;
    }

    public int getCount(Long propId) {
        Query q = em.createQuery("SELECT COUNT(u) FROM  Unit u where u.property.id=:id");
        q.setParameter("id",propId);

        return ((Long) q.getSingleResult()).intValue();


    }

    public int countOccupiedUnits(Long propId) {
        Query q = em.createQuery("SELECT COUNT(u) FROM  Unit u where u.booked=:booked and u.property.id=:id");
        q.setParameter("booked", YesNo.YES);
        q.setParameter("id", propId);
        return ((Long) q.getSingleResult()).intValue();


    }


    public int countVacantUnits(Long propId) {
        Query q = em.createQuery("SELECT COUNT(u) FROM  Unit u where u.booked=:booked and u.property.id=:id");
        q.setParameter("id", propId);
        return ((Long) q.getSingleResult()).intValue();


    }

    public BigDecimal getMonthlyRent(String unitNumber) {
        String sql = "select t.monthlyRent from tbl_units t where t.unitNumber=:unitNo";
        Query query = em.createNativeQuery(sql);
        query.setParameter("unitNo", unitNumber);
        return query.getResultList().size() > 0 ? ((BigDecimal) query.getResultList().get(0)) : BigDecimal.ZERO;
    }
   /*public boolean rentRoom(Unit unit, TenancyAgreement tenant){
        try {
            String sql = "UPDATE  tbl_units set status=1 WHERE  tenant_id=:tenant and id=:unit";
            Query query = em.createNativeQuery(sql, Unit.class);
            query.setParameter("unit", unit.getId());
            query.setParameter("tenant", tenant.getId());
            query.executeUpdate();
            return  true;
        }catch (PersistenceException pe){
            pe.printStackTrace();
            return  false;
        }



   }*/

}
