<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
    <%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
    <%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
    
    <jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="" name="pageTitle"/>
   </jsp:include>
<style>
section{
width:100%;
height:800px;
position:relative;
top:570px;
background-color:white;
z-index:10;
}
section div#main_container{
width:100%;
height:1200px;
position:relative;
z-index:10;
background-color:white;
top:30px;
}
   

div#main_container table#tbl-board th{
height:60px;
padding:20px;
text-align:center;
border-top:1px solid black;
border-bottom:1px solid black;
color:black;
font-size:16px;

}
div#main_container table#tbl-board td{
padding:20px;
text-align:center;
color:black;


}
div#main_container table#tbl-board td a{

color:black;
}
div#main_container table#tbl-board td a:hover{

color:gray;
}

div#main_container table#tbl-board th:nth-of-type(1){
width:8%;
}
div#main_container table#tbl-board th:nth-of-type(2){
width:45%;
}
div#main_container table#tbl-board th:nth-of-type(3){
width:10%;

}   
div#main_container table#tbl-board th:nth-of-type(4){
width:10%;
}

}   
div#main_container table#tbl-board th:nth-of-type(4){
width:10%;
}

div#main_container table#tbl-board td:nth-of-type(2){
text-align:left;
}

div#main_container table#tbl-board td:nth-of-type(3){
text-align:center;
}



</style>
<section>
<div id="main_container">
<br><br><br>
   <br><span style="font-size:35px; font-weight:bold;color:black; margin-left:45%; text-align:center;" >자유게시판</span>
   <br><br><br>
   
   
   <span style='margin-left:75%;'>
   <select id="searchType">
   <option value="" selected>선택</option>
   <option value="title" id="title" ${searchType == 'title' ? "selected":"" }>제목</option>
   <option value="writer" id="writer" ${searchType == 'writer' ? "selected":"" }>작성자</option>
   </select>
   <input type="text" id="searchForm" value="${searchForm }">
   <input type="button" value="검색" id='btn-search' class='btn btn-default' onclick='fn_searchForm()'/>
   
   <input type="button" value="글쓰기" id='btn-add' class='btn btn-default' onclick='fn_goboardForm()'/></span><br><br>
  <script>
   	  function fn_searchForm(){
   		  location.href="${pageContext.request.contextPath}/searchForm.do?searchType="+$('#searchType').val()+"&searchForm="+$('#searchForm').val();
   	  }
   </script>
  
   <script>
      function fn_goboardForm(){
         location.href="${pageContext.request.contextPath}/boardForm.do";
      }
   </script>
   
   
   <table id='tbl-board' class='table'>
      <tr>
         <th>번호</th>
         <th>제목</th>
         <th>작성자</th>
         <th>조회수</th>
         <th>첨부파일</th>
         <th>작성일</th>      
      </tr>
      <c:if test="${not empty list }">
         <c:forEach var='board' items='${list }' varStatus="vs">
            <tr>
               <td>${board.FREEBOARD_NUM}</td>
               <td><a href='${pageContext.request.contextPath}/board/boardView.do?no=${board.FREEBOARD_NUM }'>${board.FREEBOARD_TITLE}</a></td>
			   <td>${board.MEMBER_ID }</td>              
			   <td>${board.FREEBOARD_VIEW }</td>
                  <td align='center'><c:if test='${board.FREEBOARD_ATTACHMENT>0 }'>
                        <img alt="첨부파일"
                           src="${pageContext.request.contextPath }/resources/images/file.png"
                           width=16px>
                     </c:if></td>
                     <td><fmt:formatDate value="${board.FREEBOARD_DATE }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
               </tr>
         </c:forEach>
      </c:if>
      <c:if test="${empty list}">
       <tr>
       	<td colspan="6" style="text-align:center; font-weight:bold;">검색된 게시물이 없습니다.</td>
       </tr>
      </c:if>
      
   </table>
   <span style="margin-left:50%;margin-top:100px;">
   ${pageBar }
   </span>



</div>
   <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</section>





   