package com.rentmanagement.dao;


import com.rentmanagement.common.Constants;
import com.rentmanagement.model.Media;

import javax.persistence.EntityManager;
import java.util.List;

public class MediaDAO extends GenericDAOImpl<Media, Long> {
    private final EntityManager em;

    public MediaDAO(EntityManager entityManager) {
        super(Media.class, entityManager);
        em = entityManager;
    }

    @SuppressWarnings("unchecked")
    public List<Media> findAll(String schemeID, String profile, String memberId) {
        // TODO Auto-generated method stub
        List<Media> entities;
        String field = getField(profile);
        if (profile.equals(Constants.AGENT_PROFILE))
            entities = em.createQuery("SELECT m FROM Media m WHERE m.schemeID=:scheme AND m." + field + " = 1 AND (memberId =:member_id OR memberId =:null_member)").setParameter("member_id", Long.valueOf(memberId)).setParameter("null_member", Long.valueOf("0")).setParameter("scheme", schemeID).getResultList();
        else
            entities = em.createQuery("SELECT m FROM Media m WHERE m.schemeID=:scheme AND m." + field + " = 1").setParameter("scheme", schemeID).getResultList();

        return entities;
    }

    @SuppressWarnings("unchecked")
    public Media findMediaByMemberId(String schemeId, String memberId) {
        String sql = "select m from Media m where m.schemeID=:scheme and m.memberId=:member";
        List<Media> mediaList = em.createQuery(sql).setParameter("scheme", schemeId).setParameter("member", memberId).getResultList();
        return mediaList.size() > 0 ? mediaList.get(0) : null;
    }

    private String getField(String profile) {

        switch (profile) {
            default:
                return profile.toLowerCase();
        }

    }
}
