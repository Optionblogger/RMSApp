package com.rentmanagement.model;

public enum OccupancyStatus {
    OCCUPIED("Occupied"),
    VACANT("Vacant"),
    INACTIVE("Inactive");

    private String name;
    private OccupancyStatus(String name) {
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
