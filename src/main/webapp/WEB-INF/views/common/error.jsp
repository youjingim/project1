<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
    <%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
    <%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<link href="https://fonts.googleapis.com/css?family=Gloria+Hallelujah" rel="stylesheet">    <style>
    #error-container{
    height:600px;
    width:100%;
    }
    section{
width:100%;
height:800px;
position:relative;
background-color:white;
z-index:10;
}
section div#main_container{
width:100%;
height:500px;
position:relative;
z-index:10;
background-color:white;
}
.font_style{
color:black;font-size:60px;margin-left:40%;
font-family: 'Gloria Hallelujah', cursive;
}
.font_style2{
margin-left:25%;
font-family: 'Gloria Hallelujah', cursive;
width:10%;
}
.font_style2 a{
text-decoration:none;color:black;font-size:20px;
}    
    </style>
	<section>
	<div id="main_container">
	<div id='error-container'>
	<span class="font_style">Error Page</span><span class="font_style2"><a href="${pageContext.request.contextPath }/">첫화면으로 돌아가기</a></span>
	<img src = "resources/image/sorry.png" width="40%" height="700px" style='margin-left:28%;'>
	
	</div>
	</div>
</section>

	