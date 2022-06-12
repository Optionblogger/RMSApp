package com.rentmanagement.beans;


import com.rentmanagement.model.Social;

import javax.ejb.Local;

/**
 */
@Local
public interface SocialBeanI {

    Social edit(Social social);
    Social find();

}
