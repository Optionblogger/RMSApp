package com.rentmanagement.dto;

import java.math.BigDecimal;

public class ReleaseDTO {
    private String tenantName;
    private BigDecimal deposit;
    private BigDecimal liabilities;
    private BigDecimal balance;

    public String getTenantName() {
        return tenantName;
    }

    public void setTenantName(String tenantName) {
        this.tenantName = tenantName;
    }

    public BigDecimal getDeposit() {
        return deposit;
    }

    public void setDeposit(BigDecimal deposit) {
        this.deposit = deposit;
    }

    public BigDecimal getLiabilities() {
        return liabilities;
    }

    public void setLiabilities(BigDecimal liabilities) {
        this.liabilities = liabilities;
    }

    public BigDecimal getBalance() {
        return balance;
    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }
    public String toJson() {
        StringBuffer sb = new StringBuffer();
        sb.append("{\"tenantName\":\"").append(getTenantName() == null ? "" : getTenantName()).append("\",")
                .append("\"deposit\":\"").append(getDeposit() == null ? BigDecimal.ZERO : getDeposit()).append("\",")
                .append("\"liabilities\":\"").append(getLiabilities() == null ? BigDecimal.ZERO : getLiabilities()).append("\",")
                .append("\"balance\":\"").append(getBalance()==null?BigDecimal.ZERO:getBalance()).append("\"},")
                .append("\n");
        return sb.toString();
    }
   /* public String toJson() {
        StringBuffer sb = new StringBuffer();
        sb.append("{\"tenantName\":").append("\"").append(getTenantName() == null ? "" : getTenantName()).append("\",")
                .append("\"deposit\":\"").append(getDeposit() == null ? BigDecimal.ZERO : getDeposit()).append("\",")
                .append("\"liabilities\":\"").append(getLiabilities() == null ? BigDecimal.ZERO : getLiabilities()).append("\",")
                .append("\"balance\":\"").append(getBalance() == null ? BigDecimal.ZERO : getBalance()).append("\"},")
                .append("\n");
        return sb.toString();
    }*/
}
