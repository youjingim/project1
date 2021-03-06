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
	input#btn-add {float:right; margin:0 0 15px;}

div#main_container table#tbl-board th{
height:60px;
padding:20px;
text-align:center;
}
div#main_container table#tbl-board td{
padding:20px;
text-align:center;

}

div#main_container table#tbl-board th:nth-of-type(1){
width:5%;
}
div#main_container table#tbl-board th:nth-of-type(2){
width:20%;
}
	
</style>
<section>
<div id="main_container">
	<p> 총 ${totalCount }건의 게시물이 있습니다.</p>
	<input type="button" value="글쓰기" id='btn-add' class='btn btn-success' onclick='fn_goboardForm();'/>
	<script>
		function fn_goboardForm(){
			location.href="${pageContext.request.contextPath}/board/boardForm.do";
		}
	</script>
	<table id='tbl-board' class='table table-striped table-hover'>
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





	