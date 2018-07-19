<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
    <%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
    <%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
    <c:set var='path' value="${pageContext.request.contextPath}"/>
    	<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
	</jsp:include>
<style>

section{
width:100%;
height:800px;
position:relative;
top:570px;
background-color:white;
z-index:10;
}
section div#main_container{
width:100%;
height:1200px;
position:relative;
z-index:10;
background-color:white;

}
section div#main_container div#rank_container{
width:80%;
height:400px;
position:relative;
left:10%;
top:90px;
}
#rank_1{
width:80%;
height:400px;
margin-left:10%;
background-color:white;

}
#rank_2{
width:80%;
height:400px;
margin-left:10%;
background-color:white;
}
#rank_3{
width:80%;
height:400px;
background-color:white;
margin-left:10%;
}
.dong1{
margin-top:3%;
margin-left:5%;
}
.dong2{
margin-top:3%;
margin-left:7%;
}
.dong3{
margin-top:3%;
margin-left:9%;
}
</style>
</head>
<body>

<section>

<div id='main_container'>
<span style='color:gray;font-weight:bold;margin-top:100px;margin-left:5%;font-size:30px;'>동아리 랭킹</span>
<hr/>

<div id='rank_container'>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div style='background-color:white;' class="carousel-inner">
      <div class="item active">
		<div id='rank_1'>
		<a href="#"><img class='dong1' src="http://news.unist.ac.kr/kor/wp-content/uploads/2016/04/UNIST-MAgazine_2016_spring_UNISTAR02_08.jpg" width="25%" height="300px"></a>
		<a href="#"><img class='dong2' src="https://i.ytimg.com/vi/K5Hr5D2VfQE/maxresdefault.jpg" width="25%" height="300px"></a>
		<a href="#"><img class='dong3' src="http://img.asiatoday.co.kr/file/2013y/09m/29d/871775_0-385256_80539.jpg" width="25%" height="300px"></a>
		</div>
      </div>

      <div class="item">
   		<div id='rank_2'>
				<a href="#"><img class='dong1' src="http://news.unist.ac.kr/kor/wp-content/uploads/2016/04/UNIST-MAgazine_2016_spring_UNISTAR02_08.jpg" width="25%" height="300px"></a>
		<a href="#"><img class='dong2' src="https://i.ytimg.com/vi/K5Hr5D2VfQE/maxresdefault.jpg" width="25%" height="300px"></a>
		<a href="#"><img class='dong3' src="http://img.asiatoday.co.kr/file/2013y/09m/29d/871775_0-385256_80539.jpg" width="25%" height="300px"></a>
		</div>
      </div>
    
      <div class="item">
   		<div id='rank_3'>
				<a href="#"><img class='dong1' src="http://news.unist.ac.kr/kor/wp-content/uploads/2016/04/UNIST-MAgazine_2016_spring_UNISTAR02_08.jpg" width="25%" height="300px"></a>
		<a href="#"><img class='dong2' src="https://i.ytimg.com/vi/K5Hr5D2VfQE/maxresdefault.jpg" width="25%" height="300px"></a>
		<a href="#"><img class='dong3' src="http://img.asiatoday.co.kr/file/2013y/09m/29d/871775_0-385256_80539.jpg" width="25%" height="300px"></a>
		</div>
		</div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only" >Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 

</section>


