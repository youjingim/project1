

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<jsp:include page='/WEB-INF/views/common/header.jsp'>
	<jsp:param value="메모작성" name="pageTitle"/>
</jsp:include>
    <style>
    div#memo-container{width:60%;height:800px; margin:0 auto;}
    section{
width:100%;
height:800px;
position:relative;
top:570px;
background-color:white;
z-index:10;
}
    </style>
    <section>
    <div id="memo-container">
    	<br><br><br><br><br><br>
        <form action="${pageContext.request.contextPath}/memo/insertMemo.do" class="form-inline">
            <input type="text" class="form-control col-sm-6" name="memo" placeholder="메모" required/>&nbsp;
            <input type="password" class="form-control col-sm-2" name="password" maxlength="4" placeholder="비밀번호" required/>&nbsp;
            <button class="btn btn-outline-success" type="submit" >저장</button>
        </form>
        <br><br>
        <table class='table'>
	        <tr>
	        	<th scope="col">번호</th>
	        	<th scope="col">메모</th>
	        	<th scope="col">날짜</th>
	        	<th scope="col">삭제</th>
	        </tr>
	       	<c:forEach var='m' items='${memoList}' varStatus="vs">
	       	<tr>
				<td><c:out value="${m.memono }"/></td>		  
				<td><c:out value="${m.memo }"/></td>
				<td><c:out value="${m.memodate }"/></td>
				<td><button class="btn btn-danger" onclick="deleteMemo('${m.memono}')">삭제</button></td>	  
			</tr>	
		    </c:forEach>
        </table>
        <form name='memoDelFrm' action="deleteMemo.do" method='post'>
        	<input type='hidden' name='no'/>
        	<input type='hidden' name='password'/>
        </form>
    </div>
    <jsp:include page='/WEB-INF/views/common/footer.jsp'></jsp:include>
    </section>
	<script>
		function deleteMemo(no)
		{
				var frm=document.memoDelFrm;
				frm.no.value=no;
				frm.password.value=prompt("비밀번호를 입력하세요");
				frm.submit();
		}
	</script>
    
