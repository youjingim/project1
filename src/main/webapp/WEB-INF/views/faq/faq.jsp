<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
    <%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
    <%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
    	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js">
        <c:set var='path' value="${pageContext.request.contextPath}"/>

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
font-size:15px;
}

table tr{
font-size:15px;
}

table tr td{
border-top:2px solid black !important;
border-bottom:2px solid black !important;

padding:30px;
color:black;
font-size:15px;
}
table#tbl-board{
font-size:20px;}


</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
function fnt(){
	$(this).next().slideToggle();
	}
</script>





<script type="text/javascript">

</script>
<section>
<br><br><br>
	<br><span style="font-size:34px; font-weight:bold;color:black;margin-left:50%;  		text-align:center;" >FAQ</span>
		<span style="font-size:28px; font-weight:bold;color:black;margin-left:46%;  		text-align:center;" >자주 묻는 질문</span>
	<br><br><Br>
	
<div id="main_container">
<table id='tbl-board' class='table' style="width:80%;margin-left:10%;">
			<c:if test="${not empty list }">
			<c:forEach var='faq' items='${list }' varStatus="vs">
      <tr onclick="	$(this).next().slideToggle()" style='cursor:pointer;'>
      
         <td style='width:80%; font-size:20px; font-weight:bold; padding:14px;'>
         <input type='hidden' value='${faq.QUESTION }'>
         
         ${faq.QUESTION }</td>
		 <c:if test="${memberLoggedIn.member_id eq 'admin' }">
		 	
		 <td style='width:10%'>
		 	<button class='btn btn-info update' data-toggle="modal" data-target="#faqUpdate" style="background-color: #6CC0FF;
			   	color: white; border-color:#6CC0FF;">수정</button>
		 	<button class='btn btn-danger'  style="background-color: black;
			   		    color: white; border-color:black;" >삭제</button></td></c:if>			
         <td style='width:5%;'><input type='hidden' value='${faq.QUES_NUM }'><img src='resources/image/direction2.png' width="50px" height="50px"></td>   
      </tr>

<tr style='display:none;width:80%;'><td colspan='2' style='text-align:center; padding:30px;'>
<input type='hidden' value='${faq.ANSWER }'>
${faq.ANSWER }</td>


 
</tr>
 
 
 
 </c:forEach>
</c:if>
</table>


<div id="faqUpdate" class="modal in" role="dialog" data-backdrop="">
  <div class="modal-dialog" style='margin-top:250px;'>

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" style="color:black;margin-left:230px;font-weight:bold;">수정하기</h4>
      </div>
      <div class="modal-body">
      <form id='faqUpdateFrm' method='post'>
      <input type='text' id='title' name='title' class='form-control'>
      <br>
      <input type='text' id='content' name='content' class='form-control'>
      <input type='hidden' id = 'num' name='num'>
      <br>
      </form>
      </div>
            <div class="modal-footer">
        <button type="button" class="btn btn-success" style="background-color: #6CC0FF;
			   	color: white; border-color:#6CC0FF;" onclick="fn_faqUpdate()" >수정</button>
      </div>
      </div></div></div>

<script>
function fn_faqUpdate(){
	var faqUpdateFrm = $('#faqUpdateFrm');
	var url = "${path}/faqUpdate.do";
	faqUpdateFrm.attr("action",url);
	faqUpdateFrm.submit();
}



 $('.update').click(function(){
	var text1 = $(this).parent().siblings().first().children('input').val();
	$('#title').attr("value",text1);
	var text2 = $(this).parent().parent().next().children().children('input').val();
	$('#content').attr("value",text2);
	var text3 = $(this).parent().siblings().last().children('input').val();
	$('#num').attr("value",text3);
}) 

</script>

</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


</section>




	