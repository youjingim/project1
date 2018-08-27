<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<c:set var='path' value="<%=request.getContextPath()%>"/>     
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="  " name="pageTitle"/>
</jsp:include>
            
       <script>
                function validate(){
                    var content = $("[name=content]").val();
                    var subject = $("[name=subject]").val();
                    var cemail = $("[name=cemail]").val();
               
                    //console.log(content.length)
                    if(content.trim().length==0){
                       alert("내용을 입력하세요");
                        return false;
                    }
                    else if(cemail.trim().length==0){
                        alert("이메일을 입력하세요");
                        return false;
                    }
                    else if(subject.trim().length==0){
                        alert("제목을 입력하세요");
                        return false;
                    }
                    return true;
                }
              
                function validate(){
                var cemail = /([w-.]+)@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.)|(([w-]+.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(]?)$/; 
                if( !$("[name=cemail]").val() ){ 
                   alert("이메일주소를 입력 해 주세요"); 
                   $("[name=cemail]").focus(); 
                   return false; 
                } else { 
                   if(!cemail.test($("[name=cemail]").val())) { 
                      alert("이메일 주소가 유효하지 않습니다"); 
                      $("[name=cemail]").focus(); 
                      return false; 
                   } 
                }  
            </script>
         


<script type='text/javaScript'>
$(document).ready(function(){
    var $email = $('#cemail');

    var $Submit = $('Submit');
 
    $Submit.on('click', function(){
        // 정규식 - 이메일 유효성 검사
        var regemail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        // 정규식 -전화번호 유효성 검사
        //var regPhone = /^((01[0|1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
 
        if( !$email.val() ){
            alert('이메일주소를 입력 해 주세요');
            $email.focus();
            return false;
        } else if(!regEmail.test($email.val())) {
            alert('이메일 주소가 유효하지 않습니다');
            $email.focus();
            return false;
        }
    });
});
</script> 
            
      <style>
      section{
width:100%;
height:800px;
position:relative;
top:570px;
background-color:white;
z-index:10;
}
          #contact_frm input[type=text], input[type=email] ,textarea {
           width: 95%;
             height:20%;
             padding: 12px;
             border: 1px solid #ccc;
             border-radius: 4px;
             box-sizing: border-box;
             margin-top: 6px;
             margin-bottom: 16px;
             resize: vertical;
             margin-left:0px;
             color:black;
             
             
             
                      }
                      
         input[type=submit] {
             background-color: #6CC0FF;
               color: white;
             padding: 12px 20px;
             border: none;
             border-radius: 4px;
             cursor: pointer;
            margin-left:37%;
         }
         input[type=reset] {
             background-color: black;
                      color: white;
             padding: 12px 20px;
             border: none;
             border-radius: 4px;
             cursor: pointer;
            margin-left:3%;
         }
         .container2 {
             width:40%;
             border-radius: 5px;
             border:solid 1px black;
             background-color: white;
             padding: 20px;
             margin:auto;
             margin-bottom:150px;
             color:black;
         }
      </style>
         <section>
         <br><br>
      <div>

                 <br><span style="font-size:28px; font-weight:bold;color:black;margin-left:45%;        text-align:center;" >Contact us?</span>
               
            <br>    <br>    <br>
               
            <div class="container2">
                <form action="<%=request.getContextPath() %>/contact/mailSending" id="contact_frm" method="post">
             <br>
              <label for="subject">제목</label><br>
                  <input type="text" id="subject" name="subject" required>
                  <br>
                  
                  <label for="cemail">답변 받을 이메일 </label><br>
                  <input type="email" id="cemail" name="cemail" >
                  <Br>
                  <label for="text">내용</label><br>
                  <textarea id="text" name="content" style="height:140px;" required></textarea>
                 <br>
                 <br><br>
                 <input type="submit" value="전송" onclick="return validate();">
                 <input type="reset" value="취소">
                </form>
              </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</section>