package com.rentmanagement.beans;

import com.rentmanagement.dao.TenantDAO;
import com.rentmanagement.dto.ServiceChargeDTO;
import com.rentmanagement.dto.TenancyAgreementDTO;
import com.rentmanagement.model.Rent;
import com.rentmanagement.model.TenancyAgreement;
import com.rentmanagement.model.Unit;

import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.Date;
import java.util.List;

@Stateless
@Local
public class TenantBean implements TenantBeanI {

    @PersistenceContext
    EntityManager entityManager;

    @Override
    public TenancyAgreement add(TenancyAgreement tenancyAgreement) {
        TenantDAO dao = new TenantDAO(entityManager);
        return dao.save(tenancyAgreement);
    }

    @Override
    public TenancyAgreement edit(TenancyAgreement tenancyAgreement) {
        TenantDAO dao = new TenantDAO(entityManager);
        return dao.merge(tenancyAgreement);
    }

    @Override
    public TenancyAgreement findById(Long id) {
        TenantDAO dao = new TenantDAO(entityManager);
        return dao.findByTenantId(id);
    }

    @Override
    public TenancyAgreement findByTenantNo(String tenantNo) {
        TenantDAO dao = new TenantDAO(entityManager);
        return dao.findByTenantNo(tenantNo);    }

    @Override
    public boolean delete(TenancyAgreement tenancyAgreement) {
        TenantDAO dao = new TenantDAO(entityManager);
        return dao.remove(tenancyAgreement);
    }

    @Override
    public List<TenancyAgreement> findAll() {
        TenantDAO dao = new TenantDAO(entityManager);
        return dao.findAll();
    }

    @Override
    public List<TenancyAgreement> findActiveTenants(String to) {
        TenantDAO dao = new TenantDAO(entityManager);
        return dao.findActiveTenants(to);
    }

    @Override
    public List<TenancyAgreementDTO> findAllByProperty(Long propertyId) {
        TenantDAO dao = new TenantDAO(entityManager);
        return dao.findAllByProperty(propertyId);
    }

    @Override
    public List<ServiceChargeDTO> findServiceCharge(Long propertyId) {
        TenantDAO dao = new TenantDAO(entityManager);
        return dao.findServiceChargeByProperty(propertyId);
    }

    @Override
    public boolean bookRoom(TenancyAgreement tenancyAgreement, Unit unit) {
        return false;
    }

    @Override
    public boolean payRent(Unit unit, TenancyAgreement tenancyAgreement, Rent rent) {
        return false;
    }

    @Override
    public int countActiveTenants(Long propId) {
        TenantDAO dao = new TenantDAO(entityManager);
        return dao.countActiveTenants(propId);
    }

  public    TenancyAgreement searchByUnitNumber(String unitNumber) {
        TenantDAO dao = new TenantDAO(entityManager);
        return dao.searchByUnitNumber(unitNumber);
    }
}
