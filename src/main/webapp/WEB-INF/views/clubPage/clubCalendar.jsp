<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<c:set var = 'path' value='<%=request.getContextPath()%>'/>
<%
Date d = new Date();
SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
String date1 = sd.format(d);
request.setAttribute("date",date1);
%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link href='resources/css/fullcalendar.min.css' rel='stylesheet' />
<link href='resources/css/fullcalendar.print.min.css' rel='stylesheet'media='print' />
<script src='resources/js/moment.min.js'></script>
<script src='resources/js/fullcalendar.min.js'></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value='club' name='pageTitle'/>
</jsp:include>
<jsp:include page="/WEB-INF/views/clubPage/common/aside1.jsp"/>      
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
#budget_list th{
  text-align: center;
}
#ClubmatchingTable tr{
height:50px;
}
#ClubmatchingTable td:nth-of-type(1){
text-align:center;
color:black;
font-weight:bold;
width:15%;
}
#ClubmatchingTable td:nth-of-type(2){
color:black;
width:85%;
}
#ClubmatchingTable{
width:100%;
}
.fc-title{
cursor:pointer;
}
#noticeContainer{
width:100%;
height:auto;
}
#noticeTable tr{
border-bottom:1px solid lightgray;
}

</style>
<!-- Middle Column -->
    <div class="w3-col m7">

      <div class="w3-container w3-card w3-white w3-round w3-margin" style='height:auto;'><br>
           <div id='calendar' style='height:750px;'>
			</div>
		
			<div id='noticeContainer'>
			<span style='font-size:30px;margin-left:30%;font-weight:bold;'>Matching Information</span>
			<br><br><br>
			<table class='table' id='noticeTable'>
			<c:if test='${not empty noticeList}'>
			<c:forEach var="n" items="${noticeList}" varStatus="vs">
			<tr ${(noticeCount-1) >= vs.index ? "style='background-color:#9DCFFF;font-weight:bold;'":""} ${vs.index>=5 ? "style='display:none;width:100%;'":''}>
			<td style='height:50px;padding:20px;font-size:18px;width:100%;'>
			<c:if test='${(noticeCount-1) >= vs.index}'>
			<ruby style='color:white;' class='toggleColor'>
			<rt>new !! </rt>
			</ruby>
			</c:if>
			${n.content }</td>
			</tr>
			</c:forEach>
			</c:if>
			<c:if test='${empty noticeList}'>
			<tr style='text-align:center;font-weight:bold;'><td>소식이 없습니다</td></tr>
			</c:if>
			</table>
			<button class='btn btn-default' style='width:100%' onclick='moreInfo()'>더 보 기</button>
			</div>
		

      </div>
    <!-- End Middle Column -->
    </div>
       <script>
       var in1=0;
	   var in2=1;
	   var in3=2;
	   var in4=3;
	   var in5=4;
       function moreInfo(){
    	   var table1 = $('#noticeTable').children().children('tr');
    	   in1+=5;
    	   in2+=5;
    	   in3+=5;
    	   in4+=5;
    	   in5+=5;
    	   console.log(table1);
    	   table1.eq(in1).css("display","");
    	   table1.eq(in2).css("display","");
    	   table1.eq(in3).css("display","");
    	   table1.eq(in4).css("display","");
    	   table1.eq(in5).css("display","");
    	   

    	   
       }
       
       
       var colorFlag=true;
       $(document).ready(function() {
    	   setInterval(function(){ 
    	  if(colorFlag){
    	   $('.toggleColor').css("color","white") 
    	   colorFlag=false;
    	  }else{
    	   $('.toggleColor').css("color","red");
    	   colorFlag=true;
       }
       }, 600);
       });
       
       
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      header: {
        left: 'prev,next',
        center: 'title',
        right: ''
      },
      defaultDate: '${date}',
      navLinks: true, // can click day/week names to navigate views
      editable: false,
      eventLimit: true, // allow "more" link when too many events
      events: [
    	  <c:forEach var="c" items="${list}" varStatus="vs">
    	  {

              title: '${c.circle_name}',
              start: '${c.req_matching_date}',
              content : '${c.req_withus_content}',
              time : '${c.req_matching_time}',
              place : '${c.req_withus_place}',
              check : 'C',
			  req_member_id:'${c.req_member_id}'
            },
         </c:forEach>
            
      	  <c:forEach var="m" items="${memberList}" varStatus="vs">
    	  {

              title: '${m.member_name}'+'님의 생일',
              start: '${m.member_birth}',
              check : 'M'
            },
         </c:forEach>
               ],
         eventClick: function(event) {
        	var t1=JSON.stringify(event.start);
        	t1=t1.replace(/\"/g,"");
        	if(event.check=='C'){
            $('#Title1').html(event.title);
            $('#Content1').html(event.content);
             $('#Place1').html(event.place);
             $('#date_in1').html(t1);
             $('#Time').html(event.time);
             $('#req_member_id').html(event.req_member_id);
             

             
            $('#clubCalendarModal').modal();
  


            
            var mapContainer = document.getElementById('map1'), // 지도를 표시할 div 
          mapOption = {
              center: new daum.maps.LatLng(37.4989960052,127.0328498329), // 지도의 중심좌표
              level: 3 // 지도의 확대 레벨
          };  
      // 지도를 생성합니다    
      var map = new daum.maps.Map(mapContainer, mapOption); 
      // 주소-좌표 변환 객체를 생성합니다
      var geocoder = new daum.maps.services.Geocoder();
      // 주소로 좌표를 검색합니다
      geocoder.addressSearch(event.modalPlace, function(result, status) {
         
          // 정상적으로 검색이 완료됐으면 
           if (status === daum.maps.services.Status.OK) {
      
              var coords = new daum.maps.LatLng(result[0].y, result[0].x);
      
              // 결과값으로 받은 위치를 마커로 표시합니다
              var marker = new daum.maps.Marker({
                  map: map,
                  position: coords
              });
      
              // 인포윈도우로 장소에 대한 설명을 표시합니다
            var infowindow = new daum.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+'위치'+'</div>'
            });
              infowindow.open(map, marker);
      
              // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
              map.setCenter(coords);
          } 
      });
        	}else if(event.check=='M'){
        		$('#msg').html(event.title+"입니다!");
        		$('#memberBirthday').modal();
        	}

        }


    }); 

    calendar.render();
  });

</script>




<div id="clubCalendarModal" class="modal">
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span> <span class="sr-only">close</span></button>
            <h4 style="color:black;margin-left:43%;font-weight:bold;">Matching</h4>
        </div>
        <div id="modalBody" class="modal-body">
           <table id='ClubmatchingTable'>
           <tr>
           <td>ID</td>
           <td>
           <span id="req_member_id" class="modal-title" style="color:black;"> </span> <a href='#'><i class="fa fa fa-envelope-o fa-fw w3-margin-right"></i></a>
           </td></tr>
           <tr>
           <td>제목</td>
           <td>
           <span id="Title1" class="modal-title" style="color:black;"></span>
           </td>
           <tr>
           <td>내용</td>
           <td>
            <span id="Content1" class="modal-title" style="color:black;"> </span>
            </td></tr>
			<tr>
			<td>날짜</td>
			<td>
           <span id="date_in1" class="modal-title" style="color:black;"></span>
			</td></tr>
           <tr>
           <td>시간</td>
           <td>
           <span id="Time" class="modal-title" style="color:black;display:inline-block;"> </span>
             </td></tr>
             <tr>
             <td>장소</td>
             <td>
            <span id="Place1" class="modal-title" style="color:black;"> </span>
             </td></tr>    
            </table>
            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f39f41093473cee9c7f1cf06be632c5f&libraries=services"></script>
                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
                <div style="font-weight:400; font-size:16px">
                <div id="map1" style="width:500px;height:250px;margin-left:35px;"></div>
            <br><br>
            <br>
            </div>

  
            
            

            
            
            
         </div>
    </div>
</div>

</div>


<div id="memberBirthday" class="modal">
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span> <span class="sr-only">close</span></button>
            <h4 style="color:black;margin-left:43%;font-weight:bold;">BirthDay</h4>
        </div>
        <div id="modalBody" class="modal-body">
        <span id='msg' style='margin-left:5%;'></span><br><br>
        <span style='margin-left:5%;'>다들 축하의 메시지를 보내주세요!</span>
        <br><br>
        <p style='margin-left:5%;font-size:15px;'>제 목</p><input type='text' name='msgTitle' style='width:90%;margin-left:5%;' class="form-control">
        <br>
        <p style='margin-left:5%;font-size:15px; '>내 용</p><textarea name='msgContent' style='margin-left:5%;width:90%;height:200px;' class="form-control"></textarea>
        <br>
        <button style='margin-left:85%;' class='btn btn-success'>전송</button>
        </div>
        
        </div>
        </div>
        
        </div>
        
        

      
<jsp:include page="/WEB-INF/views/clubPage/common/aside2.jsp"/> 
     