<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<c:set var = 'path' value='<%=request.getContextPath()%>'/>
<style>
body {font-family: Arial;
color:black;
}
section{
width:100%;
height:900px;
position:relative;
top:570px;
background-color:white;
z-index:10;
}

section div#message_container{
width:100%;
height:100%;
position:relative;
z-index:10;
background-color:white;
top:30px;
}
/* Style the tab */
.tab {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
    font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
    background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
    background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
    display: none;
    padding: 6px 12px;
    max-width:1200px;
    margin:0 auto;
    /* border: 1px solid #ccc; */
    border-top: none;
}
table {
    border-collapse: collapse;
    border-spacing: 0;
    width: 100%;
    border: 1px solid #ddd;
}
th, td {
    text-align: center;
}
tr{
  height: 50px;
}
tr:nth-child(even) {
    background-color: #f2f2f2
}
label{
  margin-left:5px;
}

</style>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value=' ' name='pageTitle'/>
</jsp:include>
<section>
<div id="message_container" >
<div class="tab">
  <button class="tablinks" onclick="openCity(event, 'receive')">받은 쪽지함</button>
  <button class="tablinks" onclick="openCity(event, 'send')">보낸 쪽지함</button>
</div>

<div id="receive" class="tabcontent">
  <h3>내가 받은 쪽지함</h3>
  <table>
  <tr>
    <th style="text-align:center;">선택</th>
    <th style="text-align:center;">보낸 사람</th>
    <th style="text-align:center;">제목</th>
    <th style="text-align:center;">내용</th>
    <th style="text-align:center;">받은 날짜</th>
    
  </tr>
  <c:if test="${not empty ReceiveList }">
	  <c:forEach items="${ReceiveList }" var='r' varStatus="rStauts">
		  <tr>
		    <td>
		      <div class="checkbox">
		        <label><input type="checkbox" value=""></label>
		      </div>
		    </td>
		    <td>${r.message_sender }</td>
		    <td>${r.message_title }</td>
		    <td>${r.message_content }</td>
		    <td>${r.message_date }</td>
		    
		  </tr>
	  </c:forEach>
  </c:if>
</table>
<div style="margin-top:5px;">
<button type="button" class="btn btn-info">전체선택</button>
<button type="button" class="btn btn-warning">선택삭제</button>
</div>
	<div class="pagination" style="display: table;margin-right: auto;margin-left: auto;">
	        ${rPageBar }
	      </div>
</div>

<div id="send" class="tabcontent">
  <h3>내가 보낸 쪽지함</h3>
  <table>
  <tr>
    <th style="text-align:center;">선택</th>
    <th style="text-align:center;">보낸 사람</th>
    <th style="text-align:center;">제목</th>
    <th style="text-align:center;">내용</th>
    <th style="text-align:center;">받은 날짜</th>
    
  </tr>
  <c:if test="${not empty SendList }">
	  <c:forEach items="${SendList }" var='s' varStatus="sStatus">
		  <tr>
		    <td>
		      <div class="checkbox">
		        <label><input type="checkbox" value=""></label>
		      </div>
		    </td>
		    <td>${s.message_receiver }</td>
		    <td>${s.message_title }</td>
		    <td>${s.message_content }</td>
		    <td>${s.message_date }</td>
		  </tr>
	  </c:forEach>
 </c:if>
</table>
<div style="margin-top:5px;">
<button type="button" class="btn btn-info">전체선택</button>
<button type="button" class="btn btn-warning">선택삭제</button>
</div>
<div class="pagination" style="display: table;margin-right: auto;margin-left: auto;">
	        ${sPageBar }
	      </div>
</div>
</div>
<script>
function openCity(evt, cityName) {
    var i, tabcontent, tablinks;
     tabcontent = document.getElementsByClassName("tabcontent");
	 
     for (i = 0; i < tabcontent.length; i++) {
       console.log(tabcontent);
         tabcontent[i].style.display = "none";
     }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>      
</section>
      
