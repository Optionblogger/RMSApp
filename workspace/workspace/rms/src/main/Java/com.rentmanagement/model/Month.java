package com.rentmanagement.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "tbl_months")
public class Month extends GenericModel<Month> implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String name;

    public Month(Long id,String name) {
        this.name = name;
        this.id =id;
    }

    public Month() {
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
