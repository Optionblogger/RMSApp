package com.rentmanagement.model;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "tbl_tenants")
public class TenancyAgreement extends GenericModel<TenancyAgreement> implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String emailAddress;
    private String phoneNumber;
    private BigDecimal  serviceCharge;

    private Date dateJoined;

    private Date dateOfExit;

    private Date lastPenaltyDate;


    @Embedded
    private Address address;

    @ManyToOne
    private Unit unit;

    @Enumerated(EnumType.STRING)
    private TenantStatus tenantStatus;
    @Transient
    private String exceptions;



    public BigDecimal getServiceCharge() {
        return serviceCharge;
    }

    public void setServiceCharge(BigDecimal serviceCharge) {
        this.serviceCharge = serviceCharge;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Date getDateJoined() {
        return dateJoined;
    }

    public void setDateJoined(Date dateJoined) {
        this.dateJoined = dateJoined;
    }

    public Date getDateOfExit() {
        return dateOfExit;
    }

    public void setDateOfExit(Date dateOfExit) {
        this.dateOfExit = dateOfExit;
    }

    public TenantStatus getTenantStatus() {
        return tenantStatus;
    }

    public void setTenantStatus(TenantStatus tenantStatus) {
        this.tenantStatus = tenantStatus;
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


    public String getExceptions() {
        return exceptions;
    }

    public void setExceptions(String exceptions) {
        this.exceptions = exceptions;
    }

    public Unit getUnit() {
        return unit;
    }

    public void setUnit(Unit unit) {
        this.unit = unit;
    }

    public Date getLastPenaltyDate() {
        return lastPenaltyDate;
    }

    public void setLastPenaltyDate(Date lastPenaltyDate) {
        this.lastPenaltyDate = lastPenaltyDate;
    }
    public String toJson() {
        StringBuffer sb = new StringBuffer();
        sb.append("{\"id\":").append("\"").append(getId()).append("\",")
                .append("\"name\":\"").append(getName()==null ? "":getName()).append("\",")
                .append("\"emailAddress\":\"").append(getEmailAddress()==null?"":getEmailAddress()).append("\",")
                .append("\"unitNumber\":\"").append(getUnit()==null?"":getUnit().getUnitNumber()).append("\",")
                .append("\"phoneNumber\":\"").append(getPhoneNumber()==null?"":getPhoneNumber()).append("\",")
                .append("\"serviceCharge\":\"").append(getServiceCharge()==null?"":getServiceCharge()).append("\",")
                .append("\"dateJoined\":\"").append(getDateJoined()==null?"":getDateJoined()).append("\",")
                .append("\"town\":\"").append(getAddress()==null?"":getAddress().getTown()).append("\",")
                .append("\"exceptions\":\"").append(getExceptions()==null?"":getExceptions()).append("\",")
                .append("\"postalAddress\":\"").append(getAddress()==null?"":getAddress().getPostalAddress()).append("\"},")
                .append("\n");
        return sb.toString();
    }
}
