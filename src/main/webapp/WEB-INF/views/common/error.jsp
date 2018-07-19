<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
    <%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
    <%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
    <style>
    #error-container{
    height:600px;
    width:100%;
    
    }
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
height:500px;
position:relative;
z-index:10;
background-color:white;
top:100px;
}
    
    </style>
    	<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
	</jsp:include>
	<section>
	<div id="main_container">
	<div id='error-container'>
	<h1>Error</h1>
	<h2 style='color:red;'><%= exception.getMessage() %></h2>
	<a href="${pageContext.request.contextPath }/">첫화면으로 돌아가기</a>
	</div>
	</div>
</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	