package com.rentmanagement.beans;


import com.rentmanagement.model.Help;

import javax.ejb.Local;
import java.util.List;

/**
 */
@Local
public interface HelpBeanI {

    Help
    add(Help help);
    void edit(Help help);
    List<Help> find();
    boolean delete(Help help);
    Help findHelp(String page);
    Help findById(long id);

}
