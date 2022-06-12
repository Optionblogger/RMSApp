package com.rentmanagement.model;

import javax.persistence.*;
import java.io.Serializable;


@Entity
@Table(name = "tbl_agent_menu")
public class AgentMenu extends GenericModel<AgentMenu> implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "personalInfo", nullable = false)
    private boolean personalInfo;

    @Column(name = "add_tenant", nullable = false)
    private boolean addTenant;
    @Column(name = "view_tenant", nullable = false)
    private boolean viewTenant;

    @Column(name = "view_tenant_grid", nullable = false)
    private boolean viewTenantGrid;

    @Column(name = "send_notification", nullable = false)
    private boolean sendNotification;

    @Column(name = "add_contract", nullable = false)
    private boolean addContract;

    @Column(name = "add_contract_batch", nullable = false)
    private boolean addContractBatch;

    @Column(name = "view_contract", nullable = false)
    private boolean viewContract;


    @Column(name = "view_contract_grid", nullable = false)
    private boolean viewContractGrid;


    @Column(name = "add_unit", nullable = false)
    private boolean addUnit;

    @Column(name = "view_unit", nullable = false)
    private boolean viewUnit;

    @Column(name = "view_unit_grid", nullable = false)
    private boolean viewUnitGrid;


    @Column(name = "issue_unit", nullable = false)
    private boolean issueUnit;

    @Column(name = "release_unit", nullable = false)
    private boolean releaseUnit;

    @Column(name = "add_service_charge", nullable = false)
    private boolean addServiceCharge;

    @Column(name = "view_service_charge", nullable = false)
    private boolean viewServiceCharge;

    @Column(name = "view_service_charge_grid", nullable = false)
    private boolean viewServiceChargeGrid;


    @Column(name = "record_rent", nullable = false)
    private boolean recordRent;
    @Column(name = "uploadRent", nullable = false)
    private boolean uploadRent;

    @Column(name = "print_invoice", nullable = false)
    private boolean printInvoice;

    @Column(name = "upload_receipts", nullable = false)
    private boolean uploadReceipts;


    @Column(name = "issue_receipts", nullable = false)
    private boolean issueReceipts;


    @Column(name = "view_rent_paid", nullable = false)
    private boolean viewRentPaid;


    @Column(name = "view_rent_paid_grid", nullable = false)
    private boolean viewRentPaidGrid;


    @Column(name = "view_rent_arrears", nullable = false)
    private boolean viewRentArrears;


    @Column(name = "view_rent_arrears_grid", nullable = false)
    private boolean viewRentArrearsGrid;


    @Column(name = "view_prepaid_rent", nullable = false)
    private boolean viewprepaidRent;


    @Column(name = "view_prepaid_rent_grid", nullable = false)
    private boolean viewprepaidRentGrid;


    @Column(name = "media", nullable = false)
    private boolean media;

    @Column(name = "document", nullable = false)
    private boolean document;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public boolean isPersonalInfo() {
        return personalInfo;
    }

    public void setPersonalInfo(boolean personalInfo) {
        this.personalInfo = personalInfo;
    }

    public boolean isAddTenant() {
        return addTenant;
    }

    public void setAddTenant(boolean addTenant) {
        this.addTenant = addTenant;
    }

    public boolean isViewTenant() {
        return viewTenant;
    }

    public void setViewTenant(boolean viewTenant) {
        this.viewTenant = viewTenant;
    }

    public boolean isSendNotification() {
        return sendNotification;
    }

    public void setSendNotification(boolean sendNotification) {
        this.sendNotification = sendNotification;
    }


    public boolean isAddContract() {
        return addContract;
    }

    public void setAddContract(boolean addContract) {
        this.addContract = addContract;
    }

    public boolean isViewContract() {
        return viewContract;
    }

    public void setViewContract(boolean viewContract) {
        this.viewContract = viewContract;
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

    public boolean isIssueUnit() {
        return issueUnit;
    }

    public void setIssueUnit(boolean issueUnit) {
        this.issueUnit = issueUnit;
    }

    public boolean isReleaseUnit() {
        return releaseUnit;
    }

    public void setReleaseUnit(boolean releaseUnit) {
        this.releaseUnit = releaseUnit;
    }

    public boolean isAddServiceCharge() {
        return addServiceCharge;
    }

    public void setAddServiceCharge(boolean addServiceCharge) {
        this.addServiceCharge = addServiceCharge;
    }

    public boolean isViewServiceCharge() {
        return viewServiceCharge;
    }

    public void setViewServiceCharge(boolean viewServiceCharge) {
        this.viewServiceCharge = viewServiceCharge;
    }

    public boolean isRecordRent() {
        return recordRent;
    }

    public void setRecordRent(boolean recordRent) {
        this.recordRent = recordRent;
    }

    public boolean isPrintInvoice() {
        return printInvoice;
    }

    public void setPrintInvoice(boolean printInvoice) {
        this.printInvoice = printInvoice;
    }

    public boolean isUploadReceipts() {
        return uploadReceipts;
    }

    public void setUploadReceipts(boolean uploadReceipts) {
        this.uploadReceipts = uploadReceipts;
    }

    public boolean isIssueReceipts() {
        return issueReceipts;
    }

    public void setIssueReceipts(boolean issueReceipts) {
        this.issueReceipts = issueReceipts;
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

    public boolean isViewprepaidRent() {
        return viewprepaidRent;
    }

    public void setViewprepaidRent(boolean viewprepaidRent) {
        this.viewprepaidRent = viewprepaidRent;
    }

    public boolean isMedia() {
        return media;
    }

    public void setMedia(boolean media) {
        this.media = media;
    }

    public boolean isDocument() {
        return document;
    }

    public void setDocument(boolean document) {
        this.document = document;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public boolean isViewTenantGrid() {
        return viewTenantGrid;
    }

    public void setViewTenantGrid(boolean viewTenantGrid) {
        this.viewTenantGrid = viewTenantGrid;
    }

    public boolean isViewContractGrid() {
        return viewContractGrid;
    }

    public void setViewContractGrid(boolean viewContractGrid) {
        this.viewContractGrid = viewContractGrid;
    }

    public boolean isViewUnitGrid() {
        return viewUnitGrid;
    }

    public void setViewUnitGrid(boolean viewUnitGrid) {
        this.viewUnitGrid = viewUnitGrid;
    }

    public boolean isViewServiceChargeGrid() {
        return viewServiceChargeGrid;
    }

    public void setViewServiceChargeGrid(boolean viewServiceChargeGrid) {
        this.viewServiceChargeGrid = viewServiceChargeGrid;
    }

    public boolean isAddContractBatch() {
        return addContractBatch;
    }

    public void setAddContractBatch(boolean addContractBatch) {
        this.addContractBatch = addContractBatch;
    }

    public boolean isViewRentPaidGrid() {
        return viewRentPaidGrid;
    }

    public void setViewRentPaidGrid(boolean viewRentPaidGrid) {
        this.viewRentPaidGrid = viewRentPaidGrid;
    }

    public boolean isViewRentArrearsGrid() {
        return viewRentArrearsGrid;
    }

    public void setViewRentArrearsGrid(boolean viewRentArrearsGrid) {
        this.viewRentArrearsGrid = viewRentArrearsGrid;
    }

    public boolean isViewprepaidRentGrid() {
        return viewprepaidRentGrid;
    }

    public void setViewprepaidRentGrid(boolean viewprepaidRentGrid) {
        this.viewprepaidRentGrid = viewprepaidRentGrid;
    }

    public boolean isUploadRent() {
        return uploadRent;
    }

    public AgentMenu(boolean personalInfo, boolean addTenant, boolean viewTenant, boolean viewTenantGrid, boolean sendNotification, boolean addContract, boolean addContractBatch, boolean viewContract, boolean viewContractGrid, boolean addUnit, boolean viewUnit, boolean viewUnitGrid, boolean issueUnit, boolean releaseUnit, boolean addServiceCharge, boolean viewServiceCharge, boolean viewServiceChargeGrid, boolean recordRent, boolean uploadRent, boolean printInvoice, boolean uploadReceipts, boolean issueReceipts, boolean viewRentPaid, boolean viewRentPaidGrid, boolean viewRentArrears, boolean viewRentArrearsGrid, boolean viewprepaidRent, boolean viewprepaidRentGrid, boolean media, boolean document) {
        this.personalInfo = personalInfo;
        this.addTenant = addTenant;
        this.viewTenant = viewTenant;
        this.viewTenantGrid = viewTenantGrid;
        this.sendNotification = sendNotification;
        this.addContract = addContract;
        this.addContractBatch = addContractBatch;
        this.viewContract = viewContract;
        this.viewContractGrid = viewContractGrid;
        this.addUnit = addUnit;
        this.viewUnit = viewUnit;
        this.viewUnitGrid = viewUnitGrid;
        this.issueUnit = issueUnit;
        this.releaseUnit = releaseUnit;
        this.addServiceCharge = addServiceCharge;
        this.viewServiceCharge = viewServiceCharge;
        this.viewServiceChargeGrid = viewServiceChargeGrid;
        this.recordRent = recordRent;
        this.uploadRent = uploadRent;
        this.printInvoice = printInvoice;
        this.uploadReceipts = uploadReceipts;
        this.issueReceipts = issueReceipts;
        this.viewRentPaid = viewRentPaid;
        this.viewRentPaidGrid = viewRentPaidGrid;
        this.viewRentArrears = viewRentArrears;
        this.viewRentArrearsGrid = viewRentArrearsGrid;
        this.viewprepaidRent = viewprepaidRent;
        this.viewprepaidRentGrid = viewprepaidRentGrid;
        this.media = media;
        this.document = document;
    }

    public void setUploadRent(boolean uploadRent) {
        this.uploadRent = uploadRent;
    }

    public AgentMenu() {
        super();
        // TODO Auto-generated constructor stub
    }
}
