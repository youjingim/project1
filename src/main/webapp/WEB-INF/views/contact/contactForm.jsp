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
				        var from = $("[name=from]").val();
				        //console.log(content.length)
				        if(from.trim().length==0){
				        	alert("이메일을 입력하세요");
				            return false;
				        }
				        else if(content.trim().length==0){
				            alert("내용을 입력하세요");
				            return false;
				        }
				        else if(subject.trim().length==0){
				            alert("제목을 입력하세요");
				            return false;
				        }
				        return true;
				    }
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
			 #contact_frm input[type=text], textarea {
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

		        	<br><span style="font-size:28px; font-weight:bold;color:black;margin-left:45%;  		text-align:center;" >Contact us?</span>
               
            <br>    <br>    <br>
               
            <div class="container2">
                <form action="<%=request.getContextPath() %>/sendMail" id="contact_frm" method="post">
				 <br>
				  <label for="subject">제목</label><br>
                  <input type="text" id="subject" name="subject">
                  <br>
                  
                  <label for="cemail">답변 받을 이메일 </label><br>
                  <input type="text" id="cemail" name="from">
					<Br>
                  <label for="text">내용</label><br>
                  <textarea id="text" name="content" style="height:140px;" ></textarea>
	              <br>
	              <br><br>
	              <input type="submit" value="전송" onclick="return validate();">
	              <input type="reset" value="취소">
                </form>
              </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</section>