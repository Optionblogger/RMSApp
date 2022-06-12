package com.rentmanagement.beans;

import com.rentmanagement.model.AccountRecovery;

import javax.ejb.Local;

@Local
public interface AccountRecoveryBeanI {

    AccountRecovery find();

    AccountRecovery edit(AccountRecovery accountRecovery);
}
