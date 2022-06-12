package com.rentmanagement.beans;


import com.rentmanagement.model.Gender;

import javax.ejb.Local;
import java.util.List;



@Local
public interface GenderBeanI {

    Gender add(Gender gender);
    Gender edit(Gender gender);
    List<Gender> find();
    boolean delete(Gender gender);
    Gender findById(long id);
}
