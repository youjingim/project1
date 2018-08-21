<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.yj.project.search.model.vo.Circle"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<c:set var = 'path' value='<%=request.getContextPath()%>'/>
<%
	ArrayList<Circle> list = (ArrayList)request.getAttribute("circle");
	String searchKeyword=(String)request.getAttribute("searchKeyword");
	String searchType=(String)request.getAttribute("searchType");    
%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value='동아리 검색 결과' name='pageTitle'/>
</jsp:include>
<style>
  body{
  	background-color: white;
  }
  th,tr{
 		text-align:center;
 	}
  #p_bar{
		width:100px;
		margin:0 auto;
	}
section{
width:100%;
height:600px;
position:relative;
background-color:white;
z-index:10;
}
section div#main_container{
width:100%;
height:400px;
position:relative;
z-index:10;
background-color:white;
top:50px;

}

.input_text {
	width: 348px; height: 25px;
	margin: 6px 0 0 9px;
	border: 0;
	line-height: 21px;
	font-weight: bold;
	font-size: 16px;
	outline: none;
}

.blue_window{
	border-top-left-radius : 10px;
	border-bottom-left-radius : 10px;
}

#sch_smit {
	width: 130px; height: 40px;
	vertical-align: top;
	background: #5858FA;
	color: white;
	font-weight: bold;
	cursor: pointer;
	border-top-right-radius : 10px;
	border-bottom-right-radius : 10px;
	position:relative;
	right:7.5px;
	border-top-left-radius : 0px;
	border-bottom-left-radius : 0px;
}

#sch_smit:hover {
	background: #5882FA;
}

.blue_window {
	display: inline-block;
	width: 366px; height: 40px;
	border: 3px solid #6C82FA;
	background: white;
}
#tr1{
	border : 3.05px solid black;

}

.th-lg{
	font-weight:bold;
	color:black;
}

td{
	border-top: 2px solid black;
	color:black;
}
#table{
	width:95%;
	position:relative;
	margin-left:2.5%;
	margin-right:2.5%;
}

#searchType{
	border-radius:5px;
	height:35px;
	position:relative;
	left:3px;
	bottom:1.5px;
	outline:none;
}
</style>
<section>
<div id='#main_container'>
<div class="col-xm-10" id="main_title" style="margin-top: 300px;color:#161616;">
	<hr>
     <div id='searchresult' style="background-image:url(/project/resources/image/searchresult.png);background-repeat:no-repeat;background-position: center;background-size: 800px 250px;margin-top:2%;width: 100%; height: 200px;">
     </div>
     <h1 style="text-align:center;position:relative;margin-left:-380px;bottom:100px;font-size:20px">총 <span style="color: red;">${totalCount }</span>개의 동아리가 검색되었습니다.</h1>
          <div class="boardR">
          <section id="board-container">
        <table id='table' class="table table-striped table-hover table-bordered">
          <thead>
            <tr id='tr1'>
              <th class="th-lg">동아리No.</th>
              <th class="th-lg">대학교<i class="fa fa-sort ml-1"></i></th>
              <th class="th-lg">동아리명(카테고리)<i class="fa fa-sort ml-1"></i></th>
              <th class="th-lg">동아리회장<i class="fa fa-sort ml-1"></i></th>
              <th class="th-lg">좋아요<i class="fa fa-sort ml-1"></i></th>
            </tr>
          </thead>
          <c:if test="${not empty list }">
		  <c:forEach var='circle' items='${list }' varStatus="vs">
			<tr>
					<td style="width:15%;">${circle.circle_num }</td>
					<td style="width:20%">${circle.university }</td>
					<td class="text-warning" style="font-weight:600;">
					<a href='${pageContext.request.contextPath}/search/circleView.do?no=${circle.circle_num }' style="color:black;font:bold;">${circle.circle_name }</a>
					<span class='badge'>${circle.category}</span>
					</td>
					<td style="width:20%">${circle.member_id }</td>
					<td style="width:15%"><img src='/project/resources/image/like4.png' style="width:10%;height:5%;">${circle.circle_like }</td>
			</tr>	
		  </c:forEach>
		  </c:if>
		</table>
		<hr>
		
		<form class="example" action="${path }/ListFinder.do">
     	<div id="search-container" style="position:relative;left:700px">
        <select id="searchType">
        	<option disabled="disabled"  value="">선택</option>
            <option value="university" id="uni">대학</option>	
            <option value="circleName" id="name">동아리명</option>
        </select>
        <div id="search_university">
            <form action="${path }/ListFinder.do">
                <input type="hidden" name="searchType" value="university"/>
               	<span class='blue_window'>
					<input type='text' class='input_text' name='Unsearch'  placeholder="대학 이름 입력">
				</span>
				<button type='submit' id='sch_smit' class='btn btn-info btn-lg'>
					<span class="glyphicon glyphicon-search"></span> Search 
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
					<span class="glyphicon glyphicon-search"></span> Search 
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
		
        <div class="pagination" id="page" style="position: relative;left:850px;">
				${pageBar }
		</div>
        </section>
        </div>
        </div>

</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>		
</section>
