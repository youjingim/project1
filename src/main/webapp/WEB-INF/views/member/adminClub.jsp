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
height:800px;
position:relative;
top:570px;
background-color:white;
z-index:10;
}
section div#Enroll_container{
width:100%;
height:1200px;
position:relative;
z-index:10;
background-color:white;
}
#adminMenu{
width:300px;
height:300px;
position:absolute;
top:100px;
left:20px;
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
width:310px;
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
width:60%;
height:auto;
left:20%;
top:200px;
border:1px solid black;
}
#clubCreateTable{
width:100%;
}
#clubCreateTable img{
width:80%;
height:90%;
margin-left:10%;
}

#clubCreateTable tr td{
height:100px;
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
</tr>
<tr>
<td>
<a href='${path }/clubManagement.do'>동아리 개설관리</a>
</td>
</tr>
<tr>
<td>
<a href='#'>회원관리 관리</a>
</td>
</tr>
</table>

</div>

<div id="clubCreateContainer">
<table  id='clubCreateTable'>
<c:forEach var="c" items="${circleList}" varStatus="vs">
<tr>
<td rowspan='3'><img src="resources/image/${c.circle_photo }"></td><td>동아리 명 : ${c.circle_name}</td><td rowspan='3'><button class='btn btn-success' style='width:80px;height:50px;'>승인</button></td>
</tr>
<tr>
<td>신청자 ID : ${c.member_id}</td>
</tr>
<tr>
<td>Phone : ${c.circle_phone}</td>
</tr>
<tr><td></td></tr>
</c:forEach>
</table>
</div>

</div>
</section>
