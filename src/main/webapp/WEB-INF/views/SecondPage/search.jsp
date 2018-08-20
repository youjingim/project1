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
	<jsp:param value="동아리" name="pageTitle" />
</jsp:include>
<style>
section {
	width: 100%;
	height: 800px;
	position: relative;
	top: 300px;
	background-color: white;
	z-index: 10;
}

section div#main_container {
	width: 100%;
	height: 1200px;
	position: relative;
	z-index: 10;
	background-color: white;
}

section div#main_container div#rank_container {
	width: 80%;
	height: 400px;
	position: relative;
	left: 10%;
	top: 90px;
}

#rank_1 {
	width: 80%;
	height: 400px;
	margin-left: 10%;
	background-color: white;
}

#rank_2 {
	width: 80%;
	height: 400px;
	margin-left: 10%;
	background-color: white;
}

#rank_3 {
	width: 80%;
	height: 400px;
	background-color: white;
	margin-left: 10%;
}

.dong1 {
	margin-top: 3%;
	margin-left: 5%;
}

.dong2 {
	margin-top: 3%;
	margin-left: 7%;
}

.dong3 {
	margin-top: 3%;
	margin-left: 9%;
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
	left: 380px;
}

/* Style the active/current link */
.pagination a.active {
	background-color: dodgerblue;
	color: white;
}

/* Add a grey background color on mouse-over */
.btn-link hover {
	transform: scale(1.2);
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

.green_window {
	display: inline-block;
	width: 366px; height: 40px;
	border: 3px solid #2db400;
	background: white;
}

.input_text {
	width: 348px; height: 21px;
	margin: 6px 0 0 9px;
	border: 0;
	line-height: 21px;
	font-weight: bold;
	font-size: 16px;
	outline: none;
}
#sch_smit {
	width: 130px; height: 40px;
	margin: 0; border: 0;
	vertical-align: top;
	background: #2db400;
	color: white;
	font-weight: bold;
	border-radius: 1px;
	cursor: pointer;
}

#sch_smit:hover {
	background: #5882FA;
}
.panel-heading{
	border-top-left-radius : 20px;
	border-top-right-radius : 20px;
}

.panel-footer{
	border-bottom-left-radius : 20px;
	border-bottom-right-radius : 20px;
}

.panel{
	border-top-left-radius : 20px;
	border-top-right-radius : 20px;
	border-bottom-left-radius : 20px;
	border-bottom-right-radius : 20px;
}

.siblings * { 
    display: block;
    border: 2px solid lightgrey;
    color: lightgrey;
    padding: 5px;
    margin: 15px;
}
</style>
</head>
<body>

	<section>
		<div id='main_container'>
			<br><br><br> 
			<span style='font-weight: bold; margin-top: 100px; margin-left: 5%; font-size: 30px; text-align: center;'>동아리랭킹(좋아요 순)</span> 
			<br><br><br><br><br>
			<div class='container'>
				<c:set var="num" value="1"/>
				<c:forEach var="circle" items="${list }" varStatus="status" begin="0" end="3">
					<div class='mySlides'>
						<a href="${pageContext.request.contextPath}/search/circleView.do?no=${circle.circle_num }">
						<img src="/project/resources/image/${circle.circle_photo }" style="width: 80%; height: 400px; margin-left: 120px" class='image' alt="${circle.circle_comment }"> 
						</a>
						
						<div class="text-block">
							<c:set var="count" value="${count + 1}" />
							<h2 style="text-align: center; color:#100BA3" id='rank'>${count}등</h2>
							<h3 style="text-align: center;font-weight: bold;color:#190710"> ${circle.circle_name} </h3>
							<p style="text-align: center;font-weight: bold;color:#190710"> ${circle.circle_comment} </p>
						</div>	
					</div>
				</c:forEach>
			
					<a class="prev" onclick="plusSlides(-1)">
					<input type="hidden" class="prev" id='prev' value="-1">
					<span class="glyphicon glyphicon-chevron-left" style="color: orange"></span>
					</a>
					
					<a class="next" onclick="plusSlides(1)"> 
					<input type="hidden" class="next" id='next' value="1">
					<span class="glyphicon glyphicon-chevron-right" style="color: orange"></span>
					</a>


					<div class="caption-container">
						<p id="caption"></p>
					</div>
					
					<div class='row' id='slider'>
					<c:forEach var="circle" items="${list }" varStatus="status" begin="0" end="3">
						<div class='column'>
							<img class='demo cursor' src="/project/resources/image/${circle.circle_photo }" style="width: 100%; height: 200px; cursor: pointer;" onclick='currentSlide(${status.count})'>
						</div>
					</c:forEach>
					</div>
			</div>
	<script>
      	var slideIndex = 1;
      	showSlides();
      
      	function plusSlides(n) {
    	  showSlides(slideIndex += n);
    	}

    	function currentSlide(n) {
    	var imgText = document.getElementById("imgtext");
    	showSlides(slideIndex = n);
    	  imgText.innerHTML = imgs.alt;
    	}
    	
    	function showSlides(n) {
    		  var i;
    		  var slides = document.getElementsByClassName("mySlides");
    		  var dots = document.getElementsByClassName("demo");
    		  var captionText = document.getElementById("caption");
    		  
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
    </script>
		</div>
		<div class="jumbotron">
			<h2 style="text-align: center; color: black; font-family: 'Do Hyeon', sans-serif;">당신이 찾는 동아리가 이곳에 있습니다.ㅅㅅ</h2>
			<div class="row">
				<div class="col-xs-9 col-xs-offset-2">
					<h2>조건별 검색</h2>
					<div class="col-sm-9 col-xs-offset-2">
						<h4 style="color: black">대학선택으로 검색</h4>
						<div class="input-group-btn search-panel">
							<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
								<span id="search_concept">선택</span> <span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath}/search.do?university=서울대학교">서울대학교</a></li>
								<li><a href="${pageContext.request.contextPath}/search.do?university=연세대학교">연세대학교</a></li>
								<li><a href="${pageContext.request.contextPath}/search.do?university=고려대학교">고려대학교</a></li>
								<li><a href="${pageContext.request.contextPath}/search.do?university=성균관대학교">성균관대학교</a></li>
								<li><a href="${pageContext.request.contextPath}/search.do?university=홍익대학교">홍익대학교</a></li>
								<li class="divider"></li>
								<li><p id="inputing"
										style="color: black; font-size: 14px; cursor: pointer;"
										onclick="university();">&nbsp;&nbsp;&nbsp;직접입력</p></li>
							</ul>
						</div>
						<!-- 조건처리해서 안보이게끔 -->
						<form action="${pageContext.request.contextPath }/search.do">
							<div class="input-group" id='uni' style="display: none;">
								<span class='green_window'>
									<input type='text' class='input_text' name="Unsearch">
								</span>
								<button type='submit' id='sch_smit' class='btn btn-info btn-lg'>
									<span class="glyphicon glyphicon-search"></span> Search 
								</button>
							</div>
						</form>
					<script>
						function university(){
							$('#uni').show();
						}
					</script>
					</div>
					<form action="${pageContext.request.contextPath }/search.do">
						<div class="col-sm-9 col-xs-offset-2">
							<h4 style="color: black">동아리명으로 검색</h4>
							<div class="input-group">
								<span class='green_window'>
									<input type='text' class='input_text' name="circle_name">
								</span>
								<button type='submit' id='sch_smit' class='btn btn-info btn-lg'>
									<span class="glyphicon glyphicon-search"></span> Search 
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<span style='font-weight: bold; margin-top: 100px; margin-left: 5%; font-size: 30px; color: lightgray'>동아리홍보</span>
		<div class="container" id="con1">
			<div class="row">
					<c:forEach var='circle' items='${list2}' varStatus="vs">
					<c:if test="${not empty list2}">
						<div class="col-sm-4">
							<div class="panel panel-primary">
								<div class="panel-heading">${circle.circle_name}</div>
								<div class="panel-body">
									<a href='${pageContext.request.contextPath }/search/circleView.do?no=${circle.circle_num }'>
										<img src="/project/resources/image/${circle.circle_photo }" class="img-responsive" style="width: 100%; height: 17.4%" alt="Image">
									</a>
								</div>
								<div class="panel-footer" >
									<button class='btn btn-link' type='button' value='상세보기' style="cursor: pointer" onclick="search()">상세보기</button>
									
									<span class='likeImg' style="cursor: pointer">
									<img src='/project/resources/image/like.png' class='likImg' style="width: 50px; height: 45px; position: relative; right: 45px">
									<input type='hidden' id="circle_num" value="${circle.circle_num }">
									</span>
									
									<span style="position:relative;right:10px;width:33px;height:33px;bottom:15px;display:inline-block" class='speech'>
									<img src='/project/resources/image/speech33.ico' >
									<p class="img_center">${circle.circle_like }</p>
									</span>
								<style>
									.img_center{
										position:absolute;
										top: 50%;
										left: 50%;
									    transform: translate(-50%, -50%);
									    font-size: 18px;
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
							function search(){
								location.href="${pageContext.request.contextPath}/search/circleView.do?no=${circle.circle_num}";
							}
				
							$('.likeImg').on('click',function(){
								/* var frm_read=$('#frm_read');
								var circle_num = $('#circle_num',frm_read).val(); */
								var inputImg=$(this).children('.likImg');
								var dataSpan=$(this);
								$.ajax({
									url:"${path}/search/like.do",
									type:'post',
									data: {'circle_num':$(this).children("input").val(),'member_id':"${memberLoggedIn.member_id}"},
									dataType:'json',
									success:function(data){
										var update="${update}";
										var data2="&nbsp;&nbsp;"+data;
										dataSpan.siblings('.speech').css({"background-image":"url(/project/resources/image/speech33.ico)","position": "relative", "top": "50%","font-size" : "18px","color" : "black"});
										dataSpan.next().html(data2);
										var path='/project/resources/image/';
										/*if(data>data3){
											alert("좋아요 추가");
											$(this:after("input").val()).attr("value",data);
											src = (inputImg.attr('src')===path+'like.png')?path+'like3.png':path+'like.png';
											inputImg.attr('src',src);
										}
										 else{	
											alert("좋아요 취소");
											src =(inputImg.attr('src')===path+'like3.png')?path+'like.png':path+'like3.png';
											inputImg.attr('src',src); 
										} */
									},
									error:function(error){
										alert("에러가 발생하였습니다. 관리자에게 문의하세요");
									}
								});
							})
						</script>
				
			<div class="pagination" id="page" style="position: relative;left:100px">
				${pageBar}
			</div>
		</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	</section>