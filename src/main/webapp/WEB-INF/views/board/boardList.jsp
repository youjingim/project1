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
			<th>작성일</th>
			<th>첨부파일</th>
			<th>조회수</th>			
		</tr>
		<c:if test="${not empty list }">
			<c:forEach var='board' items='${list }' varStatus="vs">
				<tr>
					<td>${board.BOARDNO }</td>
					<td><a href='${pageContext.request.contextPath}/board/boardView.do?no=${board.BOARDNO }'>${board.BOARDTITLE }</a></td>
					<td>${board.BOARDWRITER }</td>
					<td>${board.BOARDDATE }</td>
					<td align='center'>
						<c:if test='${board.FILECOUNT>0 }'>
							<img alt="첨부파일" src="${pageContext.request.contextPath }/resources/images/file.png" width=16px>
						</c:if>
					</td>
					<td>${board.BOARDCOUNT }</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	${pageBar }
</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</section>





	