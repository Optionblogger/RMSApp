package com.rentmanagement.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
@Entity
@Table (name = "tbl_notifications")
class Notification extends GenericModel<Notification> implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public Notification() {
		// TODO Auto-generated constructor stub
	}
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private
	Long id;
	@Column (name = "details", nullable = false)
	private
	String details;
	@Column (name = "datetime", nullable = false)
	private
	Date datetime;
	@Column (name = "target", nullable = false)
	private
	String target;

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public Date getDatetime() {
		return datetime;
	}
	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
																								
	
}
