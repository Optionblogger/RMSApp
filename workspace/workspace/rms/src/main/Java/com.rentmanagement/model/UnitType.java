package com.rentmanagement.model;

public enum UnitType {
    RESIDENTIAL("Residential"),
    COMMERCIAL("Commercial");

    private String name;
    private UnitType(String name) {
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
