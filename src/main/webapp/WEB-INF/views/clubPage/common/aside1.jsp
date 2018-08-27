<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
 <c:set var='path' value="${pageContext.request.contextPath}"/>
<script src = "http://code.jquery.com/jquery-latest.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script>
      $(document).ready(function(){
      $("#post_header").click(function(){
          $("#post").slideToggle();
      });
    });
    $(document).ready(function(){
    $("#circle_comment").click(function(){
        $("#post_comment").toggle();
    });
  });

  function circle_home(){
	  location.href="${path}/clubMain.do?member_id="+'${memberLoggedIn.member_id}';
  }  
  function circle_list(level){
	  var grade=level;
	  if(grade!=='L2'){
	  location.href="${path}/circle_list.do?circle_num="+${club.circle_num};
	  }
	  else{
		  alert('접근권한이 없는 페이지입니다.');
		  history.go();
	  }
  }  
  function circle_budget(level,id){
	  location.href="${path}/circle_budget.do?circle_num="+${club.circle_num}+"&id="+'memberLoggedIn.member_id';
	 
  }
  function circle_gallery(){
	  location.href="${path}/circle_gallery.do?circle_num="+${club.circle_num};
  }
  function circle_calendar(){
	  location.href="${path}/circle_calendar.do?circle_num="+${club.circle_num}+"&member_id="+'${memberLoggedIn.member_id}';
  }
  function joinCircleMember(){
	  location.href="${path}/joinCircleMember.do?circle_num="+${club.circle_num}+"&member_id="+'${memberLoggedIn.member_id}';
  }
  function outCircle(){
	  var cf=confirm('정말 동아리를 탈퇴하시겠습니까?');
	  if(cf==true){
	  	location.href="${path}/outCircle.do?member_id="+'${memberLoggedIn.member_id}'+"&no="+${club.circle_num};
	  }
	  else{
			history.go();
		}
  }
  $(function(){
	  $('.myBtnCh#${chairman}').on('click',function(){
		  var id=$(this).attr('id');
		  $('#'+id+'.modal').css("display",'block');
	  });
  	  $('.close').on('click',function(){  
  		$(this).parents('div.modal').css('display','none');
  	  });	
  });
  $(function(){
	  $('#joinClub').on('click',function(){
		  
		  $('#joinClubPage').css("display",'block');
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
  function validate2(){
	    var content = $("[name=content]").val();
	    var title=$("[name=title]").val();
	    if(title.trim().length==0){
	    	alert("제목을 입력해주세요.");
		   	return false;
	    }
	    if(content.trim().length==0){
	        alert("내용을 입력하세요");
	        return false;
	    }
	    return true;
	}
  function validate3(){
	    var content = $("[name=join_content]").val();
	    var title=$("[name=join_title]").val();
	    if(title.trim().length==0){
	    	alert("제목을 입력해주세요.");
		   	return false;
	    }
	    if(content.trim().length==0){
	        alert("내용을 입력하세요");
	        return false;
	    }
	    return true;
	}
</script>
<style>
/* 댓글 범위를 나타내는 css*/
.top{
  width:700px;
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

</head>

<!-- Page Container -->
<div class="w3-theme-l4">
<div class="w3-container w3-content w3-theme-l4" style="max-width:1600px;margin-top:80px;">
  <!-- The Grid -->
  <div class="w3-row">
    <!-- Left Column -->
    <div class="w3-col m3" >
      <!-- Profile -->
      <div class="w3-card w3-round w3-white" style="margin-top:16px;">
        <div class="w3-container">

         <h4 class="w3-center"><c:out value="${club.circle_name }"/><span class="glyphicon glyphicon-envelope myBtnCh" id="${chairman }"></span></h4>
         <p class="w3-center"><img src="${pageContext.request.contextPath}/resources/image/${club.circle_photo}" class="w3-circle" style="height:106px;width:106px" alt="동아리 로고"></p>

         <hr>
         <p><i class="fa fa-bookmark fa-fw w3-margin-right w3-text-theme"></i><c:out value="${club.university }"/></p>
         <p><i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i><c:out value="${club.circle_location }"/> </p>
         <p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i><fmt:formatDate type="date" value="${club.circle_enrolldate}" pattern="yyyy년 MM월 dd일" /> </p>
         <p><i class="fa fa-commenting fa-fw w3-margin-right w3-text-theme"></i><c:out value="${club.circle_comment }"/></p>
         
        </div>
      </div><br>

      <!-- Accordion -->
      <div class="w3-card w3-round">
        <div class="w3-white">
          <button onclick="circle_home()" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i> 동아리 소식</button>
          <div id="Demo2" class="w3-hide w3-container">
            <p>Some other text..</p>
          </div>
          <c:if test="${club.circle_num eq memberLoggedIn.circle1_num  and memberLoggedIn.member_level ne 'L2'}">
          <button onclick="circle_list('${memberLoggedIn.member_level}')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-address-book-o fa-fw w3-margin-right"></i> 동아리 회원목록</button>
          <div id="Demo1" class="w3-hide w3-container">
            <p>Some text..</p>
          </div>
          </c:if>
          <c:if test="${club.circle_num eq memberLoggedIn.circle1_num }">
          <button onclick="circle_budget('${memberLoggedIn.member_level}','${memberLoggedIn.member_id }')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-won fa-fw w3-margin-right"></i> 동아리 예산</button>
          <div id="Demo3" class="w3-hide w3-container">
            <p>Some other text..</p>
          </div>
          </c:if>

          <button onclick="circle_calendar()" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i> 동아리 일정 <c:if test='${total != 0}'><span style='margin-left:50%;' class='badge badge-default'>new ${total}</span></c:if></button>
          <div id="Demo5" class="w3-hide w3-container">
            <p>Some other text..</p>
          </div>
          <c:if test="${club.circle_num eq memberLoggedIn.circle1_num  and memberLoggedIn.member_level eq 'L5'}">
          <button onclick="joinCircleMember()"class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-folder-open fa-fw w3-margin-right"></i> 동아리 신청회원 </button>
          <div id="Demo6" class="w3-hide w3-container">
            <p>Some other text..</p>
          </div>
		</c:if>
          <button onclick="circle_gallery()" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-users fa-fw w3-margin-right"></i> 동아리 사진첩</button>
          <div id="Demo4" class="w3-hide w3-container">

         <div class="w3-row-padding">
         <br>
           
         </div>
          </div>
        </div>
      </div>
      <br>
 
    <c:if test="${memberLoggedIn.circle1_num eq club.circle_num }">
      <button type="button" class="btn btn-danger" onclick="outCircle()">동아리 탈퇴</button>
	</c:if>	
	<c:if test="${memberLoggedIn.circle1_num ne club.circle_num }">
      <button type="button" id="joinClub" class="btn btn-success" >동아리 가입신청</button>
	</c:if>	
    <!-- End Left Column -->
    </div>
  <!-- The Modal -->
<div id="${chairman }" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <h3>TO.동아리 운영자</h3>
    <hr>
    <form action="${path }/circleMessage.do" method="post" onsubmit="return validate2();">
    <div class="form-group">
      <label for="member_receive">받는사람</label>
      <input type="text" class="form-control" id="member_receive" name="yid" value="${chairman }">
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
 <!-- The Modal --><!-- 동아리 가입하기 위한 모달페이지 -->
<div id="joinClubPage" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <h3>동아리 가입신청</h3>
    <hr>
    <form action="${path }/joinClubMember.do" method="post" onsubmit="return validate3();">
    <div class="form-group">
      <label for="member_receive">받는사람</label>
      <input type="text" class="form-control" id="member_receive" name="join_receiver" value="${chairman }">
    </div>
    <input type="hidden" name="circle_num" value="${club.circle_num }"/>
    <div class="form-group">
      <label for="pwd">보내는사람</label>
      <input type="text" class="form-control" id="pwd" name="join_sender"value="${memberLoggedIn.member_id }">
    </div>
    <div class="form-group">
      <label for="title">제목</label>
      <input type="text" class="form-control" id="title" name="join_title" placeholder="제목을 입력해주세요">
    </div>
    <div class="form-group">
      <label for="comment">내용</label>
      <textarea class="form-control" rows="5" id="comment" name="join_content" placeholder="신청사유를 적어주세요"></textarea>
    </div>
    <input type="submit" class="btn btn-default" value="신청"/>
    <input type="reset" class="btn btn-default" value="취소"/>
    </form>
  </div>

</div> 