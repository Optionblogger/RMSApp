package com.rentmanagement.model;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;

@Entity
@Table(name = "tbl_units")
public class Unit extends GenericModel<Unit> implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String unitNumber;
    @Enumerated(EnumType.STRING)
    private UnitType unitType;
    private BigDecimal deposit;
    private BigDecimal monthlyRent;
    @Lob
    private String description;

    private String blockNo;


    @Column(name = "booked")
    @Enumerated(EnumType.STRING)
    private YesNo booked;

    @Column(name = "occupancy_status")
    @Enumerated(EnumType.STRING)
    private OccupancyStatus occupancyStatus;
    @ManyToOne
    Property property;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public String getUnitNumber() {
        return unitNumber;
    }

    public void setUnitNumber(String unitNumber) {
        this.unitNumber = unitNumber;
    }

    public UnitType getUnitType() {
        return unitType;
    }


    public void setUnitType(UnitType unitType) {
        this.unitType = unitType;
    }

    public BigDecimal getMonthlyRent() {
        return monthlyRent;
    }

    public void setMonthlyRent(BigDecimal monthlyRent) {
        this.monthlyRent = monthlyRent;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getBlockNo() {
        return blockNo;
    }

    public void setBlockNo(String blockNo) {
        this.blockNo = blockNo;
    }


    public YesNo getBooked() {
        return booked;
    }

    public void setBooked(YesNo booked) {
        this.booked = booked;
    }

    public OccupancyStatus getOccupancyStatus() {
        return occupancyStatus;
    }

    public void setOccupancyStatus(OccupancyStatus occupancyStatus) {
        this.occupancyStatus = occupancyStatus;
    }

    public Property getProperty() {
        return property;
    }

    public void setProperty(Property property) {
        this.property = property;
    }

    public BigDecimal getDeposit() {
        return deposit;
    }

    public void setDeposit(BigDecimal deposit) {
        this.deposit = deposit;
    }
}
