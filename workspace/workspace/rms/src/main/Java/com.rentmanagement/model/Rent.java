package com.rentmanagement.model;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "tbl_rents")
public class Rent extends GenericModel<Rent> implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private BigDecimal amountPaid;

    private BigDecimal arrears;
    private Date datePaid;
    @ManyToOne
    private Month month;
    private int year;
    @ManyToOne
    Currency currency;
    private BigDecimal amountToLandlord;
    private BigDecimal amountToRgl;


    @ManyToOne
    Unit unit;

    @ManyToOne
    private TenancyAgreement tenancyAgreement;

    @Transient
    private String exceptions;

    private BigDecimal excessAmount;
    private BigDecimal prepaidAmount;
    private BigDecimal penalty;

    private String receiptNo;

    @Enumerated(EnumType.STRING)
    private YesNo paid;

    public String getExceptions() {
        return exceptions;
    }

    public void setExceptions(String exceptions) {
        this.exceptions = exceptions;
    }

    public BigDecimal getAmountToLandlord() {
        return amountToLandlord;
    }

    public void setAmountToLandlord(BigDecimal amountToLandlord) {
        this.amountToLandlord = amountToLandlord;
    }

    public BigDecimal getAmountToRgl() {
        return amountToRgl;
    }

    public void setAmountToRgl(BigDecimal amountToRgl) {
        this.amountToRgl = amountToRgl;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public YesNo getPaid() {
        return paid;
    }

    public void setPaid(YesNo paid) {
        this.paid = paid;
    }

    public BigDecimal getArrears() {
        return arrears;
    }

    public void setArrears(BigDecimal arrears) {
        this.arrears = arrears;
    }

    public TenancyAgreement getTenancyAgreement() {
        return tenancyAgreement;
    }

    public void setTenancyAgreement(TenancyAgreement tenancyAgreement) {
        this.tenancyAgreement = tenancyAgreement;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public BigDecimal getAmountPaid() {
        return amountPaid;
    }

    public void setAmountPaid(BigDecimal amountPaid) {
        this.amountPaid = amountPaid;
    }

    public Date getDatePaid() {
        return datePaid;
    }

    public void setDatePaid(Date datePaid) {
        this.datePaid = datePaid;
    }


    public Month getMonth() {
        return month;
    }

    public void setMonth(Month month) {
        this.month = month;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public Currency getCurrency() {
        return currency;
    }

    public void setCurrency(Currency currency) {
        this.currency = currency;
    }

    public Unit getUnit() {
        return unit;
    }

    public void setUnit(Unit unit) {
        this.unit = unit;
    }

    public BigDecimal getExcessAmount() {
        return excessAmount;
    }

    public void setExcessAmount(BigDecimal excessAmount) {
        this.excessAmount = excessAmount;
    }

    public BigDecimal getPrepaidAmount() {
        return prepaidAmount;
    }

    public void setPrepaidAmount(BigDecimal prepaidAmount) {
        this.prepaidAmount = prepaidAmount;
    }

    public BigDecimal getPenalty() {
        return penalty;
    }

    public void setPenalty(BigDecimal penalty) {
        this.penalty = penalty;
    }

    public String getReceiptNo() {
        return receiptNo;
    }

    public void setReceiptNo(String receiptNo) {
        this.receiptNo = receiptNo;
    }
}
