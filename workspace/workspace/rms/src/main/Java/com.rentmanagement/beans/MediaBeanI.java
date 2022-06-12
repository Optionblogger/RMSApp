package com.rentmanagement.beans;


import com.rentmanagement.model.Media;

import javax.ejb.Local;
import java.util.List;

@Local
public interface MediaBeanI {

    Media add(Media media);
    Media edit(Media media);
    List<Media> findAll(String schemeID, String profile, String memberId);
    List<Media> findByStatusAndProfile(String schemeId, boolean status, String Profile);
    List<Media> findByNationalPenNo(String nationalPenNo);
    List<Media> findByMemberIdAndBenefitId(String schemeId, String memberId,Long benefitId);
    List<Media> findByMemberId(String schemeId, String memberId);
    List<Media> findByMemberNO(String schemeId, String memberNo,Long benefitId);
    Media findMediaByMemberId(String schemeId, String memberId);
    List<Media> findByMember(String schemeId, String memberId);
    boolean delete(Media media);
    Media findById(long id);
}
