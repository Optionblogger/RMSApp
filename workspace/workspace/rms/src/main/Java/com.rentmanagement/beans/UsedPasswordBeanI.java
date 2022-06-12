package com.rentmanagement.beans;

import com.rentmanagement.model.UsedPassword;

import javax.ejb.Local;

/**
 */
@Local
public interface UsedPasswordBeanI {

    boolean isUsed(String password);
    UsedPassword add(UsedPassword usedPassword);

}
