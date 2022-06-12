package com.rentmanagement.beans;

import com.rentmanagement.model.Month;

import javax.ejb.Local;
import java.util.List;

@Local
public interface MonthBeanI {
    Month add(Month month);
    Month edit(Month month);
    List<Month> find();
    boolean delete(Month month);
    Month findById(long id);
    Month findByName(String name);
}
