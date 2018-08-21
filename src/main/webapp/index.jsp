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
th{
	width:50px;
}
section{
width:100%;
height:100%;
position:relative;
background-image:url('http://www.cdu.ac.kr/common/file/getImage.do?atchFileId=FILE_000000000305508');
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
#find_container{
position:relative;
top:30px;
width:700px;
height:350px;
background: white;
overflow:scroll;
margin:0 auto;
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
.input-group {
    margin-top: 1em;
    margin-bottom: 1em;
} 

</style>
</head>
<body>
<section>
<div id="login_container">
<div class="main_logo">CampusPick</div>
<form id="login_Frm" action="${pageContext.request.contextPath}/member/memberLogin.do" method="post">
<span class="loginBar">
<input type="text" class="form-control" id="login_id" name="member_id" placeholder="아이디" autofocus>
<br>
<input type="password" class="form-control" placeholder="비밀번호" id="login_pw" name="member_pw">
<br><br>
  <button type="submit" class="btn btn-primary btn-block" onclick="login()">로 그 인</button>


  
    <br><br>
 <span style="color:black;font-size:17px;margin-left:18%;">계정이 없으신가요? &nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#myModal" style="font-weight:bold;text-decoration:none;color:black;">가입하기</a></span><br><br>
 
 <span style="color:black;font-size:15px;margin-left:22%;"><a href="#" data-toggle="modal" data-target="#idModal" >아이디 찾기</a>&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#passwordModal" >비밀번호 찾기 </a></span>
</span>
</form>
</div>

</section>
<script>
function login(){
	if($("#login_id").val() ==''){
        alert('ID를 입력하세요');
        $("#login_id").focus();
    }
	else if($("#login_pw").val() ==''){
        alert('비밀번호를 입력하세요');
        $("#login_pw").focus();
    }else {
	   $('#login_Frm').submit();
    	
    }
   
}

</script>
<div class="modal fade" id="idModal" role="dialog">
    <div id="modal_move" class="modal-dialog" style="margin-left:310px; width:900px; overflow-x:hidden; overflow-y:hidden;">
         <div id="find_container">
  <br>
      <br> <span
         style='font-size: 30px; font-weight: bold; margin-left: 40%;'>아이디 찾기</span>
      <br>
      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span> <span class="sr-only">close</span></button>
      <hr />

           <span style="display:inline-block;position:absolute;right:30px;"></span>

      <div id="checkedId" class="col-sm-6 col-md-offset-3" style='width:630px; margin-left:5%; display:inline-block;'>
				            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                <input type="text" name="fid_name" id="fid_name" placeholder="이름을 입력하세요" style='width:150px' class="form-control" required/>
                            </div>

							<div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
				<input type="text" class="form-control" id='fid_email1' name='member_email1' style='width:150px; display:inline-block'
                  placeholder="이메일 ID를 입력해주세요" required><span style="display:inline-block; float:left;">@</span>
                  <input type='text' class='form-control' id='fid_email2' name='member_email2'  style='width:150px;display:inline-block' readonly>
                  <select id='fid_select' class="form-control" style='width:150px; display:inline-block;'>
                       <option value="" selected>선택하세요</option>
                       <option value='naver.com'>naver.com</option>
                       <option value='gmail.com'>gmail.com</option>
                       <option value='daum.net'>daum.net</option>
                       <option value='1'>직접입력</option>
                  </select>                            
                  </div>
               <button type='button' class="btn" style='display:inline-block' onclick="fn_fidcheck();" id='fidbtn'>이메일인증</button>
			<br>
				<button class="btn btn-success" type='submit' style='margin-left:45%'onclick="return idView()">확인</button>
				<script>
				var searchID=$('#idsearch').html();
				function idView(){
					if($("#fid_name").val()==''){
				        alert('이름을 입력하세요');
				        return false;      
				  	}
					if($("#fid_email1").val()==''){
				        alert('이메일을 입력하세요');
				        return false;      
				  	}
		    		$.ajax({
		    			url:"${path}/member/findId.do",
		    			data:{"fid_name":$('#fid_name').val(),"member_email1":$('#fid_email1').val(),"member_email2":$('#fid_email2').val()},
		    			type:'get',
		    			async:false,
		    			success:function(data){
		    				if(data!="null"){
		    					$('#checkedId').html("아이디 찾기 결과 : "+data);	
		    				}else{
		    					$('#checkedId').html("찾으시는 아이디가 없습니다."+"<button class='btn' type='button' onclick='back()'>뒤로</button>");
		    				}
				}
		    		});
				} 
				
				function back(){
					
				}
				</script>
		</div>
		</div>
		</div>
		</div>

<div class="modal fade" id="passwordModal" role="dialog">
    <div id="modal_move" class="modal-dialog" style="margin-left:310px; width:900px; overflow-x:hidden; overflow-y:hidden">
         <div id="find_container">
  <br>
      <br> <span
         style='font-size: 30px; font-weight: bold; margin-left: 40%;'>비밀번호 찾기</span>
      <br>
      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span> <span class="sr-only">close</span></button>
      <hr />

           <span style="display:inline-block;position:absolute;right:30px;"></span>

      <div class="col-sm-6 col-md-offset-3" style='width:635px; margin-left:5%; display:inline-block;'>
    
    <form action="<%=request.getContextPath()%>/member/findPw.do" method="post" >
				<div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input type="text" name="fpw_id"  value='' placeholder="ID를 입력하세요" style='width:150px; display:inline-block;' class="form-control" required/>
                                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                <input type="text" name="fpw_name" value='' placeholder="이름을 입력하세요" style='width:150px; display:inline-block;' class="form-control" required/>
                            </div>
			
							<div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
				<input type="text" class="form-control" id='fpw_email1' name='member_email1' style='width:150px; display:inline-block'
                  placeholder="이메일 ID를 입력해주세요" required><span style="display:inline-block; float:left;">@</span>
                  <input type='text' class='form-control' id='fpw_email2' name='member_email2'  style='width:150px;display:inline-block' readonly>
                  <select id='fpw_select' class="form-control" style='width:150px; display:inline-block;'>
                       <option value="" selected>선택하세요</option>
                       <option value='naver.com'>naver.com</option>
                       <option value='gmail.com'>gmail.com</option>
                       <option value='daum.net'>daum.net</option>
                       <option value='1'>직접입력</option>
                  </select>                         
                                <button type="button" class="btn" style='display:inline-block; ' onclick="fn_fpwcheck();" id='fpwbtn'>이메일인증</button>
                  </div>
                                
			
				<button name='next' class="btn btn-success" type='submit' style='margin-left:45%' onclick="return pwCheck()">확인</button>
		</form>
		</div>
		</div>
		</div>
		</div>
		<script>
		function pwCheck(){

		if($("#fid_name").val()==''){
	        alert('이름을 입력하세요');
	        return false;      
	  	}
		if($("#fid_email1").val()==''){
	        alert('이메일을 입력하세요');
	        return false;      
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

           <span style="display:inline-block;position:absolute;right:30px;"></span>

      <div class="col-sm-6 col-md-offset-3" style='margin-left:5%; display:inline-block;'>
      
         <form action='${path }/member/memberEnrollEnd.do' method='post'>
            <div class="form-group">
               <label for="member_id">ID</label><span style="color: blue">
                  (*)</span> <input type="text" class="form-control" id="member_id" name="member_id"
                  placeholder="ID를 입력해 주세요" style='width:200px'>
                <span id='idcheck' style='margin:10px;'></span>
            </div>
            <div class="form-group">
               <label for="member_pw">비밀번호</label><span style="color: blue">
                  (*)</span> <input type="password" class="form-control" id="member_pw" name='member_pw'
                  placeholder="비밀번호를 입력해주세요" style='width:300px'>
                  <span id='pwcheck' style='margin:10px;'></span>
                  
            </div>
            <div class="form-group">
               <label for="member_pwCheck">비밀번호 확인</label><span
                  style="color: blue"> (*)</span> <input type="password"
                  class="form-control" id="member_pwCheck" name='member_pwCheck'
                  placeholder="비밀번호 확인을 위해 다시 입력 해 주세요"style='width:300px'>
                  <span id='pwcheck2' style='margin:10px;'></span>
                  
            </div>
            <div class="form-group">
               <label for="member_name">이름</label><span style="color: blue">
                  (*)</span> <input type="text" class="form-control" id="member_name" name='member_name' style='width:200px'
                  placeholder="이름을 입력해 주세요">
            </div>
            <div class="form-group">
               <label for="member_birth">생년월일</label><span style="color: blue">
                  (*)</span> <input type="Date" class="form-control" id="member_birth" name='member_birth' style='width:200px'>
            </div>
            <div class="form-group">
               <label for="university">소속 대학</label><span style="color: blue">
                  (*)</span><br> <input type="text" class="form-control" id="university" name='university' style='width:200px; display:inline-block'
                  placeholder="대학교를 선택하세요" readonly>
                  <select id='school_select' name='school_select' class="form-control" style='width:150px; display:inline-block;'>
                       <option value="" selected>선택하세요</option>
                       <option value='서울대학교'>은경호롤롤롤로대학교</option>
                       <option value='연세대학교'>연세대학교</option>
                       <option value='고려대학교'>고려대학교</option>
                       <option value='경희대학교'>경희대학교</option>
                       <option value='홍익대학교'>홍익대학교</option>
                       <option value='성균관대학교'>성균관대학교</option>
                       <option value='서강대학교'>서강대학교</option>
                       <option value='한양대학교'>한양대학교</option>
                       <option value='1'>직접입력</option>
                  </select>
            </div>
            <div class="form-group">
               <label for="phone">휴대폰 번호</label><span style="color: blue">
                  (*)</span> <br/>
                  <select name='member_phone1' class="form-control" style='width:90px; display:inline-block;'>
                       <option value='010'>010</option>
                       <option value='011'>011</option>
                       <option value='019'>019</option>
                       <option value='070'>070</option>
                  </select>-
                  <input type="tel" name='member_phone2' class="form-control" maxlength="4" onKeyDown="checkKeysInt(event,'');" onKeyUp="checkKeysInt(event,'');" id="inputMobilemiddle" style='width:90px; display:inline-block;'>-
                  <input type="tel" name='member_phone3' class="form-control" maxlength="4" onKeyDown="checkKeysInt(event,'');" onKeyUp="checkKeysInt(event,'');" id="inputMobilelast" style='width:90px; display:inline-block;'>
            </div>
            <div class="form-group">
               <label for="Email">이메일 주소</label><span style="color: blue">
                  (*)</span><br> <input type="text" class="form-control" id="member_email1" name='member_email1' style='width:150px; display:inline-block'
                  placeholder="이메일 ID를 입력해주세요">@
                  <input type='text' class='form-control' name='member_email2' id='member_email2' style='width:150px;display:inline-block' readonly>
                  <select id='email_select' name='email_select' class="form-control" style='width:150px; display:inline-block;'>
                       <option value="" selected>선택하세요</option>
                       <option value='naver.com'>naver.com</option>
                       <option value='gmail.com'>gmail.com</option>
                       <option value='daum.net'>daum.net</option>
                       <option value='1'>직접입력</option>
                  </select><br>
             
             <span id='check' hidden></span>
            <button type="button" style="margin:10px 10px 10px 70% ;"onclick="fn_emailcheck();" class="btn" id='chbtn'>인증번호 받기</button><br>
            <span id='emailcheck' style='margin:10px;'></span>
            
            </div> 

            <div class="form-group">
               <label for="member_addr">주소</label> <span style="color: blue">
                  (*)</span><br/> 
                  <input type="text" class="form-control btn btn-outline" id="sample6_postcode"  name='member_addr1' style="width:300px; background-color:white;" placeholder="우편번호"  readonly>
                  <input type="button" onclick="sample6_execDaumPostcode()" class="btn" value="우편번호 찾기"><br>
                  <input type="text" class="form-control btn btn-outline-secondary"id="sample6_address" name='member_addr2' style="width:500px; background-color:white;" placeholder="주소"readonly>
                  <input type="text"class="form-control btn btn-outline-secondary" id="sample6_address2" name='member_addr3' style="width:500px" placeholder="상세주소">
            </div>

            <div class="form-group">
               <label for="enroll_category">관심분야</label>
            </div>
            <div class="col-sm-12">
               <div class="checkbox" style="display:inline-block;">
                  <label for='enroll_category1'> <input type="checkbox"name='enroll_category' id='enroll_category1' value="운동"> <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span> 운동</label>
            
               </div>
               <div class="checkbox" style="display:inline-block;">
                  <label for='enroll_category2'> <input type="checkbox" name='enroll_category'  id='enroll_category2' value="봉사" > <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span> 봉사
                  </label>
               </div>
               <div class="checkbox" style="display:inline-block;">
                  <label for='enroll_category3'> <input type="checkbox" name='enroll_category' id='enroll_category3' value="독서" > <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span> 독서
                  </label>
               </div>
               <div class="checkbox" style="display:inline-block;">
                  <label for='enroll_category4'> <input type="checkbox" name='enroll_category' id='enroll_category4'  value="여행" > <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span> 여행
                  </label>
               </div>
               <div class="checkbox" style="display:inline-block;">
                  <label for='enroll_category5'> <input type="checkbox" name='enroll_category' id='enroll_category5' value="학습" > <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span> 학습
                  </label>
               </div>
               <br>
               <div class="checkbox" style="display:inline-block;">
                  <label for='enroll_category6'> <input type="checkbox" name='enroll_category' id='enroll_category6' value="종교" > <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span> 종교
                  </label>
               </div>
               <div class="checkbox" style="display:inline-block;">
                  <label for='enroll_category7'> <input type="checkbox" name='enroll_category' id='enroll_category7' value="사진" > <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span> 사진
                  </label>
               </div>
               <div class="checkbox" style="display:inline-block;">
                  <label for='enroll_category8'> <input type="checkbox" name='enroll_category' id='enroll_category8' value="음악" > <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span> 음악
                  </label>
               </div>
               <div class="checkbox" style="display:inline-block;">
                  <label for='enroll_category9'> <input type="checkbox" name='enroll_category' id='enroll_category9' value="게임" > <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span> 게임
                  </label>
               </div>
               <div class="checkbox" style="display:inline-block;">
                  <label for='enroll_category10'> <input type="checkbox" name='enroll_category' id='enroll_category10' value="댄스" > <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span> 댄스
                  </label>
               </div>
            </div>
            <br>
            <br>
            <br>
            <br>
            <br>
         
			

</div>
<div style="border-left:1px solid darkgray; width:420px; height:900px; padding:10px; display:inline-block">
<table width="400px" cellpadding="4" cellspacing="0" bgcolor=#EEEEEE>
        <tr> 
            <td height=40>&nbsp; <b>회원가입약관</b></td>
        </tr>
        <tr> 
            <td align="center" valign="top"><textarea style="width: 98%" rows=20 readonly class=ed>[이용약관]

제 1 장 총칙

제 1 조 (목적)

본 약관은 CAMPUS PICK이 제공하는 컨텐츠와 서비스를 회원이 이용함에 있어 이용조건 및 절차에 관한 사항과 기타 필요한 사항을 규정함을 목적으로 합니다.

제 2 조 (약관의 효력 및 변경)

① 이 약관은 서비스를 통하여 이를 공지하거나 전자우편, 기타의 방법으로 회원에게 통지함으로써 효력을 발생합니다.
② CAMPUS PICK은 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지 또는 통지함으로써 효력을 발생합니다.

제 3 조 (약관 이외의 준칙)

이 약관에 언급되지 않은 사항이 전기통신기본법, 전기통신사업법, 기타 관련법령에 규정되어 있는 경우 그 규정에 따라 적용할 수 있습니다.

제 4 조 (용어의 정의)

이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
① 회원 : 서비스를 제공 받기 위하여 CAMPUS PICK과 이용계약을 체결하거나 이용자 아이디(ID)를 부여 받은 자를 말합니다.
② 아이디(ID) : 회원의 식별과 서비스를 이용을 위하여 회원이 정하고 CAMPUS PICK이 승인하는 문자와 숫자의 조합을 말합니다.
③ 비밀번호 : 회원이 부여 받은 아이디(ID)와 일치된 회원임을 확인하고 회원 자신의 비밀을 보호하기 위하여 회원이 정한 문자와 숫자의 조합을 말합니다.
④ 해지 : CAMPUS PICK 또는 회원이 서비스를 개통 후 이용계약을 해약 하는 것을 말합니다.


제 2 장 서비스 이용계약 

제 5 조 (이용계약의 성립)

① "이용약관에 동의하십니까?" 라는 이용신청 시의 물음에 회원이 "동의" 버튼을 클릭하면 이 약관에 동의하는 것으로 간주됩니다.
② 이용계약은 서비스 이용희망자의 이용약관 동의 후 신청에 대하여 CAMPUS PICK가 승낙함으로써 성립합니다.

제 6 조 (이용신청)

① 본 서비스를 이용하기 위해서는 CAMPUS PICK 소정의 가입신청 양식에서 요구하는 모든 이용자 정보를 기록하여 신청합니다.
② 가입신청 양식에 기재하는 모든 이용자 정보는 모두 실제 데이터인 것으로 간주됩니다. 설명이나 실제 정보를 입력하지 않은 사용자는 법적인 보호를 받을 수 없으며 서비스의 제한을 받을 수 있습니다.


제 7 조 (이용신청의 승낙)

① CAMPUS PICK은 제6조에 다른 이용 신청 고객에 대하여 제2호, 제3호의 경우를 예외로 하여 서비스 이용신청을 승낙합니다.
② CAMPUS PICK은 다음에 해당하는 경우에 그 신청에 대한 승낙 제한사유가 해소될 때까지 승낙을 유보할 수 있습니다.
가. 서비스 관련 설비에 여유가 없는 경우
나. 기술상 지장이 있는 경우
다. 기타 CAMPUS PICK이 필요하다고 인정되는 경우
③ CAMPUS PICK은 다음에 해당하는 경우에는 이를 승낙하지 아니 할 수 있습니다.
가. 다른 사람의 명의를 사용하여 신청한 경우
나. 이용신청 시 이용자정보를 허위로 기재하여 신청한 경우
다. 사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우
라. 기타 CAMPUS PICK 소정의 이용신청요건을 충족하지 못하는 경우

제 8 조 (이용자정보의 변경)

회원은 이용신청 시 기재한 이용자정보가 변경되었을 경우에는, 온라인으로 수정을 하여야 하며 미변경으로 인하여 발생되는 문제의 책임은 이용자에게 있습니다.

제 3 장 계약 당사자의 의무 

제 9 조 (CAMPUS PICK의 의무)

① CAMPUS PICK는 서비스 제공과 관련하여 취득한 회원의 개인정보를 본인의 사전 승낙 없이 타인에게 공개 또는 배포할 수 없습니다.
단, 다음 각 호의 1에 해당하는 경우는 예외입니다.
가. 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우
나. 범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우
다. 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우
② 1항의 범위 내에서, CAMPUS PICK는 업무와 관련하여 회원 전체 또는 일부의 개인 정보에 관한 통계 자료를 작성하여 이를 사용할 수 있고, 서비스를 통하여 회원의 컴퓨터 쿠키를 전송할 수 있습니다. 이 경우 회원은 쿠키의 수신을 거부하거나 쿠키의 수신에 대하여 경고하도록 사용하는 컴퓨터의 브라우저의 설정을 변경할 수 있습니다. 

제 10 조 (회원의 의무)

① 회원은 서비스 이용 시 다음 각 호의 행위를 하지 않아야 합니다.
가. 다른 회원의 ID를 부정하게 사용하는 행위
나. 서비스에서 얻은 정보를 CAMPUS PICK의 사전승낙 없이 회원의 이용 이외의 목적으로 복제하거나 이를 변경, 출판 및 방송 등에 사용하거나 타인에게 제공하는 행위
다. CAMPUS PICK의 저작권, 타인의 저작권 등 기타 귄리를 침해하는 행위
라. 공공질서 및 미풍양속에 위반되는 내용의 정보, 문장, 도형 등을 타인에게 유포하는 행위
마. 범죄와 결부된다고 객관적으로 판단하는 행위
바. 기타 관계법령에 위배되는 행위
② 회원은 관계법령, 이 약관에서 규정하는 사항, 서비스 이용 안내 및 주의 사항을 준수 하여야 합니다.
③ 회원은 내용별로 CAMPUS PICK가 서비스 공지사항에 게시하거나 별도로 공지한 이용 제한 사항을 준수하여야 합니다.
④ 회원은 CAMPUS PICK의 사전 승낙 없이 서비스를 이용하여 어떠한 영리행위도 할 수 없습니다. 

제 4 장 서비스 제공 및 이용 

제 11 조 (회원 아이디(ID)와 비밀번호 관리에 대한 회원의 의무)

아이디(ID)와 비밀번호에 대한 모든 관리는 회원에게 책임이 있습니다. 회원에게 부여된 아이디(ID)와 비밀번호의 관리소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 전적인 책임은 회원에게 있습니다.
자신의 아이디(ID)가 부정하게 사용된 경우 또는 기타 보안 위반에 대하여, 회원은 반드시 CAMPUS PICK에 그 사실을 통보해야 합니다.

제 12 조 (정보의 제공)

CAMPUS PICK는 회원의 서비스 이용 중 필요가 있다고 인정되는 다양한 정보에 대해서 전자메일이나 서신우편 등의 방법으로 회원에게 제공할 수 있으며, 회원은 원하지 않을 경우 가입신청 메뉴와 회원정보수정 메뉴에서 정보수신거부를 할 수 있습니다.

제 13 조 (광고주와의 거래)

CAMPUS PICK는 본 서비스상에 게재되어 있거나 본 서비스를 통한 광고주의 판촉활동에 회원이 참여하거나 교신 또는 거래의 결과로서 발생하는 모든 손실 또는 손해에 대해 책임을 지지 않습니다.

제 14 조 (회원의 게시물)

CAMPUS PICK는 회원이 본 서비스를 통하여 게시, 게재, 전자메일 또는 달리 전송한 내용물에 대하여 책임을 지지 않으며, 다음 각 호의 1에 해당한다고 판단되는 경우에 사전 통지없이 삭제할 수 있습니다.
① 다른 회원이나 타인을 비방하거나, 프라이버시를 침해하거나, 중상모략으로 명예를 손상시키는 내용인 경우
② 서비스의 안정적인 운영에 지장을 주거나 줄 우려가 있는 경우
③ 범죄적 행위에 관련된다고 인정되는 내용일 경우
④ CAMPUS PICK의 지적재산권, 타인의 지적재산권 등 기타 권리를 침해하는 내용인 경우
⑤ CAMPUS PICK에서 규정한 게시기간을 초과한 경우
⑥ 기타 관계법령에 위반된다고 판단되는 경우 

제 15 조 (게시물에 대한 권리 및 책임)

게시물에 대한 저작권을 포함한 모든 권리 및 책임은 이를 게시한 회원에게 있습니다. 

제 16 조 (메일의 내용)

① CAMPUS PICK는 회원의 메일 내용을 편집하거나 감시하지 않습니다.
② 메일의 내용에 대한 책임은 각 회원에게 있습니다.
③ 회원은 허가를 받지 않고서 음란물이나 불온한 내용, 정크메일(junk mail), 스팸메일(spam mail) 및 타인에게 피해를 주거나 미풍양속을 해치는 메일을 보내서는 안됩니다.
④ 전기통신법, 제 53조와 전기통신사업법 시행령 16조(불온통신), 통신사업법 제 53조 3항에 의거, 음란물이나 불온한 내용을 전송함으로써 발생하는 모든 법적인 책임은 회원에게 있으며 CAMPUS PICK는 책임지지 않습니다.
⑤ 본 서비스를 이용하여 타인에게 피해를 주거나 미풍양속을 해치는 행위를 하신 회원의 아이디(ID)와 메일은 보호 받을 수 없습니다.

제 17 조 (서비스 이용시간)

① 서비스는 CAMPUS PICK의 업무상 또는 기술상의 장애, 기타 특별한 사유가 없는 한 연중무휴, 1일 24시간 이용할 수 있습니다. 다만 설비의 점검 등 CAMPUS PICK가 필요한 경우 또는 설비의 장애, 서비스 이용의 폭주 등 불가항력으로 인하여 서비스 이용에 지장이 있는 경우 예외적으로 서비스 이용의 전부 또는 일부에 대하여 제한할 수 있습니다.
② CAMPUS PICK는 제공하는 서비스 중 일부에 대한 서비스이용시간을 별도로 정할 수 있으며, 이 경우 그 이용시간을 사전에 회원에게 공지 또는 통지 합니다.

제 18 조 (서비스 이용 책임)

회원은 서비스를 이용하여 불법 상품을 판매하는 영업 활동을 할 수 없으며 특히 해킹, 돈벌기 광고, 음란사이트를 통한 상업행위, 상용 S/W 불법배포 등을 할 수 없습니다. 이를 어기고 발생한 영업활동의 결과 및 손실, 관계기관에 의한 구속 등 법적 조치 등에 관해서는 CAMPUS PICK가 책임을 지지 않습니다.

제 5 장 기타 

제 20 조 (계약해지 및 이용제한)

① 회원이 이용계약을 해지하고자 하는 때에는 회원 본인이 CAMPUS PICK에 해지신청을 하여야 합니다.
② CAMPUS PICK는 회원이 다음 각 호의 1에 해당하는 행위를 하였을 경우 사전통지 없이 이용계약을 해지하거나 또는 기간을 정하여 서비스 이용을 중지할 수 있습니다.
가. 타인의 서비스 ID 및 비밀번호를 도용한 경우
나. 서비스 운영을 고의로 방해한 경우
다. 공공질서 및 미풍양속에 저해되는 내용을 고의로 유포시킨 경우
라. 회원이 국익 또는 사회적 공익을 저해할 목적으로 서비스이용을 계획 또는 실행하는 경우
마. 타인의 명예를 손상시키거나 불이익을 주는 행위를 한 경우
바. 서비스의 안정적 운영을 방해할 목적으로 다량의 정보를 전송하거나 광고성 정보를 전송한 경우
사. 정보통신설비의 오작동이나 정보 등의 파괴를 유발시키는 컴퓨터 바이러스프로그램 등을 유포하는 경우
아. CAMPUS PICK, 다른 회원 또는 타인의 지적재산권을 침해하는 경우
자. 정보통신윤리위원회 등 외부기관의 시정요구가 있거나 불법선거 운동과 관련하여 선거관리위원회의 유권해석을 받은 경우
차. 타인의 개인정보, 이용자ID 및 비밀번호를 부정하게 사용하는 경우
카. CAMPUS PICK의 서비스 정보를 이용하여 얻은 정보를 CAMPUS PICK의 사전 승낙없이 복제 또는 유통시키거나 상업적으로 이용하는 경우
타. 회원이 자신의 홈페이지와 게시판에 음란물을 게재하거나 음란사이트를 링크하는 경우
파. 본 약관을 포함하여 기타 CAMPUS PICK가 정한 이용조건 및 관계법령에 위반한 경우

제 21 조 (손해배상)

CAMPUS PICK는 서비스 요금이 무료인 동안의 서비스 이용과 관련하여 회원에게 발생한 어떠한 손해에 관하여도 책임을 지지 않습니다. 

제 22 조 (면책조항)

① CAMPUS PICK는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.
② CAMPUS PICK는 회원의 귀책사유로 인하여 서비스 이용의 장애가 발생한 경우에는 책임이 면제됩니다.
③ CAMPUS PICK는 회원이 CAMPUS PICK의 서비스 제공으로부터 기대되는 이익을 얻지 못하였거나 서비스 자료에 대한 취사 선택 또는 이용으로 발생하는 손해 등에 대해서는 책임이 면제됩니다.
④ CAMPUS PICK는 회원이 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 그 내용에 관하여는 책임이 면제됩니다.

제 23 조 (관할법원)

본 약관 상의 분쟁에 대해 소송이 제기될 경우 CAMPUS PICK의 본사 소재지를 관할하는 법원을 전속 관할법원으로 합니다.

[부칙]

(시행일) 이 약관은 2018년 8월 1일부터 시행합니다.            </textarea></td>
        </tr>
        <tr> 
            <td height=40>&nbsp;       <div class="form-group checkbox">
            <label for='agree1'> <input type="checkbox" name='agree1' id='agree1'> <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
					회원가입약관을 읽었으며 내용에 동의합니다. 
					</label></div></td>
        </tr>
    </table>
      <br>
    <table width="400px" cellpadding="4" cellspacing="0" bgcolor=#EEEEEE>
        <tr> 
            <td height=40>&nbsp; <b>개인정보취급방침</b></td>
        </tr>
        <tr> 
            <td align="center" valign="top"><textarea style="width: 98%" rows=20 readonly class=ed>[개인정보취급방침]

&#039;CAMPUS PICK&#039;는 (이하 &#039;회사&#039;는) 고객님의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다.

회사는 개인정보취급방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.


회사는 개인정보취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.

ο 본 방침은  :  2015 년 10 월 01 일 부터 시행됩니다.

■ 수집하는 개인정보 항목

회사는 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.

ο 수집항목 : 이름 , 연락처 , 이메일 , 회사명 , 회사전화번호
ο 개인정보 수집방법 : 홈페이지(Q&A) 

■ 개인정보의 수집 및 이용목적

회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다..

 ο 회원 관리
부정 이용 방지와 비인가 사용 방지

■ 개인정보의 보유 및 이용기간

회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다.

■ 개인정보의 파기절차 및 방법

회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 파기절차 및 방법은 다음과 같습니다.

ο 파기절차

회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기되어집니다.

별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다.

ο 파기방법 

   - 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다. 

■ 개인정보 제공

회사는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.

- 이용자들이 사전에 동의한 경우

- 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우

■ 수집한 개인정보의 위탁

회사는 고객님의 동의없이 고객님의 정보를 외부 업체에 위탁하지 않습니다. 향후 그러한 필요가 생길 경우, 위탁 대상자와 위탁 업무 내용에 대해 고객님에게 통지하고 필요한 경우 사전 동의를 받도록 하겠습니다.

■ 이용자 및 법정대리인의 권리와 그 행사방법

이용자 및 법정 대리인은 언제든지 등록되어 있는 자신 혹은 당해 만 14세 미만 아동의 개인정보를 조회하거나 수정할 수 있으며 삭제를 요청할 수 있습니다.

개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체없이 조치하겠습니다.

귀하가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체없이 통지하여 정정이 이루어지도록 하겠습니다. 

회사는 이용자 혹은 법정 대리인의 요청에 의해 해지 또는 삭제된 개인정보는 “ 회사가 수집하는 개인정보의 보유 및 이용기간”에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.

■ 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항

쿠키 등 인터넷 서비스 이용 시 자동 생성되는 개인정보를 수집하는 장치를 운영하지 않습니다. 

■ 개인정보에 관한 민원서비스

회사는 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보관리책임자를 지정하고 있습니다..

귀하께서는 회사의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은 담당부서로 신고하실 수 있습니다. 회사는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.

기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.

1.개인분쟁조정위원회 (www.1336.or.kr/1336)

2.정보보호마크인증위원회 (www.eprivacy.or.kr/02-580-0533~4)

3.대검찰청 인터넷범죄수사센터 (http://icic.sppo.go.kr/02-3480-3600)

4.경찰청 사이버테러대응센터 (www.ctrc.go.kr/02-392-0330)                                                </textarea></td>
        </tr>
        <tr> 
            <td height=40>&nbsp;        <div class="form-group checkbox">
            <label for='agree2' style='width:420px;'> <input type="checkbox" name='agree1' id='agree2'> <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
					개인정보취급방침을 읽었으며 내용에 동의합니다. 
					</label></div></td>
        </tr>
    </table>
</div>
<br/><br/><br/><br/><br/>
<div style="margin:0 auto; width:300px;">
      <div class="form-group checkbox">
                  <label for='agree' style='font-size:15px;'> <input type="checkbox" name='agree' id='agree' > <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
               		모든 이용약관에 동의합니다.
                  </label>
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
            </div>
         </form>
    </div>
    </div>
  </div>
    
  
<script>
function allCheckFunc( obj ) {
	$("[name=agree1]").prop("checked", $(obj).prop("checked") );
}

/* 체크박스 체크시 전체선택 체크 여부 */
function oneCheckFunc( obj )
{
var allObj = $("[name=agree]");
var objName = $(obj).attr("name");

if( $(obj).prop("checked") )
{
	checkBoxLength = $("[name="+ objName +"]").length;
	checkedLength = $("[name="+ objName +"]:checked").length;

	if( checkBoxLength == checkedLength ) {
		allObj.prop("checked", true);
	} else {
		allObj.prop("checked", false);
	}
}
else
{
	allObj.prop("checked", false);
}
}

$(function(){
$("[name=agree]").click(function(){
	allCheckFunc( this );
});
$("[name=agree1]").each(function(){
	$(this).click(function(){
		oneCheckFunc( $(this) );
	});
});
});
function fn_emailcheck() {
	   var emailch=$("#member_email1").val();
	   var emailch2=$("#member_email2").val();
	   var url="<%=request.getContextPath()%>/member/emailAuth?email="+emailch+"@"+emailch2;
	   var title="emailAuth";
	   var status="left=500px,top=100px,width=600px,height=200px";
	   var popup=window.open(url,title,status);
	}
function fn_fidcheck() {
	   var emailch=$("#fid_email1").val();
	   var emailch2=$("#fid_email2").val();
	   var url="<%=request.getContextPath()%>/member/emailAuth?email="+emailch+"@"+emailch2;
	   var title="emailAuth";
	   var status="left=500px,top=100px,width=600px,height=200px";
	   var popup=window.open(url,title,status);
	}
function fn_fpwcheck() {
	   var emailch=$("#fpw_email1").val();
	   var emailch2=$("#fpw_email2").val();
	   var url="<%=request.getContextPath()%>/member/emailAuth?email="+emailch+"@"+emailch2;
	   var title="emailAuth";
	   var status="left=500px,top=100px,width=600px,height=200px";
	   var popup=window.open(url,title,status);
	}

/* 	$(function() {
	   $('#next').click(function() {
	      var emailcheck=$('#check').html();
	      if(emailcheck!="인증완료"){
	         alert("이메일 인증이 필요합니다.");
	         return false;
	      }
	      return true;
	   });
	}); */
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
            document.getElementById('sample6_address').value = fullAddr+",";

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('sample6_address2').focus();
        }
    }).open();
}
	

  $(function(){
    // 회원 가입 처리
    
     var flag=true;
     $('#member_id').keyup(function(){
    		$.ajax({
    			url:"${path}/member/checkIdDuplicate.do",
    			data:{"member_id":$(this).val()},
    			type:'post',
    			success:function(data){
    				var member_id = $("#member_id").val();
    				var leng = $("#member_id").val().length;
    				if(data.trim()=='true' && chkValId(member_id)){
    					$('#idcheck').html("사용 가능한 ID입니다");
    					$('#idcheck').css('color','blue');
    					flag=true;
    				}else if(data.trim()!='true'){
    					$('#idcheck').html("중복된 아이디입니다");
    					$('#idcheck').css('color','red');
    					flag=false;
    				}else if(!chkValId(member_id)) {
    					$('#idcheck').html("ID는 오직 영문과 숫자, _ 기호만 입력 가능합니다");
    					$('#idcheck').css('color','red');
    					flag=false;
    				}
    				if(leng<6) {
    					$('#idcheck').html("최소 6자 이상 입력해주세요");
    					$('#idcheck').css('color','red');
    					flag=false;
    				}
    			}
    		
    		});
    	});
      emailflag=true;
	
    		var chkValId = function(id) {
    			var check = new RegExp(/^[a-z0-9_]+$/);
    			return check.test(id);
    		}
    		var flagpw=true;
    		$('#member_pw').keyup(function(){
    			var member_pw = $("#member_pw").val();
    			var leng = $("#member_pw").val().length;
    			 var num = member_pw.search(/[0-9]/g);
    			 var eng = member_pw.search(/[a-z]/ig);
    			 var spe = member_pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
    			 
    			 if((leng < 8) || (leng> 20)){
    					$('#pwcheck').html("8자리 ~ 20자리 이내로 입력해주세요");
    					$('#pwcheck').css('color','red');
    					flagpw=false;
    				}else if(member_pw.search(/₩s/) != -1){
    					$('#pwcheck').html("비밀번호는 공백없이 입력해주세요");
    					$('#pwcheck').css('color','red');
    					flagpw=false;
    				}else if(num < 0 || eng < 0 || spe < 0 ){
    					$('#pwcheck').html("영문,숫자, 특수문자를 혼합하여 입력해주세요");
    					$('#pwcheck').css('color','red');
    					flagpw=false;
    				}else {
    					$('#pwcheck').html("사용 가능한 비밀번호입니다");
    					$('#pwcheck').css('color','blue');
    					flagpw=true;
    				}
    		});
    		var flagcheck=true;
    		$('#member_pwCheck').keyup(function(){
    			if($("#member_pw").val()!= $("#member_pwCheck").val()) {
    				$('#pwcheck2').html("비밀번호가 일치하지 않습니다");
    				$('#pwcheck2').css('color','red');
    				flagcheck=false;
    			}else {
    				$('#pwcheck2').html("비밀번호가 일치합니다");
    				$('#pwcheck2').css('color','blue');
    				flagcheck=true;
    			}
    			
    		});
    		var flagname=true;
    		$("#member_name").blur(function(){
                var name=$("#member_name").val();
                   if(name.length!=0){
                      if(name.match(/([0-9])|([!,@,#,$,%,^,&,*,?,_,~,-])/)) {
                           alert("이름은 영문과 한글만 입력 가능합니다.");
                           $("#member_name").val("");
                           $("#member_name").focus();
                           flagname=false;
                         }
                   }
    		});
    $('#join-submit').click(function(e){
       if($("#member_id").val() ==''){
            alert('ID를 입력하세요');
            $("#member_id").focus();
            return false;
        }
       if(!flag) {
    	   alert('ID를 확인하세요');
           $("#member_id").focus();
           return false;
       }
       if($("#member_pw").val() ==''){
            alert('비밀번호를 입력하세요');
            $("#member_pw").focus();
            return false;
        }
		if(!flagpw || !flagcheck) {
			alert('비밀번호를 다시 확인하세요');
            $("#member_pw").focus();
            return false;
		}
        if($("#member_pwCheck").val() ==''){
            alert('비밀번호를 다시 한번 더 입력하세요');
            $("#member_pwCheck").focus();
            return false;
        }
        
        if($("#member_name").val() ==''){
            alert('이름을 입력하세요');
            $("#member_name").focus();
            return false;
        }
        if(!flagname) {
     	   alert('이름을 확인하세요');
            $("#member_name").focus();
            return false;
        }
        
        if($("#member_birth").val == '') {
        	 alert('생년월일을 입력하세요');
             $("#member_birth").focus();
             return false;
        }
        
         if($("#member_phone1").val() ==''){
            alert('휴대폰 번호를 입력하세요');
            $("#member_phone1").focus();
            return false;
        }
         if($("#member_phone2").val() ==''){
             alert('휴대폰 번호를 입력하세요');
             $("#member_phone2").focus();
             return false;
         }

        var email = $('#member_email1').val();
        var email2=$('#member_email2').val();
        if(email == ''){
            alert('이메일 ID를 입력하세요');
            $("#member_email1").focus();
            return false;
        } else if(email2=='') {
           alert('이메일 주소를 입력하세요');
            $("#member_email2").focus();
            return false
        }
        /* var emailcheck=$('#check').html();
	      if(emailcheck!="인증완료"){
	         alert("이메일 인증이 필요합니다.");
	         return false;
	      } */
	      if(!emailflag) {
	    	   alert('해당 이메일이 있습니다');
	           $("#member_email1").focus();
	           return false;
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
         $("#member_phone2").val('');
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
             $("#member_email2").val('');
             $("#member_email2").prop("readonly",false); 
          }else{ 
             $("#member_email2").val($('#email_select').val());
             $("#member_email2").prop("readonly",true); 
          } 
          
          $.ajax({
  			url:"${path}/member/checkEmail.do",
  			data:{"member_name":$("#member_name").val(),"member_email1":$("#member_email1").val(),"member_email2":$("#member_email2").val()},
  			type:'post',
  			success:function(data){
  				if(data=="0"){
					$('#emailcheck').html("사용 가능한 이메일입니다");
					$('#emailcheck').css('color','blue');
  					emailflag=true;
  				}else {
					$('#emailcheck').html("사용 불가능한 이메일입니다");
					$('#emailcheck').css('color','red');
  					emailflag=false;
  				}
  			}
  		});
       }); 
    });

$(function() {
    $('#fid_select').change(function(){ 
          if($(this).val()== '1'){ 
             $("#fid_email2").val('');
             $("#fid_email2").prop("readonly",false); 
          }else{ 
             $("#fid_email2").val($('#fid_select').val());
             $("#fid_email2").prop("readonly",true); 
          } 
       }); 
    });

$(function() {
    $('#fpw_select').change(function(){ 
          if($(this).val()== '1'){ 
             $("#fpw_email2").val('');
             $("#fpw_email2").prop("readonly",false); 
          }else{ 
             $("#fpw_email2").val($('#fpw_select').val());
             $("#fpw_email2").prop("readonly",true); 
          } 
       }); 
    });

$(function() {
      $('#school_select').change(function(){ 
            if($(this).val()== '1'){ 
               $("#university").val('');
               $("#university").prop("readonly",false); 
            }else{ 
               $("#university").val($('#school_select').val());
               $("#university").prop("readonly",true); 
            } 
         }); 
      });
		
</script>
</body>
</html>
