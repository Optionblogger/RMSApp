package com.rentmanagement.beans;

import com.rentmanagement.dto.ReleaseDTO;
import com.rentmanagement.model.Unit;
import com.rentmanagement.model.UnitLiability;

import javax.ejb.Local;
import java.util.List;

@Local
public interface UnitLiabilityBeanI {
    UnitLiability add(UnitLiability liability);

    UnitLiability edit(UnitLiability liability);

    UnitLiability findById(Long id);

    UnitLiability searchByUnitNumber(String unitNumber);

    List<UnitLiability> searchByPropertyId(Long propertyId);

    boolean delete(UnitLiability liability);

    List<Object[]> findReleaseDetails(String unitNumber);
}
