package com.rentmanagement.beans;


import com.rentmanagement.common.Constants;
import com.rentmanagement.common.JLogger;
import com.rentmanagement.dao.MediaDAO;
import com.rentmanagement.model.Media;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

@Local
@Stateless
public class MediaBean implements MediaBeanI {
@PersistenceContext
EntityManager entityManager;
    @Override
    public Media add(Media media) {
        return null;
    }

    @Override
    public Media edit(Media media) {
        return null;
    }

    @Override
    public List<Media> findAll(String schemeID, String profile, String memberId) {
        return null;
    }

    @Override
    public List<Media> findByStatusAndProfile(String schemeId, boolean status, String Profile) {
        return null;
    }

    @Override
    public List<Media> findByNationalPenNo(String nationalPenNo) {
        return null;
    }

    @Override
    public List<Media> findByMemberIdAndBenefitId(String schemeId, String memberId, Long benefitId) {
        return null;
    }

    @Override
    public List<Media> findByMemberId(String schemeId, String memberId) {
        return null;
    }

    @Override
    public List<Media> findByMemberNO(String schemeId, String memberNo, Long benefitId) {
        return null;
    }

    @Override
    public Media findMediaByMemberId(String schemeId, String memberId) {
        return null;
    }

    @Override
    public List<Media> findByMember(String schemeId, String memberId) {
        return null;
    }

    @Override
    public boolean delete(Media media) {
        return false;
    }

    @Override
    public Media findById(long id) {
        return null;
    }
}