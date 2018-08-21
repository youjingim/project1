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

	function insertComment(n){
		console.log("게시글 번호:"+n);
		var no = n;
		var comment = $('#comment1').val();
		var memberId = $('#memberId').val();
		var allData={"no":no, "memberId":memberId,"comment":comment};
		$.ajax({
			url:"${path}/insertComment.do",
			data:allData,
			type:"post",
			dataType:"html",
			success:function(data){
				alert("댓글 등록!");
				$('#comment1').val("");
				$('#commentTable').html(data);
			}
		});
	}
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
    $(function() {
        $(".commentTable").slice(0, 2).show(); // 최초 10개 선택
        $("#moreComment").click(function(e) { // Load More를 위한 클릭 이벤트e
           e.preventDefault();
           $(".commentTable:hidden").slice(0, 2).show(); // 숨김 설정된 다음 10개를 선택하여 표시
           if ($(".commentTable:hidden").length == 0) { // 숨겨진 DIV가 있는지 체크
              $("#moreComment").hide();
           }
        });
     });
function like_func(){

}    
</script>
<style>
.check1{
	display: none;
}
.commentTable{
	display: none;
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
              <span style="margin-top: -30px; float: right;">(글쓰기)</span>
              </div>
              <div id="post" style="display:none;">
              <form action="clubMainPage.do" method="post" enctype="multipart/form-data" onsubmit="return validate();">
                    <input type="text" class="form-control" id="cb_title" name="cb_title" placeholder="게시글 제목을 작성해주세요."><br>
                    <textarea class="form-control" rows="5" id="cb_content" name="cb_content" placeholder="게시글 내용을 작성해주세요."></textarea>
					<input type="hidden" name="circle_num"value="${club.circle_num }"/>
					<input type="hidden" name="member_id" value="${member.member_id }"/>
                	
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
            </div>
          </div>
        </div>
      </div>
      <c:if test="${not empty BoardList }">
	      <c:forEach items="${BoardList}" var='b' varStatus="status">
	      <div class="w3-container w3-card w3-white w3-round w3-margin check1"><br>
	        <p style="display:inline-block;"><i class="fa fa-user fa-fw w3-margin-right w3-text-theme"></i>${b.member_id }</p>
	        <c:if test="${member.member_id eq b.member_id}">
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
	        <c:choose>
	        	<c:when test="${member.member_id ne null }">
	        		<button type="button" class="w3-button w3-indigo w3-margin-bottom" id="like_icon" onclick="like_func();"><i class="fa fa-thumbs-up"></i> 좋아요 </button>
	        	</c:when>
	        	<c:otherwise>
	        		<button type="button" class="w3-button w3-red w3-margin-bottom" id="like_icon" onclick="login_need();"><i class="fa fa-thumbs-up"></i> 좋아요 </button>
	        	</c:otherwise>
	        </c:choose>
	        <button type="button" class="w3-button w3-theme-d2 w3-margin-bottom" id="circle_comment"><i class="fa fa-comment"></i> 댓글 </button>
	        <div id="post_comment" >
	          <input type="text" class="form-control" name="comment1" id="comment1" placeholder="댓글을 작성해주세요." style="display:inline-block; width:90%;"/>
	          <input type="hidden" id="no" value="${b.cb_num }"/>
	          <input type="hidden" id="memberId" value="${member.member_id }"/>
	          <button type="button" class="btn btn-primary" id="comment_button" onclick="insertComment(${b.cb_num})">등록</button>
	          <div><hr>
	            <c:forEach items="${clist}" var='cc' varStatus="cstatus">
	         	<c:if test="${b.cb_num eq cc.cb_num }">
	            <table class="commentTable">
	              <tr>
	                <td class="top"><strong>${cc.member_id }</strong> <fmt:formatDate type="both" value="${cc.cb_comment_date}" /></td>
	                <td></td>
	              </tr>
	              <tr>
	                <td class="top">${cc.cb_comment_content }</td>
	                <c:if test="${member.member_id eq b.member_id}">	                
	                <td><button type="button" class="btn btn-danger" onclick="deleteComment(${cc.cb_commentno},'${member.member_id }');">삭제</button></td>
	                </c:if>
	              </tr>
	            </table><hr>
		          </c:if>
	              </c:forEach>
	         		<c:if test="not empty ${clist }">
	         		<button type="button" class="btn btn-default" id="moreComment"> 댓글 더 보기</button>
	         		</c:if>
	          </div>
	          <br>
	        </div>
	      </div>
	      </c:forEach>
	    <button type="button" class="btn btn-default btn-block" id="moreBoard" style="margin:0px 30px 0px 16px; width:96%;" >더 보기</button>
	    </c:if> 
    <!-- End Middle Column -->
    </div>

      
<jsp:include page="/WEB-INF/views/clubPage/common/aside2.jsp"/>      