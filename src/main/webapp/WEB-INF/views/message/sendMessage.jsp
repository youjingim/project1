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
/* visited link */
a:visited {
    color: black;
}
a:link {
    color: black;
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
    display: block;
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
<section style="color:black">
<div id="message_container" >
<div class="tab">
  <button class="tablinks" onclick="receiveMessage('${member_id}')">받은 쪽지함</button>
  <button class="tablinks" onclick="sendMessage('${member_id}')">보낸 쪽지함</button>
</div>
<div id="send" class="tabcontent">
  <h3>내가 보낸 쪽지함</h3>
  <table style="color:black">
  <tr>
    <th style="text-align:center;"><input type="checkbox" id="checkall" /></th>
    <th style="text-align:center;">받은 사람</th>
    <th style="text-align:center;">제목</th>
    <th style="text-align:center;">내용</th>
    <th style="text-align:center;">받은 날짜</th>
    
  </tr>
  <c:if test="${not empty SendList }">
	  <c:forEach items="${SendList }" var='s' varStatus="sStatus">
		  <tr>
		    <td>
		      <div class="checkbox">
		        <label><input type="checkbox" name="chk" value="${s.message_num }"></label>
		      </div>
		    </td>
		    <td>${s.message_receiver }</td>
		    <td><a href='${path }/messageView2.do?message_num=${s.message_num }'>${s.message_title }</a></td>
		    <td>${s.message_content }</td>
		    <td>${s.message_date }</td>
		  </tr>
	  </c:forEach>
 </c:if>
</table>
<div style="margin-top:5px;">
<button type="button" class="btn btn-warning">선택삭제</button>
</div>
<div class="pagination" style="display: table;margin-right: auto;margin-left: auto;">
	        ${PageBar }
	      </div>
</div>
</div>
<script>
function sendMessage(id) {
	   location.href="${path }/myMessage2.do?member_id="+id;
	}
	function receiveMessage(id) {
		   location.href="${path }/myMessage.do?member_id="+id;
		}
	$(document).ready(function(){
	    $("#checkall").click(function(){
	        if($("#checkall").prop("checked")){
	            $("input[name=chk]").prop("checked",true);
	        }else{
	            $("input[name=chk]").prop("checked",false);
	        }
	    })
	})	
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>      
</section>
      
