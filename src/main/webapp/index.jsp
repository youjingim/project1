<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
    <%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
    <%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
    <c:set var='path' value="${pageContext.request.contextPath}"/>
    
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Poiret+One" rel="stylesheet">
<style>

body{
margin:0px;

}
section{
width:100%;
height:820px;
position:relative;
background-image:url('resources/image/background.jpg');
background-size:cover;
margin:0px;
}
#login_container{
position:relative;
top:80px;
width:30%;
height:600px;
background: #ffffff; background: rgba(255, 255, 255, 0);
left:60%;
}
.main_logo{
font-family: 'Lobster', cursive;
font-size:80px;
color:white;
position:absolute;
left:20%;
top:50px;
width:430px;
font-family: 'Poiret One', cursive;
font-weight:900;
}

.loginBar{
width:370px;
height:200px;
position:absolute;
top:220px;
left:25%;
}
.loginBar input{
height:50px;
}
.loginBar button{
height:50px;
font-weight:bold;
font-size:20px;
background-color:#6CC0FF;
border:none;color:white;
}

@media screen and (max-width: 1110px) {
#login_container{
left:16%;
}
.main_logo{
left:10%;
}

}

@media screen and (max-width: 1200px) {
#modal_move{
margin-left:100px;
}
}

#Enroll_container{
position:relative;
top:30px;
width:1100px;
height:700px;
background: white;
overflow:scroll;
}
.checkbox label:after, .radio label:after {
   content: '';
   display: table;
   clear: both;
}

.checkbox .cr, .radio .cr {
   position: relative;
   display: inline-block;
   border: 1px solid #a9a9a9;
   border-radius: .25em;
   width: 1.3em;
   height: 1.3em;
   float: left;
   margin-right: .5em;
}

.radio .cr {
   border-radius: 50%;
}

.checkbox .cr .cr-icon, .radio .cr .cr-icon {
   position: absolute;
   font-size: .8em;
   line-height: 0;
   top: 50%;
   left: 20%;
}

.radio .cr .cr-icon {
   margin-left: 0.04em;
}

.checkbox label input[type="checkbox"], .radio label input[type="radio"]
   {
   display: none;
}

.checkbox label input[type="checkbox"]+.cr>.cr-icon, .radio label input[type="radio"]+.cr>.cr-icon
   {
   transform: scale(3) rotateZ(-20deg);
   opacity: 0;
   transition: all .3s ease-in;
}

.checkbox label input[type="checkbox"]:checked+.cr>.cr-icon, .radio label input[type="radio"]:checked+.cr>.cr-icon
   {
   transform: scale(1) rotateZ(0deg);
   opacity: 1;
}

.checkbox label input[type="checkbox"]:disabled+.cr, .radio label input[type="radio"]:disabled+.cr
   {
   opacity: .5;
}

</style>
</head>
<body>
<section>
<div id="login_container">
<div class="main_logo">Campus Pick</div>
<form id="login_Frm" action="${pageContext.request.contextPath}/member/memberLogin.do" method="post">
<span class="loginBar">
<input type="text" class="form-control" name="userId" placeholder="아이디" autofocus>
<br>
<input type="password" class="form-control" placeholder="비밀번호" name="password">
<br><br>
  <button type="button" class="btn btn-primary btn-block" onclick="login()">로 그 인</button>
  <br><br>
 <span style="color:black;font-size:17px;margin-left:18%;">계정이 없으신가요? &nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#myModal" style="font-weight:bold;text-decoration:none;color:black;">가입하기</a></span><br><br>
 
 <span style="color:black;font-size:15px;margin-left:22%;">아이디 찾기&nbsp;&nbsp;&nbsp;비밀번호 찾기 </span>
</span>
</form>
</div>

</section>
<script>
function login(){
	$('#login_Frm').submit();
	
}

</script>

<div class="modal fade" id="myModal" role="dialog">
    <div id="modal_move" class="modal-dialog" style="margin-left:310px;">
    
      <!-- Modal content-->
     <div id="Enroll_container">
  <br>
      <br> <span
         style='font-size: 30px; font-weight: bold; margin-left: 50px;'>회원가입</span>
      <br>
      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span> <span class="sr-only">close</span></button>
      <hr />

           <span style="display:inline-block;position:absolute;right:30px;"><img src="resources/image/join.jpg" width="350px" height="600px"></span>

      <div class="col-sm-6 col-md-offset-3" style='margin-left:5%; display:inline-block;'>
      
         <form action='${path }/member/memberEnrollEnd.do' method='post'>
            <div class="form-group">
               <label for="inputId">ID</label><span style="color: blue">
                  (*)</span> <input type="text" class="form-control" id="inputId"
                  placeholder="ID를 입력해 주세요" style='width:200px'>
            </div>
            <div class="form-group">
               <label for="inputnick">닉네임</label> <input type="text"
                  class="form-control" id="inputnick" placeholder="별명을 입력해 주세요" style='width:200px'> 
            </div>
            <div class="form-group">
               <label for="inputName">이름</label><span style="color: blue">
                  (*)</span> <input type="text" class="form-control" id="inputName" style='width:200px'
                  placeholder="이름을 입력해 주세요">
            </div>
            <div class="form-group">
               <label for="inputPassword">비밀번호</label><span style="color: blue">
                  (*)</span> <input type="password" class="form-control" id="inputPassword"
                  placeholder="비밀번호를 입력해주세요" style='width:300px'>
            </div>
            <div class="form-group">
               <label for="inputPasswordCheck">비밀번호 확인</label><span
                  style="color: blue"> (*)</span> <input type="password"
                  class="form-control" id="inputPasswordCheck"
                  placeholder="비밀번호 확인을 위해 다시 입력 해 주세요"style='width:300px'>
            </div>
            
            <div class="form-group">
               <label for="inputMobile">휴대폰 번호</label><span style="color: blue">
                  (*)</span> <br/>
                  <select name='tel'class="form-control" style='width:90px; display:inline-block;'>
                       <option value='010'>010</option>
                       <option value='011'>011</option>
                       <option value='019'>019</option>
                       <option value='070'>070</option>
                  </select>-
                  <input type="tel" class="form-control" maxlength="4" onKeyDown="checkKeysInt(event,'');" onKeyUp="checkKeysInt(event,'');" id="inputMobilemiddle" style='width:90px; display:inline-block;'>-
                  <input type="tel" class="form-control" maxlength="4" onKeyDown="checkKeysInt(event,'');" onKeyUp="checkKeysInt(event,'');" id="inputMobilelast" style='width:90px; display:inline-block;'>
            </div>
            <div class="form-group">
               <label for="InputEmail">이메일 주소</label><span style="color: blue">
                  (*)</span><br> <input type="email" class="form-control" id="InputEmail" style='width:150px; display:inline-block'
                  placeholder="이메일 주소를 입력해주세요">@
                  <input type='text' class='form-control' name='inputEmail2' id='inputEmail2' style='width:150px;display:inline-block' readonly>
                  <select id='email_select' name='email_select' class="form-control" style='width:150px; display:inline-block;'>
                       <option value="" selected>선택하세요</option>
                       <option value='naver.com'>naver.com</option>
                       <option value='gmail.com'>gmail.com</option>
                       <option value='daum.net'>daum.net</option>
                       <option value='1'>직접입력</option>
                  </select>
            </div>

            <div class="form-group">
               <label for="inputAddress">주소</label> <span style="color: blue">
                  (*)</span><br/> 
                  <input type="text" class="form-control btn btn-outline" id="sample6_postcode" style="width:300px; background-color:white;" placeholder="우편번호"  readonly>
                  <input type="button" onclick="sample6_execDaumPostcode()" class="btn" value="우편번호 찾기"><br>
                  <input type="text" class="form-control btn btn-outline-secondary"id="sample6_address" style="width:300px; background-color:white;" placeholder="주소"readonly>
                  <input type="text"class="form-control btn btn-outline-secondary" id="sample6_address2" style="width:300px" placeholder="상세주소">
            </div>

            <div class="form-group">
               <label for="inputAddress">관심분야</label>
            </div>
            <div class="col-sm-12">
               <div class="checkbox" style="display:inline-block;">
                  <label> <input type="checkbox" value="sport" > <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span> 운동</label>
            
               </div>
               <div class="checkbox" style="display:inline-block;">
                  <label> <input type="checkbox" value="help" > <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span> 봉사
                  </label>
               </div>
               <div class="checkbox" style="display:inline-block;">
                  <label> <input type="checkbox" value="book" > <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span> 독서
                  </label>
               </div>
               <div class="checkbox" style="display:inline-block;">
                  <label> <input type="checkbox" value="trip" > <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span> 여행
                  </label>
               </div>
               <div class="checkbox" style="display:inline-block;">
                  <label> <input type="checkbox" value="study" > <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span> 학습
                  </label>
               </div>
               <br>
               <div class="checkbox" style="display:inline-block;">
                  <label> <input type="checkbox" value="religion" > <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span> 종교
                  </label>
               </div>
               <div class="checkbox" style="display:inline-block;">
                  <label> <input type="checkbox" value="photo" > <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span> 사진
                  </label>
               </div>
               <div class="checkbox" style="display:inline-block;">
                  <label> <input type="checkbox" value="music" > <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span> 음악
                  </label>
               </div>
               <div class="checkbox" style="display:inline-block;">
                  <label> <input type="checkbox" value="game" > <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span> 게임
                  </label>
               </div>
               <div class="checkbox" style="display:inline-block;">
                  <label> <input type="checkbox" value="dance" > <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span> 댄스
                  </label>
               </div>
            </div>
            <br>
            <br>
            <br>
            <br>
            <br>
         
            <div class="form-group">
               <label>약관 동의</label>
               <div data-toggle="buttons">
                  <label class="btn btn-primary active"> <span
                     class="fa fa-check"></span> <input id="agree" type="checkbox"
                     autocomplete="off" checked>
                  </label> <a style="color:black" href="#">이용약관</a>에 동의합니다.
               </div>
            </div>
            <br/>
            <div class="form-group" style='margin:0 0 10% 10%'>
               <button type="submit" id="join-submit" class="btn btn-primary" >
                  회원가입<i class="fa fa-check spaceLeft"></i>
                  </button>
               &nbsp;
               <button type="reset" class="btn btn-warning">
                  다시작성<i class="fa fa-times spaceLeft"></i>
               </button>
            </div>
         </form>




</div>
</div>
      
    </div>
  </div>
  
<script>
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
            document.getElementById('sample6_address2').focus();
        }
    }).open();
}
  $(function(){
    // 회원 가입 처리
    $('#join-submit').click(function(e){
                
        if($("#inputName").val() ==''){
            alert('이름을 입력하세요');
            $("#inputName").focus();
            return false;
        }
         if($("#inputMobilemiddle").val() ==''){
            alert('휴대폰 번호를 입력하세요');
            $("#inputMobilemiddle").focus();
            return false;
        }
         if($("#inputMobilelast").val() ==''){
             alert('휴대폰 번호를 입력하세요');
             $("#inputMobilelast").focus();
             return false;
         }

        var email = $('#InputEmail').val();
        var email2=$('#inputEmail2').val();
        if(email == ''){
            alert('이메일 ID를 입력하세요');
            $("#InputEmail").focus();
            return false;
        } else if(email2=='') {
           alert('이메일 주소를 입력하세요');
            $("#InputEmail2").focus();
        }
        
        if($("#agree").is(":checked") == false){
            alert('약관에 동의하셔야 합니다');
            return false;      
       }
    });
  });
   
function checkKeysInt(e,event) {
     if(event.keyCode) {
       var code = event.keyCode;
       if ((code >= 48 && code <= 57) || (code >= 96 && code <= 105) || (code==8) || (code==9) || (code==46)) {
         return;
       } else {
         e.returnValue = false;
         alert('숫자만 입력하세요!');
         $("#inputMobileMiddle").val('');
       }
     } else if (e.which) {
       var code = e.which;
       if ((code >= 48 && code <= 57) || (code >= 96 && code <= 105) || (code==8) || (code==9) || (code==46)) {
         return;
       } else {
         e.preventDefault();
         alert('숫자만 입력하세요!');
       }
     }
   }
$(function() {
   $('#email_select').change(function(){ 
         if($(this).val()== '1'){ 
            $("#inputEmail2").val('');
            $("#inputEmail2").prop("readonly",false); 
         }else{ 
            $("#inputEmail2").val($('#email_select').val());
            $("#inputEmail2").prop("readonly",true); 
         } 
      }); 
   });
</script>


</body>
</html>





