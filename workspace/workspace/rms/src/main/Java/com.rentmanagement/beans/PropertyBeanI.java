package com.rentmanagement.beans;

import com.rentmanagement.model.Property;

import javax.ejb.Local;
import java.util.List;

@Local
public interface PropertyBeanI {
    Property add(Property property);

    Property edit(Property property);

    boolean delete(Property property);

    List<Property> findAll();

    Property findById(Long id);

    Property findByAgentId(Long id);

    List<Property> findPropByAgentId(Long id);

    Property findPropPropertyNumber(String propertyNo);

    int getCount();


}
