package com.rentmanagement.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "tbl_permissions")
public class Permission extends GenericModel<Permission> implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public boolean isSetup() {
        return setup;
    }


    public void setSetup(boolean setup) {
        this.setup = setup;
    }

    public boolean isContent() {
        return content;
    }

    public void setContent(boolean content) {
        this.content = content;
    }


    public boolean isMedia() {
        return media;
    }

    public boolean isDocument() {
        return document;
    }

    public void setMedia(boolean media) {
        this.media = media;
    }

    public void setDocument(boolean document) {
        this.document = document;
    }

    public boolean isUac() {
        return uac;
    }

    public void setUac(boolean uac) {
        this.uac = uac;
    }


    public boolean isSetup_company() {
        return setup_company;
    }

    public void setSetup_company(boolean setup_company) {
        this.setup_company = setup_company;
    }

    public boolean isSetup_email() {
        return setup_email;
    }

    public void setSetup_email(boolean setup_email) {
        this.setup_email = setup_email;
    }

    public boolean isSetup_logo() {
        return setup_logo;
    }

    public void setSetup_logo(boolean setup_logo) {
        this.setup_logo = setup_logo;
    }

    public boolean isSetup_menu() {
        return setup_menu;
    }

    public void setSetup_menu(boolean setup_menu) {
        this.setup_menu = setup_menu;
    }

    public boolean isEnable_acc_recovery() {
        return enable_acc_recovery;
    }

    public void setEnable_acc_recovery(boolean enable_acc_recovery) {
        this.enable_acc_recovery = enable_acc_recovery;
    }

    public boolean isDb_menu() {
        return db_menu;
    }

    public void setDb_menu(boolean db_menu) {
        this.db_menu = db_menu;
    }

    public boolean isSetup_social() {
        return setup_social;
    }

    public void setSetup_social(boolean setup_social) {
        this.setup_social = setup_social;
    }

    public boolean isSetup_theme() {
        return setup_theme;
    }

    public void setSetup_theme(boolean setup_theme) {
        this.setup_theme = setup_theme;
    }

    public boolean isSetup_banner() {
        return setup_banner;
    }

    public void setSetup_banner(boolean setup_banner) {
        this.setup_banner = setup_banner;
    }

    public boolean isSetup_interest_rate() {
        return setup_interest_rate;
    }

    public void setSetup_interest_rate(boolean setup_interest_rate) {
        this.setup_interest_rate = setup_interest_rate;
    }

    public boolean isSetup_other() {
        return setup_other;
    }

    public void setSetup_other(boolean setup_other) {
        this.setup_other = setup_other;
    }

    public boolean isSetup_contact_reason() {
        return setup_contact_reason;
    }

    public void setSetup_contact_reason(boolean setup_contact_reason) {
        this.setup_contact_reason = setup_contact_reason;
    }

    public boolean isContent_help() {
        return content_help;
    }

    public void setContent_help(boolean content_help) {
        this.content_help = content_help;
    }

    public boolean isContent_page() {
        return content_page;
    }

    public void setContent_page(boolean content_page) {
        this.content_page = content_page;
    }

    public boolean isFaq_page() {
        return faq_page;
    }

    public void setFaq_page(boolean faq_page) {
        this.faq_page = faq_page;
    }


    public boolean isMedia_upload() {
        return media_upload;
    }

    public void setMedia_upload(boolean media_upload) {
        this.media_upload = media_upload;
    }

    public boolean isMember_edit() {
        return member_edit;
    }

    public void setMember_edit(boolean member_edit) {
        this.member_edit = member_edit;
    }


    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    public boolean isProfile_privileges() {
        return profile_privileges;
    }

    public void setProfile_privileges(boolean profile_privileges) {
        this.profile_privileges = profile_privileges;
    }


    public boolean isAdmin_dashboard_items() {
        return admin_dashboard_items;
    }

    public void setAdmin_dashboard_items(boolean admin_dashboard_items) {
        this.admin_dashboard_items = admin_dashboard_items;
    }

    public boolean isProfile_login_username() {
        return profile_login_username;
    }

    public void setProfile_login_username(boolean profile_login_username) {
        this.profile_login_username = profile_login_username;
    }

    public boolean isClient_setup_config() {
        return client_setup_config;
    }

    public void setClient_setup_config(boolean client_setup_config) {
        this.client_setup_config = client_setup_config;
    }

    public boolean isMedia_remove() {
        return media_remove;
    }

    public void setMedia_remove(boolean media_remove) {
        this.media_remove = media_remove;
    }

    public boolean isMember_view() {
        return member_view;
    }

    public void setMember_view(boolean member_view) {
        this.member_view = member_view;
    }

    private String profile;

    private boolean setup, content, media, document, uac;

    private boolean portal_agents, portal_agent_view, portal_agent_delete, portal_agent_add;

    private boolean portal_landlords, portal_landlord_view, portal_landlord_delete, portal_landlord_add;

    private boolean tenants, view_tenant;
    private boolean property, add_property,add_propertyBatch, view_property;
    private boolean unit, add_unit, view_unit,view_unit_grid ;
    private boolean service_charge, view_service_charge;
    private boolean rent, view_rent_paid, view_rent_arrears, view_rent_prepaid;
    private boolean commissions, view_commissions;
    private boolean deductions, view_deductions;
    private boolean invoices, view_invoices;
    private boolean receipts, view_receipts;


    public boolean isAdd_propertyBatch() {
        return add_propertyBatch;
    }

    public void setAdd_propertyBatch(boolean add_propertyBatch) {
        this.add_propertyBatch = add_propertyBatch;
    }

    private boolean password_policy;

    public boolean isPassword_policy() {
        return password_policy;
    }

    public void setPassword_policy(boolean password_policy) {
        this.password_policy = password_policy;
    }


    public boolean isPortal_landlords() {
        return portal_landlords;
    }

    public void setPortal_landlords(boolean portal_landlords) {
        this.portal_landlords = portal_landlords;
    }

    public boolean isUsers() {
        return users;
    }


    public void setUsers(boolean users) {
        this.users = users;
    }

    public boolean isAudit_trail() {
        return audit_trail;
    }

    public void setAudit_trail(boolean audit_trail) {
        this.audit_trail = audit_trail;
    }


    private boolean setup_company, setup_email, setup_logo, setup_menu, enable_acc_recovery, db_menu, setup_social, setup_theme, setup_banner, setup_interest_rate, setup_other, setup_contact_reason;

    private boolean content_help, content_page, faq_page;

    private boolean profile_privileges, agent_edit_permissions, agent_menu_config, agent_dashboard_items, admin_dashboard_items, profile_login_username, client_setup_config, users, user_enable_disable, audit_trail;


    private boolean media_upload, media_remove, profile_names, client_names;


    public boolean isProfile_names() {
        return profile_names;
    }

    public void setProfile_names(boolean profile_names) {
        this.profile_names = profile_names;
    }

    public boolean isClient_names() {
        return client_names;
    }

    public void setClient_names(boolean client_names) {
        this.client_names = client_names;
    }

    public boolean isUser_enable_disable() {
        return user_enable_disable;
    }

    public void setUser_enable_disable(boolean user_enable_disable) {
        this.user_enable_disable = user_enable_disable;
    }

    public Permission() {
        super();
        // TODO Auto-generated constructor stub
    }

    public boolean isPortal_agents() {
        return portal_agents;
    }

    public void setPortal_agents(boolean portal_agents) {
        this.portal_agents = portal_agents;
    }

    public boolean isPortal_agent_view() {
        return portal_agent_view;
    }

    public void setPortal_agent_view(boolean portal_agent_view) {
        this.portal_agent_view = portal_agent_view;
    }

    public boolean isPortal_agent_delete() {
        return portal_agent_delete;
    }

    public void setPortal_agent_delete(boolean portal_agent_delete) {
        this.portal_agent_delete = portal_agent_delete;
    }

    public boolean isPortal_agent_add() {
        return portal_agent_add;
    }

    public void setPortal_agent_add(boolean portal_agent_add) {
        this.portal_agent_add = portal_agent_add;
    }

    public boolean isPortal_landlord_view() {
        return portal_landlord_view;
    }

    public void setPortal_landlord_view(boolean portal_landlord_view) {
        this.portal_landlord_view = portal_landlord_view;
    }

    public boolean isPortal_landlord_delete() {
        return portal_landlord_delete;
    }

    public void setPortal_landlord_delete(boolean portal_landlord_delete) {
        this.portal_landlord_delete = portal_landlord_delete;
    }

    public boolean isPortal_landlord_add() {
        return portal_landlord_add;
    }

    public void setPortal_landlord_add(boolean portal_landlord_add) {
        this.portal_landlord_add = portal_landlord_add;
    }

    private boolean member_edit, member_view;

    public boolean isAgent_edit_permissions() {
        return agent_edit_permissions;
    }

    public void setAgent_edit_permissions(boolean agent_edit_permissions) {
        this.agent_edit_permissions = agent_edit_permissions;
    }

    public boolean isAgent_menu_config() {
        return agent_menu_config;
    }

    public void setAgent_menu_config(boolean agent_menu_config) {
        this.agent_menu_config = agent_menu_config;
    }

    public boolean isAgent_dashboard_items() {
        return agent_dashboard_items;
    }

    public void setAgent_dashboard_items(boolean agent_dashboard_items) {
        this.agent_dashboard_items = agent_dashboard_items;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public boolean isTenants() {
        return tenants;
    }

    public void setTenants(boolean tenants) {
        this.tenants = tenants;
    }

    public boolean isView_tenant() {
        return view_tenant;
    }

    public void setView_tenant(boolean view_tenant) {
        this.view_tenant = view_tenant;
    }

    public boolean isProperty() {
        return property;
    }

    public void setProperty(boolean property) {
        this.property = property;
    }

    public boolean isAdd_property() {
        return add_property;
    }

    public void setAdd_property(boolean add_property) {
        this.add_property = add_property;
    }

    public boolean isView_property() {
        return view_property;
    }

    public void setView_property(boolean view_property) {
        this.view_property = view_property;
    }

    public boolean isUnit() {
        return unit;
    }

    public void setUnit(boolean unit) {
        this.unit = unit;
    }

    public boolean isAdd_unit() {
        return add_unit;
    }

    public void setAdd_unit(boolean add_unit) {
        this.add_unit = add_unit;
    }

    public boolean isView_unit() {
        return view_unit;
    }

    public void setView_unit(boolean view_unit) {
        this.view_unit = view_unit;
    }

    public boolean isView_unit_grid() {
        return view_unit_grid;
    }

    public void setView_unit_grid(boolean view_unit_grid) {
        this.view_unit_grid = view_unit_grid;
    }

    public boolean isService_charge() {
        return service_charge;
    }

    public void setService_charge(boolean service_charge) {
        this.service_charge = service_charge;
    }

    public boolean isView_service_charge() {
        return view_service_charge;
    }

    public void setView_service_charge(boolean view_service_charge) {
        this.view_service_charge = view_service_charge;
    }

    public boolean isRent() {
        return rent;
    }

    public void setRent(boolean rent) {
        this.rent = rent;
    }

    public boolean isView_rent_paid() {
        return view_rent_paid;
    }

    public void setView_rent_paid(boolean view_rent_paid) {
        this.view_rent_paid = view_rent_paid;
    }

    public boolean isView_rent_arrears() {
        return view_rent_arrears;
    }

    public void setView_rent_arrears(boolean view_rent_arrears) {
        this.view_rent_arrears = view_rent_arrears;
    }

    public boolean isView_rent_prepaid() {
        return view_rent_prepaid;
    }

    public void setView_rent_prepaid(boolean view_rent_prepaid) {
        this.view_rent_prepaid = view_rent_prepaid;
    }

    public boolean isCommissions() {
        return commissions;
    }

    public void setCommissions(boolean commissions) {
        this.commissions = commissions;
    }

    public boolean isView_commissions() {
        return view_commissions;
    }

    public void setView_commissions(boolean view_commissions) {
        this.view_commissions = view_commissions;
    }

    public boolean isDeductions() {
        return deductions;
    }

    public void setDeductions(boolean deductions) {
        this.deductions = deductions;
    }

    public boolean isView_deductions() {
        return view_deductions;
    }

    public void setView_deductions(boolean view_deductions) {
        this.view_deductions = view_deductions;
    }

    public boolean isInvoices() {
        return invoices;
    }

    public void setInvoices(boolean invoices) {
        this.invoices = invoices;
    }

    public boolean isView_invoices() {
        return view_invoices;
    }

    public void setView_invoices(boolean view_invoices) {
        this.view_invoices = view_invoices;
    }

    public boolean isReceipts() {
        return receipts;
    }

    public void setReceipts(boolean receipts) {
        this.receipts = receipts;
    }

    public boolean isView_receipts() {
        return view_receipts;
    }

    public void setView_receipts(boolean view_receipts) {
        this.view_receipts = view_receipts;
    }

    public Permission(String profile, boolean setup, boolean content,
                      boolean tenants,
                      boolean view_tenant,
                      boolean property,
                      boolean add_property,
                      boolean add_propertyBatch,
                      boolean view_property,
                      boolean unit,
                      boolean add_unit,
                      boolean view_unit,
                      boolean view_unit_grid,
                      boolean service_charge,
                      boolean view_service_charge,
                      boolean rent,
                      boolean view_rent_paid,
                      boolean view_rent_arrears,
                      boolean view_rent_prepaid,
                      boolean commissions,
                      boolean view_commissions,
                      boolean deductions,
                      boolean view_deductions,
                      boolean invoices,
                      boolean view_invoices,
                      boolean receipts,
                      boolean view_receipts,
                      boolean media, boolean document, boolean uac, boolean portal_agents,
                      boolean portal_agent_view, boolean portal_agent_delete, boolean portal_agent_add,
                      boolean portal_landlords, boolean portal_landlord_view, boolean portal_landlord_delete,
                      boolean portal_landlord_add, boolean password_policy, boolean setup_company, boolean setup_email,
                      boolean setup_logo, boolean setup_menu, boolean enable_acc_recovery, boolean db_menu, boolean setup_social,
                      boolean setup_theme, boolean setup_banner, boolean setup_interest_rate, boolean setup_other, boolean setup_contact_reason,
                      boolean content_help, boolean content_page, boolean faq_page, boolean profile_privileges, boolean agent_edit_permissions,
                      boolean agent_menu_config, boolean agent_dashboard_items, boolean admin_dashboard_items, boolean profile_login_username,
                      boolean client_setup_config, boolean users, boolean user_enable_disable, boolean audit_trail,
                      boolean media_upload, boolean media_remove, boolean profile_names, boolean client_names, boolean member_edit, boolean member_view) {
        this.profile = profile;
        this.setup = setup;
        this.content = content;
        this.tenants = tenants;
        this.view_tenant = view_tenant;
        this.property = property;
        this.add_property = add_property;
        this.add_propertyBatch = add_propertyBatch;
        this.view_property = view_property;
        this.unit = unit;
        this.view_unit = view_unit;
        this.view_unit_grid= view_unit_grid;
        this.add_unit = add_unit;
        this.view_receipts = view_receipts;
        this.receipts = receipts;
        this.invoices = invoices;
        this.view_invoices = view_invoices;
        this.service_charge = service_charge;
        this.view_service_charge = view_service_charge;
        this.deductions = deductions;
        this.view_deductions = view_deductions;
        this.commissions = commissions;
        this.view_commissions = view_commissions;
        this.rent = rent;
        this.view_rent_arrears = view_rent_arrears;
        this.view_rent_paid = view_rent_paid;
        this.view_rent_prepaid = view_rent_prepaid;
        this.media = media;
        this.document = document;
        this.uac = uac;
        this.portal_agents = portal_agents;
        this.portal_agent_view = portal_agent_view;
        this.portal_agent_delete = portal_agent_delete;
        this.portal_agent_add = portal_agent_add;
        this.portal_landlords = portal_landlords;
        this.portal_landlord_view = portal_landlord_view;
        this.portal_landlord_delete = portal_landlord_delete;
        this.portal_landlord_add = portal_landlord_add;
        this.password_policy = password_policy;
        this.setup_company = setup_company;
        this.setup_email = setup_email;
        this.setup_logo = setup_logo;
        this.setup_menu = setup_menu;
        this.enable_acc_recovery = enable_acc_recovery;
        this.db_menu = db_menu;
        this.setup_social = setup_social;
        this.setup_theme = setup_theme;
        this.setup_banner = setup_banner;
        this.setup_interest_rate = setup_interest_rate;
        this.setup_other = setup_other;
        this.setup_contact_reason = setup_contact_reason;
        this.content_help = content_help;
        this.content_page = content_page;
        this.faq_page = faq_page;
        this.profile_privileges = profile_privileges;
        this.agent_edit_permissions = agent_edit_permissions;
        this.agent_menu_config = agent_menu_config;
        this.agent_dashboard_items = agent_dashboard_items;
        this.admin_dashboard_items = admin_dashboard_items;
        this.profile_login_username = profile_login_username;
        this.client_setup_config = client_setup_config;
        this.users = users;
        this.user_enable_disable = user_enable_disable;
        this.audit_trail = audit_trail;
        this.media_upload = media_upload;
        this.media_remove = media_remove;
        this.profile_names = profile_names;
        this.client_names = client_names;
        this.member_edit = member_edit;
        this.member_view = member_view;
    }
}
