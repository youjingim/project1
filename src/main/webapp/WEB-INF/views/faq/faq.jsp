<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
    <%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
    <%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
    	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js">
	
	</script>
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
section div#faq{
/* .list_faq > li .faq_subject { */
    position: relative;
    padding-right: 44px;
    background: url(/design/ooo1069/2018_renew/img/common/faq_q.gif) no-repeat 10px center;
    cursor: pointer;
}
.list_faq > li .row {
    padding: 15px 0 15px 71px;
    color: #696868;
    font-size: 13px;
    font-weight: 300;
    text-align: left;
    line-height: 1.8;
}

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

<script type="text/javascript">
//FAQ Toggle
function faqToggle(m) {
	var faqSubject = jQuery(m);
	var faqCnt =  jQuery(m).siblings('.faq_cnt');
	if(faqCnt.is(':visible')) {
		faqSubject.removeClass('open');
		faqCnt.hide();
	} else {
		faqSubject.addClass('open');
		faqCnt.show();
	}
}
</script>
<section>
<br><br><br>
	<br><span style="font-size:28px; font-weight:bold;color:black;margin-left:50%;  		text-align:center;" >FAQ</span>
	<br>
	
<div id="main_container">

	<input type="button" value="글쓰기" id='btn-add' class='btn btn-success' onclick='fn_goboardForm();'/>
	<br><br>	<br>
	<script>
		function fn_goboardForm(){
			location.href="${pageContext.request.contextPath}/board/boardForm.do";
		}
	</script>
	<table id='tbl-board' class='table table-striped table-hover'>
		<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>첨부파일</th>
			<th>조회수</th>			
		</tr>
		</thead>
		<tbody>
		
		
		
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
		</tbody>
		
	</table>
	
	<div id="faq">
	<ul class="list_faq">
		<li>
		<div class="row faq_subject" onclick=faqToggle(this);"></div>"
		"동아리 가입안내"
		<span class="arrow"></span>
		
		</div>
		<div class="row faq_cnt" style="display:none;">
		"안내"</div>
		</li>
	</ul>
	</div>
	${pageBar }
	
		<p> 총 ${totalCount }건의 게시물이 있습니다.</p>
</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</section>





	