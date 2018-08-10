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


</style>

<script type="text/javascript">

</script>
<section>
<br><br><br>
	<br><span style="font-size:28px; font-weight:bold;color:black;margin-left:50%;  		text-align:center;" >FAQ</span>
	<br>
	
<div id="main_container">
<table class='table'>
<tr onclick='toggle_tr()' style='cursor:pointer;'>
<td>서영누나 집중해야지~</td>
</tr>
<tr onclick='toggle_tr1()' style='cursor:pointer;'>
<td>서영누나 집중해야지~</td>
</tr>

</table>
<div id='div1' style='display:none;'>ddddd</div>
<div id='div2' style='display:none;'>ddddd</div>

</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</section>
<script>
function toggle_tr(e){
	$('#div1').css('display','block');
	
}
function toggle_tr1(e){
	$('#div2').css('display','block');
	
}
</script>




	