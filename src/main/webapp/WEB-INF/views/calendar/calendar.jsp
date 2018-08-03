<%@page import="com.yj.project.member.model.vo.Member"%>
<%@page import="com.yj.project.calendar.model.vo.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
    <%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
    <%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
        <c:set var='path' value="${pageContext.request.contextPath}"/>
    <%
    Date d = new Date();
    System.out.println(d);
    SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
    String date1 = sd.format(d);
   request.setAttribute("date",date1);
   ArrayList<Calendar> list = (ArrayList)request.getAttribute("list");

   %>


<link href='resources/css/fullcalendar.min.css' rel='stylesheet' />
<link href='resources/css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='resources/js/moment.min.js'></script>
<script src='resources/js/fullcalendar.min.js'></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

   
   
   
   
<style>

#calendar {
   margin: 0 auto;
   width:80%;
   height:1200px;
   position:relative;
   background-color:white;
   left:1.5%;
}
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
height:1400px;
position:relative;
z-index:10;
background-color:white;
top:100px;

}
#update_info{
display:none;
transition:0.5s;
}
#search_b{
width:400px;
position:absolute;
right:3.1%;
z-index:100;
}
#myModal p{
color:black;
}
#calendarModal p{
color:black;
}

</style>



    <jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="" name="pageTitle"/>
   </jsp:include>
   <section>
   <br><span style="font-size:35px;color:gray;font-weight:bold;margin-left:3%;" data-toggle="modal" data-target="#matching">With Us</span>
   <br><hr>
   <div id="search_b">
   <select id="category" name="category" class="form-control" style="width:200px;font-size:15px;display:inline-block;">
   <option value="전체" <c:if test="${category == '전체'}">selected</c:if>>전체</option>
   <option value="축구" <c:if test="${category == '축구'}">selected</c:if>>축구</option>
   <option value="여행" <c:if test="${category == '여행'}">selected</c:if>>여행</option>
   <option value="봉사" <c:if test="${category == '봉사'}">selected</c:if>>봉사</option>
   <option value="종교" <c:if test="${category == '종교'}">selected</c:if>>종교</option>
   <option value="음악" <c:if test="${category == '음악'}">selected</c:if>>음악</option>
   </select>
   <input type="button" class="btn btn-success" onclick="category()" value="검색" style="font-size:15px;display:inline-block;width:100px;">
   <br><br>
   <button type="button" class="btn btn-info" style="margin-left:205px;cursor:pointer;" data-toggle="modal" data-target="#myModal">매칭 업로드</button>   
   </div>
   <script>
   function category(){
      location.href="${path}/calendar.do?category="+$('#category').val();
   }
   </script>
   <div id='main_container'>
   <div id='calendar'>
   </div>
   </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
   
   </section>
    
<script>
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      header: {
        left: 'prev,next today',
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
    		/*     <c:choose>
    		    <c:when test="${memberLoggedIn.member_id eq c.member_id}">
				color:'#7C96C9',
    		    </c:when>

    		    <c:otherwise>
    		        color:'#A5DE9F',
    		    </c:otherwise>
    			</c:choose> */
    		  widthus_num: '${c.withus_num}',
              title: '${c.withus_title}',
              start: '${c.matching_date}',
              modalContent:'${c.withus_content}',
              modalPlace:'${c.withus_place}',
              enroll_date: '${c.enroll_date}',
              withus_category : '${c.withus_category}',
              member_id : '${c.member_id}',
              time1 : '${c.time1}',
              time2 : '${c.time2}',
              register_circle : '${c.register_circle}'

            },
         </c:forEach>
               ],
        eventClick: function(event) {
           

           
              $('#member_id_in').html('아이디 : '+ event.member_id);
            $('#Title').html('제목 : '+ event.title);
            $('#Content').html('내용 : ' + event.modalContent);
             $('#Place').html('장소 : ' + event.modalPlace);
             $('#Time1').html('시간 : '+event.time1+':00');
             $('#Time2').html(event.time2+':00');
             $('#category_in').html('카테고리 : ' + event.withus_category);

            $('#calendarModal').modal();
            $('#machingTitleIn').attr("value",event.title);
            $('#machingContentIn').attr("value",event.modalContent);
            $('#machingPlaceIn').attr("value",event.modalPlace);
             $('#time1In').attr("value", event.time1);
             $('#time2In').attr("value", event.time2);
             $('#machingDateIn').attr("value",event.start);
             $('#withus_num').attr("value",event.widthus_num);
             $('#member_id').attr("value",event.member_id);
             $('#register_circle_in').attr("value",event.register_circle);
            if($('#member_id').val()=='${memberLoggedIn.member_id}'){
              var btn2 = "<input type='button' value='삭제' class='btn btn-danger' onclick='deleteFrm()' style='width:250px;margin-right:170px;'>";
              $('.modal-footer').html(btn2);
           }else{
               var btn4 = "<input type='button' value='매칭신청' class='btn btn-success' onclick='matchingFrm()' style='width:250px;margin-right:170px;'>";
              $('.modal-footer').html("<span id='change' style='cursor:pointer;color:black;position:absolute;left:15px;' onclick='chage_toggle()'> 변경하기 </span>"+btn4);
              
           }
            
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
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


        },
        dayClick: function(date, allDay, jsEvent, view) {
              alert("우측 상단의 매칭 업로드 버튼을 이용해주세요!");
                }, 

    });

    calendar.render();
  });

</script>

<div id="myModal" class="modal" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" style="color:black;">매칭 업로드</h4>
      </div>
      <div class="modal-body">
      <form action="${path }/uploadMatching.do" method="post" id="uploadMatching">
      <p>제목 :</p> <input type="text" name="withus_title" id="machingTitle" class="form-control" style="width:50%;" required><br>
      <p>날짜 :</p> <input type="date" name="matching_date" id="machingDate" class="form-control" style="width:50%;" required><br><br>
      <p>시간 :</p> <select id="t1" name="time1" style="width:20%;display:inline-block;" class="form-control">
      <option value="08">08:00</option>
      <option value="09">09:00</option>
      <option value="10">10:00</option>
      <option value="11">11:00</option>
      <option value="12">12:00</option>
      <option value="13">13:00</option>
      <option value="14">14:00</option>
      <option value="15">15:00</option>
      <option value="16">16:00</option>
      <option value="17">17:00</option>
      <option value="18">18:00</option>
      <option value="19">19:00</option>
      <option value="20">20:00</option>
      <option value="21">21:00</option>
      <option value="22">22:00</option>
      </select> - 
      <select id="t2" name="time2" style="width:20%;display:inline-block;" class="form-control" >
      <option value="08">08:00</option>
      <option value="09">09:00</option>
      <option value="10">10:00</option>
      <option value="11">11:00</option>
      <option value="12">12:00</option>
      <option value="13">13:00</option>
      <option value="14">14:00</option>
      <option value="15">15:00</option>
      <option value="16">16:00</option>
      <option value="17">17:00</option>
      <option value="18">18:00</option>
      <option value="19">19:00</option>
      <option value="20">20:00</option>
      <option value="21">21:00</option>
      <option value="22">22:00</option>
      </select><br><br>
                  <div class="form-group">
               <label for="member_addr">주소</label>
                  <br/>
                  <input type="text" class="form-control btn btn-outline" id="sample6_postcode"  name='member_addr1' style="width:300px; background-color:white;" placeholder="우편번호"  readonly>
                  <input type="button" onclick="sample6_execDaumPostcode()" class="btn" value="우편번호 찾기"><br>
                  <input type="text" class="form-control btn btn-outline-secondary"id="sample6_address" name="withus_place" style="width:300px; background-color:white;" placeholder="주소"readonly>
            </div>
            
      <p>내용 :</p> <input type="text" name="withus_content" id="machingContent" class="form-control" style="width:50%;" ><br>
      <input type="hidden" name="register_circle" id="register_circle" value="${memberLoggedIn.circle1_num}">
      <p>카테고리 :</p> <select name="withus_category" id="withus_category" class="form-control" style="width:50%;">
      <option value="축구">축구</option>
      <option value="봉사">봉사</option>
      <option value="음악">음악</option>
      <option value="여행">여행</option>
      <option value="연극">연극</option>
      </select>
      
      <br>
      </form>
      
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" onclick="return uploadMatching()" style="width:250px;margin-right:170px;">업로드</button>
      </div>
    </div>
  </div>
</div>

<div id="calendarModal" class="modal">
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span> <span class="sr-only">close</span></button>
            <h4 style="color:black;">Matching</h4>
        </div>
        <div id="modalBody" class="modal-body">
           <form id="matchingFrm" method="get">
           <h4 id="member_id_in" class="modal-title" style="color:black;"> </h4><br>
           
            <h4 id="category_in" class="modal-title" style="color:black;"> </h4><br>
           
           <h4 id="Title" class="modal-title" style="color:black;"></h4>
           <input type="hidden" name="withus_title" id="machingTitleIn">
           
           <br>
           <h4 id="Time1" class="modal-title" style="color:black;display:inline-block;"> </h4>
            <input type="hidden" name="time1" id="time1In">
            ~ <h4 id="Time2" class="modal-title" style="color:black;display:inline-block;"> </h4>
             <input type="hidden" name="time2" id="time2In"><br>
            <br>
            <h4 id="Place" class="modal-title" style="color:black;"> </h4>
            <input type="hidden" name="withus_place" id="machingPlaceIn">
            <br>
            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f39f41093473cee9c7f1cf06be632c5f&libraries=services"></script>
                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
                <div style="font-weight:400; font-size:16px">
                <div id="map" style="width:500px;height:250px;margin-left:35px;"></div>

            <br>
            <h4 id="Content" class="modal-title" style="color:black;"> </h4>
            <input type="hidden" name="withus_content" id="machingContentIn">
            <br>
            </div>

            <input type="hidden" name="matching_date1" id="machingDateIn">
            <input type="hidden" name="withus_num" id="withus_num">
            <input type="hidden" name="member_id" id="member_id">
            <input type="hidden" name="register_circle" id="register_circle_in">
            <input type="hidden" id="chage_toggle" value="false">
            <div id="update_info">
            <br>
            <p>변경할 날짜 :</p> <input type="date" name="req_matching_date1" style="width:50%;" id="req_matching_date" class="form-control"><br>
         <p>변경할 시간 :</p> <select id = "re_time1" name="re_time11" style="width: 20%; display: inline-block;" class="form-control">
                     <option value="null">00:00</option>
                     <option value="08">08:00</option>
                     <option value="09">09:00</option>
                     <option value="10">10:00</option>
                     <option value="11">11:00</option>
                     <option value="12">12:00</option>
                     <option value="13">13:00</option>
                     <option value="14">14:00</option>
                     <option value="15">15:00</option>
                     <option value="16">16:00</option>
                     <option value="17">17:00</option>
                     <option value="18">18:00</option>
                     <option value="19">19:00</option>
                     <option value="20">20:00</option>
                     <option value="21">21:00</option>
                     <option value="22">22:00</option>
                  </select> - <select id = "re_time2" name="re_time22" style="width:20%; display:inline-block;" class="form-control" >
                     <option value="null">00:00</option>                     
                     <option value="08">08:00</option>
                     <option value="09">09:00</option>
                     <option value="10">10:00</option>
                     <option value="11">11:00</option>
                     <option value="12">12:00</option>
                     <option value="13">13:00</option>
                     <option value="14">14:00</option>
                     <option value="15">15:00</option>
                     <option value="16">16:00</option>
                     <option value="17">17:00</option>
                     <option value="18">18:00</option>
                     <option value="19">19:00</option>
                     <option value="20">20:00</option>
                     <option value="21">21:00</option>
                     <option value="22">22:00</option>
                  </select><br> <br>
                  <div class="form-group">
                      <p>변경할 주소 :</p>
                      <br /> <input type="text"
                        class="form-control btn btn-outline" id="sample6_postcode1"
                        name='member_addr1'
                        style="width: 300px; background-color: white;"
                        placeholder="우편번호" readonly> <input type="button"
                        onclick="sample6_execDaumPostcode2()" class="btn" value="우편번호 찾기"><br>
                     <input type="text" class="form-control btn btn-outline-secondary"
                        id="sample6_address1" name="req_withus_place1"
                        style="width: 300px; background-color: white;" placeholder="주소"
                        readonly>
                  </div>
            <p>변경할 내용 :</p> <input type="text" name="req_withus_content1" style="width:50%;" id="req_withus_content" class="form-control"><br>
            </div>
            
            
            

            </form>
            
            
            
         </div>
        <div class="modal-footer">
        
            
        </div>
    </div>
</div>

</div>

<script>
var flag=true;
   function chage_toggle(){
      if(flag){
      $('#update_info').css("display","block");
   $('#chage_toggle').attr("value",true);
   $('#change').html('변경취소');
      flag=false;
      }else{
      $('#update_info').css("display","none");
   $('#chage_toggle').attr("value",false);
      flag=true;
      $('#change').html('변경하기');
      }
   }
   

function matchingFrm(){
   
   var id = $('#member_id').val();
   var d1 = $('#req_matching_date').val();
   var t1 = $('#re_time1').val();
   var t2 = $('#re_time2').val();

    

   if('${memberLoggedIn.member_id}'==id){
      alert('자신이 등록한 매칭은 신청할 수 없습니다.');
      return false;
   }
   if($('#chage_toggle').val()=='true'){
   if(d1<'${date}'){
      alert('날짜를 확인해주세요');
      return false;
   }
   if(t1>t2){
      alert('시간을 확인해주세요!');
      return false;
   }
   }
   $('#matchingFrm').attr("action","${path }/send_Matching.do");
   $('#matchingFrm').submit();
   
   }
function uploadMatching(){
   var title = $('#machingTitle').val();
   var d1 = $('#machingDate').val();
   var place = $('#machingPlace').val()
   var content = $('#machingContent').val();
   var circle = $('#register_circle').val();
   var t1 = $('#t1').val();
   var t2 = $('#t2').val();
   var f;
   $.ajax({
      url: "${path}/checkCalendar?matchingDate="+d1,
      async: false,
      success:function(data){
         if(data=='false'){
            alert('해당 날짜에는 이미 매칭이 신청되어 있습니다.');
            f=true;
         }else{
            f=false;
         }
      }

   });
   if(f){
      return false;
   }
   

    if(title==''){
      alert('제목을 입력해주세요');
      return false;
   }
   if(d1<'${date}'){
      alert('지난 날짜는 선택할 수 없습니다!');
      return false;
   }
   if(t1>t2){
      alert('시간을 확인해주세요!');
      return false;
   }
   if(place==''){
      alert('장소을 입력해주세요');
      return false;
   }
   if(content==''){
      alert('내용을 입력해주세요');
      return false;
   }


   $('#uploadMatching').submit();
   return true;
}

   function deleteFrm(){
      $('#matchingFrm').attr("action","${path}/delete_Matching.do");
      $('#matchingFrm').submit();

   }
   function sample6_execDaumPostcode() {
       new daum.Postcode({
           oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 각 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var fullAddr = ''; // 최종 주소 변수
               var extraAddr = ''; // 조합형 주소 변수

               // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
               if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                   fullAddr = data.roadAddress;

               } else { // 사용자가 지번 주소를 선택했을 경우(J)
                   fullAddr = data.jibunAddress;
               }

               // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
               if(data.userSelectedType === 'R'){
                   //법정동명이 있을 경우 추가한다.
                   if(data.bname !== ''){
                       extraAddr += data.bname;
                   }
                   // 건물명이 있을 경우 추가한다.
                   if(data.buildingName !== ''){
                       extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                   }
                   // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                   fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
               document.getElementById('sample6_address').value = fullAddr;

               // 커서를 상세주소 필드로 이동한다.
               document.getElementById('machingContent').focus();
           }
       }).open();
   }
   
   function sample6_execDaumPostcode2() {
       new daum.Postcode({
           oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 각 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var fullAddr = ''; // 최종 주소 변수
               var extraAddr = ''; // 조합형 주소 변수

               // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
               if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                   fullAddr = data.roadAddress;

               } else { // 사용자가 지번 주소를 선택했을 경우(J)
                   fullAddr = data.jibunAddress;
               }

               // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
               if(data.userSelectedType === 'R'){
                   //법정동명이 있을 경우 추가한다.
                   if(data.bname !== ''){
                       extraAddr += data.bname;
                   }
                   // 건물명이 있을 경우 추가한다.
                   if(data.buildingName !== ''){
                       extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                   }
                   // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                   fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               document.getElementById('sample6_postcode1').value = data.zonecode; //5자리 새우편번호 사용
               document.getElementById('sample6_address1').value = fullAddr;

               // 커서를 상세주소 필드로 이동한다.
               document.getElementById('req_withus_content').focus();
           }
       }).open();
   }
      

</script>