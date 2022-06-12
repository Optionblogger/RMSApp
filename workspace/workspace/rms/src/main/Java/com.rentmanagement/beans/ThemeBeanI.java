package com.rentmanagement.beans;


import com.rentmanagement.model.Theme;

import javax.ejb.Local;

/**
 */
@Local
public interface ThemeBeanI {
    Theme find();
    Theme edit(Theme theme);
    Theme findById(long id);
}
