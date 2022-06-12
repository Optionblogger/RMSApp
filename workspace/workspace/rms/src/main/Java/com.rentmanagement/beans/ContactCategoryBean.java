package com.rentmanagement.beans;

import com.rentmanagement.common.Constants;
import com.rentmanagement.dao.ContactCategoryDAO;
import com.rentmanagement.model.ContactCategory;

import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;


@Local
@Stateless
public class ContactCategoryBean implements ContactCategoryBeanI {


    @PersistenceContext    private EntityManager entityManager;

    @Override
    public ContactCategory add(ContactCategory contactCategory) {
        ContactCategoryDAO dao = new ContactCategoryDAO(entityManager);
        return dao.save(contactCategory);
    }

    @Override
    public ContactCategory findById(long id) {
        ContactCategoryDAO dao = new ContactCategoryDAO(entityManager);
        return dao.findById(id);
    }

    @Override
    public ContactCategory edit(ContactCategory contactCategory) {
        ContactCategoryDAO dao = new ContactCategoryDAO(entityManager);
        return dao.merge(contactCategory);
    }

    @Override
    public List<ContactCategory> find() {
        ContactCategoryDAO dao = new ContactCategoryDAO(entityManager);
        return dao.findAll();
    }

    @Override
    public boolean delete(ContactCategory contactCategory) {
        ContactCategoryDAO dao = new ContactCategoryDAO(entityManager);
        return dao.remove(contactCategory);
    }
}
