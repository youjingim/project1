package com.yj.project.message.model.vo;

import java.util.Date;

public class Message {
	private int message_num;
	private String message_sender;
	private String message_receiver;
	private String message_title;
	private String message_content;
	private Date message_date;
	private String status;
	
	public Message() {}

	public Message(int message_num, String message_sender, String message_receiver, String message_title,
			String message_content, Date message_date, String status) {
		super();
		this.message_num = message_num;
		this.message_sender = message_sender;
		this.message_receiver = message_receiver;
		this.message_title = message_title;
		this.message_content = message_content;
		this.message_date = message_date;
		this.status = status;
	}

	public int getMessage_num() {
		return message_num;
	}

	public void setMessage_num(int message_num) {
		this.message_num = message_num;
	}

	public String getMessage_sender() {
		return message_sender;
	}

	public void setMessage_sender(String message_sender) {
		this.message_sender = message_sender;
	}

	public String getMessage_receiver() {
		return message_receiver;
	}

	public void setMessage_receiver(String message_receiver) {
		this.message_receiver = message_receiver;
	}

	public String getMessage_title() {
		return message_title;
	}

	public void setMessage_title(String message_title) {
		this.message_title = message_title;
	}

	public String getMessage_content() {
		return message_content;
	}

	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}

	public Date getMessage_date() {
		return message_date;
	}

	public void setMessage_date(Date message_date) {
		this.message_date = message_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Message [message_num=" + message_num + ", message_sender=" + message_sender + ", message_receiver="
				+ message_receiver + ", message_title=" + message_title + ", message_content=" + message_content
				+ ", message_date=" + message_date + ", status=" + status + "]";
	}
	
	
}
