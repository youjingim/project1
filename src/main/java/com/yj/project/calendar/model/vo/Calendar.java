package com.yj.project.calendar.model.vo;

import java.sql.Date;

public class Calendar {
	
	private String machingTitle;
	private Date machingDate;
	private String machingTime;
	private String machingPlace;
	private String machingContent;
	
	public Calendar() {
		// TODO Auto-generated constructor stub
	}

	public Calendar(String machingTitle, Date machingDate, String machingTime, String machingPlace,
			String machingContent) {
		super();
		this.machingTitle = machingTitle;
		this.machingDate = machingDate;
		this.machingTime = machingTime;
		this.machingPlace = machingPlace;
		this.machingContent = machingContent;
	}

	public String getMachingTitle() {
		return machingTitle;
	}

	public void setMachingTitle(String machingTitle) {
		this.machingTitle = machingTitle;
	}

	public Date getMachingDate() {
		return machingDate;
	}

	public void setMachingDate(Date machingDate) {
		this.machingDate = machingDate;
	}

	public String getMachingTime() {
		return machingTime;
	}

	public void setMachingTime(String machingTime) {
		this.machingTime = machingTime;
	}

	public String getMachingPlace() {
		return machingPlace;
	}

	public void setMachingPlace(String machingPlace) {
		this.machingPlace = machingPlace;
	}

	public String getMachingContent() {
		return machingContent;
	}

	public void setMachingContent(String machingContent) {
		this.machingContent = machingContent;
	}

	@Override
	public String toString() {
		return "Calendar [machingTitle=" + machingTitle + ", machingDate=" + machingDate + ", machingTime="
				+ machingTime + ", machingPlace=" + machingPlace + ", machingContent=" + machingContent + "]";
	}
	
}
