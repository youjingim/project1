<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<c:set var = 'path' value='<%=request.getContextPath()%>'/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value='club' name='pageTitle'/>
</jsp:include>
<jsp:include page="/WEB-INF/views/clubPage/common/aside1.jsp"/>
 <script>
		function deleteMember(id,no)
		{
			var choose=confirm('동아리에서 탈퇴시키겠습니까?');
			if(choose==true){
				location.href="${path}/deleteCircleMember.do?id="+id+"&no="+no;
			}
			else{
				alert('다시 동아리 회원관리 페이지로 넘어갑니다.');
				history.go();
			}
			
		}
		function changeLevel(id){
			location.href="${path}/changeGrade.do?id="+id;
		}
</script>
<style>
/* 페이징 처리 css */
/* Pagination links */
.pagination a {
    color: black;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color .3s;
}

/* Style the active/current link */
.pagination a.active {
    background-color: dodgerblue;
    color: white;
}

/* Add a grey background color on mouse-over */
.pagination a:hover:not(.active) {background-color: #ddd;}

th,td{
  text-align: center;
}
</style>
  <!-- Middle Column -->
    <div class="w3-col m7">

      <div class="w3-container w3-card w3-white w3-round w3-margin" style="height:700px;"><br>
        <div>
        <h5 style="text-align:center;"><strong><c:out value="${club.circle_name }"/> 회원관리</strong></h5> <hr>
        </div>
        <div>
        <table class="table">
        <tr>
          <th>이름</th>
          <th>생년월일</th>
          <th>회원등급</th>
          <th>전화번호</th>
          <th>이메일</th>
          <th>수정 / 삭제</th>
        </tr>
       <c:forEach items="${list }" var="m" varStatus="status">
        <tr>
          <td><c:out value="${m.member_name }"/></td>
          <td><c:out value="${m.member_birth}"/></td>
          <td><select name="memberGrade">         	
          	<c:if test="${m.member_level eq 'L2' }">
              <option value="L2" selected>일반회원</option>
              <option value="L3">총부</option>
              <option value="L4">부회장</option>
              <option value="L5">회장</option>
          	</c:if>
           	<c:if test="${m.member_level eq 'L3' }">
              <option value="L2" >일반회원</option>
              <option value="L3" selected>총부</option>
              <option value="L4">부회장</option>
              <option value="L5">회장</option>
            </c:if>
            <c:if test="${m.member_level eq 'L4' }">
              <option value="L2" >일반회원</option>
              <option value="L3">총부</option>
              <option value="L4" selected>부회장</option>
              <option value="L5">회장</option>
           	</c:if>
           	<c:if test="${m.member_level eq 'L5' }">
              <option value="L2" >일반회원</option>
              <option value="L3">총부</option>
              <option value="L4">부회장</option>
              <option value="L5" selected>회장</option>
         	</c:if>
            </select></td>
          <td><c:out value="${m.member_phone }"/></td>
          <td><c:out value="${m.member_email }"/></td>
          <td><button type="button" onclick="changeLevel('${m.member_id}')">등급수정</button>
            <button type="button" onclick="deleteMember('${m.member_id}',${club.circle_num });">회원삭제</button>
          </td>
        </tr>
       </c:forEach>
      </table>
      
	
      <!-- 페이징 처리 -->
      <div class="pagination" style="display: table;margin-right: auto;margin-left: auto;">
        ${pageBar }
      </div>
    </div>
      </div>
    <!-- End Middle Column -->
    </div>

      
<jsp:include page="/WEB-INF/views/clubPage/common/aside2.jsp"/>      