<%@page import="com.yj.project.search.model.vo.Circle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.yj.project.search.model.vo.Circle"%>

<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
<c:set var='path' value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="search" name="pageTitle" />
</jsp:include>
<style>
section {
   width: 100%;
   height: 500px;
   position: relative;
   top: 580px;
   background-color: white;
   z-index: 10;
}
div#img_slider{
	position:absolute;

}

section div#main_container {
	width: 100%;
	height: 700px;
	position: relative;
	bottom:120px;
	z-index: 10;
	background-color: white;
}

section div#main_container div#rank_container {
	width: 100%;
	height: 400px;
	position: relative;
	left: 10%;
}
.container{
	height:700px;
}

.column {
	float: left;
	width: 25%;
	align-content: center;
}

.pagination a {
	color: black;
	float: center;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	position: relative;
	margin : 0 auto;
	align:center;

}

/* Style the active/current link */
.pagination a.active {
	background-color: dodgerblue;
	color: white;
}

/* Add a grey background color on mouse-over */
.btn-link hover {
	transform: scale(1.5);
}

.likeImg {
	display: inline-block;
	width: 20px;
	height: 20px;
	margin-left: 180px;
}

.likeImg img {
	width: 20px;
	height: 30px;
}

.likeImg img:hover {
	transform: scale(1.2);
	transition: transform .10s;
}

.blue_window {
	display: inline-block;
	width: 620px; height: 60px;
	border: 0px solid rgb(00,32,96);
	background: white;
}

.input_text {
	width: 580px; height: 40px;
	margin-top:10px;  
	border: 0;
	line-height: 21px;
	font-weight: bold;
	font-size: 20px;
	outline: none;
	position:relative;
	top:3px;
	left:25px;
	color:rgb(0,0,0);
}

input::placeholder{
	color:black;
	font-weight: bold;
}

#sch_smit {
	width: 130px; height: 60px;
	margin: 0; border: 0;
	position:relative;
	right:6px;
	vertical-align: top;
	background: #6CC0FF;
	color: white;
	font-weight: bold;
	border-top-right-radius: 10px;
	border-bottom-right-radius: 10px;
	cursor: pointer;
	outline:none;
	
}

#sch_smit:hover {
	background: #4375DB;
}
.panel-heading{
	border : 1px solid lightgray;
}

.panel-footer{
	border : 1px solid lightgray;
}

.panel{
	border : 1px solid lightgray;
}

.siblings * { 
    display: block;
    border: 2px solid lightgrey;
    color: lightgrey;
    padding: 5px;
    margin: 15px;
}
.nav-pills li{
	background-color: white;
	color:#6CC0FF;
}

.nav-pills li a{
	background-color: white;
	color:gray;
	border: 1px solid lightgray;
}

.nav-pills li:active{
	background-color:white;
	color:#6CC0FF;
}

/* style="background-color:white;color:#6CC0FF" */

.nav-pills li a:active{
	background-color:#6CC0FF;
	color:white;
	border-top-left-radius : 5px;
	border-top-right-radius : 5px;
	border-bottom-left-radius : 5px;
	border-bottom-right-radius : 5px;
	
}

#search1{
	width:550px;
	height:200px;
	position:relative;
	left:200px;
}


.image{
	border-top-left-radius : 20px;
	border-top-right-radius : 20px;
	border-bottom-left-radius : 20px;
	border-bottom-right-radius : 20px;
}
.dem1{
	border-top-left-radius : 20px;
	border-top-right-radius : 20px;
	border-bottom-left-radius : 20px;
	border-bottom-right-radius : 20px;
}


.dem2{
	border-top-left-radius : 20px;
	border-top-right-radius : 20px;
	border-bottom-left-radius : 20px;
	border-bottom-right-radius : 20px;
}

.jumbotron{
	position:relative;
	z-index=-1;
	margin-bottom:0;
	height:1000px;
}
.row{
	z-index=1000;
}
#sang{
	outline:none;
	position:relative;
	top:40px;
	right:90px;
}

.glosbe{
	font-weight:bold;
}

a:hover{color:red; text-decoration:none;}

.prev{
	font-size: 50px;
	position:relative;
	bottom:320px;
}

.next{
	font-size: 50px;
	position:relative;
	bottom:320px;
	left:950px;
	
}

#searchType{
	width:150px;
	height:60px;
	position:relative;
	bottom:1.5px;
	left:6px;
	outline:none;
	color:black;
	border: 0px solid rgb(00,32,96);
	border-top-left-radius:15px;
	border-bottom-left-radius:15px;
}

searchType option{
	font-size:15px;
	text-align:center;
	
}

.nav-pills > li.active > a, .nav-pills > li.active > a:hover, .nav-pills > li.active > a:focus{
	color: #6CC0FF;
    background-color: WHITE;
}

.btn-lg, .btn-group-lg > .btn {
    padding: 10px 16px;
    font-size: 18px;
    line-height: 1.3333333;
    border-radius: 0;
}
</style>
</head>
<body>
	

	<section>
		<p style="font-size:55px;color:white;position:relative;bottom:295px;left:32%;font-weight:bold;">관심있는 동아리를 검색하세요</p>
		<div class="row" style="position:relative;bottom:280px;right:10px;">
				<div class="col-xs-9 col-xs-offset-2">
					<form class="example" action="${path }/ListFinder.do">
				     	<div id="search-container" style="position:relative;left:15.2%;">
				        <select id="searchType">
				        	<option disabled="disabled" selected="selected">선택</option>
				            <option value="university" id="uni">대학</option>	
				            <option value="circleName" id="name">동아리명</option>
				        </select>
				        <div id="search_university">
				            <form action="${path }/ListFinder.do">
				                <input type="hidden" name="searchType" value="university"/>
				               	<span class='blue_window'>
									<input type='text' class='input_text' name='Unsearch'  placeholder="학교명 입력">
								</span>
								<button type='submit' id='sch_smit' class='btn btn-info btn-lg'>
									<span class="glyphicon glyphicon-search"></span>
								</button>			
				            </form>	
				        </div>
				        <div id="search_circleName">
				            <form action="${path }/ListFinder.do">
				                <input type="hidden" name="searchType" value="circleName"/>
				                <span class='blue_window'>
									<input type='text' class='input_text' name='circle_name' placeholder="동아리명 입력">
								</span>
								<button type='submit' id='sch_smit' class='btn btn-info btn-lg'>
									<span class="glyphicon glyphicon-search"></span>
								</button>			
				            </form>	
				        </div> 
				        <script>        
						window.onload = function() {
						var stitle = document.querySelector("#search_university");
						var sname = document.querySelector("#search_circleName");
						var searchType = document.querySelector("#searchType");
						stitle.style.display = "inline-block";
						sname.style.display = "none";
						searchType.addEventListener("change",function() {
											stitle.style.display = "none";
											sname.style.display = "none";
											(document.querySelector("#search_" + this.value)).style.display = 'inline-block';
										});
						} 
						</script>
						</div>
				        </form>
				</div>
			</div>
		<div id='main_container'>
			<span style='font-weight: bold; margin-left: 5%; font-size: 30px; text-align: center;color:black;'>동아리 랭킹</span> 
			<br><br><br><br><br>
			<div class='container'>
			  <ul class="nav nav-pills" style="float:right">
			    <li class="active"><a href="#like" aria-controls="home" data-toggle="pill" onclick="mains1()" class='glosbe'>좋아요 순</a></li>
			    <li><a href="#desc" aria-controls="messages" data-toggle="pill"  onclick="mains2()" class='glosbe'>최신순</a></li>
			  </ul>
			  <br><br><br>
			  
			  <script>
			  function mains1(){
				  $('#desc').tab('hidden');
				  $('#like').tab('show');
			  };
				function mains2(){
					$('#like').tab('hidden');
					$('#desc').tab('show');
			  };
			  
			  </script>
			  
			  
			  
			  <!-- 좋아요 순 리스트 -->
			  <div class="tab-content">
			    <div id="like" class="tab-pane fade in active" style="background-color:white;">
			    <c:set var="num" value="1"/>
				<c:forEach var="circle" items="${list}" varStatus="status" begin="0" end="3">
					<div class='mySlides myS1'>
						
						<a href="${pageContext.request.contextPath }/search/circleView.do?no=${circle.circle_num }&id=${memberLoggedIn.member_id}"> 
						<img src="resources/upload/club/<c:if test='${c.circle_photo != null}'>${c.circle_photo }</c:if><c:if test='${c.circle_photo == null}'>noimage.png</c:if>" style="width: 80%; height: 400px; margin-left: 120px" class='image'>
						</a>
						<div class="text-block">
							<c:set var="count" value="${count + 1}" />
							<h2 style="text-align: center; color:#6CC0FF" id='rank'>${count}등</h2>
							<h3 style="text-align: center;font-weight: bold;color:#190710"> ${circle.circle_name} </h3>
							<p style="text-align: center;font-weight: bold;color:#190710"> ${circle.circle_comment} </p>
 						</div>
					</div>
				</c:forEach>
				<a class="prev" onclick="plusSlides(-1)" >
					<input type="hidden" class="prev" id='prev' value="-1">
					<span class="glyphicon glyphicon-chevron-left" style="color: orange"></span>
					</a>
					
					<a class="next" onclick="plusSlides(1)"> 
					<input type="hidden" class="next" id='next' value="1">
					<span class="glyphicon glyphicon-chevron-right" style="color: orange"></span>
					</a>

					<div class="caption-container">
						<p id="caption1"></p>
					</div>
					
					<div class='row' id='slider' style="display:none">
					<c:forEach var="circle" items="${list}" varStatus="status" begin="0" end="3">
						<div class='column'>
							<img class='demo cursor dem1' src="/project/resources/upload/club/${circle.circle_photo }" style="width: 100%; height: 200px; cursor: pointer;" onclick='currentSlide(${status.count})'>
						</div>
					</c:forEach>
					</div>
			    </div>
			    
			    <!-- 생성일 순 리스트 -->
			    <div id="desc" class="tab-pane fade" style="background-color:white;">
			    <c:set var="num1" value="1"/>
				<c:forEach var="circle" items="${circleenroll}" varStatus="status" begin="0" end="3">
					<div class='mySlides myS2'>
						<a href="${pageContext.request.contextPath }/search/circleView.do?no=${circle.circle_num }&id=${memberLoggedIn.member_id}">
						<img src="resources/upload/club/<c:if test='${c.circle_photo != null}'>${c.circle_photo }</c:if><c:if test='${c.circle_photo == null}'>noimage.png</c:if>" style="width: 80%; height: 400px; margin-left: 120px" class='image'>

						
						</a>
						<div class="text-block">
							<c:set var="count2" value="${count2 + 1}" />
							<h3 style="text-align: center;font-weight: bold;color:#190710"> ${circle.circle_name} </h3>
							<p style="text-align: center;font-weight: bold;color:#190710"> ${circle.circle_comment} </p>
 						</div>
					</div>
				</c:forEach>
				<a class="prev" onclick="plusSlides1(-1)">
					<input type="hidden" class="prev" id='prev' value="-1">
					<span class="glyphicon glyphicon-chevron-left" style="color: orange"></span>
					</a>
					
					<a class="next" onclick="plusSlides1(1)"> 
					<input type="hidden" class="next" id='next' value="1">
					<span class="glyphicon glyphicon-chevron-right" style="color: orange"></span>
					</a>


					<div class="caption-container">
						<p id="caption2"></p>
					</div>
					
					<div class='row' style="display:none">
					<c:forEach var="circle" items="${circleenroll }" varStatus="status1" begin="0" end="3">
						<div class='column' id='slider2'>
							<img class='demo cursor dem2' src="/project/resources/upload/club/${circle.circle_photo}" style="width: 100%; height: 200px; cursor: pointer;" onclick='currentSlide1(${status1.count})'>
						</div>
					</c:forEach>
					</div>
			    </div>
			  </div>
			</div>
	<script>
      	var slideIndex = 1;
      	showSlides();
      	showSlides1();
      	
      	function plusSlides(n) {
    		showSlides(slideIndex += n);
    	}
      	
      	function plusSlides1(n) {
      	  showSlides1(slideIndex += n);
      	}


    	function currentSlide(n) {
    		var imgText = document.getElementById("imgtext");
    		showSlides(slideIndex = n);
    	    imgText.innerHTML = imgs.alt;
    	}
    	
    	function currentSlide1(n) {
    		var imgText = document.getElementById("imgtext");
    		showSlides1(slideIndex = n);
    	    imgText.innerHTML = imgs.alt;
    	}
    	
    	function showSlides(n) {
    		  var i;
    		  var slides = document.getElementsByClassName("myS1");
    		  var dots = document.getElementsByClassName("dem1");
    		  var captionText = document.getElementById("caption1");
    		  
    		  if (n > slides.length) {slideIndex = 1}
    		  if (n < 1) {slideIndex = slides.length}
    		  for (i = 0; i < slides.length; i++) {
    		      slides[i].style.display = "none";
    		  }
    		  for (i = 0; i < dots.length; i++) {
    		      dots[i].className = dots[i].className.replace(" active", "");
    		  }
    		  
    		  slides[slideIndex-1].style.display = "block";
    		  dots[slideIndex-1].className += " active";
    		  
    		  captionText.innerHTML = dots[slideIndex-1].alt;
    		  
    		}
    	
    	function showSlides1(n) {
  		  var i;
  		  var slides = document.getElementsByClassName("myS2");
  		  var dots = document.getElementsByClassName("dem2");
  		  var captionText = document.getElementById("caption2");
  		  
  		  if (n > slides.length) {slideIndex = 1}
  		  if (n < 1) {slideIndex = slides.length}
  		  for (i = 0; i < slides.length; i++) {
  		      slides[i].style.display = "none";
  		  }
  		  for (i = 0; i < dots.length; i++) {
  		      dots[i].className = dots[i].className.replace("active", "");
  		  }
  		  
  		  slides[slideIndex-1].style.display = "block";
  		  dots[slideIndex-1].className += " active";
  		  
  		  captionText.innerHTML = dots[slideIndex-1].alt;
  		  
  		}
    </script>
		</div>
			<div class="jumbotron" style="background-color:#F6F6F6">
				<span id="promotion" style='font-weight: bold; font-size: 30px; color: black;position:relative;left:100px'>동아리 목록</span>
		<br><br><br><br><br>	
		<div class="container" id="con1" style="position:relative;left:1.5%;" >
			<div class="row">
					<c:forEach var='circle' items='${list2}' varStatus="vs">
					<c:if test="${not empty list2}">
						<div class="col-sm-4">
							<div class="panel panel-default" style="width:80%">
								
								<div class="panel-body" style="padding:0;margin-right:0;">
									<a href='${pageContext.request.contextPath }/search/circleView.do?no=${circle.circle_num }&id=${memberLoggedIn.member_id}'>
										<img src="resources/upload/club/<c:if test='${c.circle_photo != null}'>${c.circle_photo }</c:if><c:if test='${c.circle_photo == null}'>noimage.png</c:if>" style="width: 100%; height: 180px" class='image'>
										
									</a>
								</div>
								<br>
								<div class="panel-heading" style="text-align: center;background-color:white;height:120px;color:black;font-weight:bold;font-size:18px;border:0">
									${circle.circle_name}
									<br>
										<button id='sang' class='btn btn-link' type='button' value='${circle.circle_num }' style="cursor: pointer;color:#6CC0FF" onclick="search('${circle.circle_num }','${memberLoggedIn.member_id}')">상세보기</button>
										<input type='hidden' id="circle_num" value="${circle.circle_num }">

									<span class='likeImg' style="cursor: pointer;position:relative;left:10px;bottom:1px;">
									<img src='/project/resources/image/like6.png' class='likImg' style="width: 110px; height: 55px; position: relative;right:30px;bottom:5px;"> 
									<input type='hidden' id="circle_num" value="${circle.circle_num }">
									</span>
									
									<span style="font-size:5px;position:relative;width:33px;height:33px;top:10px;left:7%;display:inline-block;" class='speech'>
										<!-- <img src='/project/resources/image/speech33.ico' > -->
										<p class="img_center" style="font-size:15px;">${circle.circle_like }</p>
									</span>
								<style>
									.img_center{
										position:absolute;
										top: 50%;
										left: 50%;
									    transform: translate(-50%, -50%);
									    font-size: 15px;
									    color:black;
									}
								</style>	
								</div>
							</div>
						</div>
						</c:if>
					</c:forEach>
			</div>
			<script>
							function search(num,id){
								location.href="${pageContext.request.contextPath}/search/circleView.do?no="+num+"&id="+id;
							}
				
							$('.likeImg').on('click',function(){
								var inputImg=$(this).children('.likImg');
								var dataSpan=$(this);
								$.ajax({
									url:"${path}/search/like.do",
									type:'post',
									data: {'circle_num':$(this).children("input").val(),'member_id':"${memberLoggedIn.member_id}"},
									dataType:'json',
									success:function(data){
										var update="${update}";
										var data2="&nbsp;"+data;
										/* dataSpan.siblings('.speech').css({"background-image":"url(/project/resources/image/speech33.ico)","position": "relative","font-size" : "18px","font-weight" : "300"}); */
										dataSpan.next().html('<p class="img_center" style="font-size:15px;">'+data2+'</p>');
										var path='/project/resources/image/';
									},
									error:function(error){
										alert("다시 시도 하거나 재 로그인이 필요합니다.");
									}
								});
							})
						</script>
				
			<div class="pagination" id="page" style="position: relative;">
				${pageBar}
			</div>
						
			<script>
			var flag=${flag};
			if(flag!=0){
				$(function(){
					$('html, body').animate({
						scrollTop: $('.jumbotron').offset().top
						}, 'slow');
					});	
			}
			</script>
		</div>
		</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</section>