<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
    <%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
    <%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
    <c:set var='path' value="${pageContext.request.contextPath}"/>

<style>
section{
width:100%;
height:800px;
position:relative;
top:570px;
background-color:white;
z-index:10;
}
section div#create_container{
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
<div id="create_container">
  <br>
      <br> <span
         style='font-size: 30px; font-weight: bold; margin-left: 45%;color:black;'>동아리 개설 신청</span>
      <br>
      <hr />
<br><br>

      <div class="col-sm-6 col-md-offset-3" style='margin-left:25%;'>
         <form action='${path}/clubCreateEnd' method='post' enctype="multipart/form-data">
		  <table class='table' style='color:black;'>
		  <tr>
		  <td>동아리 명</td>
		  <td>
		  <input type='text' name='circle_name' class="form-control"/>
		  </td>
		  </tr>
		  <tr>
		  <td>개설 신청자</td><td><input type='text' name='circle_adviser' value='${memberLoggedIn.member_name}' class="form-control" readonly/></td>
		  </tr>
		  
		  <tr>
		  <td>아이디</td><td><input type='text' name='member_id' value='${memberLoggedIn.member_id}' class="form-control" readonly/></td>
		  </tr>
		  
		  
		  <tr>
		  <td>소속 대학</td>
		  <td><input type='text' name='university' value='${memberLoggedIn.university}' class="form-control" readonly/></td>
		  </tr>
		  
		  <tr>
		  <td>전화번호</td><td><input type='text' name='circle_phone' value='${memberLoggedIn.member_phone}' class="form-control" readonly/></td>
		  </tr>
		  
		  
		  <tr>
		  <td>동아리 대표사진</td>
		  <td>
		  <input type="file" name="circle_photo1" value="" >
          <div id="filephoto1" style="position:absolute;top:1020px;left:268px; background-color:white; width:150px;"></div>
          <input type="hidden" name="oldfile1" value="">
		  
		  </td>
		  </tr>
		  
		  <tr>
		  <td>카테고리</td><td><select name='category' class="form-control">
   <option value="" selected>선택</option>
   <option value="축구">축구</option>
   <option value="여행">여행</option>
   <option value="봉사">봉사</option>
   <option value="종교">종교</option>
   <option value="음악">음악</option>
		  </select></td>
		  </tr>
		  
		  <tr>
		  <td>동아리 소개</td><td>
		  <textarea name='circle_comment' style='width:100%;height:100px;' class="form-control"></textarea>
		  </td>
		  </tr>
		  <tr>
		  
		  <td colspan='2' style='text-align:center;'><button type='submit' class='btn btn-success'>제출</button>
		  <input type='hidden' value="${memberLoggedIn.member_pw }" name='member_pw'/>
		  </td>
		  
		  
		  </tr>
		  </table>
		  
         </form>




</div>
</div>
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</section>