package com.rentmanagement.model;

public enum Lease {
    YES("Yes"),
    NO("No");

    private String name;

    private Lease(String name) {
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

    public static Lease get(String val) {
        return fromString(val);
    }

    public static Lease fromString(String val) {
        if (val == null || val.equals(""))
            return null;
        val = val.trim();
        if (val.equalsIgnoreCase("YES"))
            return YES;
        if (val.equalsIgnoreCase("NO"))
            return NO;
        return null;
    }

    public static Lease fromOrdinal(int ord) {
        for (Lease b : Lease.values()) {
            if (b.ordinal() == ord) {
                return b;
            }
        }
        return null;
    }
}
