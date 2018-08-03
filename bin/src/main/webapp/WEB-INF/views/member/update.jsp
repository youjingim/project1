<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
    <%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
    <%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
    <%
    List<String> hobbyList = (List<String>)request.getAttribute("hobbyList");
    %>
    	<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
	</jsp:include>
<style>
 		section div#main_container{
		width:100%;
		height:700px;
		position:relative;
		top:500px;
		background-color:white;
		}
 
		div#enroll-container{position:relative;top:50px;width:400px; margin:0 auto; text-align:center;}
		div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
		div#enroll-container table th{text-align: right; padding-right:10px;}
		div#enroll-container table td{text-align: left;}
		</style>
		<section>
		<div id='main_container'>
		<span style='font-size:30px;font-weight:bold;margin-left:50px;'>회원가입</span>
		<hr/>
		<div id="enroll-container">
			<form name="memberUpdateFrm" action="${path }/memberUpdate.do" method="post" onsubmit="return fn_enroll_validate();" >
				<table>
					<tr>
						<th>아이디</th>
						<td>
							<input type="text" class="form-control" value='${m.userId}' name="userId" id="userId_"  readonly>
						</td>
					</tr>


					<tr>
						<th>이름</th>
						<td>	
						<input type="text" class="form-control" value='${m.userName}' name="userName" id="userName" required>
						</td>
					</tr>
					<tr>
						<th>나이</th>
						<td>	
						<input type="number" class="form-control" value='${m.age}' name="age" id="age">
						</td>
					</tr> 
					<tr>
						<th>이메일</th>
						<td>	
							<input type="email" class="form-control" value='${m.email}' placeholder="abc@xyz.com" name="email" id="email">
						</td>
					</tr>
					<tr>
						<th>휴대폰</th>
						<td>	
							<input type="tel" class="form-control" value='${m.phone }' placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" required>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>	
							<input type="text" class="form-control" value='${m.address}'placeholder="" name="address" id="address">
						</td>
					</tr>
					<tr>
						<th>성별 </th>
						<td>
							<div class="form-check form-check-inline">
								<input type="radio" class="form-check-input" name="gender" id="gender0" value="M" <c:if test="${m.gender=='M'}">checked</c:if>>
								<label for="gender0">남</label>
								<input type="radio" class="form-check-input" name="gender" id="gender1" value="F" <c:if test="${m.gender=='F'}">checked</c:if>>
								<label for="gender1">여</label>
							</div>
						</td>
					</tr>
					<tr>
						<th>취미 </th>
						<td>
							<div class="form-check form-check-inline">

								<input type="checkbox" class="form-check-input" name="hobby" id="hobby0" value="운동" <%=hobbyList.contains("운동") ? "checked":""%>><label class="form-check-label for="hobby0">운동</label>
								<input type="checkbox" class="form-check-input" name="hobby" id="hobby1" value="등산" <%=hobbyList.contains("등산") ? "checked":""%>><label class="form-check-label for="hobby1">등산</label>
								<input type="checkbox" class="form-check-input" name="hobby" id="hobby2" value="독서" <%=hobbyList.contains("독서") ? "checked":""%>><label class="form-check-label for="hobby2">독서</label>
								<input type="checkbox" class="form-check-input" name="hobby" id="hobby3" value="게임" <%=hobbyList.contains("게임") ? "checked":""%>><label class="form-check-label for="hobby3">게임</label>
								<input type="checkbox" class="form-check-input" name="hobby" id="hobby4" value="여행" <%=hobbyList.contains("여행") ? "checked":""%>><label class="form-check-label for="hobby4">여행</label>
							</div>
						</td>
					</tr>
				</table>
				<input type="submit" value="수정" >
				<input type="reset" value="취소">
			</form>
		</div>
		</div>
</section>





	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	