package com.yj.project.search.model.vo;

public class University {

	private int universityNo;
	private String university;
	private String uniPlace;
	
	public University() {
		// TODO Auto-generated constructor stub
	}

	public int getUniversityNo() {
		return universityNo;
	}

	public void setUniversityNo(int universityNo) {
		this.universityNo = universityNo;
	}

	public String getUniversity() {
		return university;
	}

	public void setUniversity(String university) {
		this.university = university;
	}

	public String getUniPlace() {
		return uniPlace;
	}

	public void setUniPlace(String uniPlace) {
		this.uniPlace = uniPlace;
	}

	public University(int universityNo, String university, String uniPlace) {
		super();
		this.universityNo = universityNo;
		this.university = university;
		this.uniPlace = uniPlace;
	}

	@Override
	public String toString() {
		return "University [universityNo=" + universityNo + ", university=" + university + ", uniPlace=" + uniPlace
				+ "]";
	}
	
	
}
