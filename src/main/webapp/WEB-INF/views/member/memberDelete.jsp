<%@page import="com.yj.project.member.model.vo.Member"%>
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
    
    	<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageState"/>
	</jsp:include>
	<style>
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
	section{
width:100%;
height:800px;
position:relative;
top:570px;
background-color:white;
z-index:10;
}
section div#Enroll_container{
width:100%;
height:800px;
position:relative;
z-index:10;
background-color:white;

}
table {
margin:0 auto;
border-collapse:collapse;
}
#delete_table {
margin:0 auto;
width:50%;
color:black;
}
th,td {
text-align:center;
padding:10px;
}
	</style>
<section>
<div id="Enroll_container">
  <br>
      <br> <span
         style='font-size: 30px; font-weight: bold; margin-left: 50px;'>탈퇴</span>
      <br>
      <hr />
<br><br>
	<div id='delete_table'>
	※회원 탈퇴 서비스를 위한 개인정보 수집 및 이용 동의※
	<table border="1px solid black">
	<tr>
		<th>구분</th>
		<th>내용</th>
	</tr>
	<tr>
		<td>수집 항목</td>
		<td>이름, 이메일, 연락처</td>
	</tr>
	<tr>
		<td>처리 목적</td>
		<td>사용자의 실명인증 및 본인 확인, 웹사이트 이용내역 확인, 웹사이트 회원탈퇴 민원처리</td>
	</tr>
	<tr>
		<td>이용 및 보유 기간</td>
		<td>민원처리 종료 후 다음 년도 12월 31일까지 보유</td>
	</tr>
	</table>
	<br>
      <div class="col-sm-6 col-md-offset-3" style='margin-left:30%;'>
         <form action='${path }/member/memberDeleteEnd.do' method='post'>
             <input type='text' class='form-control' name='member_id' value="${memberLoggedIn.member_id}" style="display:none" >
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
            	<span style='font-size:13px;'>위 조건에 따른 개인정보 처리에 동의하십니까?<br>
	(동의를 거부하시는 경우에는 탈퇴가 불가합니다.)<br></span>
            
		      <div class="checkbox" style="display:inline-block;">
                  <label style='color:black'> <input type="checkbox" name='agree' value="agree" onclick="doOpenCheck(this);" > <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span> 동의함
                  </label>
                  </div>
   		      <div class="checkbox" style="display:inline-block;">
                  <label style='color:black'> <input type="checkbox" name='agree' value="disagree"onclick="doOpenCheck(this);"> <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span> 동의하지 않음
                  </label>
               </div>
               <script>
	               function doOpenCheck(chk){
	    var obj = document.getElementsByName("agree");
	    for(var i=0; i<obj.length; i++){
	        if(obj[i] != chk){
	            obj[i].checked = false;
	       	 	}
		    }
		}	
               </script>

            <div class="form-group" style='margin:0 0 10% 10%'>
               <button type="submit" id="delete-submit" class="btn btn-primary" >
                  탈퇴하기<i class="fa fa-check spaceLeft"></i>
                  </button>
               &nbsp
               <button type="reset" class="btn btn-warning">
                  다시작성<i class="fa fa-times spaceLeft"></i>
               </button>
            </div>
         </form>
       </div>
</div>
</div>
</div>
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</section>
<script>

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
    $('#delete-submit').click(function(e){
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

    });
    $('#delete-submit').click(function(e){

    if($("[name=agree]").is(":checked") == false){
        alert('탈퇴에 동의하셔야 합니다');
        return false;      
  	}
    });
   
</script>

