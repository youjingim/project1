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
		function deleteJoin(join_num,circleNum){
			alert(join_num);
			alert(circleNum);
			var chance=confirm('가입신청서를 삭제하시겠습니까?');
			if(chance==true){
				location.href="${path}/deleteJoin.do?circle_num="+circleNum+"&joinNum="+join_num;
			}else{
				alert('다시 신청서 페이지로 넘어갑니다.');
				history.go();
			}
		}
		/* function validate11(){
		    var content = $("[name=content12]").val();
		    var title=$("[name=title12]").val();
		    if(title.trim().length==0){
		    	alert("제목을 입력해주세요.");
			   	return false;
		    }
		    if(content.trim().length==0){
		        alert("내용을 입력하세요");
		        return false;
		    }
		    return true;
		} */
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
    z-index: 9; /* Sit on top */
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
    z-index: 9;
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
        <h5 style="text-align:center;"><strong><c:out value="${club.circle_name }"/> 회원신청 리스트</strong></h5> <hr>
        </div>
        <div>
        <table class="table">
        <tr>
          <th>신청자</th>
          <th>신청날짜</th>
          <th>제목</th>
          <th>내용</th>
  
          <th>보기  / 삭제</th>
        </tr>
       <c:forEach items="${list }" var="m" varStatus="status">
        <tr>
          <td><c:out value="${m.join_sender }"/> <span class="glyphicon glyphicon-envelope myBtn" id="${m.join_sender }"></span></td>
          <td><c:out value="${m.join_date}"/></td>
          <td><c:out value="${m.join_title }"/></td>
          <td><c:out value="${m.join_content }"/></td>
          <td><button type="button" class="view" id="${m.joinNum }">보기</button>
            <button type="button" onclick="deleteJoin(${m.joinNum},${club.circle_num });">삭제</button>
          </td>
        </tr>
      <!-- The Modal -->
      <div id="${m.join_sender }" class="modal">

        <!-- Modal content -->
        <div class="modal-content">
          <span class="close">&times;</span>
          <h3>쪽지보내기</h3>
          <hr>
          <form action="${path }/circleMemberMessage.do" method="post" onsubmit="return validate11();">
          <div class="form-group">
            <label for="member_receive">받는사람</label>
            <input type="text" class="form-control" id="member_receive" name="yid" value="${m.join_sender }">
          </div>
          <div class="form-group">
            <label for="pwd">보내는사람</label>
            <input type="text" class="form-control" id="pwd" name="mid"value="${m.join_receiver }">
          </div>
          <div class="form-group">
            <label for="title">제목</label>
            <input type="text" class="form-control" id="title" name="title12" placeholder="제목을 입력하세요.">
          </div>
          <div class="form-group">
            <label for="comment">내용</label>
            <textarea class="form-control" rows="5" id="comment" name="content12" placeholder="내용을 입력하세요."></textarea>
          </div>
          <input type="submit" class="btn btn-default" value="전송"/>
          <input type="reset" class="btn btn-default" value="취소"/>
          </form>
        </div>

      </div>
      <!-- The Modal --><!-- 상세보기 모달 -->
      <div id="${m.joinNum }" class="modal">

        <!-- Modal content -->
        <div class="modal-content">
          <span class="close">&times;</span>
          <h3>동아리 가입신청</h3>
          <hr>
          <form action="${path }/circleMemberMessage2.do" method="post">
          <div class="form-group">
            <label for="member_receive">받는사람</label>
            <input type="text" class="form-control" id="member_receive" name="yid" value="${m.join_receiver }">
          </div>
          <input type="hidden" name="nn" values="${club.circle_num }"/>
          <div class="form-group">
            <label for="pwd">보내는사람</label>
            <input type="text" class="form-control" id="pwd" name="mid"value="${m.join_sender }">
          </div>
          <div class="form-group">
            <label for="title">제목</label>
            <input type="text" class="form-control" id="title" name="title" value="${m.join_title }">
          </div>
          <div class="form-group">
            <label for="comment">내용</label>
            <textarea class="form-control" rows="5" id="comment" name="content" >${m.join_content }</textarea>
          </div>
          <input type="submit" class="btn btn-default" value="수락"/>
          
          </form>
        </div>

      </div>
       </c:forEach>
      </table>
      
      <script>
      $(function(){
    	  $('.view').on('click',function(){
    		  var id=$(this).attr('id');
    		  $('#'+id).css("display",'block');
    	  });
      	  $('.close').on('click',function(){  
      		$(this).parents('div.modal').css('display','none');
      	  });	
      });
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