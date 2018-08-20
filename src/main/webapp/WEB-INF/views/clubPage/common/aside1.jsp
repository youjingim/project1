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
	  location.href="${path}/circle_budget.do?circle_num="+${club.circle_num}+"&id="+id;
	 
  }
  function circle_gallery(){
	  location.href="${path}/circle_gallery.do?circle_num="+${club.circle_num};
  }
  function circle_calendar(){
	  location.href="${path}/circle_calendar.do?circle_num="+${club.circle_num}+"&member_id="+'${memberLoggedIn.member_id}';
  }
</script>
<style>
/* 댓글 범위를 나타내는 css*/
.top{
  width:700px;
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
         <h4 class="w3-center"><c:out value="${club.circle_name }"/></h4>
         <p class="w3-center"><img src="${pageContext.request.contextPath}/resources/image/${club.circle_photo}" class="w3-circle" style="height:106px;width:106px" alt="동아리 로고"></p>
         <hr>
         <p><i class="fa fa-bookmark fa-fw w3-margin-right w3-text-theme"></i><c:out value="${club.university }"/></p>
         <p><i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i><c:out value="${club.circle_location }"/> </p>
         <p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i><fmt:formatDate type="date" value="${club.circle_enrolldate}" /> </p>
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
          <c:if test="${club.circle_num eq memberLoggedIn.circle1_num }">
          <button onclick="circle_list('${memberLoggedIn.member_level}')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-address-book-o fa-fw w3-margin-right"></i> 동아리 회원목록</button>
          <div id="Demo1" class="w3-hide w3-container">
            <p>Some text..</p>
          </div>
          <button onclick="circle_budget('${memberLoggedIn.member_level}','${memberLoggedIn.member_id }')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-won fa-fw w3-margin-right"></i> 동아리 예산</button>
          <div id="Demo3" class="w3-hide w3-container">
            <p>Some other text..</p>
          </div>

          </c:if>

          <button onclick="circle_calendar()" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i> 동아리 일정 <c:if test='${total != 0}'><span style='margin-left:50%;' class='badge badge-default'>new ${total}</span></c:if></button>
          <div id="Demo5" class="w3-hide w3-container">
            <p>Some other text..</p>
          </div>

          <button onclick="circle_gallery()" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-users fa-fw w3-margin-right"></i> 동아리 사진첩</button>
          <div id="Demo4" class="w3-hide w3-container">
         <div class="w3-row-padding">
         <br>
           <div class="w3-half">
             <img src="/w3images/lights.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/mountains.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/forest.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/snow.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
         </div>
          </div>
        </div>
      </div>
      <br>

      <!-- Interests -->
      <div class="w3-card w3-round w3-white w3-hide-small">
        <div class="w3-container">
          <p>관련  태그</p>
          <p>
         <c:forEach  var="ca" items="${array}">	
            <span class="w3-tag w3-small w3-theme-d1">#${ca }</span>

		</c:forEach>
          </p>
        </div>
      </div>
      <br>

    <!-- End Left Column -->
    </div>
   