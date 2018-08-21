<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
    <%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
    <%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
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
   input#btn-add {float:right; margin:0 0 15px;}

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
width:10%;
}
div#main_container table#tbl-board th:nth-of-type(3){
width:45%;
<<<<<<< HEAD
=======

>>>>>>> yujin
}	
div#main_container table#tbl-board th:nth-of-type(4){
width:10%;
}


div#main_container table#tbl-board td:nth-of-type(3){
text-align:left;
}



</style>
<section>
<div id="main_container">


<h1 style='color:black;margin-left:1%;'>자유게시판</h1>
<br/>
   <p style="margin-left:1%;"> 총 ${totalCount }건의 게시물이 있습니다.</p>
   <input type="button" value="글쓰기" id='btn-add' class='btn btn-default' onclick='fn_goboardForm();'/>
   <script> 
      function fn_goboardForm(){
         location.href="${pageContext.request.contextPath}/boardForm.do";
      }
   </script>
   <table id='tbl-board' class='table'>
      <tr>
         <th>No.</th>
         <th>작성자</th>
         <th>제목</th>
         <th>조회수</th>
         <th>첨부파일</th>
         <th>작성일</th>      
      </tr>
      <c:if test="${not empty list }">
         <c:forEach var='board' items='${list }' varStatus="vs">
            <tr>
               <td>${board.FREEBOARD_NUM}</td>
               <td>${board.MEMBER_ID }</td>
               <td><a href='${pageContext.request.contextPath}/board/boardView.do?no=${board.FREEBOARD_NUM }'>${board.FREEBOARD_TITLE}</a></td>
               <td>${board.FREEBOARD_VIEW }</td>
                  <td align='center'><c:if test='${board.FREEBOARD_ATTACHMENT>0 }'>
                        <img alt="첨부파일"
                           src="${pageContext.request.contextPath }/resources/images/file.png"
                           width=16px>
                     </c:if></td>
                     <td>${board.FREEBOARD_DATE }</td>
               </tr>
         </c:forEach>
      </c:if>
   </table>
   <span style="margin-left:50%;margin-top:100px;">
   ${pageBar }
   </span>


</div>
   <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</section>





   