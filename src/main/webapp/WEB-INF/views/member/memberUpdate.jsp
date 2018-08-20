<%@page import="com.yj.project.member.model.vo.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
    <%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
    <%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
    <%
    String categoryList = (String)request.getAttribute("categoryList");
    %>
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
height:1200px;
position:relative;
z-index:10;
background-color:white;

}
	</style>
<section>
<div id="Enroll_container">
  <br>
      <br> <span
         style='font-size: 30px; font-weight: bold; margin-left: 50px;'>회원정보수정</span>
      <br>
      <hr />
<br><br>

      <div class="col-sm-6 col-md-offset-3" style='margin-left:30%;'>
         <form action='${path }/member/memberUpdateEnd.do' method='post'>
            <div class="form-group">
               <label for="member_id">ID</label><span style="color: blue">
                  (*)</span> <input type='text' class='form-control' style='width:200px' name='member_id' value="${memberLoggedIn.member_id}" readonly>
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
                  (*)</span> <input type="text" class="form-control" name='member_name' style='width:200px' value="${memberLoggedIn.member_name }" readonly>
            </div>
             <div class="form-group">
               <label for="member_birth">생년월일</label><span style="color: blue">
                  (*)</span> <input type="Date" class="form-control" id="member_birth" value="${memberLoggedIn.member_birth }"name='member_birth' style='width:200px' readonly> 
            </div>
            <div class="form-group">
               <label for="university">소속 대학</label><span style="color: blue">
                  (*)</span><br> <input type="text" class="form-control" id="university" name='university' style='width:200px; display:inline-block'
                  value="${memberLoggedIn.university }" readonly>
                  
            </div>
            <div class="form-group">
               <label for="member_phone">휴대폰 번호</label><span style="color: blue">
                  (*)</span> <br/>
                  <select name='member_phone1'class="form-control" style='width:90px; display:inline-block;'>
                       <option value='010'>010</option>
                       <option value='011'>011</option>
                       <option value='019'>019</option>
                       <option value='070'>070</option>
                  </select>-
                  <input type="tel" class="form-control" value="${p1 }" maxlength="4" onKeyDown="checkKeysInt(event,'');" onKeyUp="checkKeysInt(event,'');" name='member_phone2' id='member_phone2' style='width:90px; display:inline-block;'>-
                  <input type="tel" class="form-control" value="${p2 }" maxlength="4" onKeyDown="checkKeysInt(event,'');" onKeyUp="checkKeysInt(event,'');" name='member_phone3' id='member_phone3' style='width:90px; display:inline-block;'>
            </div>
            <div class="form-group">
               <label for="email">이메일 주소</label><span style="color: blue">
                  (*)</span><br> <input type="email" class="form-control" value="${e1 }" id='member_email1' name='member_email1' style='width:150px; display:inline-block'
                  placeholder="이메일 주소를 입력해주세요" readonly>@
                  <input type='text' class='form-control' value="${e2 }" id='member_email2' name='member_email2'style='width:150px;display:inline-block' readonly>
                  
                  </div>

            <div class="form-group">
               <label for="member_addr">주소</label> <span style="color: blue">
                  (*)</span><br/> 
                  <input type="text" class="form-control btn btn-outline" value="${a1 }" id="sample6_postcode"  name='member_addr1' style="width:300px; background-color:white;" placeholder="우편번호"  readonly>
                  <input type="button" onclick="sample6_execDaumPostcode()" class="btn" value="우편번호 찾기"><br>
                  <input type="text" class="form-control btn btn-outline-secondary" value="${a2 }" id="sample6_address" name='member_addr2' style="width:500px; background-color:white;" placeholder="주소"readonly><br>
                  <input type="text"class="form-control btn btn-outline-secondary" value="${a3 }" id="sample6_address2" name='member_addr3' style="width:500px" placeholder="상세주소">
            </div>

            <div class="form-group">
               <label for="enroll_category">관심분야</label>
            </div>
            <div class="col-sm-12">
               <div class="checkbox" style="display:inline-block;">
                  <label for='enroll_category1' style='color:black'> <input type="checkbox"name='enroll_category' id='enroll_category1' value="운동" <%=categoryList.contains("운동") ? "checked":""%>> <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span> 운동</label>
            
               </div>
               <div class="checkbox" style="display:inline-block;">
                  <label for='enroll_category2' style='color:black'> <input type="checkbox" name='enroll_category'  id='enroll_category2' value="봉사" <%=categoryList.contains("봉사") ? "checked":""%>> <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span> 봉사
                  </label>
               </div>
               <div class="checkbox" style="display:inline-block;">
                  <label for='enroll_category3' style='color:black'> <input type="checkbox" name='enroll_category' id='enroll_category3' value="독서" <%=categoryList.contains("독서") ? "checked":""%>> <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span> 독서
                  </label>
               </div>
               <div class="checkbox" style="display:inline-block;">
                  <label for='enroll_category4' style='color:black'> <input type="checkbox" name='enroll_category' id='enroll_category4'  value="여행" <%=categoryList.contains("여행") ? "checked":""%> > <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span> 여행
                  </label>
               </div>
               <div class="checkbox" style="display:inline-block;">
                  <label for='enroll_category5' style='color:black'> <input type="checkbox" name='enroll_category' id='enroll_category5' value="학습" <%=categoryList.contains("학습") ? "checked":""%>> <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span> 학습
                  </label>
               </div>
               <br>
               <div class="checkbox" style="display:inline-block;">
                  <label for='enroll_category6' style='color:black'> <input type="checkbox" name='enroll_category' id='enroll_category6' value="종교" <%=categoryList.contains("종교") ? "checked":""%>> <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span> 종교
                  </label>
               </div>
               <div class="checkbox" style="display:inline-block;">
                  <label for='enroll_category7' style='color:black'> <input type="checkbox" name='enroll_category' id='enroll_category7' value="사진" <%=categoryList.contains("사진") ? "checked":""%>> <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span> 사진
                  </label>
               </div>
               <div class="checkbox" style="display:inline-block;">
                  <label for='enroll_category8' style='color:black'> <input type="checkbox" name='enroll_category' id='enroll_category8' value="음악" <%=categoryList.contains("음악") ? "checked":""%>> <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span> 음악
                  </label>
               </div>
               <div class="checkbox" style="display:inline-block;">
                  <label for='enroll_category9' style='color:black'> <input type="checkbox" name='enroll_category' id='enroll_category9' value="게임" <%=categoryList.contains("게임") ? "checked":""%>> <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span> 게임
                  </label>
               </div>
               <div class="checkbox" style="display:inline-block;">
                  <label for='enroll_category10' style='color:black'> <input type="checkbox" name='enroll_category' id='enroll_category10' value="댄스" <%=categoryList.contains("댄스") ? "checked":""%>> <span
                     class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span> 댄스
                  </label>
               </div>
            </div>
            <br>
            <br>
            <br>
            <br>
            <br>
         
            
            <div class="form-group" style='margin:0 0 10% 10%'>
               <button type="submit" id="update-submit" class="btn btn-primary" >
                  수정하기<i class="fa fa-check spaceLeft"></i>
                  </button>
               &nbsp
               <button type="reset" class="btn btn-warning">
                  다시작성<i class="fa fa-times spaceLeft"></i>
               </button>
            </div>
         </form>




</div>
</div>
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</section>
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
            document.getElementById('sample6_address').value = fullAddr+",";

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('sample6_address2').focus();
        }
    }).open();
}
  $(function(){
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
    // 회원 가입 처리
    $('#update-submit').click(function(e){
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
	   
</script>

