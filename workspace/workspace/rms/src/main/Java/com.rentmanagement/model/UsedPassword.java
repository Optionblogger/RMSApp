package com.rentmanagement.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table (name = "tbl_used_passwords")
public class UsedPassword extends GenericModel<UsedPassword> implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5687957149402155333L;
	
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private long id;
	
	private long userid;
	
	private String password;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getUserid() {
		return userid;
	}

	public void setUserid(long userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
