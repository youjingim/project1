<%@page import="com.yj.project.member.model.vo.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
    <%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
    <%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
        
    <c:set var='path' value="${pageContext.request.contextPath}"/>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    
    	<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageState"/>
	</jsp:include>
	<style>

	section{
width:100%;
height:900;
position:relative;
top:570px;
background-color:white;
z-index:10;
}
section div#Enroll_container{
width:100%;
height:2500px;
position:relative;
z-index:10;
background-color:white;
}
#adminMenu{
width:40%;
height:300px;
position:absolute;
top:30px;
left:33%;
}
div#adminMenu table{
}
div#adminMenu table tr td{
font-size:20px;
font-weight:bold;
padding:30px;

}
div#adminMenu table tr{
height:80px;

}
div#adminMenu table tr td:hover{
font-size:22px;
height:90px;
}
div#adminMenu table tr td a{
text-decoration:none;
color:black;
}
div#adminMenu table tr td a:hover{
text-decoration:none;
color:gray;
}
div#clubCreateContainer{
position:absolute;
width:80%;
height:auto;
left:10%;
top:270px;
}
#clubCreateTable{
width:100%;
}
#clubCreateTable img{
width:80%;
height:250px;
margin-left:10%;
}

#clubCreateTable tr td{
height:50px;
color:black;
padding-top:30px;
}
#clubCreateTable tr td:nth-of-type(1){
width:40%;
}
#clubCreateTable tr td:nth-of-type(2){
width:50%;
}
#clubCreateTable tr td:nth-of-type(3){
width:10%;
text-align:center;
}

</style>
<section>
<div id="Enroll_container">
<div id='adminMenu'>
<table class='table'>
<tr>
<td>
<a href='${path }/member/adminPage.do'>회원관리</a>
</td>
<td>
<a href='${path }/clubManagement.do'>동아리 개설관리</a>
</td>
<td>
<a href='${path }/clubList.do'>동아리 관리</a>
</td>
</tr>
</table>

</div>
  <br>
      <br><br><br><br><br><br> <span
         style='font-size: 30px; font-weight: bold; margin-left: 10%;color:black;'>동아리 관리</span>
      <hr />
<br>

<div id="clubCreateContainer">
<table  id='clubCreateTable'>

<c:if test = '${not empty clubList}'>
<c:forEach var="c" items="${clubList}" varStatus="vs">
<tr style='border-top:1px solid black;'>
<td rowspan='5'><img src="resources/upload/club/<c:if test='${c.circle_photo != null}'>${c.circle_photo }</c:if><c:if test='${c.circle_photo == null}'>noimage.png</c:if>"></td><td>ID : ${c.member_id}</td><td rowspan='6'>
</td>
</tr>
<tr>
<td>Phone : ${c.circle_phone}
</td>
</tr>
<tr>
<td>소속학교 : ${c.university}</td>
</tr>
<tr>
<td>카테고리 : ${c.category}</td>
</tr>
<tr>
<td>comment : ${c.circle_comment}</td>
</tr>

<tr>
<td style='text-align:center;font-size:23px;font-weight:bold;'>${c.circle_name}</td>
</tr>
<tr><td colspan='3'></td></tr>
</c:forEach>

</c:if>

</table>

<c:if test='${empty clubList}'>
<span style='margin-left:45%;'>동아리가 없습니다.</span>
</c:if>
<div style='margin-left:50%;'>
${pageBar}
</div>
</div>


</div>
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</section>
