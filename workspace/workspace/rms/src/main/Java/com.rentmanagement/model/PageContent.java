package com.rentmanagement.model;

import javax.persistence.*;
import java.io.Serializable;
@Entity
@Table (name = "tbl_content")
public class PageContent extends GenericModel<PageContent> implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public PageContent() {
		// TODO Auto-generated constructor stub
	}

	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private
	Long id;
	private String page;
	@Column (columnDefinition = "TEXT")
	private String text;
	private String position;
	private boolean publish;

	public boolean isPublish() {
		return publish;
	}
	public void setPublish(boolean publish) {
		this.publish = publish;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public PageContent(Long id, String page, String text, String position,
			boolean publish) {
		super();
		this.id = id;
		this.page = page;
		this.text = text;
		this.position = position;
		this.publish = publish;
	}
}
