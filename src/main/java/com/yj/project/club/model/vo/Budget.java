package com.yj.project.club.model.vo;

import java.sql.Date;

public class Budget {
	private int budget_no;
	private int circle_num;
	private String member_id;
	private String budget_content;
	private String attachment;
	private int budget_input;
	private int budget_output;
	private Date used_date;
	private Date write_date;
	private String reattachment;
	
	public Budget() {
		// TODO Auto-generated constructor stub
	}

	public Budget(int budget_no, int circle_num, String member_id, String budget_content, String attachment,
			int budget_input, int budget_output, Date used_date, Date write_date, String reattachment) {
		super();
		this.budget_no = budget_no;
		this.circle_num = circle_num;
		this.member_id = member_id;
		this.budget_content = budget_content;
		this.attachment = attachment;
		this.budget_input = budget_input;
		this.budget_output = budget_output;
		this.used_date = used_date;
		this.write_date = write_date;
		this.reattachment = reattachment;
	}

	public int getBudget_no() {
		return budget_no;
	}

	public void setBudget_no(int budget_no) {
		this.budget_no = budget_no;
	}

	public int getCircle_num() {
		return circle_num;
	}

	public void setCircle_num(int circle_num) {
		this.circle_num = circle_num;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getBudget_content() {
		return budget_content;
	}

	public void setBudget_content(String budget_content) {
		this.budget_content = budget_content;
	}

	public String getAttachment() {
		return attachment;
	}

	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}

	public int getBudget_input() {
		return budget_input;
	}

	public void setBudget_input(int budget_input) {
		this.budget_input = budget_input;
	}

	public int getBudget_output() {
		return budget_output;
	}

	public void setBudget_output(int budget_output) {
		this.budget_output = budget_output;
	}

	public Date getUsed_date() {
		return used_date;
	}

	public void setUsed_date(Date used_date) {
		this.used_date = used_date;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

	public String getReattachment() {
		return reattachment;
	}

	public void setReattachment(String reattachment) {
		this.reattachment = reattachment;
	}

	@Override
	public String toString() {
		return "Budget [budget_no=" + budget_no + ", circle_num=" + circle_num + ", member_id=" + member_id
				+ ", budget_content=" + budget_content + ", attachment=" + attachment + ", budget_input=" + budget_input
				+ ", budget_output=" + budget_output + ", used_date=" + used_date + ", write_date=" + write_date
				+ ", reattachment=" + reattachment + "]";
	}

}
