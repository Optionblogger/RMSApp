package com.rentmanagement.model;

import javax.persistence.*;
import java.io.Serializable;



@Entity
@Table(name = "tbl_agent_rights")
public class AgentPermission extends GenericModel<AgentPermission> implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private
    Long id;
    private Boolean agentNo;
    private Boolean name;
    private Boolean postalAddress;
    private Boolean phoneNumber;
    private Boolean emailAddress;
    private Boolean country;
    private Boolean town;

    public Long getId() {
        return id;
    }

    public AgentPermission() {
        super();
        // TODO Auto-generated constructor stub
    }

    public AgentPermission(Long id, Boolean agentNo,Boolean name,
                           Boolean postalAddress,
                           Boolean phoneNumber, Boolean emailAddress,
                           Boolean country,
                           Boolean town) {
        super();
        this.id = id;

        this.name=name;
        this.agentNo = agentNo;
        this.postalAddress = postalAddress;
        this.phoneNumber = phoneNumber;
        this.emailAddress = emailAddress;
        this.country = country;
        this.town = town;

    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Boolean getName() {
        return name;
    }

    public void setName(Boolean name) {
        this.name = name;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Boolean getAgentNo() {
        return agentNo;
    }

    public void setAgentNo(Boolean agentNo) {
        this.agentNo = agentNo;
    }



    public Boolean getPostalAddress() {
        return postalAddress;
    }

    public void setPostalAddress(Boolean postalAddress) {
        this.postalAddress = postalAddress;
    }

    public Boolean getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(Boolean phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Boolean getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(Boolean emailAddress) {
        this.emailAddress = emailAddress;
    }



    public Boolean getCountry() {
        return country;
    }

    public void setCountry(Boolean country) {
        this.country = country;
    }

    public Boolean getTown() {
        return town;
    }

    public void setTown(Boolean town) {
        this.town = town;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
