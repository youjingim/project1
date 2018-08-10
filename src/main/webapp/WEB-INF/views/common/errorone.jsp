<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
    <%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
    <%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<link href="https://fonts.googleapis.com/css?family=Yeon+Sung" rel="stylesheet">    <c:set var='path' value="${pageContext.request.contextPath}"/>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    

    <style>
#error-container{
height:800px;
width:100%;
/* background-image:url('${path}/resources/image/error2.JPG');
background-size:cover; */

    }
section{
width:100%;
height:800px;
position:relative;
background-color:white;
z-index:10;
}
.font_style1{
position:absolute;
font-size:40px;
color:blue;
top:300px;
left:120px;
font-family: 'Yeon Sung', cursive;
}
.font_style2{
position:absolute;
top:500px;
left:120px;
}
.font_style3{
position:absolute;
font-size:20px;
color:gray;
top:380px;
left:120px;

}
    </style>
	<section>
	<div id='error-container'>
	<span class="font_style1">죄송합니다. 현재 찾을 수 없는 페이지를 요청 하셨습니다.</span>
 	<span class="font_style3">존재하지 않는 주소를 입력하셨거나,<br> 요청하신 페이지의 주소가 변경, 삭제되어 찾을 수 없습니다.<br> 궁금한 점이 있으시면 언제든 고객센터를 통해 문의해 주시기 바랍니다.</span>
 	
 	<img src = "${path}/resources/image/error.JPG" width="35%" height="550px" style="margin-left:53%;margin-top:150px;">
 	<span class="font_style2"><button onclick="location.href='${path}/'" class="btn btn-success" style="width:150px;height:60px;" >홈으로</button></span>
	</div>
</section>

	