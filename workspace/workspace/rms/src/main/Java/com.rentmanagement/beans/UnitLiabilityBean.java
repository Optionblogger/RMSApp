package com.rentmanagement.beans;

import com.rentmanagement.dao.UnitLiabilityDAO;
import com.rentmanagement.dto.ReleaseDTO;
import com.rentmanagement.model.UnitLiability;

import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Stateless
@Local
public class UnitLiabilityBean implements UnitLiabilityBeanI {
    @PersistenceContext
    EntityManager entityManager;


    @Override
    public UnitLiability add(UnitLiability liability) {
        UnitLiabilityDAO dao = new UnitLiabilityDAO(entityManager);
        return dao.save(liability);
    }

    @Override
    public UnitLiability edit(UnitLiability liability) {
        UnitLiabilityDAO dao = new UnitLiabilityDAO(entityManager);
        return dao.merge(liability);
    }

    @Override
    public UnitLiability findById(Long id) {
        UnitLiabilityDAO dao = new UnitLiabilityDAO(entityManager);
        return dao.findById(id);
    }

    @Override
    public UnitLiability searchByUnitNumber(String unitNumber) {
        UnitLiabilityDAO dao = new UnitLiabilityDAO(entityManager);
        return dao.searchByUnitNumber(unitNumber);
    }

    @Override
    public List<UnitLiability> searchByPropertyId(Long propertyId) {
        UnitLiabilityDAO dao = new UnitLiabilityDAO(entityManager);
        return dao.searchByPropertyId(propertyId);
    }

    @Override
    public boolean delete(UnitLiability liability) {
        UnitLiabilityDAO dao = new UnitLiabilityDAO(entityManager);
        return dao.remove(liability);
    }

    @Override
    public List<Object[]> findReleaseDetails(String unitNumber) {
        UnitLiabilityDAO dao = new UnitLiabilityDAO(entityManager);
        return dao.findReleaseDetails(unitNumber);
    }
}
