<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
    <%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
    <%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
    <c:set var='path' value="${pageContext.request.contextPath}"/>
       <jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="index" name="pageState"/>
   </jsp:include>
<style>

section{
width:100%;
height:1800px;
z-index:10;
position:relative;

}

#img_slide{
width:100%;
height:700px;
position:fixed;
z-index:-1;
}
#info_container{
width:100%;
height:200px;
}

#info1{
width:100%;
position:relative;
height:180px;
background-color:white;
z-index:10;
top:850px;
}

#info2{
position:relative;
width:100%;
height:140px;
background-color:white;
z-index:10;
top:850px;
}

#info3{
position:relative;
width:100%;
height:140px;
background-color:white;
z-index:10;
top:850px;
}
#info4{
position:relative;
width:100%;
height:150px;
background-color:white;
z-index:10;
top:850px;
}



#information1{
width:100%;
height:750px;
background-color:white;
position:relative;
z-index:10;
top:850px;

}

#information2{
width:100%;
height:750px;
background-color:#FFB4FF;
position:relative;
z-index:10;
top:850px;

}
#information3{
width:100%;
height:750px;
background-color:#000F75;
position:relative;
z-index:10;
top:850px;
}

#page1{
width:80%;
height:550px;
position:absolute;
top:80px;
right:10%;
background-color:white;

}
#page2{
width:83%;
height:550px;
position:absolute;
top:80px;
right:0%;
background-color:white;
}
#page3{
width:83%;
height:550px;
position:absolute;
top:80px;
right:0%;
background-color:white;
}

#row_line1{
width:0%;
height:750px;
position:absolute;
z-index:10;
left:0%;
background-image:url('http://cfile210.uf.daum.net/image/240DD948558D86BE347AEB');
background-size:cover;
transition:0.5s;
}
#row_line2{
width:0%;
height:750px;
position:absolute;
z-index:10;
background-image:url('http://cfile225.uf.daum.net/image/272D8C4B52E346AD15A225');
background-size:cover;
left:0%;
background-color:black;
transition:0.5s;
}
#row_line3{
width:0%;
height:750px;
position:absolute;
z-index:10;
left:0%;
background-image:url('http://sinhwayh.com/wp/wp-content/uploads/2017/02/ex5-1024x683.jpg');
background-size:cover;
transition:0.5s;
}


.table_container{
width:80%;
height:500px;
position:absolute;
top:80px;
left:10%;
}
.commant{
width:30%;
height:100px;
position:absolute;
bottom:0%;
right:0%;
}
@media screen and (max-width: 1000px) {
.commant span{
display:none !important;
}
}

@media screen and (max-width: 1430px) {
#information1 img{
display:none;
}
.big_logo{
display:none;

}
.footer_logo{
display:none;

}

}

.big_logo{
font-family: 'Poiret One', cursive;
font-size:80px;
font-weight:bold;

color:black;
position:absolute;
right:0%;
top:400px;

}
#information1 span{

}
#information1 img{
width:40%;
height:60%;
position:absolute;
z-index:100;
right:0%;
}

</style>

<section>
<div id='img_slide'>
<div class="slideshow-container">

<div class="mySlides fade">
  <img src="${path }/resources/image/background1.jpg" style="width:100%; height:900px;">
  <div>봉주 바부</div>
</div>

<div class="mySlides fade">
  <img src="${path }/resources/image/background2.jpg" style="width:100%; height:900px;">
  <div class="text">Caption Two</div>
</div>

 <div class="mySlides fade">
  <img src="${path }/resources/image/image1.jpg" style="width:100%; height:900px;">
  <div class="text">Caption Three</div>
</div> 


</div>
<br>


</div>

<script>
var slideIndex = 0;
showSlides();

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}
function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}
    slides[slideIndex-1].style.display = "block";
   
    
    if(slideIndex==3 && $('#color_select').val()=='white'){
        $('#myNavbar').children("ul").children("li").children("a").css("color","white");
        $("#logo_span").children("a").css("color","white");
    }else{
       $('#myNavbar').children("ul").children("li").children("a").css("color","black");
      $("#logo_span").children("a").css("color","black");
    }
     
    
    setTimeout(showSlides, 2500); // Change image every 2 seconds
}

$(window).scroll(function() {
     var row1 = $('#row_line1');
     var row2 = $('#row_line2');
     var row3 = $('#row_line3');
     var row4 = $('#row_line4');


     if($(this).scrollTop() >= 400){ row1.css('width','20%');}
     else {row1.css('width','0%');};
     
     if($(this).scrollTop() >= 1200){ row2.css('width','20%');}
     else {row2.css('width','0%');};
     
     if($(this).scrollTop() >= 2200){ row3.css('width','20%');}
     else {row3.css('width','0%');};
     
     if($(this).scrollTop() >= 3200){ row4.css('width','20%');}
     else {row4.css('width','0%');};
   });

</script>

<div id='info1'>
<br><br><br><br><br>
<span style="font-weight:bold;margin-left:15%;color:black;font-size:30px;">서비스 소개</span>
</div>
<div id='information1'>
<img src="https://t1.daumcdn.net/cfile/tistory/0369B73F519F001137" style="margin-right:5%;">
<div id='page1'>
<br><br>
<span style="color:black;margin-left:6%;margin-top:50px;font-size:18px;font-family:  'Nanum Gothic Coding', monospace;">전국의 동아리 들을 모아놓은 곳, </span><span style="color:#51ABF3;margin-top:50px;font-size:22px;font-weight:bold; font-family:'Poiret One', cursive;">CampusPick</span><br>
<span style="color:black;margin-top:25%;font-size:18px;margin-left:6%;font-family:  'Nanum Gothic Coding', monospace;">Campuspick은 전국의 동아리들이 더 쉽고 편리하게 이용할 수 있는</span><br><span style="color:black;margin-top:25%;font-size:18px;margin-left:6%;font-family:   'Nanum Gothic Coding', monospace;"> 커뮤니티 사이트 입니다.</span><br><br><br><span style="color:black;margin-top:25%;font-size:18px;margin-left:6%;font-family:  'Nanum Gothic Coding', monospace;">자학교 동아리만이 아닌 전국의 동아리들과 함께 활동할 수 있는 활동 </span><br><span style="color:black;margin-top:25%;font-size:18px;margin-left:6%;font-family:  'Nanum Gothic Coding', monospace;">매칭 기능부터, 동아리 홍보 또는 등록도 쉽게 할 수 있으며, 동아리들</span><br><span style="color:black;margin-top:25%;font-size:18px;margin-left:6%;font-family:  'Nanum Gothic Coding', monospace;">간의 정보를 공유할 수 있는 소통의 공간까지 다양하게 제공합니다.</span><br><span style="color:black;margin-top:25%;font-size:18px;margin-left:6%;font-family:  'Nanum Gothic Coding', monospace;">누구나 쉽게 공통의 관심사를 공유하고 모임으로 하나되는 즐거움을 </span><br><span style="color:black;margin-top:25%;font-size:18px;margin-left:6%;font-family:  'Nanum Gothic Coding', monospace;">경험할 수 있도록 </span><span style="color:#51ABF3;margin-top:25%;font-size:22px;font-weight:bold; font-family:'Poiret One', cursive;">CampusPick</span><span style="color:black;margin-top:25%;font-size:18px;font-family:  'Nanum Gothic Coding', monospace;">은 언제나 최선을 다하고 있습니다.</span>

<!-- <div class="big_logo" style="margin-right:2%;">CampusPick</div> -->

</div>
</div>
<div id='info4'>
</div>

</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>