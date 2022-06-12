package com.rentmanagement.dto;


import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;

public class RentDTO {
    private BigInteger id;
    private BigDecimal amountPaid;
    private BigDecimal monthlyRent;
    private Date datePaid;
    private String datePaidString;
    private Date lastPenaltyDate;
    private String month;
    private int year;
    private String unitNumber;
    private String tenantName;
    private BigDecimal excessAmount;
    private BigDecimal prepaidAmount;
    private BigDecimal amountToLandlord;
    private BigDecimal amountToRgl;
    private BigDecimal arrears;
    private BigDecimal penalty;
    private String receiptNo;
    private String paid;
    private BigDecimal propertyId;


    public BigDecimal getPropertyId() {
        return propertyId;
    }

    public void setPropertyId(BigDecimal propertyId) {
        this.propertyId = propertyId;
    }

    public String getPaid() {
        return paid;
    }

    public void setPaid(String paid) {
        this.paid = paid;
    }

    public BigInteger getId() {
        return id;
    }

    public void setId(BigInteger id) {
        this.id = id;
    }

    public BigDecimal getMonthlyRent() {
        return monthlyRent;
    }

    public void setMonthlyRent(BigDecimal monthlyRent) {
        this.monthlyRent = monthlyRent;
    }


    public BigDecimal getArrears() {
        return arrears;
    }

    public void setArrears(BigDecimal arrears) {
        this.arrears = arrears;
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

    public Date getLastPenaltyDate() {
        return lastPenaltyDate;
    }

    public void setLastPenaltyDate(Date lastPenaltyDate) {
        this.lastPenaltyDate = lastPenaltyDate;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getUnitNumber() {
        return unitNumber;
    }

    public void setUnitNumber(String unitNumber) {
        this.unitNumber = unitNumber;
    }

    public String getTenantName() {
        return tenantName;
    }

    public void setTenantName(String tenantName) {
        this.tenantName = tenantName;
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

    public String getDatePaidString() {
        return datePaidString;
    }

    public void setDatePaidString(String datePaidString) {
        this.datePaidString = datePaidString;
    }

    public String toJson() {
        StringBuffer sb = new StringBuffer();
        sb.append("{\"id\":").append("\"").append(getId()).append("\",")
                .append("\"arrears\":\"").append(getArrears() == null ? BigDecimal.ZERO : getArrears()).append("\",")
                .append("\"prepaidAmount\":\"").append(getPrepaidAmount() == null ? BigDecimal.ZERO : getPrepaidAmount()).append("\",")
                .append("\"monthlyRent\":\"").append(getMonthlyRent() == null ? BigDecimal.ZERO : getMonthlyRent()).append("\",")
                .append("\"unitNumber\":\"").append(getUnitNumber()).append("\",")
                .append("\"tenantName\":\"").append(getTenantName()).append("\",")
                .append("\"month\":\"").append(getMonth()).append("\",")
                .append("\"amountPaid\":\"").append(getAmountPaid() == null ? BigDecimal.ZERO : getAmountPaid()).append("\",")
                .append("\"year\":\"").append(getYear()).append("\"},")
                .append("\n");
        return sb.toString();
    }
}
