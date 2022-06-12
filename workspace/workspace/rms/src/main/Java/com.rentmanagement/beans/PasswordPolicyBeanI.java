package com.rentmanagement.beans;

import com.rentmanagement.model.PasswordPolicy;
import javax.ejb.Local;

@Local
public interface PasswordPolicyBeanI {

    PasswordPolicy edit(PasswordPolicy passwordPolicy);
    PasswordPolicy find();

}
