package com.rentmanagement.model;

import javax.persistence.*;
import java.io.Serializable;


@Entity
@Table(name = "admin_dashboard_items")
public class LandloardDashboardItems extends GenericModel<AgentMenu> implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "properties", nullable = false)
    private boolean numberOfProperties;
    @Column(name = "agents", nullable = false)
    private boolean numberOfAgents;
    @Column(name = "activeTenants", nullable = false)
    private boolean activeTenants;
    @Column(name = "vacantUnits", nullable = false)
    private boolean vacantUnits;
    @Column(name = "units", nullable = false)
    private boolean numberOfUnits;
    @Column(name = "occupiedUnits", nullable = false)
    private boolean occupiedUnits;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public boolean isNumberOfProperties() {
        return numberOfProperties;
    }

    public void setNumberOfProperties(boolean numberOfProperties) {
        this.numberOfProperties = numberOfProperties;
    }

    public boolean isNumberOfAgents() {
        return numberOfAgents;
    }

    public void setNumberOfAgents(boolean numberOfAgents) {
        this.numberOfAgents = numberOfAgents;
    }

    public boolean isActiveTenants() {
        return activeTenants;
    }

    public void setActiveTenants(boolean activeTenants) {
        this.activeTenants = activeTenants;
    }

    public boolean isVacantUnits() {
        return vacantUnits;
    }

    public void setVacantUnits(boolean vacantUnits) {
        this.vacantUnits = vacantUnits;
    }

    public boolean isNumberOfUnits() {
        return numberOfUnits;
    }

    public void setNumberOfUnits(boolean numberOfUnits) {
        this.numberOfUnits = numberOfUnits;
    }

    public boolean isOccupiedUnits() {
        return occupiedUnits;
    }

    public void setOccupiedUnits(boolean occupiedUnits) {
        this.occupiedUnits = occupiedUnits;
    }

    public LandloardDashboardItems(boolean numberOfProperties, boolean numberOfAgents, boolean activeTenants, boolean vacantUnits, boolean numberOfUnits, boolean occupiedUnits) {


        this.numberOfProperties = numberOfProperties;
        this.numberOfAgents = numberOfAgents;
        this.activeTenants = activeTenants;
        this.vacantUnits = vacantUnits;
        this.numberOfUnits = numberOfUnits;
        this.occupiedUnits = occupiedUnits;
    }

    public LandloardDashboardItems() {
        super();
    }




}
