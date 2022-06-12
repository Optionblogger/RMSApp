package com.rentmanagement.beans;


import com.rentmanagement.model.ContactCategory;

import javax.ejb.Local;
import java.util.List;


@Local
public interface ContactCategoryBeanI {

    ContactCategory add(ContactCategory contactCategory);
    ContactCategory edit(ContactCategory contactCategory);
    List<ContactCategory> find();
    boolean delete(ContactCategory contactCategory);
    ContactCategory findById(long id);

}
