package com.rentmanagement.beans;

import com.rentmanagement.dao.PropertyDAO;
import com.rentmanagement.model.Property;

import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Local
@Stateless
public class PropertyBean implements PropertyBeanI {
    @PersistenceContext
    EntityManager entityManager;

    @Override
    public Property add(Property property) {
        PropertyDAO dao = new PropertyDAO(entityManager);
        return dao.save(property);
    }

    @Override
    public Property edit(Property property) {
        PropertyDAO dao = new PropertyDAO(entityManager);
        return dao.merge(property);
    }

    @Override
    public boolean delete(Property property) {
        PropertyDAO dao = new PropertyDAO(entityManager);
        return dao.remove(property);
    }

    @Override
    public List<Property> findAll() {
        PropertyDAO dao = new PropertyDAO(entityManager);
        return dao.findAll();
    }

    @Override
    public Property findById(Long id) {
        PropertyDAO dao = new PropertyDAO(entityManager);
        return dao.findById(id);
    }

    @Override
    public Property findByAgentId(Long id) {
        PropertyDAO dao = new PropertyDAO(entityManager);
        return dao.findByAgentId(id);
    }


    @Override
    public int getCount() {
        PropertyDAO dao = new PropertyDAO(entityManager);
        return dao.getCount();
    }

    @Override
    public List<Property> findPropByAgentId(Long id) {
        PropertyDAO dao = new PropertyDAO(entityManager);

        return dao.findPropByAgentId(id);
    }

    @Override
    public Property findPropPropertyNumber(String propNo) {
        PropertyDAO dao = new PropertyDAO(entityManager);

        return dao.findPropPropertyNumber(propNo);
    }
}
