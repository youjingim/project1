<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>	
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link href='resources/css/fullcalendar.min.css' rel='stylesheet' />
<link href='resources/css/fullcalendar.print.min.css' rel='stylesheet'media='print' />
<script src='resources/js/moment.min.js'></script>
<script src='resources/js/fullcalendar.min.js'></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<c:set var='path' value="${pageContext.request.contextPath}"/>

    
    <style>
    #update_info{
display:none;
transition:0.5s;
}
#tableContainer{
width:100%;
}
#tableContainer tr{
height:50px;
}
#tableContainer td:nth-of-type(1){
text-align:center;
color:black;
font-weight:bold;
width:15%;
}
#tableContainer td:nth-of-type(2){
color:black;
width:85%;
}

	#slidebox {
		position:relative;
		width:260px;
		height:430px;
		overflow:hidden;
		white-space:nowrap;
	}
	#slidebox ul#slider {
		list-style:none;
		margin:0;
		padding:0;
	}
	#slidebox ul li {
		position:absolute;
		width:260px;
		height:430px;
	}
	#slidebox ul li img {
		width:260px;
		height:300px;
	}
    </style>
    
    
  <!-- Right Column -->
    <div class="w3-col m2" style="margin-top:16px;">
      <div class="w3-card w3-round w3-white w3-center">
        <div class="w3-container">
          <h5><strong><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i>이번 주 생일의 주인공</strong></h5>
          <hr>
          <p>07.24 홍길동</p>
          <p>07.27 이순신</p>
          <p><button class="w3-button w3-block w3-theme-l4">Info</button></p>
        </div>
      </div>
      <br>
		<c:if test='${not empty matching}'>
      <div class="w3-card w3-round w3-white w3-center">
        <div class="w3-container" id='slidebox'>
        <ul id="slider">
        <c:forEach var="m" items="${matching}" varStatus="vs">
        
        <li>
          <h5><strong><i class="fa fa-handshake-o fa-fw w3-margin-right w3-text-theme"></i>매칭 시스템</strong></h5><hr>
          <img src="${pageContext.request.contextPath}/resources/image/${m.circle_photo}" alt="Avatar" style="width:80%;height:150px;" class='img-rounded'><br>
          <br>
          <span><strong>${m.circle_name }</strong></span>
          <br><br>
          <span style='cursor:pointer;' class='info_view'>상세보기
          <input type='hidden' value='${m.withus_num}'/>
          </span>
          <c:if test="${m.status eq 'C'}"><br><br>
          <span style='color:red;'>변경사항</span>
          </c:if>
          <c:if test="${m.status eq 'S'}"><br><br><br>
          </c:if>
          <div class="w3-row w3-opacity">
            <div class="w3-half">
              <button class="w3-button w3-block w3-green w3-section" title="Accept"><i class="fa fa-check"></i></button>
            </div>
            <div class="w3-half">
              <button class="w3-button w3-block w3-red w3-section" title="Decline"><i class="fa fa-remove"></i></button>
            </div>
          </div>
          </li>
          </c:forEach>
          </ul>
        </div>
            <button class='btn btn-default' id='before'><</button>&nbsp;&nbsp;
            <span id='current'></span>
    &nbsp;&nbsp;<button class='btn btn-default' id='after'>></button><br><br>
      </div>
      </c:if>
      <br>
      

   

      
      
     
      <div id="matchingModal" class="modal">
      <div class="modal-dialog">
          <div class="modal-content">
              <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span> <span class="sr-only">close</span></button>
                  <h4 style="color:black;margin-left:43%;font-weight:bold;">Matching</h4>
              </div>
              <div id="modalBody" class="modal-body">
                 <form id="matchingFrm" method="get">
	             <table id='tableContainer'>
	             <tr>
	             <td>날짜</td>
	             <td>
	             <span id="date_in" class="modal-title" style="color:black;"></span>
	             </td></tr>
	             <tr style='height:0px;'><td style='color:red;'></td><td>
	             <span id='chage_in' class='modal-title' style='color:red;'></span>
	             </td></tr>

                 <tr>
                 <td>시간</td>
                 <td>
                 <span id="Time1" class="modal-title" style="color:black;display:inline-block;"> </span>
                  <input type="hidden" name="time1" id="time1In">
                  ~ <span id="Time2" class="modal-title" style="color:black;display:inline-block;"> </span>
                   <input type="hidden" name="time2" id="time2In">
                  </td></tr>
                  <tr style='height:0px;'><td style='color:red;'></td><td>
                  <span id='chage_time1' class='modal-title' style='color:red;'></span> <span id='chage_time2' class='modal-title' style='color:red;'></span></td>
                  </tr>
                  <tr>
                  <td>제목</td>
                  <td>
                 <span id="Title" class="modal-title" style="color:black;"></span>
                 <input type="hidden" name="withus_title" id="machingTitleIn">
                 </td></tr>
                 <tr>
                 <td>내용</td>
                 <td>
                  <span id="Content" class="modal-title" style="color:black;"></span>
                  </td></tr>
                  <tr>
                  <td>장소</td>
                  <td>
                  <span id="Place" class="modal-title" style="color:black;"> </span>
                  <input type="hidden" name="withus_place" id="machingPlaceIn">
                  </td></tr>
                  <tr style='height:0px;'><td style='color:red;'></td><td>
                  <span id="Place_in" class="modal-title" style='color:red;'> </span>
                  
                  </td></tr>
                  </table>
                  <br>
                  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f39f41093473cee9c7f1cf06be632c5f&libraries=services"></script>
                      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
                      <div style="font-weight:400; font-size:16px">
                      <div id="map" style="width:500px;height:250px;margin-left:35px;"></div>
                  <br>
                  <input type="hidden" name="withus_content" id="machingContentIn">
                  <br>
                  </div>

                  <input type="hidden" name="matching_date1" id="machingDateIn">
                  <input type="hidden" name="withus_num" id="withus_num">
                  <input type="hidden" name="member_id" id="member_id">
                  <input type="hidden" name="register_circle" id="register_circle_in">
                  <input type='hidden' name='req_circle' value='${memberLoggedIn.circle1_num}'>
                  <input type="hidden" id="chage_toggle" value="false">
                  <input type='hidden' name='login_info' value='${memberLoggedIn.member_id}'>
                  <div id="update_info">
                  <br>
               <input type="hidden" name="req_matching_date1" style="width:50%;margin-left:25px;" id="req_matching_date" class="form-control"><br>
               <p style='margin-left:25px;font-weight:bold;'>변경할 시간 </p> <select id = "re_time1" name="re_time11" style="width: 20%;margin-left:25px; display: inline-block;" class="form-control">
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
                            <p style='margin-left:25px;font-weight:bold;'>변경할 주소 </p>
                            <br /> <input type="text"
                              class="form-control btn btn-outline" id="sample6_postcode1"
                              name='member_addr1'
                              style="width: 300px;margin-left:25px; background-color: white;"
                              placeholder="우편번호" readonly> <input type="button"
                              onclick="sample6_execDaumPostcode2()" class="btn" value="우편번호 찾기"><br>
                           <input type="text" class="form-control btn btn-outline-secondary"
                              id="sample6_address1" name="req_withus_place1"
                              style="width: 300px;margin-left:25px; background-color: white;" placeholder="주소"
                              readonly>
                        </div>
                  <p style='margin-left:25px;font-weight:bold;'>변경할 내용 </p> <textarea name="req_withus_content1" style="width:90%;height:150px;margin-left:25px;" id="req_withus_content" class="form-control"></textarea><br>
                  </div>
                  
                  
                  

                  </form>
                  
                  
                  
               </div>
              <div id="modal_foot" class="modal-footer">
              
              <span id='change' style='cursor:pointer;color:black;position:absolute;left:15px;' onclick='chage_toggle()'> 변경하기 </span>
              <span style='margin-right:120px;'>
              <input type='button' value='수락' class='btn btn-success' onclick='matchingOK()' style='width:100px;'>
              <input type='button' value='재신청' class='btn btn-warning' onclick='matchingFrm()' style='width:100px;'>
              <input type='button' value='거절' class='btn btn-danger' onclick='matchingNO()' style='width:100px;'>
              </span>
              </div>
      <script>
      function matchingOK(){
    	  var frm = $('#matchingFrm');
		  var url = "${path}/successMatching";
    	  frm.attr("action",url);
    	  frm.submit();
    	  
      }
      
      function matchingNO(){
    	  var frm = $('#matchingFrm');
		  var url = "${path}/failMatching";
    	  frm.attr("action",url);
    	  frm.submit();
    	  
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

 <script>
	 $('.info_view').click(function(){
		 var number=$(this).children('input').attr("value");

		   $.ajax({
			      url: "${path}/indexCheck.do",
			      data:{"num":number},
			      dataType:"json",
			      success:function(data){
			       	  $('#matchingModal').modal();
			             $('#Title').html(data.withus_title);
			             $('#Content').html(data.withus_content);
			              $('#Place').html(data.withus_place);
			              $('#Time1').html(data.time1+":00");
			              $('#Time2').html(data.time2+":00");
			       	   $('#date_in').html(data.matching_date);
			   		   $('#req_matching_date').attr("value",data.req_matching_date);
			   		   $('#req_withus_content').html(data.req_withus_content);
			   		   $('#sample6_address1').attr("value",data.req_withus_place);
			   		   
			   		   
			   		   
			            $('#machingTitleIn').attr("value",data.withus_title);
			            $('#machingContentIn').attr("value",data.withus_content);
			            $('#machingPlaceIn').attr("value",data.withus_place);
			            $('#time1In').attr("value", data.time1);
			            $('#time2In').attr("value", data.time2);
			            $('#machingDateIn').attr("value",data.matching_date);
			            $('#withus_num').attr("value",data.withus_num);
			            $('#member_id').attr("value",data.member_id);
			            $('#register_circle_in').attr("value",data.req_circle);
			   		   
			   		   $(document).ready(function(){
			           	  $('#re_time1').children().each(function(){
			           	    if($(this).val()==data.req_time1){

			           	      $(this).prop("selected",true); // attr적용안될경우 prop으로 

			           	    }

			           	  });

			           	});
			            $(document).ready(function(){

			        	  $('#re_time2').children().each(function(){
			        	    if($(this).val()==data.req_time2){

			        	      $(this).prop("selected",true); // attr적용안될경우 prop으로 
			        	    }

			        	  });

			        	});

			   		   if(data.matching_date != data.req_matching_date){
			   			   $('#chage_in').parent().siblings().first().html('변경날짜');
			   			   $('#chage_in').html(data.req_matching_date);
			   		   }else{
			   			   $('#chage_in').parent().siblings().first().html("");
			   			   $('#chage_in').html("");
			   			   
			   		   }
			   		   if(data.time1 != data.req_time1 || data.time2 != data.req_time2){
			   			   $('#chage_time1').parent().siblings().first().html('변경시간');
			   			   $('#chage_time1').html(data.req_time1+':00 ~ ');
			   			   $('#chage_time2').html(data.req_time2+':00');

			   		   }else{
			   			   $('#chage_time1').parent().siblings().first().html("");
			   			   $('#chage_time1').html("");
			   			   $('#chage_time2').html("");
			   		   }
			   		   
			   		   if(data.withus_place != data.req_withus_place){
			   			   $('#Place_in').parent().siblings().first().html('변경주소');
			   			   $('#Place_in').html(data.req_withus_place);
			   			   
			   		   }else{
			   			   $('#Place_in').parent().siblings().first().html("");
			   			   $('#Place_in').html("");			   			   
			   			   
			   		   }
			   		   
			   		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		              mapOption = 
		              {
		                  center: new daum.maps.LatLng(37.4989960052,127.0328498329), // 지도의 중심좌표
		                  level: 3 // 지도의 확대 레벨
		              };  
		          // 지도를 생성합니다    
		          var map = new daum.maps.Map(mapContainer, mapOption); 
		          // 주소-좌표 변환 객체를 생성합니다
		          var geocoder = new daum.maps.services.Geocoder();
		          // 주소로 좌표를 검색합니다
		          geocoder.addressSearch(data.req_withus_place, function(result, status) {
		             
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
		       	  
		         })
			   		   
			      }

			   });
		 
   		   
	 });
              
	

	  		

      
      var flag=true;
      function chage_toggle(){
   	   $('#update_info').slideToggle();
         if(flag){
      $('#chage_toggle').attr("value",true);
      $('#change').html('변경취소');
         flag=false;
         }else{
      $('#chage_toggle').attr("value",false);
         flag=true;
         $('#change').html('변경하기');
         }
      }
      
      
		var num = 1;
        var x = 260;
        var before = document.getElementById("before");
        var after = document.getElementById("after");
        var slider = document.getElementById("slider");
        var slideArray = slider.getElementsByTagName("li");
        var slideMax = slideArray.length - 1;
        var curSlideNo = 0;
        $('#current').html(curSlideNo+1+'/'+(slideMax+1));
        var changeSlide1 = function(){
            for (i = 0; i <= slideMax; i++) {
                if (i == curSlideNo) slideArray[i].style.left = 0;
                else slideArray[i].style.left = -x + "px";
            }
        }
        changeSlide1();
        after.addEventListener('click', function () {
            curSlideNo = curSlideNo + 1;
            if(num<=slideMax){
            num++;}
            $('#current').html(num+'/'+(slideMax+1));
            if ( curSlideNo > slideMax ) curSlideNo = slideMax;
            changeSlide1();
        }, false);



        var changeSlide2 = function(){
            for (i = 0; i <= slideMax; i++) {
                if (i == curSlideNo) slideArray[i].style.left = 0;
                else slideArray[i].style.left = -x + "px";
            }
        }
        changeSlide2();
        before.addEventListener('click', function () {
            curSlideNo = curSlideNo - 1;
            if(num>1){
                num--;}            $('#current').html(num+'/'+(slideMax+1));
            if ( curSlideNo < 0 ) curSlideNo = 0;
            changeSlide2();
        }, false);
    </script>
      
      

    <!-- End Right Column -->
    </div>

  <!-- End Grid -->
  </div>

<!-- End Page Container -->
</div>
</div>
<br>


</body>
</html>
     