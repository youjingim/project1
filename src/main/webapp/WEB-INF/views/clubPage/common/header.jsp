<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<c:set var = 'path' value='<%=request.getContextPath()%>'/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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


      <link rel="stylesheet" type="text/css" href="${path }/resources/css/component.css">
    <link rel="stylesheet" type="text/css" href="${path }/resources/css/default.css">
  <script src="${path }/resources/js/modernizr.custom.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gothic+A1" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Poiret+One" rel="stylesheet">

<script>
function fnMove(seq){
    var offset = $("#info" + seq).offset();
    if('${param.pageState}'!='index'){
    	location.href = "${path}/index.do?seq="+seq;
    }else{
    	$('html, body').animate({scrollTop : offset.top}, 600);
    }

}


	if('${param.seq}'!=''){
		setTimeout(function(){
			$('html, body').animate({scrollTop : ($("#info" + '${param.seq}').offset()).top}, 600);
	}, 100);

  }
     $(window).scroll(function() {
    	  var $el = $('#navbar_set');
    	  var $sel = $('#color_select');
    	  if($(this).scrollTop() >= 100){ $el.css('background','white');$el.css('border','1px solid lightgray');$sel.attr("value","black");}
    	  else {$el.css('background','rgba(255, 255, 255, 0)');$el.css('border','none');$sel.attr("value","white");
    	   	 $('#myNavbar').children("ul").children("li").children("a").css("color","black");
    	    	$("#logo_span").children("a").css("color","black");
    	  }
    	});

      
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
  function circle_budget(){
	  location.href="${path}/circle_list.do?circle_num="+${club.circle_num};
  }  
</script>
<style>
body{
width:100%;
height:auto;
position:relative;
}
div#myNavbar a {
font-size:17px;
color:black;
font-family: 'Nanum Gothic Coding', monospace;
}
div#myNavbar ul li a:hover{
color:gray;
font-size:18px;
}
header{
width:100%;
height:auto;
position:fixed;
z-index:999;
}
.container{
height:1000px;
}

#logo_span{
position:absolute;
left:20px;
transition:0.5s;
z-index:1001;
top:10px;
}
span#logo_span a{
font-size:40px;
font-weight:bold;
color:black;
text-decoration:none;
font-family: 'Poiret One', cursive;
margin-left:30px;
padding-top:10px;
}

#info_span a{
font-size:10px;
font-weight:bold;
color:black;
text-decoration:none;
margin-left:30px;
padding-top:10px;
}

#info_span{
position:absolute;
right:30px;
transition:0.5s;
z-index:1001;
top:25px;
}

.login{
position:absolute;
right:30px;
top:20px;
}
.login a{
font-size:17px;
font-weight:bold;
color:white;
text-decoration:none;
}
.login a:hover{
color:gray;
}

* {box-sizing: border-box}
body {font-family: Verdana, sans-serif; margin:0}
.mySlides {display: none}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 100%;
  position: relative;
  margin: auto;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 2.5s;
  animation-name: fade;
  animation-duration: 2.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}



.card-container.card {
    max-width: 350px;
    padding: 40px 40px;
}

.btn {
    font-weight: 700;
    height: 36px;
    -moz-user-select: none;
    -webkit-user-select: none;
    user-select: none;
    cursor: default;
}

/*
 * Card component
 */
.card {
    background-color: #F7F7F7;
    /* just in case there no content*/
    padding: 20px 25px 30px;
    margin: 0 auto 25px;
    margin-top: 50px;
    /* shadows and rounded borders */
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}

.profile-img-card {
    width: 96px;
    height: 96px;
    margin: 0 auto 10px;
    display: block;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    border-radius: 50%;
}

/*
 * Form styles
 */
.profile-name-card {
    font-size: 16px;
    font-weight: bold;
    text-align: center;
    margin: 10px 0 0;
    min-height: 1em;
}

.reauth-email {
    display: block;
    color: #404040;
    line-height: 2;
    margin-bottom: 10px;
    font-size: 14px;
    text-align: center;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

.form-signin #inputEmail,
.form-signin #inputPassword {
    direction: ltr;
    height: 44px;
    font-size: 16px;
}

.form-signin input[type=email],
.form-signin input[type=password],
.form-signin input[type=text],
.form-signin button {
    width: 100%;
    display: block;
    margin-bottom: 10px;
    z-index: 1;
    position: relative;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

.form-signin .form-control:focus {
    border-color: rgb(104, 145, 162);
    outline: 0;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
}

.btn.btn-signin {
    /*background-color: #4d90fe; */
    background-color: rgb(104, 145, 162);
    /* background-color: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));*/
    padding: 0px;
    font-weight: 700;
    font-size: 14px;
    height: 36px;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    border-radius: 3px;
    border: none;
    -o-transition: all 0.218s;
    -moz-transition: all 0.218s;
    -webkit-transition: all 0.218s;
    transition: all 0.218s;
}

.btn.btn-signin:hover,
.btn.btn-signin:active,
.btn.btn-signin:focus {
    background-color: rgb(12, 97, 33);
}

.forgot-password {
    color: rgb(104, 145, 162);
}

.forgot-password:hover,
.forgot-password:active,
.forgot-password:focus{
    color: rgb(12, 97, 33);
}



.dropdown .dropbtn {
    font-size: 16px;
    border: none;
    outline: none;
    color: white;
    padding: 14px 16px;
    background-color: inherit;
    font-family: inherit;
    margin: 0;
}



.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    float: none;
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}

.dropdown-content a:hover {
    background-color: #ddd;
}

.dropdown:hover .dropdown-content {
    display: block;
}

.openBtn {
    background: #f1f1f1;
    border: none;
    padding: 10px 15px;
    font-size: 20px;
    cursor: pointer;
}

.openBtn:hover {
    background: #bbb;
}

.overlay {
    height: 100%;
    width: 100%;
    display: none;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: rgb(0,0,0);
    background-color: rgba(0,0,0, 0.9);
}

.overlay-content {
    position: relative;
    top: 46%;
    width: 80%;
    text-align: center;
    margin-top: 30px;
    margin: auto;
}

.overlay .closebtn {
    position: absolute;
    top: 20px;
    right: 45px;
    font-size: 60px;
    cursor: pointer;
    color: white;
}

.overlay .closebtn:hover {
    color: #ccc;
}

.overlay input[type=text] {
    padding: 15px;
    font-size: 17px;
    border: none;
    float: left;
    width: 80%;
    background: white;
}

.overlay input[type=text]:hover {
    background: #f1f1f1;
}

.overlay button {
    float: left;
    width: 20%;
    padding: 15px;
    background: #ddd;
    font-size: 17px;
    border: none;
    cursor: pointer;
}

.overlay button:hover {
    background: #bbb;
}
div#img_slider{
width:100%;
height:500px;
position:fixed;
background-image:url('${path}/resources/image/backgroundNew.jpg');
background-size:cover;
z-index:-1;
top:80px;
}
#navbar_set{
position:fixed;
top:100px;
width:100%;
transition:0.5s;
height:80px;
background: #ffffff; background: rgba(255, 255, 255, 0);
border:none;
margin-left:0.2%;
margin-bottom:0px;
}

@media screen and (max-width: 765px) {
#navbar_set{
background-color:white;
}
#info_span{
right:60px;
}
#nav_move{
margin-left:0% !important;
}
#nav_span{
background-color:white;
}
}
/* 댓글 범위를 나타내는 css*/
.top{
  width:700px;
}
</style>

</head>
<body id='info5'>
<header class='transparent-header dark'>
<nav id='navbar_set' class="navbar navbar-default row navbar-expand-lg" style="top:0px;">
<input type="hidden" id="color_select">
<div class="col-sm-3">
<span id='logo_span'>
      <a href="#" onclick="fnMove('5')" style="opacity:1 !important;">CampusPick</a>
</span>
</div>
  <div id="nav_move" class="container-fluid col-sm-9" style="margin-top:10px;margin-left:30%;">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-left" id="nav_span" >
      	<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
         <li><a href="#" onclick="fnMove('1')">CampusPick</a></li>
        <li><a href="${path}/secondPage.do">동아리</a></li>
        <li><a href="#">동아리 개설</a></li>
        <li><a href="${path}/calendar.do">With us</a></li> 
        <li><a href="${path }/board/boardList.do">자유게시판</a></li>
      </ul>
    </div>
  </div>

</nav>
		<div class="dropdown" id="info_span">
		<a style="font-weight:600; color:white;font-size:15px;cursor:pointer;"><c:out value="${memberLoggedIn.member_id}"/>님</a>
			
			<div class="dropdown-content">
			         
        <a href="${path }/clubMain.do?member_id=${memberLoggedIn.member_id}">나의 동아리</a>
				<a href="#">마이페이지</a>
				<a href="#">쪽지함</a> 
				<a href="${path}/member/memberUpdate.do">내 정보 수정</a>
				<a class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" type="button" onclick="location.href='${path }/member/memberLogout.do'" style='cursor:pointer;'>로그아웃</a>

				
			</div>
		</div>
</header>

<!-- Page Container -->
<div class="w3-theme-l4">
<div class="w3-container w3-content w3-theme-l4" style="max-width:1600px;margin-top:80px;">
  <!-- The Grid -->
  <div class="w3-row">
    <!-- Left Column -->
    <div class="w3-col m3">
      <!-- Profile -->
      <div class="w3-card w3-round w3-white" style="margin-top:16px;">
        <div class="w3-container">
         <h4 class="w3-center"><c:out value="${club.circle_name }"/></h4>
         <p class="w3-center"><img src="./title.jpg" class="w3-circle" style="height:106px;width:106px" alt="동아리 로고"></p>
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
          <button onclick="myFunction('Demo2')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i> 동아리 소식</button>
          <div id="Demo2" class="w3-hide w3-container">
            <p>Some other text..</p>
          </div>
          <button onclick="circle_budget()" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-address-book-o fa-fw w3-margin-right"></i> 동아리 회원목록</button>
          <div id="Demo1" class="w3-hide w3-container">
            <p>Some text..</p>
          </div>
          <button onclick="myFunction('Demo3')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-won fa-fw w3-margin-right"></i> 동아리 예산</button>
          <div id="Demo3" class="w3-hide w3-container">
            <p>Some other text..</p>
          </div>
          <button onclick="myFunction('Demo4')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-users fa-fw w3-margin-right"></i> 동아리 사진첩</button>
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
          <c:forEach items="club.category" var='cal' varStatus="status">
            <span class="w3-tag w3-small w3-theme-d5">cal</span>
	   	</c:forEach>
          </p>
        </div>
      </div>
      <br>

    <!-- End Left Column -->
    </div>
   