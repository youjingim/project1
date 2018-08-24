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
		function changeLevel(id,no){
			var grade=$("[name='memberGrade']").val();
			var choose=confirm(id+'님의 등급을 변경하시겠습니까?');
			if(choose==true){
				location.href="${path}/changeGrade.do?id="+id+"&grade="+grade+"&no="+no;
			}
			else{
				alert('다시 동아리 회원관리 페이지로 넘어갑니다.');
				history.go();
			}
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
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    max-width:800px;
}

/* The Close Button */
.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
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
          <td><c:out value="${m.member_name }"/> <span class="glyphicon glyphicon-envelope myBtn" id="${m.member_id }"></span></td>
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
          <td><button type="button" onclick="changeLevel('${m.member_id}',${club.circle_num });">등급수정</button>
            <button type="button" onclick="deleteMember('${m.member_id}',${club.circle_num });">회원삭제</button>
          </td>
        </tr>
      <!-- The Modal -->
      <div id="${m.member_id }" class="modal">

        <!-- Modal content -->
        <div class="modal-content">
          <span class="close">&times;</span>
          <h3>쪽지보내기</h3>
          <hr>
          <form action="${path }/circleMemberMessage.do" method="post">
          <div class="form-group">
            <label for="member_receive">받는사람</label>
            <input type="text" class="form-control" id="member_receive" name="yid" value="${m.member_id }">
            <input type="hidden" name="cNum" value="${m.circle1_num }"/>
          </div>
          <div class="form-group">
            <label for="pwd">보내는사람</label>
            <input type="text" class="form-control" id="pwd" name="mid"value="${memberLoggedIn.member_id }">
          </div>
          <div class="form-group">
            <label for="title">제목</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요">
          </div>
          <div class="form-group">
            <label for="comment">내용</label>
            <textarea class="form-control" rows="5" id="comment" name="content" placeholder="내용을 입력해주세요"></textarea>
          </div>
          <input type="submit" class="btn btn-default" value="전송"/>
          <input type="reset" class="btn btn-default" value="취소"/>
          </form>
        </div>

      </div>
       </c:forEach>
      </table>
      
      <script>
      $(function(){
    	  $('.myBtn').on('click',function(){
    		  var id=$(this).attr('id');
    		  $('#'+id).css("display",'block');
    	  });
      	  $('.close').on('click',function(){  
      		$(this).parents('div.modal').css('display','none');
      	  });	
      });
    //Get the modal
      var modal = document.getElementById('myModal');

      // Get the button that opens the modal
      var btn = document.getElementById("myBtn");

      // Get the <span> element that closes the modal
      var span = document.getElementsByClassName("close")[0];

      // When the user clicks the button, open the modal
      /* btn.onclick = function() {
          modal.style.display = "block";
      } */

      // When the user clicks on <span> (x), close the modal
      span.onclick = function() {
          modal.style.display = "none";
      }

      // When the user clicks anywhere outside of the modal, close it
      window.onclick = function(event) {
          if (event.target == modal) {
              modal.style.display = "none";
          }
      }
      </script>
	
      <!-- 페이징 처리 -->
      <div class="pagination" style="display: table;margin-right: auto;margin-left: auto;">
        ${pageBar }
      </div>
    </div>
      </div>
    <!-- End Middle Column -->
    </div>

      
<jsp:include page="/WEB-INF/views/clubPage/common/aside2.jsp"/>      