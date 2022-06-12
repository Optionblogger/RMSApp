package com.rentmanagement.dao;
import com.rentmanagement.model.ImageBanner;

import javax.persistence.EntityManager;

public class BannerDAO extends GenericDAOImpl<ImageBanner, Long> {
    public BannerDAO(EntityManager entityManager)
    {
        super(ImageBanner.class, entityManager);
    }

}
