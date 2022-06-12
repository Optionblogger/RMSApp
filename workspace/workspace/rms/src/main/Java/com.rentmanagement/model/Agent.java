package com.rentmanagement.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "tbl_agents")
public class Agent extends GenericModel<Agent> implements Serializable {

    private static final long serialVersionUID = 2136322189676132530L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private
    Long id;
    private String name;
    @Column(unique = true)
    private String emailAddress;



    private String phoneNumber;
    @Embedded
    private Address address;

    private String agentNumber;


    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }



    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }


    public String getAgentNumber() {
        return agentNumber;
    }

    public void setAgentNumber(String agentNumber) {
        this.agentNumber = agentNumber;
    }
}
