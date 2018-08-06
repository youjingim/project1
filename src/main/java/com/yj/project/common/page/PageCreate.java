package com.yj.project.common.page;

public class PageCreate {
	public String getPageBar(int cPage, int numPerPage,int totalCount, String url) {
	      String pageBar="";
	      
	      int pageSize=5;
	      int totalPage=(int)Math.ceil((double)totalCount/numPerPage);
	      int pageNo=((cPage-1)/pageSize)*pageSize+1;
	      int pageEnd=pageNo+pageSize-1;
	      
	      pageBar+="<ul class='pagination justify-content-center pagination-sm'>";
	      
	      //이전
	      if(pageNo==1) {
	      pageBar+="<li class='page-item disabled'>";
	      pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
	      pageBar+="</li>";
	      }
	      else {
	         pageBar+="<li class='page-item active'>";
	         pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
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
	      if(pageNo > totalPage){
	         pageBar += "<li class='page-item disabled'>";
	         pageBar += "<a class='page-link' href='#'>다음</a>";
	         pageBar += "</li>";
	         
	      } else {
	         pageBar += "<li class='page-item'>";
	         pageBar += "<a class='page-link' href='javascript:fn_paging("+(pageNo+1)+")'>다음</a> ";
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
}
<<<<<<< HEAD

=======
>>>>>>> 46aea74b81f9fae36c3302f59f767276b2242b7f
