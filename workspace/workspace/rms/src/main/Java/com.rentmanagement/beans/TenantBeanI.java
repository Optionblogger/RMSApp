package com.rentmanagement.beans;

import com.rentmanagement.dto.ServiceChargeDTO;
import com.rentmanagement.dto.TenancyAgreementDTO;
import com.rentmanagement.model.Rent;
import com.rentmanagement.model.TenancyAgreement;
import com.rentmanagement.model.Unit;

import javax.ejb.Local;
import java.util.Date;
import java.util.List;

@Local
public interface TenantBeanI {
    TenancyAgreement add(TenancyAgreement tenancyAgreement);

    TenancyAgreement edit(TenancyAgreement tenancyAgreement);

    TenancyAgreement findById(Long id);

    TenancyAgreement findByTenantNo(String tenantNo);

    boolean delete(TenancyAgreement tenancyAgreement);

    List<TenancyAgreement> findAll();

    List<TenancyAgreement> findActiveTenants(String to);

    List<TenancyAgreementDTO> findAllByProperty(Long propertyId);

    List<ServiceChargeDTO> findServiceCharge(Long propertyId);

    boolean bookRoom(TenancyAgreement tenancyAgreement, Unit unit);

    boolean payRent(Unit unit, TenancyAgreement tenancyAgreement, Rent rent);

    int countActiveTenants(Long propId);

    TenancyAgreement searchByUnitNumber(String UnitNumber);

}
