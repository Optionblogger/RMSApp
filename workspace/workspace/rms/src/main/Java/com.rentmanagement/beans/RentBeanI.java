package com.rentmanagement.beans;


import com.rentmanagement.dto.RentDTO;
import com.rentmanagement.model.Rent;
import com.rentmanagement.model.TenancyAgreement;
import com.rentmanagement.model.Unit;

import javax.ejb.Local;
import java.security.SecureRandom;
import java.util.Date;
import java.util.List;

@Local
public interface RentBeanI {
    Rent add(Rent rent);

    Rent edit(Rent rent);

    Rent findById(long id);

    boolean delete(Rent rent);

    List<Rent> findAll();

    List<RentDTO> findAllPaidRent(Long propertyId);

    List<RentDTO> findPaidRent(Long propertyId, String fromDate, String toDate);

    List<RentDTO> findRentArrears(Long propertyId, String fromDate, String toDate);

    List<RentDTO> findRentArrears(Long propertyId);

    List<RentDTO> findRentPrepaid(Long propertyId, String fromDate, String toDate);

    List<RentDTO> findRentPrepaid(Long propertyId);

    List<RentDTO> findAllByAllInvoicesAsat(Long propertyId, Date date);

    boolean payRent(Unit unit, TenancyAgreement tenancyAgreement, Rent rent);

    List<RentDTO> issueReceipts(String unitNumber, Long month, int year, Long propId);

}
