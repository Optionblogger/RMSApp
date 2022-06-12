package com.rentmanagement.model;

public enum  TenantStatus {
    ACTIVE("Active"),
    LEFT("Left");

    private String name;
    private TenantStatus(String name) {
        this.name = name;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return name;
    }
}
