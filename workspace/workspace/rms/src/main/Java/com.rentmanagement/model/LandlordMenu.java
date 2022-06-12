package com.rentmanagement.model;

import javax.persistence.*;
import java.io.Serializable;


@Entity
@Table(name = "tbl_landlord_menu")
public class LandlordMenu extends GenericModel<LandlordMenu> implements Serializable {


    private static final long serialVersionUID = -2947085950601182141L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


    public Long getId() {
        return id;
    }

    @ManyToOne
    private ProfileName profile;

    public ProfileName getProfile() {
        return profile;
    }

    public void setProfile(ProfileName profile) {
        this.profile = profile;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(name = "add_agent", nullable = false)
    private boolean addAgent;

    @Column(name = "view_agent", nullable = false)
    private boolean viewAgent;

    @Column(name = "set_commission", nullable = false)
    private boolean setCommission;

    @Column(name = "view_commission", nullable = false)
    private boolean viewCommission;


    @Column(name = "view_deduction", nullable = false)
    private boolean viewDeduction;

    @Column(name = "view_tenants", nullable = false)
    private boolean viewTenant;

    @Column(name = "add_property", nullable = false)
    private boolean addProperty;

    @Column(name = "add_property_batch", nullable = false)
    private boolean addPropertyBatch;

    @Column(name = "view_property", nullable = false)
    private boolean viewProperty;

    @Column(name = "add_units", nullable = false)
    private boolean addUnit;

    @Column(name = "view_units", nullable = false)
    private boolean viewUnit;

    @Column(name = "view_receipts", nullable = false)
    private boolean viewReceipt;

    @Column(name = "add_rent", nullable = false)
    private boolean addRent;

    @Column(name = "view_rent", nullable = false)
    private boolean viewRent;

    @Column(name = "view_paid_rent", nullable = false)
    private boolean viewRentPaid;

    @Column(name = "view_rent_arrears", nullable = false)
    private boolean viewRentArrears;


    @Column(name = "view_audit_trail", nullable = false)
    private boolean viewAuditTrail;

    @Column(name = "view_users", nullable = false)
    private boolean viewUser;

    @Column(name = "add_currency", nullable = false)
    private boolean addCurrency;

    @Column(name = "landlord_permission", nullable = false)
    private boolean landlordPermission;


    @Column(name = "agent_access", nullable = false)
    private boolean agentAccessControl;

    public boolean isAgentAccessControl() {
        return agentAccessControl;
    }

    public boolean isLandlordPermission() {
        return landlordPermission;
    }

    public void setAgentAccessControl(boolean agentAccessControl) {
        this.agentAccessControl = agentAccessControl;
    }

    public void setLandlordPermission(boolean landlordPermission) {
        this.landlordPermission = landlordPermission;
    }

    public boolean isAddAgent() {
        return addAgent;
    }

    public void setAddAgent(boolean addAgent) {
        this.addAgent = addAgent;
    }

    public boolean isViewAgent() {
        return viewAgent;
    }

    public void setViewAgent(boolean viewAgent) {
        this.viewAgent = viewAgent;
    }

    public boolean isSetCommission() {
        return setCommission;
    }

    public void setSetCommission(boolean setCommission) {
        this.setCommission = setCommission;
    }

    public boolean isViewCommission() {
        return viewCommission;
    }

    public void setViewCommission(boolean viewCommission) {
        this.viewCommission = viewCommission;
    }

    public boolean isViewDeduction() {
        return viewDeduction;
    }

    public void setViewDeduction(boolean viewDeduction) {
        this.viewDeduction = viewDeduction;
    }

    public boolean isViewTenant() {
        return viewTenant;
    }

    public void setViewTenant(boolean viewTenant) {
        this.viewTenant = viewTenant;
    }

    public boolean isAddProperty() {
        return addProperty;
    }

    public void setAddProperty(boolean addProperty) {
        this.addProperty = addProperty;
    }

    public boolean isViewProperty() {
        return viewProperty;
    }

    public void setViewProperty(boolean viewProperty) {
        this.viewProperty = viewProperty;
    }

    public boolean isAddUnit() {
        return addUnit;
    }

    public void setAddUnit(boolean addUnit) {
        this.addUnit = addUnit;
    }

    public boolean isViewUnit() {
        return viewUnit;
    }

    public void setViewUnit(boolean viewUnit) {
        this.viewUnit = viewUnit;
    }

    public boolean isViewReceipt() {
        return viewReceipt;
    }

    public void setViewReceipt(boolean viewReceipt) {
        this.viewReceipt = viewReceipt;
    }

    public boolean isAddRent() {
        return addRent;
    }

    public void setAddRent(boolean addRent) {
        this.addRent = addRent;
    }

    public boolean isViewRent() {
        return viewRent;
    }

    public void setViewRent(boolean viewRent) {
        this.viewRent = viewRent;
    }

    public boolean isViewRentPaid() {
        return viewRentPaid;
    }

    public void setViewRentPaid(boolean viewRentPaid) {
        this.viewRentPaid = viewRentPaid;
    }

    public boolean isViewRentArrears() {
        return viewRentArrears;
    }

    public void setViewRentArrears(boolean viewRentArrears) {
        this.viewRentArrears = viewRentArrears;
    }

    public boolean isViewAuditTrail() {
        return viewAuditTrail;
    }

    public void setViewAuditTrail(boolean viewAuditTrail) {
        this.viewAuditTrail = viewAuditTrail;
    }

    public boolean isViewUser() {
        return viewUser;
    }

    public void setViewUser(boolean viewUser) {
        this.viewUser = viewUser;
    }

    public boolean isAddCurrency() {
        return addCurrency;
    }

    public void setAddCurrency(boolean addCurrency) {
        this.addCurrency = addCurrency;
    }

    public boolean isAddPropertyBatch() {
        return addPropertyBatch;
    }

    public void setAddPropertyBatch(boolean addPropertyBatch) {
        this.addPropertyBatch = addPropertyBatch;
    }

    public LandlordMenu(boolean addAgent, boolean agentAccessControl, boolean landlordPermission, boolean viewAgent, boolean setCommission, boolean viewCommission, boolean viewDeduction, boolean viewTenant, boolean addProperty,boolean addPropertyBatch, boolean viewProperty, boolean addUnit, boolean viewUnit, boolean viewReceipt, boolean addRent, boolean viewRent, boolean viewRentPaid, boolean viewRentArrears, boolean viewAuditTrail, boolean viewUser, boolean addCurrency) {
        this.addAgent = addAgent;
        this.viewAgent = viewAgent;
        this.setCommission = setCommission;
        this.viewCommission = viewCommission;
        this.viewDeduction = viewDeduction;
        this.viewTenant = viewTenant;
        this.addProperty = addProperty;
        this.addPropertyBatch = addPropertyBatch;
        this.viewProperty = viewProperty;
        this.addUnit = addUnit;
        this.viewUnit = viewUnit;
        this.viewReceipt = viewReceipt;
        this.addRent = addRent;
        this.viewRent = viewRent;
        this.viewRentPaid = viewRentPaid;
        this.viewRentArrears = viewRentArrears;
        this.viewAuditTrail = viewAuditTrail;
        this.viewUser = viewUser;
        this.addCurrency = addCurrency;
        this.landlordPermission = landlordPermission;
        this.agentAccessControl = agentAccessControl;
    }

    public LandlordMenu() {
        super();
    }
}
