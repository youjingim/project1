<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
    <%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
    <%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
      <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
  <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
    <c:set var='path' value="${pageContext.request.contextPath}"/>

     	<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
	</jsp:include>  
<style>
section{
width:100%;
height:800px;
position:relative;
top:570px;
background-color:white;
z-index:10;
}
section div#main_container{
width:100%;
height:1200px;
position:relative;
z-index:10;
background-color:white;
top:50px;
}
.note-editable{
height:320px;
}
	div#board-continer{width:70%;height:800px;margin:0 auto;position:absolute; left:15%;top:310px;}
	div#board-continer input{margin-bottom:15px;}

	div#board-continer table td{
	border:none;
	color:black;
	}

</style>

 <section>
     <div id="main_container">

     <div id="board-continer">
<form class="form-horizontal" action='${path}/board/boardWrite' method='post'>
		<table class='table'>
		<tr>
		<td style='text-align:center;width:7%;'>제목</td><td><input type='text' class="form-control" name='freeboard_title'></td>
		</tr>
		<tr><td colspan='2'>
          <textarea name="freeboard_content" id="content" class="summernote"></textarea>
		</td></tr>
        <tr><td colspan='2' style='text-align:center;'>
          <button type="submit" class="btn btn-default">Save</button>
        </td></tr>
      </table>
      <input type='hidden' value='${memberLoggedIn.member_id}' name='member_id'>
    </form>

  <script>
    $(document).ready(function() {
        $('.summernote').summernote();
    });
  </script>
        </div>
    </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	</section>

