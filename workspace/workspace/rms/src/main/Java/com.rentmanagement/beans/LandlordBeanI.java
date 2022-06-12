package com.rentmanagement.beans;


import com.rentmanagement.model.Landlord;

import javax.ejb.Local;
import java.util.List;

@Local
public interface LandlordBeanI {

    Landlord add(Landlord landlord);
    Landlord edit(Landlord landlord);
    List<Landlord> findAll();
    Landlord findById(long id);
    boolean delete(Landlord landlord);
    Landlord findByIdnumber(String idnumber);
    Landlord findByUser(String username);
    List<Landlord> findByEmails(String to);


}
