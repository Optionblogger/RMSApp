package com.rentmanagement.beans;

import com.rentmanagement.dao.RentDAO;
import com.rentmanagement.dto.RentDTO;
import com.rentmanagement.model.Rent;
import com.rentmanagement.model.TenancyAgreement;
import com.rentmanagement.model.Unit;

import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.Date;
import java.util.List;


@Local
@Stateless
public class RentBean implements RentBeanI {


    @PersistenceContext
    EntityManager entityManager;


    @Override
    public Rent add(Rent rent) {
        RentDAO dao = new RentDAO(entityManager);
        return dao.save(rent);
    }

    @Override
    public Rent edit(Rent rent) {
        RentDAO dao = new RentDAO(entityManager);
        return dao.merge(rent);
    }

    @Override
    public Rent findById(long id) {
        RentDAO dao = new RentDAO(entityManager);
        return dao.findById(id);
    }

    @Override
    public boolean delete(Rent rent) {
        RentDAO dao = new RentDAO(entityManager);

        return dao.remove(rent);
    }

    @Override
    public List<Rent> findAll() {
        RentDAO dao = new RentDAO(entityManager);
        return dao.findAll();
    }

    @Override
    public List<RentDTO> findAllPaidRent(Long propertyId) {
        RentDAO dao = new RentDAO(entityManager);
        return dao.findAllPaidRent(propertyId);
    }

    @Override
    public List<RentDTO> findAllByAllInvoicesAsat(Long propertyId, Date date) {
        RentDAO dao = new RentDAO(entityManager);
        return dao.findAllByAllInvoicesAsat(propertyId, date);
    }

    @Override
    public List<RentDTO> findPaidRent(Long propertyId, String fromDate, String toDate) {
        RentDAO dao = new RentDAO(entityManager);
        return dao.findPaidRent(propertyId, fromDate, toDate);
    }

    @Override
    public List<RentDTO> findRentArrears(Long propertyId, String fromDate, String toDate) {
        RentDAO dao = new RentDAO(entityManager);
        return dao.findRentArrears(propertyId, fromDate, toDate);
    }

    @Override
    public List<RentDTO> findRentArrears(Long propertyId) {
        RentDAO dao = new RentDAO(entityManager);
        return dao.findRentArrears(propertyId);
    }

    @Override
    public List<RentDTO> findRentPrepaid(Long propertyId, String fromDate, String toDate) {
        RentDAO dao = new RentDAO(entityManager);
        return dao.findRentPrepaid(propertyId, fromDate, toDate);
    }

    @Override
    public List<RentDTO> findRentPrepaid(Long propertyId) {
        RentDAO dao = new RentDAO(entityManager);
        return dao.findRentPrepaid(propertyId);
        }

    public EntityManager getEntityManager() {
        return entityManager;
    }

    public void setEntityManager(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public boolean payRent(Unit unit, TenancyAgreement tenancyAgreement, Rent rent) {
        return false;
    }

    @Override
    public List<RentDTO> issueReceipts(String unitNumber, Long name, int year, Long propId) {
        RentDAO dao = new RentDAO(entityManager);
        return dao.issueReceipts(unitNumber, name, year, propId);
    }
}
