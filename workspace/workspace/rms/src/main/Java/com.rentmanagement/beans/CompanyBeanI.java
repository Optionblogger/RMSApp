package com.rentmanagement.beans;


import com.rentmanagement.model.Company;

import javax.ejb.Local;

@Local
public interface CompanyBeanI {

    Company edit(Company company);
    Company find();

}
