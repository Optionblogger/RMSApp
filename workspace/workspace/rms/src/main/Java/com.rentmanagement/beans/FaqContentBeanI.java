package com.rentmanagement.beans;


import com.rentmanagement.model.FaqContent;

import javax.ejb.Local;
import java.util.List;


@Local
public interface FaqContentBeanI {

    FaqContent edit(FaqContent pageContent);
    List<FaqContent> find();
    FaqContent findPageContent(String page);
    FaqContent findById(long id);
}
