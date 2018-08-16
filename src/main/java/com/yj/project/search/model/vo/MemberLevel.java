package com.yj.project.search.model.vo;

public class MemberLevel {

	private String memberLevel;
	private String levelTitle;
	
	public MemberLevel() {
		// TODO Auto-generated constructor stub
	}

	public String getMemberLevel() {
		return memberLevel;
	}

	public void setMemberLevel(String memberLevel) {
		this.memberLevel = memberLevel;
	}

	public String getLevelTitle() {
		return levelTitle;
	}

	public void setLevelTitle(String levelTitle) {
		this.levelTitle = levelTitle;
	}

	public MemberLevel(String memberLevel, String levelTitle) {
		super();
		this.memberLevel = memberLevel;
		this.levelTitle = levelTitle;
	}

	@Override
	public String toString() {
		return "MemberLevel [memberLevel=" + memberLevel + ", levelTitle=" + levelTitle + "]";
	}
	
	
}
