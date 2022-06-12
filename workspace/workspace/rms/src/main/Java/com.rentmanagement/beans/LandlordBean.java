package com.rentmanagement.beans;

import com.rentmanagement.dao.LandlordDAO;
import com.rentmanagement.model.Landlord;

import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Stateless
@Local
public class LandlordBean implements LandlordBeanI {
    @PersistenceContext
    private EntityManager em;

    @Override
    public Landlord add(Landlord landlord) {
        LandlordDAO dao = new LandlordDAO(em);
        return dao.save(landlord);
    }

    @Override
    public Landlord edit(Landlord landlord) {
        LandlordDAO dao = new LandlordDAO(em);
        return dao.merge(landlord);
    }

    @Override
    public List<Landlord> findAll() {
        LandlordDAO dao = new LandlordDAO(em);
        return dao.findAll();
    }

    @Override
    public Landlord findById(long id) {
        LandlordDAO dao = new LandlordDAO(em);
        return dao.findById(id);
    }

    @Override
    public boolean delete(Landlord landlord) {
        LandlordDAO dao = new LandlordDAO(em);
        return dao.remove(landlord);
    }

    @Override
    public Landlord findByIdnumber(String idnumber) {
        LandlordDAO dao = new LandlordDAO(em);
        return dao.findByIdnumber(idnumber);

    }

    @Override
    public Landlord findByUser(String username) {
        LandlordDAO dao = new LandlordDAO(em);
        return dao.findByUser(username);
    }

    @Override
    public List<Landlord> findByEmails(String to) {
        LandlordDAO dao = new LandlordDAO(em);
        return dao.findByEmails(to);
    }
}
