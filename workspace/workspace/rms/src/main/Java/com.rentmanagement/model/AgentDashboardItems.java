package com.rentmanagement.model;

import javax.persistence.*;
import java.io.Serializable;


@Entity
@Table(name = "tbl_agent_dashboard_items")
public class AgentDashboardItems extends GenericModel<AgentDashboardItems> implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


    @Column(name = "name", nullable = false)
    private boolean name;

   /* @Column(name = "idNumber", nullable = false)
    private boolean idNumber;*/

    @Column(name = "email", nullable = false)
    private boolean emailAddress;

    @Column(name = "phone_number", nullable = false)
    private boolean phoneNumber;

    @Column(name = "agentNo", nullable = false)
    private boolean agentNumber;

    public AgentDashboardItems(boolean name ,boolean emailAddress, boolean phoneNumber, boolean agentNumber) {

        this.name = name;
        this.emailAddress = emailAddress;
        this.phoneNumber = phoneNumber;
        this.agentNumber = agentNumber;
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


    public boolean isName() {
        return name;
    }

    public void setName(boolean name) {
        this.name = name;
    }



    public boolean isEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(boolean emailAddress) {
        this.emailAddress = emailAddress;
    }

    public boolean isPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(boolean phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public boolean isAgentNumber() {
        return agentNumber;
    }

    public void setAgentNumber(boolean agentNumber) {
        this.agentNumber = agentNumber;
    }

    public AgentDashboardItems() {
        super();
        // TODO Auto-generated constructor stub
    }
}
