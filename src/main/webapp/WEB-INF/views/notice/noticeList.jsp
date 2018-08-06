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
top:100px;
}
table#tbl-board{
border:none;
width:70%;
margin-left:15%

}
	input#btn-add {
/* 	float:right; */
/*  	margin:100 80 105 200%;  */
	color:black;
	background-color:white;
	border-color:black;
	position:absolute;
left:80%;

	
	}
	
	 	th,tr{
 		text-align:center;
 		color:black;
 		vertical-align: middle;
 		
 	}
 	thead{
 		background:white;
 		border-top:solid 1px black;
 		border-bottom:solid 1px black;
 		
 		border-color:black;
 	}
 	
 	
</style>
<section>
<br><br><br>
	<br><span style="font-size:28px; font-weight:bold;color:black;margin-left:45%;  		text-align:center;" >NOTICE</span>
	<br>
	
<div id="main_container">

	<input type="button" value="글쓰기" id='btn-add' class='btn btn-success' onclick='fn_gonoticeForm();'/>
	<br><br>	<br>
	<script>
		function fn_gonoticeForm(){
			location.href="${pageContext.request.contextPath}/notice/noticeForm.do";
		}
	</script>
	<table id='tbl-board' class='table table-striped table-hover'>
		<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>첨부파일</th>
			<th>작성일</th>			
		</tr>
		</thead>
		<tbody>
 		<c:if test="${not empty list }">
			<c:forEach var='notice' items='${list }' varStatus="vs">
				<tr>
					<td>${notice.NOTICE_NO }</td>
					<td><a href='${pageContext.request.contextPath}/notice/noticeView.do?no=${notice.NOTICE_NO }'>${notice.NOTICE_TITLE }</a></td>
					<td>${notice.MEMBER_ID }</td>
					<td>${notice.NOTICE_VIEW }</td>
					<td align='center'>
						<c:if test='${notice.NOTICE_ATTACHMENT>0 }'>
							<img alt="첨부파일" src="${pageContext.request.contextPath }/resources/images/file.png" width=16px>
						</c:if>
					</td>
					<td>${notice.NOTICE_DATE }</td>
				</tr>	
			</c:forEach>
		</c:if> 
		</tbody>
		
	</table>
	${pageBar }
	
		<p> 총 ${totalCount }건의 게시물이 있습니다.</p>
</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</section>





	