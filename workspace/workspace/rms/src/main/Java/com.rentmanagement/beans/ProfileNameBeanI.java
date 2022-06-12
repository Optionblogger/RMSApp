package com.rentmanagement.beans;


import javax.ejb.Local;
import java.util.List;
import com.rentmanagement.model.ProfileName;

@Local
public interface ProfileNameBeanI {

    ProfileName edit(ProfileName profileName);
    List<ProfileName> find();
}
