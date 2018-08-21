<%@page import="com.yj.project.member.model.vo.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
    <%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
    <%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
    
    <%List<Member> memberList=(List<Member>)request.getAttribute("memberList"); %>
    
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
table {
margin:0 auto;
border-collapse:collapse;
}
#member_table {
margin:0 auto;
width:90%;
}
th,td {
text-align:center;
padding:10px;
color:black;
}
#line {
border-bottom:1px solid black;
}
#linetop {
border-bottom:3px solid black;
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
  <br>
      <br> <span
         style='font-size: 30px; font-weight: bold; margin-left: 45%;color:black;'>관리자 페이지</span>
      <br>
      <hr />
<br><br>
	
    <form action="${path }/member/memberFinder.do">
	<select name='level' class='form-control'style='width:150px; margin-left:35%; display:inline-block'>
	<option value=''>등급 선택</option>
	<option value='L5'>회장</option>
	<option value='L4'>부회장</option>
	<option value='L3'>총무</option>
	<option value='L2'>일반</option>
	</select>
	<div id="search-userId" style=' display:inline-block'>
                <input type='text' class='form-control' name="searchKeyword" size='25' placeholder="검색할 회원ID를 입력하세요." style="width: 300px; display:inline-block;" >
                <button class="btn btn-info" type='submit' style=" display:inline-block;">검색</button>
            </form>
    </div>
	<div id='member_table'>
   <table>
	<tr>
		<th><span class='glyphicon glyphicon-user' style='color:red'/></th>
		<th><span class='glyphicon glyphicon-sunglasses' style='color:orange'/></th>
		<th><span class='glyphicon glyphicon-envelope' style='color:goldenrod'/></th>
		<th><span class='glyphicon glyphicon-phone' style='color:green'/></th>
		<th><span class='glyphicon glyphicon-gift' style='color:yellowgreen'/></th>
		<th><span class='glyphicon glyphicon-education' style='color:skyblue'/></th>
		<th><span class='glyphicon glyphicon-heart' style='color:blue'/></th>
		<th><span class='glyphicon glyphicon-calendar' style='color:pink'/></th>
		<th><span class='glyphicon glyphicon-queen' style='color:navy'/></th>
		<th><span class='glyphicon glyphicon-thumbs-down' style='color:purple'/></th>
	</tr>
	<tr id='linetop' style='font-size:10px; color:black'>
		<td>ID</td>
		<td>이름</td>
		<td>E-MAIL</td>
		<td>휴대전화</td>
		<td>생년월일</td>
		<td>소속 대학</td>
		<td>관심 분야</td>
		<td>가입일자</td>
		<td>등급</td>
		<td>회원 강등</td>	
	</tr>
	
	<%for(Member m:memberList) {
		if(!m.getMember_id().equals("admin")){%>
	<tr id='line'>
		<td><%=m.getMember_id() %></td>
		<td><%=m.getMember_name() %></td>
		<td><%=m.getMember_email() %></td>
		<td><%=m.getMember_phone() %></td>
		<td><%=m.getMember_birth() %></td>
		<td><%=m.getUniversity() %></td>
		<td>
		<% for(int i=0; i<m.getEnroll_category().length; i++) { %>
		<%=m.getEnroll_category()[i] %>
		<%if(i!=m.getEnroll_category().length-1) { %>
		/
		<%} } %>
		</td>
		<td><%=m.getEnroll_date() %></td>
		<td class='s'><%=m.getMember_level() %> </td>
		<td style='text-align:center;'><button class='btn btn-danger btn-sm deleteMember' name="<%=m.getMember_id()%>">탈퇴</button></td>
	</tr>
	<%} }%>
</table>
</div>
<script>
$(function(){
	$(".ly").on("click",function() {
		
		var selectValue = $(this).parent().siblings('td').first().html();
		var level = $(this).parent().siblings('td').eq(8).children().attr("value");
		
		location.href='${path}/member/levelChange.do?member_id='+selectValue+'&level='+level;
		});
	
	$(".deleteMember").click(function () {
		var member_id = $(this).attr("name");
		if(confirm($(this).attr("name")+"님을 탈퇴 시키시겠습니까?")){
			locatin.href="${path}/deleteMember.do?member_id="+member_id;
		}
	});
	
	
	});	
</script>
<div style="margin-left:48%">
${pageBar }
</div>
</div>
</div>

  	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</section>


