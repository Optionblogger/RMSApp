package com.rentmanagement.beans;


import com.rentmanagement.common.Constants;
import com.rentmanagement.model.ImageBanner;
import com.rentmanagement.dao.BannerDAO;
import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

/**
 */
@Local
@Stateless
public class ImageBannerBean implements ImageBannerBeanI {


    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public ImageBanner add(ImageBanner imageBanner) {
        BannerDAO dao = new BannerDAO(entityManager);
        return dao.save(imageBanner);
    }

    @Override
    public ImageBanner findById(long id) {
        BannerDAO dao = new BannerDAO(entityManager);
        return dao.findById(id);
    }

    @Override
    public boolean delete(ImageBanner imageBanner) {
        BannerDAO dao = new BannerDAO(entityManager);
        return dao.remove(imageBanner);
    }

    @Override
    public List<ImageBanner> find() {
        BannerDAO dao = new BannerDAO(entityManager);
        return dao.findAll();
    }
}
