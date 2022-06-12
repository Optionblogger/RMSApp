package com.rentmanagement.beans;


import javax.ejb.Local;
import java.util.List;
import com.rentmanagement.model.ImageBanner;


@Local
public interface ImageBannerBeanI {

    ImageBanner add(ImageBanner imageBanner);
    boolean delete(ImageBanner imageBanner);
    List<ImageBanner> find();
    ImageBanner findById(long id);

}
