<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
    <%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
    <%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
       <jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="" name="pageTitle"/>
   </jsp:include>
     <style>
    div#board-container{width:400px; margin:0 auto; text-align:center;}
    div#board-container input,div#board-container button{margin-bottom:15px;}
    /* 부트스트랩 : 파일라벨명 정렬*/
    div#board-container label.custom-file-label{text-align:left;}
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
#table_container{
width:80%;
height:1200px;
margin-left:10%;
}

div#main_container table td{
height:70px;

text-align:center;
color:black;
border-top:1px solid black;
border-bottom:1px solid black;
}
div#main_container table td:nth-of-type(1){
width:80%;
font-size:22px;
padding:25px;
text-align:left;

}
div#main_container table td:nth-of-type(2){
width:20%;
padding:30px;
font_size:22px;
text-align:right;

}

div#main_container table td{
border-bottom:1px solid black;

}
    </style>

    <section>
<div id="main_container">
<div id="table_container">

<table class='table'>
<tr>
<td>${notice.notice_title }</td>
<td>${notice.member_id }</td>

</tr>
<tr>
<td colspan='4' style='height:500px;'>${notice.notice_content }</td>
</tr>


</table>
    <div>
     	<span style='margin-left:85%;display:inline-block;'>
     	 
    	<c:if test="${memberLoggedIn.member_id eq 'admin' }">
<input style='display:inline-block;' type="button" value="수정" id='btn-add' class='btn btn-default' onclick="location.href='${pageContext.request.contextPath}/notice/noticeUpdate.do?no=${notice.notice_no }'"/>
 	<input style='display:inline-block;' type="button" value="삭제" id='btn-add' class='btn btn-default' onclick="location.href='${pageContext.request.contextPath}/notice/noticeDelete.do?no=${notice.notice_no }'"/>

	<input style='display:inline-block;' type="button" value="목록" id='btn-add' class='btn btn-default' onclick="location.href='${pageContext.request.contextPath}/notice/noticeList.do'"/></span>

    
    </div>    </c:if>	<div>
   	<c:if test="${memberLoggedIn.member_id != 'admin' }">

         
 	<span style='margin-left:95%;display:inline-block;'>
 	<input style='display:inline-block;' type="button" value="목록" id='btn-add' class='btn btn-default' onclick="location.href='${pageContext.request.contextPath}/notice/noticeList.do'"/></span>
 	</div>  </c:if>
    </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</section>

   
   