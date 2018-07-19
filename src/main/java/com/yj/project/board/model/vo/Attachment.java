package com.yj.project.board.model.vo;

import java.util.Date;

public class Attachment {
	private int attachmentNo;
	private int boardNo;
	private String originalFileName;
	private String renameFileName;
	private Date uploadDate;
	private int dounloadCount;
	private String status;
	
	public Attachment() {
	}

	public Attachment(int attachmentNo, int boardNo, String originalFileName, String renameFileName, Date uploadDate,
			int dounloadCount, String status) {
		super();
		this.attachmentNo = attachmentNo;
		this.boardNo = boardNo;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.uploadDate = uploadDate;
		this.dounloadCount = dounloadCount;
		this.status = status;
	}

	public int getAttachmentNo() {
		return attachmentNo;
	}

	public void setAttachmentNo(int attachmentNo) {
		this.attachmentNo = attachmentNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getRenameFileName() {
		return renameFileName;
	}

	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public int getDounloadCount() {
		return dounloadCount;
	}

	public void setDounloadCount(int dounloadCount) {
		this.dounloadCount = dounloadCount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Attachment [attachmentNo=" + attachmentNo + ", boardNo=" + boardNo + ", originalFileName="
				+ originalFileName + ", renameFileName=" + renameFileName + ", uploadDate=" + uploadDate
				+ ", dounloadCount=" + dounloadCount + ", status=" + status + "]";
	}
}
