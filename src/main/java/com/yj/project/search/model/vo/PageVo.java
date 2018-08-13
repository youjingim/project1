package com.yj.project.search.model.vo;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class PageVo {

	private int pageSize; //한페이지에 보여줄 게시글 수
	private int pageBlock; //페이징 블록 사이즈
	private int pageNo; //페이지 번호
	private int startRowNo; //조회 시작 row
	private int endRowNo; //조회 마지막 row
	private int firstPageNo; //첫번째 페이지 번호
	private int finalPageNo; //마지막 페이지 번호
	private int prevPageNo; //이전페이지
	private int nextPageNo; //다음페이지
	private int startPageNo; //시작페이지
	private int endPageNo; //끝페이지
	private int totalCount; // 리스트 전체
	

	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageBlock() {
		return pageBlock;
	}
	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getStartRowNo() {
		return startRowNo;
	}
	public void setStartRowNo(int startRowNo) {
		this.startRowNo = startRowNo;
	}
	public int getEndRowNo() {
		return endRowNo;
	}
	public void setEndRowNo(int endRowNo) {
		this.endRowNo = endRowNo;
	}
	public int getFirstPageNo() {
		return firstPageNo;
	}
	public void setFirstPageNo(int firstPageNo) {
		this.firstPageNo = firstPageNo;
	}
	public int getFinalPageNo() {
		return finalPageNo;
	}
	public void setFinalPageNo(int finalPageNo) {
		this.finalPageNo = finalPageNo;
	}
	public int getPrevPageNo() {
		return prevPageNo;
	}
	public void setPrevPageNo(int prevPageNo) {
		this.prevPageNo = prevPageNo;
	}
	public int getNextPageNo() {
		return nextPageNo;
	}
	public void setNextPageNo(int nextPageNo) {
		this.nextPageNo = nextPageNo;
	}
	public int getStartPageNo() {
		return startPageNo;
	}
	public void setStartPageNo(int startPageNo) {
		this.startPageNo = startPageNo;
	}
	public int getEndPageNo() {
		return endPageNo;
	}
	public void setEndPageNo(int endPageNo) {
		this.endPageNo = endPageNo;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	private void makePaging() {
		if(this.totalCount == 0) return;
		if(this.pageNo ==0) this.setPageNo(1); //기본페이지 번호
		if(this.pageSize ==0) this.setPageSize(5); //기본페이지 리스트 사이즈
		if(this.pageBlock ==0) this.setPageBlock(5); //기본 페이지 네비
		
		//첫페이지,마지막페이지 계산
		int finalPage = (totalCount+(pageSize -1)) / pageSize;
		this.setFinalPageNo(1); //첫번째 페이지 번호
		this.setFinalPageNo(finalPage); //마지막 페이지 번호
		
		//이전,다음 페이지 계산
		boolean isNowFirst = pageNo ==1? true : false; //시작페이지(전체)
		boolean isNowFinal = pageNo == finalPage ? true : false; //마지막페이지(전체)
		
		if(isNowFirst) {
			this.setPrevPageNo(1);//이전페이지 번호
		}
		else {
			this.setPrevPageNo(((pageNo-1) < 1 ? 1: (pageNo -1))); //이전 페이지 번호
		}
		if(isNowFinal) {
			this.setNextPageNo(finalPage); //다음 페이지 번호
		}else {
			this.setNextPageNo(((pageNo + 1) > finalPage ? finalPage : (pageNo +1)));
		}
		
		//페이징 블록 계산
		int startPage = ((pageNo - 1) / pageBlock) * pageBlock +1; //시작페이지
		int endPage = startPage+pageBlock - 1; // 맨 마지막 페이지
		
		if(endPage > finalPage) {
			endPage=finalPage;
		}
		this.setStartPageNo(startPage);
		this.setEndPageNo(endPage);
		
		//조회 시작 row, 조회 마지막 row 계산
		int startRowNo = ((pageNo - 1) * pageSize) +1;
		int endRowNo = pageNo * pageSize;
		setStartRowNo(startRowNo);
		setEndRowNo(endRowNo);
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
	
	
}
