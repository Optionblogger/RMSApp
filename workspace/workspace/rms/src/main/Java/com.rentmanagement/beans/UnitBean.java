package com.rentmanagement.beans;

import com.rentmanagement.dao.UnitDAO;
import com.rentmanagement.model.Unit;

import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.math.BigDecimal;
import java.util.List;

@Stateless
@Local
public class UnitBean implements UnitBeanI {
    @PersistenceContext
    EntityManager entityManager;

    @Override
    public Unit add(Unit unit) {
        UnitDAO dao = new UnitDAO(entityManager);
        return dao.save(unit);
    }

    @Override
    public Unit edit(Unit unit) {
        UnitDAO dao = new UnitDAO(entityManager);
        return dao.merge(unit);
    }

    @Override
    public boolean delete(Unit unit) {
        UnitDAO dao = new UnitDAO(entityManager);
        return dao.remove(unit);
    }

    @Override
    public List<Unit> findAll() {
        UnitDAO dao = new UnitDAO(entityManager);
        return dao.findAll();
    }

  @Override
    public Unit findById(Long id) {
        UnitDAO dao = new UnitDAO(entityManager);
        return dao.findById(id);
    }

    @Override
    public Unit searchByUnitNumber(String UnitNumber) {
        UnitDAO dao = new UnitDAO(entityManager);
        return dao.searchByUnitNumber(UnitNumber);
    }

    @Override
    public BigDecimal getMonthlyRent(String unitNumber) {
        UnitDAO dao = new UnitDAO(entityManager);
        return dao.getMonthlyRent(unitNumber);
    }

    @Override
    public List<Unit> searchByPropertyId(Long propertyId) {
        UnitDAO dao = new UnitDAO(entityManager);
        return dao.searchByPropertyId(propertyId);
    }

    @Override
    public List<Unit> viewAvailableUnits() {
        UnitDAO dao = new UnitDAO(entityManager);
        return dao.viewAvailableUnits();
    }

    /*@Override
    public boolean rentRoom(Unit unit, TenancyAgreement tenant) {
        UnitDAO dao = new UnitDAO(entityManager);
        return  dao.rentRoom(unit,tenant);
    }*/

    @Override
    public int getCount(Long propId) {
        UnitDAO dao = new UnitDAO(entityManager);

        return dao.getCount(propId);
    }

    @Override
    public int countOccupiedUnits(Long propId) {
        UnitDAO dao = new UnitDAO(entityManager);
        return dao.countOccupiedUnits(propId);

    }

    @Override
    public int countVacantUnits(Long propId) {
        UnitDAO dao = new UnitDAO(entityManager);
        return dao.countOccupiedUnits(propId);
    }
}
