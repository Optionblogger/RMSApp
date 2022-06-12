package com.rentmanagement.model;

import javax.inject.Inject;
import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;

@Entity
@Table(name = "tbl_unit_liabilities")
public class UnitLiability extends GenericModel<UnitLiability> implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @ManyToOne
    private Unit unit;
    private BigDecimal electricityCost;
    private BigDecimal waterCost;
    private BigDecimal generalUnitMismanagement;
    private String description;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Unit getUnit() {
        return unit;
    }

    public void setUnit(Unit unit) {
        this.unit = unit;
    }

    public BigDecimal getElectricityCost() {
        return electricityCost;
    }

    public void setElectricityCost(BigDecimal electricityCost) {
        this.electricityCost = electricityCost;
    }

    public BigDecimal getWaterCost() {
        return waterCost;
    }

    public void setWaterCost(BigDecimal waterCost) {
        this.waterCost = waterCost;
    }

    public BigDecimal getGeneralUnitMismanagement() {
        return generalUnitMismanagement;
    }

    public void setGeneralUnitMismanagement(BigDecimal generalUnitMismanagement) {
        this.generalUnitMismanagement = generalUnitMismanagement;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
