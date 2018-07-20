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
    %>


<link href='resources/css/fullcalendar.min.css' rel='stylesheet' />
<link href='resources/css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='resources/js/moment.min.js'></script>
<script src='resources/js/fullcalendar.min.js'></script>

	
	
	
	
<style>

#calendar {
	margin: 0 auto;
	width:75%;
	height:1200px;
	position:relative;
	background-color:white;
	left:5%;
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
height:1200px;
position:relative;
z-index:10;
background-color:white;

}
</style>

    <jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
	</jsp:include>
	<section>
	<br><span style="font-size:35px;color:gray;font-weight:bold;margin-left:3%;" data-toggle="modal" data-target="#matching">With Us</span>
	<br><hr>

	<span style="margin-left:5%;width:10px;">
	<select name="category" class="form-control" style="margin-left:2%;width:200px;font-size:15px;">
	<option value="축구">축구</option>
	<option value="여행">여행</option>
	<option value="봉사">봉사</option>
	<option value="종교">종교</option>
	<option value="음악">음악</option>
	</select>
	</span>
	<div id='main_container'>
	<button type="button" class="btn btn-success" style="margin-left:86.5%;margin-bottom:10px;cursor:pointer;" data-toggle="modal" data-target="#myModal">매칭 업로드</button>	
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
        right: 'month'
      },/* ddd */
      defaultDate: '${date}',
      navLinks: true, // can click day/week names to navigate views
      editable: false,
      eventLimit: true, // allow "more" link when too many events
      events: [
        {
          title: '야호야호야호',
          start: '2018-07-19',
          modalContent:'축구매칭',
          modalPlace:'kh교육원',
          time:'09:00~17:00',
          
          
        }
        ,
        {
            title: '승하형 바보',
            start: '2018-04-06',
            modalContent:'야구매칭',
            modalPlace:'kj교육원',
            time:'09:00~17:00',

        },
        {
            title: '서영누나 바보',
            start: '2018-04-16',
            modalContent:'야구매칭',
            modalPlace:'kj교육원',
            time:'09:00~17:00',

        },
          {
              title: '슬기도 바보',
              start: '2018-04-06',
              modalContent:'봉사매칭',
              modalPlace:'kh교육원1',
              time:'09:00~17:00',

            }
        ],
        eventClick: function(event) {
        	 $('#Title').html('동아리 이름 : '+ event.title);
        	 $('#Content').html('내용 : ' + event.modalContent);
             $('#Place').html('장소 : ' + event.modalPlace);
             $('#Time').html('시간 : ' + event.time);

        	 $('#calendarModal').modal();
        	 $('#machingTitleIn').attr("value",event.title);
        	 $('#machingContentIn').attr("value",event.modalContent);
        	 $('#machingPlaceIn').attr("value",event.modalPlace);
             $('#machingTimeIn').attr("value", event.time);
             $('#machingDateIn').attr("value",event.start);

        }

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
        <h4 class="modal-title">매칭 업로드</h4>
      </div>
      <div class="modal-body">
      <form action="${path }/uploadMatching.do" method="post" id="uploadMatching">
      제목 : <input type="text" name="machingTitle" id="machingTitle" class="form-control" style="width:50%;"><br>
      날짜 : <input type="date" name="machingDate" id="machingDate" class="form-control" style="width:50%;"><br>
      시간 : <input type="text" name="machingTime" id="machingTime" class="form-control" style="width:50%;"><br>
      장소 : <input type="text" name="machingPlace" id="machingPlace" class="form-control" style="width:50%;"><br>
      내용 : <input type="text" name="machingContent" id="machingContent" class="form-control" style="width:50%;"><br>
      
      </form>
      
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" onclick="uploadMatching()">업로드</button>
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
        	<form id="matchingFrm" action="${path }/send_Matching.do" method="post">
        	
        	<h4 id="Title" class="modal-title" style="color:black;"></h4>
        	<input type="hidden" name="machingTitle" id="machingTitleIn">
        	<br>
         	<h5 id="Place" class="modal-title" style="color:black;"> </h5>
         	<input type="hidden" name="machingPlace" id="machingPlaceIn">
         	<br>
         	<h5 id="Content" class="modal-title" style="color:black;"> </h5>
         	<input type="hidden" name="machingContent" id="machingContentIn">
         	<br>
         	<h5 id="Time" class="modal-title" style="color:black;"> </h5>
         	<input type="hidden" name="machingTime" id="machingTimeIn">
         	
         	<input type="hidden" name="machingDate" id="machingDateIn">

         	</form>
         	
         	
         	<br><br><br>
         	
         	
         	
         </div>
        <div class="modal-footer">
         	<span style="margin-left:35%;"><input type="button" value="매칭신청" class="btn btn-success" onclick="matchingFrm()">
         	 <input type="button" value="취소" class="btn btn-danger"></span>
         	
        </div>
    </div>
</div>
</div>

<script>
function matchingFrm(){
	$('#matchingFrm').submit();
}
function uploadMatching(){
	$('#uploadMatching').submit();
	
}

</script>