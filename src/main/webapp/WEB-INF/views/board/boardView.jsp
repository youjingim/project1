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
<td>${board.freeboard_title }</td>
<td>${board.member_id }</td>

</tr>
<tr>
<td colspan='4' style='height:500px;'>${board.freeboard_content }</td>
</tr>


</table>
    <div>
     <input style='margin-left:95%;' type="button" value="목 록" id='btn-add' class='btn btn-default' onclick="location.href='${pageContext.request.contextPath}/board/boardList.do'"/>
    
    
    </div>  

        
    </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</section>

   
   