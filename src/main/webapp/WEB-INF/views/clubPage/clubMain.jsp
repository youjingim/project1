<%@page import="com.yj.project.club.model.vo.CB_Comment"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<c:set var = 'path' value='<%=request.getContextPath()%>'/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function validate(){
    var content = $("[name=cb_content]").val();
    var title=$("[name=cb_title]").val();
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
function validate2(){
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
function deleteBoard(no,id){
	location.href="${path}/deleteCircle_board.do?no="+no+"&id="+id;
}
function updateBoard(no){
	location.href="${path}/updateCircle_board.do?no="+no;
}
function deleteComment(no,id){
	location.href="${path}/deleteComment.do?no="+no+"&id="+id;
}
Date.prototype.format = function (f) {

    if (!this.valueOf()) return " ";



    var weekKorName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];

    var weekKorShortName = ["일", "월", "화", "수", "목", "금", "토"];

    var weekEngName = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];

    var weekEngShortName = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

    var d = this;



    return f.replace(/(yyyy|yy|MM|dd|KS|KL|ES|EL|HH|hh|mm|ss|a\/p)/gi, function ($1) {

        switch ($1) {

            case "yyyy": return d.getFullYear(); // 년 (4자리)

            case "yy": return (d.getFullYear() % 1000).zf(2); // 년 (2자리)

            case "MM": return (d.getMonth() + 1).zf(2); // 월 (2자리)

            case "dd": return d.getDate().zf(2); // 일 (2자리)

            case "KS": return weekKorShortName[d.getDay()]; // 요일 (짧은 한글)

            case "KL": return weekKorName[d.getDay()]; // 요일 (긴 한글)

            case "ES": return weekEngShortName[d.getDay()]; // 요일 (짧은 영어)

            case "EL": return weekEngName[d.getDay()]; // 요일 (긴 영어)

            case "HH": return d.getHours().zf(2); // 시간 (24시간 기준, 2자리)

            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2); // 시간 (12시간 기준, 2자리)

            case "mm": return d.getMinutes().zf(2); // 분 (2자리)

            case "ss": return d.getSeconds().zf(2); // 초 (2자리)

            case "a/p": return d.getHours() < 12 ? "오전" : "오후"; // 오전/오후 구분

            default: return $1;

        }

    });

};



String.prototype.string = function (len) { var s = '', i = 0; while (i++ < len) { s += this; } return s; };

String.prototype.zf = function (len) { return "0".string(len - this.length) + this; };

Number.prototype.zf = function (len) { return this.toString().zf(len); };
   
      
   

	/* 게시글 더보기 기능 */
    $(function() {
        $(".check1").slice(0, 5).show(); // 최초 10개 선택
        $("#moreBoard").click(function(e) { // Load More를 위한 클릭 이벤트e
           e.preventDefault();
           $(".check1:hidden").slice(0, 5).show(); // 숨김 설정된 다음 10개를 선택하여 표시
           if ($(".check1:hidden").length == 0) { // 숨겨진 DIV가 있는지 체크
              $("#moreBoard").hide();
           }
        });
     });
    /*댓글 더보기 기능  */
   /*  $(function() {
        $(".commentTable").slice(0, 3).show(); // 최초 10개 선택
        $("#moreComment").click(function(e) { // Load More를 위한 클릭 이벤트e
           e.preventDefault();
           $(".commentTable:hidden").slice(0, 3).show(); // 숨김 설정된 다음 10개를 선택하여 표시
           if ($(".commentTable:hidden").length == 0 ) { // 숨겨진 DIV가 있는지 체크
              $("#moreComment").hide();
           }
          
        });
     }); */
    $('.moreComment').on("click",function(){
	  	  var evObj=$(this);
	  	$(".commentTable").slice(0, 3).show(); // 최초 10개 선택
        $(evObj).click(function(e) { // Load More를 위한 클릭 이벤트e
           e.preventDefault();
           $(".commentTable:hidden").slice(0, 3).show(); // 숨김 설정된 다음 10개를 선택하여 표시
           if ($(".commentTable:hidden").length == 0 ) { // 숨겨진 DIV가 있는지 체크
              $(evObj).hide();
           }
          
        });
    });
    /*좋아요 ajax구현  */
function like_func(id,no,event){
	console.log(id);
	console.log(no); 
	
	var obj=event.target;
 	if(obj.tagName!='BUTTON')
 	{
		obj=obj.parentElement;
 	}
	console.log(obj);
	var cl=obj.getAttribute('class');
	var allData={"id":id,"no":no};
	$.ajax({
		url:"${path}/likeButton.do",
		data:allData,
		type:"get",
		dataType:'JSON',
		success: function(data){
			
			if(data==1)
			{
				cl=cl.replace('w3-indigo','w3-red');
				obj.removeAttribute('class');
				obj.setAttribute('class',cl);
			}
			else
			{	
				
				cl=cl.replace('w3-red','w3-indigo');
				obj.removeAttribute('class');
				obj.setAttribute('class',cl);
			}
		},
		error:function(data)
		{
			console.log(data);
		}
	})
};

</script>
<style>
.check1{
	display: none;
}
.commentTable{
	display: none;
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
   <jsp:param value='club' name='pageTitle'/>

</jsp:include>
<jsp:include page="/WEB-INF/views/clubPage/common/aside1.jsp"/>    
<!-- Middle Column -->
    <div class="w3-col m7" >
      <div class="w3-row-padding" style="margin-top:16px;">
        <div class="w3-col m12">
          <div class="w3-card w3-round w3-white">
            <div class="w3-container w3-padding">
              <div id="post_header">
              <h6 class="w3-opacity" style="cursor:pointer"><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i>우리 동아리 소식을 공유해요~</h6>
              <span style="margin-top: -30px; float: right;">(동아리 회원전용)</span>
              </div>
              <c:if test="${memberLoggedIn.circle1_num eq club.circle_num }">
              <div id="post" >
              <form action="clubMainPage.do" method="post" enctype="multipart/form-data" onsubmit="return validate();">
                    <input type="text" class="form-control" id="cb_title" name="cb_title" placeholder="게시글 제목을 작성해주세요."><br>
                    <textarea class="form-control" rows="5" id="cb_content" name="cb_content" placeholder="게시글 내용을 작성해주세요."></textarea>
					<input type="hidden" name="circle_num"value="${club.circle_num }"/>
					<input type="hidden" name="member_id" value="${memberLoggedIn.member_id }"/>
                	
                    <div class="input-group mb-3" style="padding:0px;">
                        <div class="input-group-prepend" style="padding:0px;">
                            <span class="input-group-text">첨부파일1</span>
                        </div>
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" name="cb_attachment" id="cb_attachment" accept=".jpg, .png, .bmp">

                        </div>
                        <div class="input-group-prepend" style="padding:0px;">
                            <span class="input-group-text">첨부파일2</span>
                        </div>
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" name="cb_attachment2" id="cb_attachment2" accept=".jpg, .png, .bmp">
                        </div>

                    </div>
                <input type="submit" class="w3-button w3-theme" style="float:right;" value="등록">
              </form>
              </div>
              </c:if>
            </div>
          </div>
        </div>
      </div>
      <c:if test="${not empty BoardList }">
	      <c:forEach items="${BoardList}" var='b' varStatus="status">
	      <div class="w3-container w3-card w3-white w3-round w3-margin check1"><br>
	        <p style="display:inline-block;">${b.member_id }  <span class="glyphicon glyphicon-envelope myBtn1" id="${b.cb_num }"></span></p>
	        <c:if test="${memberLoggedIn.member_id eq b.member_id}">
	        <div style="flaot:right; display: inline-block;">
	        <button type="button" class="btn btn-warning" style="margin-right:5px;" onclick="updateBoard(${b.cb_num })">수정</button>
	        <button type="button" class="btn btn-danger" onclick="deleteBoard(${b.cb_num },'${b.member_id }')">삭제</button>
	        </div>
	        </c:if>
	        <span class="w3-right w3-opacity"><fmt:formatDate type="both" value="${b.cb_date}" /></span>
	        <h4><bold>${b.cb_title }</bold></h4>
	        <hr class="w3-clear">
	        <p>
	        ${b.cb_content }
	        </p><br>
	        <c:if test="${not empty b.cb_attachment }">
	          <div class="w3-row-padding" style="margin:0 -16px" id="img_container">
	           
	              <img src="${path }/resources/upload/club/${b.cb_reattachment }" style="width:300px; height:300px; display: inline-block;" alt="게시글 사진1" class="w3-margin-bottom">
	              <c:if test="${not empty b.cb_attachment2 }">
	              <img src="${path }/resources/upload/club/${b.cb_reattachment2 }" style="width:300px; height:300px; display: inline-block;" alt="게시글 사진1" class="w3-margin-bottom">
	          		</c:if>
			 </div>
			 </c:if>
			 <c:if test="${not empty likeList }">	
			 	<c:forEach items="${likeList }" var='ll' varStatus="llstatus">
			 		<c:if test="${ll.member_id eq memberLoggedIn.member_id and ll.cb_no eq b.cb_num and ll.cb_like_check eq 1 }">		 	
	        		<button type="button" class="w3-button w3-red w3-margin-bottom like_icon" id="like_icon" onclick="like_func('${memberLoggedIn.member_id}','${b.cb_num }',event);"><i class="fa fa-thumbs-up"></i> 좋아요 </button>
	        		</c:if>
	        	</c:forEach>
	        		<button type="button" class="w3-button w3-indigo w3-margin-bottom like_icon1" id="like_icon1" onclick="like_func('${memberLoggedIn.member_id}','${b.cb_num }',event);"><i class="fa fa-thumbs-up"></i> 좋아요 </button>
	        </c:if>	
	        		<button type="button" class="w3-button w3-theme-d2 w3-margin-bottom" id="circle_comment"><i class="fa fa-comment"></i> 댓글 </button>
	        <div id="post_comment" >
	          <input type="text" class="form-control" name="comment1" id="comment1" placeholder="댓글을 작성해주세요." style="display:inline-block; width:90%;"/>
	          <input type="hidden" id="no" value="${b.cb_num }"/>
	          <input type="hidden" id="memberId" value="${memberLoggedIn.member_id }"/>
	          <button type="button" class="btn btn-primary submit_button" value='${b.cb_num}'>등록</button>
	          <div class="comment-container"><hr>
	            <c:forEach items="${clist}" var='cc' varStatus="cstatus">
	            <c:if test="${cc.cb_num eq b.cb_num }">
	            <table class="commentTable">
	              <tr>
	                <td class="top"><strong>${cc.member_id }</strong> <fmt:formatDate type="both" value="${cc.cb_comment_date}" /></td>
	                <td></td>
	              </tr>
	              <tr>
	                <td class="top">${cc.cb_comment_content }</td>
	                <c:if test="${memberLoggedIn.member_id eq cc.member_id}">	                
	                <td><button type="button" class="btn btn-danger" onclick="deleteComment(${cc.cb_commentno},'${memberLoggedIn.member_id }');">삭제</button></td>
	                </c:if>
	              </tr>
	            </table>
	            </c:if>
	           </c:forEach>
	         		<button type="button" class="btn btn-default moreComment" id="moreComment"> 댓글 더 보기</button>	     
	          </div>
	          <br>
	        </div>
	      </div>
	      	        <!-- The Modal -->
<div id="${b.cb_num }" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <h3>쪽지보내기</h3>
    <hr>
    <form action="${path }/circleMessage.do" method="post" onsubmit="return validate2();">
    <div class="form-group">
      <label for="member_receive">받는사람</label>
      <input type="text" class="form-control" id="member_receive" name="yid" value="${b.member_id }">
    </div>
    <div class="form-group">
      <label for="pwd">보내는사람</label>
      <input type="text" class="form-control" id="pwd" name="mid"value="${memberLoggedIn.member_id }">
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
	      </c:forEach>
	    <button type="button" class="btn btn-default btn-block" id="moreBoard" style="margin:0px 30px 0px 16px; width:96%;" >더 보기</button>
	    </c:if> 
    <!-- End Middle Column -->
    </div>

<script>
$(function(){
	 $('.myBtn1').on('click',function(){
		  var messageId=$(this).attr('id');
		  $('#'+messageId+'.modal').css("display",'block'); 
	  });  

	  $('.close').on('click',function(){  
		$(this).parents('div.modal').css('display','none');
	  });	
	  
	  $('.submit_button').on("click",function(){
		  	  var evObj=$(this);
		      var no = $(this).val();
		      var comment = $('input[value='+no+']').prev('input').val();
		      var memberId = $('#memberId').val();
		      console.log("댓글 내용 : "+evObj.parent().parent().parent().attr('class'));
		      console.log("회원 아이디 : "+memberId);
		      var allData={"no":no, "memberId":memberId,"comment":comment};
		      $.ajax({
		         url:"${path}/insertComment.do",
		         data:allData,
		         type:"get",
		         dataType:"json",
		         success:function(data){
		            alert("댓글 등록!");
		            var _today = new Date();
		           
		            evObj.next().prepend("<table><tr><td class='top'><strong>"+data.member_id+"</strong>"+_today.format('yyyy. MM. dd a/p hh:mm:ss')+"</td><td></td><tr/><tr><td class='top'>"+data.cb_comment_content+"</td><td><button type='button' class='btn btn-danger' onclick='deleteComment(${cc.cb_commentno},'memberLoggedIn.member_id');'>삭제</button></td></tr></table>");
		            
		            $("#comment1").prop("value","");
		         }
		      });
	});
	
});
//Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn1");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal
btn.onclick = function() {
    modal.style.display = "block";
};
// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
};
</script>
<jsp:include page="/WEB-INF/views/clubPage/common/aside2.jsp"/>      