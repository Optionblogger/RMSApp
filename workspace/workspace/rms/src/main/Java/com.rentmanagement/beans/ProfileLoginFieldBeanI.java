package com.rentmanagement.beans;

import com.rentmanagement.model.ProfileLoginField;

import javax.ejb.Local;
import java.util.List;

@Local
public interface ProfileLoginFieldBeanI {

    ProfileLoginField edit(ProfileLoginField profileLoginField);
    String findByProfile(String profile);
    ProfileLoginField find(String profile);
    List<ProfileLoginField> find();
}
