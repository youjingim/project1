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
width:10%;
}
div#main_container table#tbl-board th:nth-of-type(2){
width:50%;
}
div#main_container table#tbl-board th:nth-of-type(3){
width:10%;

}   
div#main_container table#tbl-board th:nth-of-type(4){
width:10%;
}

}   
div#main_container table#tbl-board th:nth-of-type(5){
width:5%;
}
div#main_container table#tbl-board td:nth-of-type(3){
text-align:center;
}



</style>
<section>
<br><br><br>
	<br><span style="font-size:28px; font-weight:bold;color:black;margin-left:50%;  		text-align:center;" >NOTICE</span>
	<br><br><br>
	
<div id="main_container">
	<c:if test="${memberLoggedIn.member_id eq 'admin' }">
	<input type="button" value="글쓰기" id='btn-add' class='btn btn-default'style="border-color:black;"  onclick='fn_gonoticeForm();'/>
	</c:if>
	<br><br>	<br>
	<script>
		function fn_gonoticeForm(){
			location.href="${pageContext.request.contextPath}/notice/noticeForm.do";
		}
	</script>
   <table id='tbl-board' class='table'>
	
      <tr>
         <th>번호</th>

         <th>제목</th>
         <th>작성자</th>
         <th>조회수</th>
<!--          <th>첨부파일</th> -->
         <th>작성일</th>      
      </tr>
	
		
 		<c:if test="${not empty list }">
			<c:forEach var='notice' items='${list }' varStatus="vs">
				<tr>
					<td>${notice.NOTICE_NO}</td>
					<td><a href='${pageContext.request.contextPath}/notice/noticeView.do?no=${notice.NOTICE_NO }'>${notice.NOTICE_TITLE }</a></td>
					<td>${notice.MEMBER_ID }</td>
					<td>${notice.NOTICE_VIEW }</td>
<%-- 					<td align='center'>
						<c:if test='${notice.NOTICE_ATTACHMENT>0 }'>
							<img alt="첨부파일" src="${pageContext.request.contextPath }/resources/images/file.png" width=16px>
						</c:if>
					</td> --%>
			<%-- 		<td>${notice.NOTICE_DATE }</td>
			 --%>		 <td><fmt:formatDate value="${notice.NOTICE_DATE }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				</tr>	
			</c:forEach>
		</c:if> 
	
		
	</table>
   <span style="margin-left:50%;margin-top:100px;">
   ${pageBar }
   </span>
	
<%-- 		<p> 총 ${totalCount }건의 게시물이 있습니다.</p> --%>
</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</section>





	