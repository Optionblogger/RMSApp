package com.rentmanagement.model;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Table(name = "tbl_rent_penalty_formula")
@Entity
public class RentPenaltyFormula  extends GenericModel<RentPenaltyFormula> implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private Date effectiveDate;

    private String name;

    private String formula;

    private BigDecimal rate;

    private Integer dueDay;

    @Transient
    private String auditDescription = "Rent Penalty Formula";

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getEffectiveDate() {
        return effectiveDate;
    }

    public void setEffectiveDate(Date effectiveDate) {
        this.effectiveDate = effectiveDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFormula() {
        return formula;
    }

    public void setFormula(String formula) {
        this.formula = formula;
    }

    public BigDecimal getRate() {
        return rate;
    }

    public void setRate(BigDecimal rate) {
        this.rate = rate;
    }

    public Integer getDueDay() {
        return dueDay;
    }

    public void setDueDay(Integer dueDay) {
        this.dueDay = dueDay;
    }

    public String getAuditDescription() {
        return auditDescription;
    }

    public void setAuditDescription(String auditDescription) {
        this.auditDescription = auditDescription;
    }
}
