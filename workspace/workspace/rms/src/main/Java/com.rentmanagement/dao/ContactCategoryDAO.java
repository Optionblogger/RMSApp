package com.rentmanagement.dao;


import com.rentmanagement.model.ContactCategory;

import javax.persistence.EntityManager;


public class ContactCategoryDAO extends GenericDAOImpl<ContactCategory, Long> {
    public ContactCategoryDAO(EntityManager entityManager)
    {
        super(ContactCategory.class, entityManager);
    }
}
