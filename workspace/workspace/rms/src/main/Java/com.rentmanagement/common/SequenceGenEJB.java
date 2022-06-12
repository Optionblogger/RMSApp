package com.rentmanagement.common;

import org.jboss.logging.Logger;

import javax.ejb.*;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.math.BigInteger;


@Singleton
@Remote
public class SequenceGenEJB implements SequenceGenI {
    private Logger logger = Logger.getLogger(getClass());

    @PersistenceContext
    protected EntityManager em;


    //@Override
    @Lock(LockType.WRITE)
    @AccessTimeout(unit=java.util.concurrent.TimeUnit.SECONDS, value = 15)
    private CMPSequence getSequenceCreateIfNotExists(String name) throws CMPSequenceException{
        CMPSequence cmp_sequence = findSequenceByName(name);

        if(cmp_sequence!=null)
            return cmp_sequence;

        try {
            cmp_sequence = new CMPSequence();
            cmp_sequence.setName(name);
            cmp_sequence.setNextval(BigInteger.ONE);
            cmp_sequence.setPrefix(name);
            cmp_sequence.setSuffix(String.valueOf(name.hashCode()));
            cmp_sequence = em.merge(cmp_sequence);
        } catch (Exception e) {
            logger.error(e.getMessage(),e);
        }

        return cmp_sequence;


    }


    @Lock(LockType.READ)
    @AccessTimeout(unit=java.util.concurrent.TimeUnit.SECONDS, value = 15)
    @Override
    public CMPSequence findSequenceByName(String name){
        CMPSequence sequence = null;
        try{
            Query query = em.createQuery("from CMPSequence s WHERE s.name=:name");
            query.setParameter("name", name);
            sequence = (CMPSequence) query.getSingleResult();
        }catch(javax.persistence.NoResultException nre){
            logger.warn("Sequence with the name "+name+" not found. We should create a new one");
        }catch(Exception exp){
            logger.error(exp.getMessage(),exp);
        }
        return sequence;
    }


    @Lock(LockType.WRITE)
    @AccessTimeout(unit=java.util.concurrent.TimeUnit.SECONDS, value = 15)
    @Override
    public CMPSequence getOrCreateNextSequence(String name) throws CMPSequenceException{

        try{
            CMPSequence sequence = getSequenceCreateIfNotExists(name);
            BigInteger nextVal = sequence.getNextval().add(BigInteger.ONE);
            Query qry = em.createQuery("update CMPSequence cs SET cs.nextval=:nextval_ where cs.name=:name_");
            qry.setParameter("nextval_", nextVal);
            qry.setParameter("name_", name);
            qry.executeUpdate();
            return sequence;
        }catch(Exception e) {
            logger.error(e.getMessage(),e);
            throw new CMPSequenceException("Could not get new sequence",e);
        }
    }



    @Lock(LockType.WRITE)
    @AccessTimeout(unit=java.util.concurrent.TimeUnit.SECONDS, value = 15)
    @Override
    public CMPSequence  save(CMPSequence seq){
        try{
            return em.merge(seq);
        }catch(Exception exp){
            logger.error(exp.getMessage(), exp);
        }
        return null;
    }


    /* (non-Javadoc)
     * @see com.systech.fm.ejb.sequences.SequenceGenI#getEm()
     */
    @Override
    public EntityManager getEm() throws Exception {
        return em;
    }

}
