package com.rentmanagement.common;

public enum TemplateType {
    DEFAULT("Default"),
    EXTENDED("Extended");

    private String name;
    private TemplateType(String name) {
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
