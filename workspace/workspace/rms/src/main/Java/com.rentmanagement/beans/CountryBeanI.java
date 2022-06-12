package com.rentmanagement.beans;


import com.rentmanagement.model.Country;

import javax.ejb.Local;
import java.util.List;


@Local
public interface CountryBeanI {

    Country add(Country country);
    Country edit(Country country);
    Country findById(long id);
    List<Country> find();
    boolean delete(Country country);

}
