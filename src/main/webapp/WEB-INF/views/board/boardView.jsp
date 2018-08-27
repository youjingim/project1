<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
    <%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
    <%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
        <c:set var='path' value="${pageContext.request.contextPath}"/>
    
    	<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
	</jsp:include>
     <style>
    div#board-container{width:400px; margin:0 auto; text-align:center;}
    div#board-container input,div#board-container button{margin-bottom:15px;}
    /* 부트스트랩 : 파일라벨명 정렬*/
    div#board-container label.custom-file-label{text-align:left;}
section{
width:100%;
height:auto;
position:relative;
top:570px;
background-color:white;
z-index:10;
}
section div#main_container{
width:100%;
height:auto;
position:relative;
z-index:10;
background-color:white;
top:100px;
}
#table_container{
width:80%;
height:auto;
margin-left:10%;
margin-top:80px;
}

div#table_container #boardTable td{
height:70px;
text-align:center;
color:black;
border-top:1px solid black;
border-bottom:1px solid black;
}
div#table_container #boardTable td:nth-of-type(1){
width:80%;
font-size:20px;
padding:25px;
text-align:left;

}
div#table_container #boardTable td:nth-of-type(2){
width:20%;
padding:30px;
font_size:22px;
text-align:right;

}

div#table_container #boardTable td{
border-bottom:1px solid black;
padding-top:29px;
}
div#comment_container{
width:100%;
height:auto;

}
#comment_table{
width:100%;
}
div#comment_container #comment_table tr{
height:60px;
color:black;
}
div#comment_container #comment_table tr td{

}
div#comment_container #comment_table tr td:nth-of-type(1){

}
div#comment_container #comment_table tr td:nth-of-type(2){
text-align:center;
width:20%;
max-width:20%;
}


    </style>

    <section>
<div id="main_container">
   <br><span style="font-size:35px; font-weight:bold;color:black; margin-left:45%; text-align:center;" >자유게시판</span>
<div id="table_container">

<table class='table' id='boardTable'>
<tr>
<td>${board.freeboard_title }
<input type='hidden' value='${board.freeboard_num}' id='boardNum'></td>
<td>${board.member_id }
<input type='hidden' value='${board.member_id}' id='memberId'>
</td>

</tr>
<tr>
<td colspan='2' style='width:100% ;max-width:100% ;height:500px;font-size:20px;'>${board.freeboard_content }</td>
</tr>


</table>
 	<c:if test = '${board.member_id eq memberLoggedIn.member_id}'>
 	<div>
 	<span style='margin-left:85%;display:inline-block;'>
 	<input style='display:inline-block;' type="button" value="수정" id='btn-add' class='btn btn-default' onclick="location.href='${pageContext.request.contextPath}/board/boardUpdate.do?no=${board.freeboard_num }'"/>
 	<input style='display:inline-block;' type="button" value="삭제" id='btn-add' class='btn btn-default' onclick="location.href='${pageContext.request.contextPath}/board/boardDelete.do?no=${board.freeboard_num }'"/>
 	<input style='display:inline-block;' type="button" value="목록" id='btn-add' class='btn btn-default' onclick="location.href='${pageContext.request.contextPath}/board/boardList.do'"/></span>
 	</div>  
 	</c:if>
 	
 	 	<c:if test = '${board.member_id != memberLoggedIn.member_id}'>
 	<div>
 	<span style='margin-left:95%;display:inline-block;'>
 	<input style='display:inline-block;' type="button" value="목록" id='btn-add' class='btn btn-default' onclick="location.href='${pageContext.request.contextPath}/board/boardList.do'"/></span>
 	</div>  
 	</c:if>
 	<span style='font-size:25px;color:black;'>Comment</span>
 	<hr />
 	<span>
<textarea class="form-control" id="comment" style='width:93%;height:70px;display:inline-block;;'>
    
    </textarea><button class='btn btn-default' style='width:6%;height:60px;display:inline-block;margin-top:-60px;margin-left:1%;' onclick="fn_commentInsert()">등록</button>
      </span>
      <div id="comment_container">
      <table id='comment_table'>
      <c:forEach var='comment' items='${list}' varStatus="vs">
      <tr style='border-top:1px solid black;'>
      <td>${comment.member_id }</td>
      <td>${comment.comment_date }
      
      <c:if test = '${comment.member_id eq memberLoggedIn.member_id}'>
      
      &nbsp;&nbsp;&nbsp;&nbsp;<input style='display:inline-block;' type="button" value="수정" id='comment_update' class='btn btn-default updateComment' />   
    	 	     <input style='display:inline-block;' type="button" value="삭제" id='comment_delete' class='btn btn-default' onclick="location.href='${pageContext.request.contextPath}/commentDelete.do?no=${comment.comment_no }&boardNo=${board.freeboard_num }'"/>
    	 	     
    	 	       	 	     
      </c:if>
      <c:if test = '${comment.member_id != memberLoggedIn.member_id}'>
      
      </c:if>
      </td> 
      </tr> 
      <tr>
      <td>${comment.comment_content }</td>
      </tr>
      <tr style='display:none;'>
      <td colspan='2'><span><input type='text' name='comment_update' class="form-control" style='width:89%; height:60px; margin-bottom:10px; margin-top:10px; display:inline-block;'>&nbsp;<input type='button' value='확인' style='display:inline-block;' class='btn btn-default' onclick="location.href='${pageContext.request.contextPath}/commentUpdate.do?no=${comment.comment_no }&boardNo=${board.freeboard_num }'"/></span></td>
      </tr>
      
      </c:forEach>
      </table>
      <button class='btn btn-default' style='width:100%' onclick='morecomment()'>더 보 기</button>
      </div>
    </div>
     
</div>
<div style='width:100%;height:200px;'>


<input type='hidden' value='${memberLoggedIn.member_id}' id='member'/>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</section>

<script>
$('.updateComment').click(function(){
	$(this).parent().parent().next().next().slideToggle();
	
})

function fn_commentInsert(){
	
	var comment=$("#comment").val();
	if(comment != ''){
	var boardNum=$('#boardNum').val();
	var memberId=$('#member').val();
	var tableText = $('#comment_table').html();
	var commentResult = {"comment":comment,"boardNum":boardNum,"memberId":memberId};
	var check = confirm('등록할까요?');
	if(check){
	$.ajax({
		url:"${path}/comment.do",
		data:{"comment":comment,"boardNum":boardNum,"memberId":memberId},
		dataType:"json",
		success:function(data){
			
			$('#comment_table').prepend("<tr style='border-top:1px solid black;'><td>"+data.member_id+"</td><td>"+data.comment_date+"&nbsp;&nbsp;&nbsp;&nbsp; <input style='display:inline-block;' type='button' value='수정' id='comment_update' class='btn btn-default' onclick='location.href='${pageContext.request.contextPath}/commentUpdate.do?no=${comment.comment_no }''/>&nbsp;<input style='display:inline-block;' type='button' value='삭제' id='comment_delete' class='btn btn-default' onclick='location.href='${pageContext.request.contextPath}/commentDelete.do?no=${comment.comment_no }''/></td></tr><tr><td>"+data.comment_content+"</td></tr>");
			
			$("#comment").prop("value","");
			
			
		}
	})
	}
	}else{
		alert('내용을 입력해주세요!');
		
	}
}

var in1=0;
var in2=1;
var in3=2;
var in4=3;
var in5=4;
 function morecomment(){
    var table1 = $('#comment_table').children().children('tr');
    in1+=5;
    in2+=5;
    in3+=5;
    in4+=5;
    in5+=5;
    console.log(table1);
    table1.eq(in1).css("display","");
    table1.eq(in2).css("display","");
    table1.eq(in3).css("display","");
    table1.eq(in4).css("display","");
    table1.eq(in5).css("display","");
    

    
 } 

 
	 
</script>
	
	