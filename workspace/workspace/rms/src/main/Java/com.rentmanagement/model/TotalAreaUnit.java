package com.rentmanagement.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "tbl_total_area_units")
public class TotalAreaUnit extends GenericModel<TotalAreaUnit> implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String hectare;
    private String squareMetre;
    private String acre;
    private String squareYard;
    private String squareFeet;


    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getHectare() {
        return hectare;
    }

    public void setHectare(String hectare) {
        this.hectare = hectare;
    }

    public String getSquareMetre() {
        return squareMetre;
    }

    public void setSquareMetre(String squareMetre) {
        this.squareMetre = squareMetre;
    }

    public String getAcre() {
        return acre;
    }

    public void setAcre(String acre) {
        this.acre = acre;
    }

    public String getSquareYard() {
        return squareYard;
    }

    public void setSquareYard(String squareYard) {
        this.squareYard = squareYard;
    }

    public String getSquareFeet() {
        return squareFeet;
    }

    public void setSquareFeet(String squareFeet) {
        this.squareFeet = squareFeet;
    }
}
