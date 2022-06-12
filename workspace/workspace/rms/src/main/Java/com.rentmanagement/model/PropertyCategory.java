package com.rentmanagement.model;

public enum PropertyCategory {

    COMMERCIAL("Commercial"),
    RESIDENTIAL("Residential");

    private String name;

    private PropertyCategory(String name) {
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

    public static PropertyCategory get(String val) {
        return fromString(val);
    }

    public static PropertyCategory fromString(String val) {
        if (val == null || val.equals(""))
            return null;
        val = val.trim();
        if (val.equalsIgnoreCase("COMMERCIAL"))
            return COMMERCIAL;
        if (val.equalsIgnoreCase("RESIDENTIAL"))
            return RESIDENTIAL;
        return null;
    }

    public static PropertyCategory fromOrdinal(int ord) {
        for (PropertyCategory b : PropertyCategory.values()) {
            if (b.ordinal() == ord) {
                return b;
            }
        }
        return null;

    }
}
