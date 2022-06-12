package com.rentmanagement.model;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "tbl_commissions")
public class Commission  extends  GenericModel<Commission> implements Serializable{
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private BigDecimal amount;
    private Date datePaid;
    private BigDecimal arrears;
    private BigDecimal excessAmount;
    private BigDecimal deductions;
    private String receiptNo;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public Date getDatePaid() {
        return datePaid;
    }

    public void setDatePaid(Date datePaid) {
        this.datePaid = datePaid;
    }

    public BigDecimal getArrears() {
        return arrears;
    }

    public void setArrears(BigDecimal arrears) {
        this.arrears = arrears;
    }

    public BigDecimal getExcessAmount() {
        return excessAmount;
    }

    public void setExcessAmount(BigDecimal excessAmount) {
        this.excessAmount = excessAmount;
    }

    public BigDecimal getDeductions() {
        return deductions;
    }

    public void setDeductions(BigDecimal deductions) {
        this.deductions = deductions;
    }

    public String getReceiptNo() {
        return receiptNo;
    }

    public void setReceiptNo(String receiptNo) {
        this.receiptNo = receiptNo;
    }
}
