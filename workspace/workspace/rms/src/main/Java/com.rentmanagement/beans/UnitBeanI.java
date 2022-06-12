package com.rentmanagement.beans;

import com.rentmanagement.model.Unit;

import javax.ejb.Local;
import java.math.BigDecimal;
import java.util.List;

@Local
public interface UnitBeanI {
    Unit add(Unit unit);

    Unit edit(Unit unit);

    boolean delete(Unit unit);

    List<Unit> findAll();

    Unit findById(Long id);

    Unit searchByUnitNumber(String UnitNumber);

    BigDecimal getMonthlyRent(String unitNumber);

    List<Unit> searchByPropertyId(Long propertyId);

    List<Unit> viewAvailableUnits();

    int getCount(Long propId);

    int countOccupiedUnits(Long propId);

    int countVacantUnits(Long propId);
/*
    boolean rentRoom(Unit unit, TenancyAgreement tenant);
*/


}
