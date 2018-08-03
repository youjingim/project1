<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
    <%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
    <%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<link href="https://fonts.googleapis.com/css?family=Gloria+Hallelujah" rel="stylesheet">
    <c:set var='path' value="${pageContext.request.contextPath}"/>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    

    <style>
#error-container{
height:800px;
width:100%;
background-image:url('${path}/resources/image/error1.JPG');
background-size:cover;

    }
section{
width:100%;
height:800px;
position:relative;
background-color:white;
z-index:10;
}

.font_style2{
position:absolute;
top:800px;
left:45%;
}

    </style>
	<section>
	<div id='error-container'>
	
<%-- 	<img src = "${path}/resources/image/error1.JPG" width="80%" height="800px" style="margin-left:10%;">
 --%> 	<span class="font_style2"><button onclick="location.href='${path}/'" class="btn btn-success" style="width:150px;height:60px;" >홈으로</button></span>
	</div>
</section>

	