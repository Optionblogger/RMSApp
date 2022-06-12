package com.rentmanagement.common;

import javax.persistence.EntityManager;

public interface SequenceGenI {

    /**
     * Gets a sequence, increments the value
     * @param name - The name of sequence you want to find
     */
    public CMPSequence getOrCreateNextSequence(String name) throws CMPSequenceException;

    /**
     *
     * @param seq
     * @return
     */
    public CMPSequence save(CMPSequence seq);


    /**
     *
     * @param name
     * @return
     * @throws CMPSequenceException
     */
    //public CMPSequence getSequenceCreateIfNotExists(String name) throws CMPSequenceException;

    /**
     *
     * @param name
     * @return
     */
    public CMPSequence findSequenceByName(String name);

    public EntityManager getEm() throws Exception;
}
