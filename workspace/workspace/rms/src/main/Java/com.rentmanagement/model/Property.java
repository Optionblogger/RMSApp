package com.rentmanagement.model;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;

@Entity
@Table(name = "tbl_properties")
public class Property extends GenericModel<Property> implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String propertyNo;

    private String name;

    private String companyName;

    private String landRates;

    private String totalArea;
    private String location;
    private int numberOfUnits;
    @OneToOne
    private TotalAreaUnit totalAreaUnit;
    private String landNumber;
    @Embedded
    private Address address;

    @ManyToOne
    private Agent agent;

    @Transient
    private String exceptions;

    @Enumerated(EnumType.STRING)
    private PropertyCategory propertyCategory;


    @Enumerated(EnumType.STRING)
    private Lease lease;

    public String getPropertyNo() {
        return propertyNo;
    }

    public void setPropertyNo(String propertyNo) {
        this.propertyNo = propertyNo;
    }

    public int getNumberOfUnits() {
        return numberOfUnits;
    }

    public void setNumberOfUnits(int numberOfUnits) {
        this.numberOfUnits = numberOfUnits;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Agent getAgent() {
        return agent;
    }

    public void setAgent(Agent agent) {
        this.agent = agent;
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


    public String getTotalArea() {
        return totalArea;
    }

    public void setTotalArea(String totalArea) {
        this.totalArea = totalArea;
    }

    public TotalAreaUnit getTotalAreaUnit() {
        return totalAreaUnit;
    }

    public void setTotalAreaUnit(TotalAreaUnit totalAreaUnit) {
        this.totalAreaUnit = totalAreaUnit;
    }

    public String getLandNumber() {
        return landNumber;
    }

    public void setLandNumber(String landNumber) {
        this.landNumber = landNumber;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public PropertyCategory getPropertyCategory() {
        return propertyCategory;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getLandRates() {
        return landRates;
    }

    public void setLandRates(String landRates) {
        this.landRates = landRates;
    }

    public Lease getLease() {
        return lease;
    }

    public void setLease(Lease lease) {
        this.lease = lease;
    }

    public void setPropertyCategory(PropertyCategory propertyCategory) {
        this.propertyCategory = propertyCategory;
    }

    public String getExceptions() {
        return exceptions;
    }

    public void setExceptions(String exceptions) {
        this.exceptions = exceptions;
    }
}
