package com.rentmanagement.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
@Entity
@Table (name = "tbl_activity_logs")
public class ActivityLog extends GenericModel<ActivityLog> implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public ActivityLog() {
		// TODO Auto-generated constructor stub
	}
	
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private
	Long id;
	@Column (name = "description", nullable = false)
	private
	String description;
	@Column (name = "userProfile")
	private
	String userProfile;
	@Column (name = "datetime", nullable = false)
	private
	Date datetime;
	@Column (name = "user_id")
	private
	Long userID;
	public Long getUserID() {
		return userID;
	}
	public void setUserID(Long userID) {
		this.userID = userID;
	}
	public String getAccess_menu() {
		return access_menu;
	}
	public void setAccess_menu(String access_menu) {
		this.access_menu = access_menu;
	}

	public String getUserProfile() {
		return userProfile;
	}
	public void setUserProfile(String userProfile) {
		this.userProfile = userProfile;
	}


	private String access_menu;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getDatetime() {
		return datetime;
	}
	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public ActivityLog(String description, Date datetime,
					   Long userID, String access_menu, String userProfile) {
		super();
		this.id = null;
		this.description = description;
		this.datetime = datetime;
		this.userID = userID;
		this.access_menu = access_menu;
		this.userProfile = userProfile;
	}
	
}
