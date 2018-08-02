package com.yj.project.board.model.vo;

import java.sql.Date;

public class Board {

   private int freeboard_num;
   private String freeboard_title;
   private String freeboard_content;
   private String member_id;
   private int freeboard_view;
   private int freeboard_attachment;
   private Date freeboard_date;

   public Board() {
      
   }
   

   public Board(int freeboard_num, String freeboard_title, String freeboard_content, String member_id,
         int freeboard_view, int freeboard_attachment, Date freeboard_date) {
      super();
      this.freeboard_num = freeboard_num;
      this.freeboard_title = freeboard_title;
      this.freeboard_content = freeboard_content;
      this.member_id = member_id;
      this.freeboard_view = freeboard_view;
      this.freeboard_attachment = freeboard_attachment;
      this.freeboard_date = freeboard_date;
   }


   @Override
   public String toString() {
      return "Board [freeboard_num=" + freeboard_num + ", freeboard_title=" + freeboard_title + ", freeboard_content="
            + freeboard_content + ", member_id=" + member_id + ", freeboard_view=" + freeboard_view
            + ", freeboard_attachment=" + freeboard_attachment + ", freeboard_date=" + freeboard_date + "]";
   }


   
   
   public int getFreeboard_num() {
      return freeboard_num;
   }


   public void setFreeboard_num(int freeboard_num) {
      this.freeboard_num = freeboard_num;
   }


   public String getFreeboard_title() {
      return freeboard_title;
   }


   public void setFreeboard_title(String freeboard_title) {
      this.freeboard_title = freeboard_title;
   }


   public String getFreeboard_content() {
      return freeboard_content;
   }


   public void setFreeboard_content(String freeboard_content) {
      this.freeboard_content = freeboard_content;
   }


   public String getMember_id() {
      return member_id;
   }


   public void setMember_id(String member_id) {
      this.member_id = member_id;
   }


   public int getFreeboard_view() {
      return freeboard_view;
   }


   public void setFreeboard_view(int freeboard_view) {
      this.freeboard_view = freeboard_view;
   }


   public int getFreeboard_attachment() {
      return freeboard_attachment;
   }


   public void setFreeboard_attachment(int freeboard_attachment) {
      this.freeboard_attachment = freeboard_attachment;
   }


   public Date getFreeboard_date() {
      return freeboard_date;
   }


   public void setFreeboard_date(Date freeboard_date) {
      this.freeboard_date = freeboard_date;
   }
   
}