package com.rentmanagement.beans;


import com.rentmanagement.model.Permission;

import javax.ejb.Local;


@Local
public interface PermissionBeanI {

    Permission findByProfile(String profile);
    Permission edit(Permission permission);

}
