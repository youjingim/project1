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
	<br><span style="font-size:35px;color:gray;font-weight:bold;margin-left:3%;">With Us</span>
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
	<button type="button" class="btn btn-success" style="margin-left:90%;margin-bottom:10px;cursor:pointer;">+</button>	
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
          
        }
        ,
        {
            title: '승하형 바보',
            start: '2018-04-06',
            modalContent:'야구매칭',
            modalPlace:'kj교육원',
        },
        {
            title: '서영누나 바보',
            start: '2018-04-16',
            modalContent:'야구매칭',
            modalPlace:'kj교육원',  
        },
          {
              title: '슬기도 바보',
              start: '2018-04-06',
              modalContent:'봉사매칭',
              modalPlace:'kh교육원1',
            }
        ],
        eventClick: function(event) {
        	 $('#modalTitle').html('동아리 이름 : '+ event.title);
        	 $('#modalContent').html('내용 : ' + event.modalContent);
             $('#modalPlace').html('장소 : ' + event.modalPlace);
        	 $('#calendarModal').modal();
        }

    });

    calendar.render();
  });

</script>

<div id="calendarModal" class="modal">
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span> <span class="sr-only">close</span></button>
            <h4 style="color:black;">Matching</h4>
        </div>
        <div id="modalBody" class="modal-body">
        	<h4 id="modalTitle" class="modal-title" style="color:black;"> </h4>
        	<br>
         	<h5 id="modalPlace" class="modal-title" style="color:black;"> </h5>
         	<br>
         	<h5 id="modalContent" class="modal-title" style="color:black;"> </h5>
         	
         	<br><br><br>
         	
         	
         </div>
        <div class="modal-footer">
            <form action="#" method="post">
         	<span style="margin-left:35%;"><input type="button" value="매칭신청" class="btn btn-success" onclick="alert('매칭이 신청되었습니다!');location.href='${path}/calendargo.do'">
         	 <input type="button" value="취소" class="btn btn-danger"></span>
         	</form>
         	
        </div>
    </div>
</div>
</div>