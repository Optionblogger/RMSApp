package com.rentmanagement.beans;


import com.rentmanagement.model.Setting;

import javax.ejb.Local;

/**
 */
@Local
public interface SettingBeanI {

    Setting find();
    Setting edit(Setting setting);

}
