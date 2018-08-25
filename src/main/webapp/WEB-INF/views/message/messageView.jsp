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
    text-align: left;
    padding-left:10px;
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
.btn{
  margin: 5px;
}
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    max-width:800px;
}

/* The Close Button */
.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
</style>

<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value=' ' name='pageTitle'/>
</jsp:include>
<section style="color:black">
<div id="message_container" >
<div class="tab">
  <button class="tablinks" onclick="receiveMessage('${memberLoggedIn.member_id}')">받은 쪽지함</button>
  <button class="tablinks" onclick="sendMessage('${memberLoggedIn.member_id}')">보낸 쪽지함</button>
</div>

<div id="receive" class="tabcontent" >
  <h3 style="text-align:center;">내가 받은 쪽지함</h3><br>
  <table style="max-width:1000px; display: table;margin-right: auto;margin-left: auto; color:black" >
    <tr style="background-color:#E1E1E1; height:50px;">
      <td class="td_title"><strong>제목</strong></td>
      <td> ${message.message_title }</td>
    </tr>
  <tr>
    <td class="td_title"><strong>보낸이</strong></td>
    <td> ${message.message_sender }</td>
  </tr>
  <tr>
    <td class="td_title"><strong>받는이</strong></td>
    <td> ${message.message_receiver }</td>
  </tr>
  <tr>
    <td class="td_title"><strong>보낸 날짜</strong></td>
    <td> ${message.message_date }</td>
  </tr>
  <tr>
    <td class="td_title"><strong>내용</strong></td>
    <td>${message.message_content }</td>
  </tr>
</table>
  <!-- 버튼 묶은 div -->
  <div style="margin-top:10px;display: table;margin-right: auto;margin-left: auto;" >
    <button type="button" class="btn btn-success" onclick="messageList('${message.message_receiver }')">목록</button>
    <button type="button" class="btn btn-info" id="myBtn">답변</button>
    <button type="button" class="btn btn-warning" onclick="deleteMessage(${message.message_num},'${message.message_receiver }')">삭제</button>
  </div>
</div>
</div>

<!-- Trigger/Open The Modal -->
<button id="myBtn" class="btn info">쪽지 보내기</button>

<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <h3>답변하기</h3>
    <hr>
    <form action="${path }/reSendMessage2.do" method="post" onsubmit="return validate();">
    <div class="form-group">
      <label for="member_receive">받는사람</label>
      <input type="text" class="form-control" id="member_receive" name="yid" value="${message.message_sender }">
    </div>
    <div class="form-group">
      <label for="pwd">보내는사람</label>
      <input type="text" class="form-control" id="pwd" name="mid"value="${message.message_receiver }">
    </div>
    <div class="form-group">
      <label for="title">제목</label>
      <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요">
    </div>
    <div class="form-group">
      <label for="comment">내용</label>
      <textarea class="form-control" rows="5" id="comment" name="content" placeholder="내용을 입력해주세요"></textarea>
    </div>
    <input type="submit" class="btn btn-default" value="전송"/>
    <input type="reset" class="btn btn-default" value="취소"/>
    </form>
  </div>

</div>
<script>
function validate(){
    var content = $("[name=content]").val();
    var title=$("[name=title]").val();
    if(title.trim().length==0){
    	alert("제목을 입력해주세요.");
	   	return false;
    }
    if(content.trim().length==0){
        alert("내용을 입력하세요");
        return false;
    }
    return true;
}
function sendMessage(id) {
   	location.href="${path }/myMessage2.do?member_id="+id;
}
function receiveMessage(id) {
	location.href="${path }/myMessage.do?member_id="+id;
}
function messageList(id){
	location.href="${path }/myMessage.do?member_id="+id;
}
function deleteMessage(message_num,mid){
	var con=confirm('삭제하시겠습니까?');
	if(con==true){
		location.href="${path }/deleteMessage.do?message_num="+message_num+"&mid="+mid;
	}
	else{
		history.go();
	}
}

//Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>      
</section>
      
