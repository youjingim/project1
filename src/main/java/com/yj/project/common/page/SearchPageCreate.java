package com.yj.project.common.page;

public class SearchPageCreate {
	   public String getPageBar(int cPage, int numPerPage,int totalCount, String url) {
	         String pageBar="";
	         
	         int pageSize=5;
	         int totalPage=(int)Math.ceil((double)totalCount/numPerPage);
	         int pageNo=((cPage-1)/pageSize)*pageSize+1;
	         int pageEnd=pageNo+pageSize-1;
	         
	         pageBar+="<ul class='pagination justify-content-center pagination-sm'>";
	         
	         //이전
	         if(cPage<1 || cPage==1) {
	         pageBar+="<li class='page-item disabled'>";
	         pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>&laquo;</a> ";
	         pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
	         pageBar+="</li>";
	         }
	         else if(cPage > totalPage || pageNo < pageSize) {
	        	 pageBar+="<li class='page-item disabled'>";
	             pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>&laquo;</a> ";
	             pageBar+="</li>";
	             pageBar+="<li class='page-item'>";
	             pageBar+="<a class='page-link' href='javascript:fn_paging("+(cPage-1)+")'>이전</a>";        
	             pageBar+="</li>";
	         }
	         else {
	            pageBar+="<li class='page-item'>";
	            pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>&laquo;</a> ";
	            pageBar+="<a class='page-link' href='javascript:fn_paging("+(cPage-1)+")'>이전</a>";        
	            pageBar+="</li>";
	         }
	         
	         while(!(pageNo>pageEnd||pageNo>totalPage)) {
	            if(cPage==pageNo) {
	               pageBar+="<li class='page-item'>";
	               pageBar+="<a class='page-link' style='font-weight:bold;color:black;'>"+pageNo+"</a>";
	               pageBar+="</li>";
	            }
	            else {
	               pageBar+="<li class='page-item'>";
	               pageBar+="<a class='page-link' style='color:black;' href='javascript:fn_paging("+(pageNo)+")'>"+pageNo+"</a>";
	               pageBar+="</li>";
	            }
	            pageNo++;
	         }
	         //다음
	         if(cPage == totalPage){
	            pageBar += "<li class='page-item disabled'>";
	            pageBar += "<a class='page-link' href='#'>다음</a>";
	            pageBar += "<a class='page-link disabled' href='javascript:fn_paging("+(pageNo)+")'>&raquo;</a> ";
	            pageBar += "</li>";
	            
	         }
	         else if(cPage < totalPage && pageNo>totalPage) {
	            	 pageBar+="<li class='page-item'>";
	            	 pageBar+= "<a class='page-link' href='javascript:fn_paging("+(cPage+1)+")'>다음</a> ";
	            	 pageBar+="</li>";
	            	 pageBar+="<li class='page-item disabled'>";
	                 pageBar+= "<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>&raquo;</a> ";       
	                 pageBar+="</li>";
	         }
	         else{
	            pageBar += "<li class='page-item'>";
	            pageBar += "<a class='page-link' href='javascript:fn_paging("+(cPage+1)+")'>다음</a> ";
	            pageBar += "<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>&raquo;</a> ";
	            pageBar += "</li>";
	         }
	         pageBar+="</ul>";
	         
	         pageBar+="<script>";
	         pageBar+="function fn_paging(cPage){";
	         pageBar+="location.href='"+url+"?cPage='+cPage;";
	         pageBar+="}";
	         pageBar+="</script>";
	         
	         
	         return pageBar;
	      }
	   
	   //university
	   public String getPageBar1(int cPage, int numPerPage,int totalCount,String university, String url) {
	       String pageBar="";
	       
	       int pageSize=5;
	       int totalPage=(int)Math.ceil((double)totalCount/numPerPage);
	       int pageNo=((cPage-1)/pageSize)*pageSize+1;
	       int pageEnd=pageNo+pageSize-1;
	       
	       pageBar+="<ul class='pagination justify-content-center pagination-sm'>";
	       
	     //이전
	       if(cPage<1 || cPage==1) {
	       pageBar+="<li class='page-item disabled'>";
	       pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>&laquo;</a> ";
	       pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
	       pageBar+="</li>";
	       }
	       else if(cPage > totalPage || pageNo < pageSize) {
	      	 pageBar+="<li class='page-item disabled'>";
	           pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>&laquo;</a> ";
	           pageBar+="</li>";
	           pageBar+="<li class='page-item'>";
	           pageBar+="<a class='page-link' href='javascript:fn_paging("+(cPage-1)+")'>이전</a>";        
	           pageBar+="</li>";
	       }
	       else {
	          pageBar+="<li class='page-item'>";
	          pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>&laquo;</a> ";
	          pageBar+="<a class='page-link' href='javascript:fn_paging("+(cPage-1)+")'>이전</a>";        
	          pageBar+="</li>";
	       }
	       
	       while(!(pageNo>pageEnd||pageNo>totalPage)) {
	          if(cPage==pageNo) {
	             pageBar+="<li class='page-item'>";
	             pageBar+="<a class='page-link' style='font-weight:bold;color:black;'>"+pageNo+"</a>";
	             pageBar+="</li>";
	          }
	          else {
	             pageBar+="<li class='page-item'>";
	             pageBar+="<a class='page-link' style='color:black;' href='javascript:fn_paging("+(pageNo)+")'>"+pageNo+"</a>";
	             pageBar+="</li>";
	          }
	          pageNo++;
	       }
	       //다음
	       if(cPage == totalPage){
	          pageBar += "<li class='page-item disabled'>";
	          pageBar += "<a class='page-link' href='#'>다음</a>";
	          pageBar += "<a class='page-link disabled' href='javascript:fn_paging("+(pageNo)+")'>&raquo;</a> ";
	          pageBar += "</li>";
	          
	       }
	       else if(cPage < totalPage && pageNo>totalPage) {
	          	 pageBar+="<li class='page-item'>";
	          	 pageBar+= "<a class='page-link' href='javascript:fn_paging("+(cPage+1)+")'>다음</a> ";
	          	 pageBar+="</li>";
	          	 pageBar+="<li class='page-item disabled'>";
	               pageBar+= "<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>&raquo;</a> ";       
	               pageBar+="</li>";
	       }
	       else{
	          pageBar += "<li class='page-item'>";
	          pageBar += "<a class='page-link' href='javascript:fn_paging("+(cPage+1)+")'>다음</a> ";
	          pageBar += "<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>&raquo;</a> ";
	          pageBar += "</li>";
	       }
	       pageBar+="</ul>";
	       
	       pageBar+="<script>";
	       pageBar+="function fn_paging(cPage){";
	       pageBar+="location.href='"+url+"?university="+university+"&cPage='+cPage;";
	       pageBar+="}";
	       pageBar+="</script>";
	       
	       
	       return pageBar;
	    }
	   
	 //Unsearch
	   public String getPageBar2(int cPage, int numPerPage,int totalCount,String Unsearch, String url) {
	       String pageBar="";
	       
	       int pageSize=5;
	       int totalPage=(int)Math.ceil((double)totalCount/numPerPage);
	       int pageNo=((cPage-1)/pageSize)*pageSize+1;
	       int pageEnd=pageNo+pageSize-1;
	       
	       pageBar+="<ul class='pagination justify-content-center pagination-sm'>";
	       
	     //이전
	       if(cPage<1 || cPage==1) {
	       pageBar+="<li class='page-item disabled'>";
	       pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>&laquo;</a> ";
	       pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
	       pageBar+="</li>";
	       }
	       else if(cPage > totalPage || pageNo < pageSize) {
	      	 pageBar+="<li class='page-item disabled'>";
	           pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>&laquo;</a> ";
	           pageBar+="</li>";
	           pageBar+="<li class='page-item'>";
	           pageBar+="<a class='page-link' href='javascript:fn_paging("+(cPage-1)+")'>이전</a>";        
	           pageBar+="</li>";
	       }
	       else {
	          pageBar+="<li class='page-item'>";
	          pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>&laquo;</a> ";
	          pageBar+="<a class='page-link' href='javascript:fn_paging("+(cPage-1)+")'>이전</a>";        
	          pageBar+="</li>";
	       }
	       
	       while(!(pageNo>pageEnd||pageNo>totalPage)) {
	          if(cPage==pageNo) {
	             pageBar+="<li class='page-item'>";
	             pageBar+="<a class='page-link' style='font-weight:bold;color:black;'>"+pageNo+"</a>";
	             pageBar+="</li>";
	          }
	          else {
	             pageBar+="<li class='page-item'>";
	             pageBar+="<a class='page-link' style='color:black;' href='javascript:fn_paging("+(pageNo)+")'>"+pageNo+"</a>";
	             pageBar+="</li>";
	          }
	          pageNo++;
	       }
	       //다음
	       if(cPage == totalPage){
	          pageBar += "<li class='page-item disabled'>";
	          pageBar += "<a class='page-link' href='#'>다음</a>";
	          pageBar += "<a class='page-link disabled' href='javascript:fn_paging("+(pageNo)+")'>&raquo;</a> ";
	          pageBar += "</li>";
	          
	       }
	       else if(cPage < totalPage && pageNo>totalPage) {
	          	 pageBar+="<li class='page-item'>";
	          	 pageBar+= "<a class='page-link' href='javascript:fn_paging("+(cPage+1)+")'>다음</a> ";
	          	 pageBar+="</li>";
	          	 pageBar+="<li class='page-item disabled'>";
	               pageBar+= "<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>&raquo;</a> ";       
	               pageBar+="</li>";
	       }
	       else{
	          pageBar += "<li class='page-item'>";
	          pageBar += "<a class='page-link' href='javascript:fn_paging("+(cPage+1)+")'>다음</a> ";
	          pageBar += "<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>&raquo;</a> ";
	          pageBar += "</li>";
	       }
	       pageBar+="</ul>";
	       
	       pageBar+="<script>";
	       pageBar+="function fn_paging(cPage){";
	       pageBar+="location.href='"+url+"?Unsearch="+Unsearch+"&cPage='+cPage;";
	       pageBar+="}";
	       pageBar+="</script>";
	       
	       
	       return pageBar;
	    }
	   
	 //circle_name
	   public String getPageBar3(int cPage, int numPerPage,int totalCount,String circle_name, String url) {
	       String pageBar="";
	       
	       int pageSize=5;
	       int totalPage=(int)Math.ceil((double)totalCount/numPerPage);
	       int pageNo=((cPage-1)/pageSize)*pageSize+1;
	       int pageEnd=pageNo+pageSize-1;
	       
	       pageBar+="<ul class='pagination justify-content-center pagination-sm'>";
	       
	     //이전
	       if(cPage<1 || cPage==1) {
	       pageBar+="<li class='page-item disabled'>";
	       pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>&laquo;</a> ";
	       pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
	       pageBar+="</li>";
	       }
	       else if(cPage > totalPage || pageNo < pageSize) {
	      	 pageBar+="<li class='page-item disabled'>";
	           pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>&laquo;</a> ";
	           pageBar+="</li>";
	           pageBar+="<li class='page-item'>";
	           pageBar+="<a class='page-link' href='javascript:fn_paging("+(cPage-1)+")'>이전</a>";        
	           pageBar+="</li>";
	       }
	       else {
	          pageBar+="<li class='page-item'>";
	          pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>&laquo;</a> ";
	          pageBar+="<a class='page-link' href='javascript:fn_paging("+(cPage-1)+")'>이전</a>";        
	          pageBar+="</li>";
	       }
	       
	       while(!(pageNo>pageEnd||pageNo>totalPage)) {
	          if(cPage==pageNo) {
	             pageBar+="<li class='page-item'>";
	             pageBar+="<a class='page-link' style='font-weight:bold;color:black;'>"+pageNo+"</a>";
	             pageBar+="</li>";
	          }
	          else {
	             pageBar+="<li class='page-item'>";
	             pageBar+="<a class='page-link' style='color:black;' href='javascript:fn_paging("+(pageNo)+")'>"+pageNo+"</a>";
	             pageBar+="</li>";
	          }
	          pageNo++;
	       }
	       //다음
	       if(cPage == totalPage){
	          pageBar += "<li class='page-item disabled'>";
	          pageBar += "<a class='page-link' href='#'>다음</a>";
	          pageBar += "<a class='page-link disabled' href='javascript:fn_paging("+(pageNo)+")'>&raquo;</a> ";
	          pageBar += "</li>";
	          
	       }
	       else if(cPage < totalPage && pageNo>totalPage) {
	          	 pageBar+="<li class='page-item'>";
	          	 pageBar+= "<a class='page-link' href='javascript:fn_paging("+(cPage+1)+")'>다음</a> ";
	          	 pageBar+="</li>";
	          	 pageBar+="<li class='page-item disabled'>";
	               pageBar+= "<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>&raquo;</a> ";       
	               pageBar+="</li>";
	       }
	       else{
	          pageBar += "<li class='page-item'>";
	          pageBar += "<a class='page-link' href='javascript:fn_paging("+(cPage+1)+")'>다음</a> ";
	          pageBar += "<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>&raquo;</a> ";
	          pageBar += "</li>";
	       }
	       pageBar+="</ul>";
	       
	       pageBar+="<script>";
	       pageBar+="function fn_paging(cPage){";
	       pageBar+="location.href='"+url+"?circle_name="+circle_name+"&cPage='+cPage;";
	       pageBar+="}";
	       pageBar+="</script>";
	       
	       
	       return pageBar;
	    }
	   
	 //대학이름으로 재검색시 페이징 처리
	   public String getPageBar5(int cPage, int numPerPage,int totalCount,String searchType,String Unsearch, String url) {
	       String pageBar="";
	       
	       int pageSize=5;
	       int totalPage=(int)Math.ceil((double)totalCount/numPerPage);
	       int pageNo=((cPage-1)/pageSize)*pageSize+1;
	       int pageEnd=pageNo+pageSize-1;
	       
	       pageBar+="<ul class='pagination justify-content-center pagination-sm'>";
	       
	     //이전
	       if(cPage<1 || cPage==1) {
	       pageBar+="<li class='page-item disabled'>";
	       pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>&laquo;</a> ";
	       pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
	       pageBar+="</li>";
	       }
	       else if(cPage > totalPage || pageNo < pageSize) {
	      	 pageBar+="<li class='page-item disabled'>";
	           pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>&laquo;</a> ";
	           pageBar+="</li>";
	           pageBar+="<li class='page-item'>";
	           pageBar+="<a class='page-link' href='javascript:fn_paging("+(cPage-1)+")'>이전</a>";        
	           pageBar+="</li>";
	       }
	       else {
	          pageBar+="<li class='page-item'>";
	          pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>&laquo;</a> ";
	          pageBar+="<a class='page-link' href='javascript:fn_paging("+(cPage-1)+")'>이전</a>";        
	          pageBar+="</li>";
	       }
	       
	       while(!(pageNo>pageEnd||pageNo>totalPage)) {
	          if(cPage==pageNo) {
	             pageBar+="<li class='page-item'>";
	             pageBar+="<a class='page-link' style='font-weight:bold;color:black;'>"+pageNo+"</a>";
	             pageBar+="</li>";
	          }
	          else {
	             pageBar+="<li class='page-item'>";
	             pageBar+="<a class='page-link' style='color:black;' href='javascript:fn_paging("+(pageNo)+")'>"+pageNo+"</a>";
	             pageBar+="</li>";
	          }
	          pageNo++;
	       }
	       //다음
	       if(cPage == totalPage){
	          pageBar += "<li class='page-item disabled'>";
	          pageBar += "<a class='page-link' href='#'>다음</a>";
	          pageBar += "<a class='page-link disabled' href='javascript:fn_paging("+(pageNo)+")'>&raquo;</a> ";
	          pageBar += "</li>";
	          
	       }
	       else if(cPage < totalPage && pageNo>totalPage) {
	          	 pageBar+="<li class='page-item'>";
	          	 pageBar+= "<a class='page-link' href='javascript:fn_paging("+(cPage+1)+")'>다음</a> ";
	          	 pageBar+="</li>";
	          	 pageBar+="<li class='page-item disabled'>";
	               pageBar+= "<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>&raquo;</a> ";       
	               pageBar+="</li>";
	       }
	       else{
	          pageBar += "<li class='page-item'>";
	          pageBar += "<a class='page-link' href='javascript:fn_paging("+(cPage+1)+")'>다음</a> ";
	          pageBar += "<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>&raquo;</a> ";
	          pageBar += "</li>";
	       }
	       pageBar+="</ul>";
	       
	       pageBar+="<script>";
	       pageBar+="function fn_paging(cPage){";
	       pageBar+="location.href='"+url+"?Unsearch="+Unsearch+"&searchType="+searchType+"&cPage='+cPage;";
	       pageBar+="}";
	       pageBar+="</script>";
	       
	       
	       return pageBar;
	    }
	   
	 //동아리명으로 재검색시 페이징 처리
	   public String getPageBar6(int cPage, int numPerPage,int totalCount,String searchType,String circle_name, String url) {
	       String pageBar="";
	       
	       int pageSize=5;
	       int totalPage=(int)Math.ceil((double)totalCount/numPerPage);
	       int pageNo=((cPage-1)/pageSize)*pageSize+1;
	       int pageEnd=pageNo+pageSize-1;
	       
	       pageBar+="<ul class='pagination justify-content-center pagination-sm'>";
	       
	     //이전
	       if(cPage<1 || cPage==1) {
	       pageBar+="<li class='page-item disabled'>";
	       pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>&laquo;</a> ";
	       pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
	       pageBar+="</li>";
	       }
	       else if(cPage > totalPage || pageNo < pageSize) {
	      	 pageBar+="<li class='page-item disabled'>";
	           pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>&laquo;</a> ";
	           pageBar+="</li>";
	           pageBar+="<li class='page-item'>";
	           pageBar+="<a class='page-link' href='javascript:fn_paging("+(cPage-1)+")'>이전</a>";        
	           pageBar+="</li>";
	       }
	       else {
	          pageBar+="<li class='page-item'>";
	          pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>&laquo;</a> ";
	          pageBar+="<a class='page-link' href='javascript:fn_paging("+(cPage-1)+")'>이전</a>";        
	          pageBar+="</li>";
	       }
	       
	       while(!(pageNo>pageEnd||pageNo>totalPage)) {
	          if(cPage==pageNo) {
	             pageBar+="<li class='page-item'>";
	             pageBar+="<a class='page-link' style='font-weight:bold;color:black;'>"+pageNo+"</a>";
	             pageBar+="</li>";
	          }
	          else {
	             pageBar+="<li class='page-item'>";
	             pageBar+="<a class='page-link' style='color:black;' href='javascript:fn_paging("+(pageNo)+")'>"+pageNo+"</a>";
	             pageBar+="</li>";
	          }
	          pageNo++;
	       }
	       //다음
	       if(cPage == totalPage){
	          pageBar += "<li class='page-item disabled'>";
	          pageBar += "<a class='page-link' href='#'>다음</a>";
	          pageBar += "<a class='page-link disabled' href='javascript:fn_paging("+(pageNo+1)+")'>&raquo;</a> ";
	          pageBar += "</li>";
	          
	       }
	       else if(cPage < totalPage && pageNo>totalPage) {
	          	 pageBar+="<li class='page-item'>";
	          	 pageBar+= "<a class='page-link' href='javascript:fn_paging("+(cPage+1)+")'>다음</a> ";
	          	 pageBar+="</li>";
	          	 pageBar+="<li class='page-item disabled'>";
	             pageBar+= "<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>&raquo;</a> ";       
	             pageBar+="</li>";
	       }
	       else{
	          pageBar += "<li class='page-item'>";
	          pageBar += "<a class='page-link' href='javascript:fn_paging("+(cPage+1)+")'>다음</a> ";
	          pageBar += "<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>&raquo;</a> ";
	          pageBar += "</li>";
	       }
	       pageBar+="</ul>";
	       
	       pageBar+="<script>";
	       pageBar+="function fn_paging(cPage){";
	       pageBar+="location.href='"+url+"?circle_name="+circle_name+"&searchType="+searchType+"&cPage='+cPage;";
	       pageBar+="}";
	       pageBar+="</script>";
	       
	       
	       return pageBar;
	    }
	}
