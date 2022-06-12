package com.rentmanagement.beans;


import com.rentmanagement.model.PageContent;

import javax.ejb.Local;
import java.util.List;


@Local
public interface PageContentBeanI {

    PageContent edit(PageContent pageContent);
    List<PageContent> find();
    PageContent findPageContent(String page);
    PageContent findById(long id);
}
