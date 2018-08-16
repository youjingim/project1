<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<c:set var = 'path' value='<%=request.getContextPath()%>'/>

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
function like_button(){

}

	function insertComment(n){
		console.log("ddddd");
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

</script>

<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value='club' name='pageTitle'/>

</jsp:include>
<jsp:include page="/WEB-INF/views/clubPage/common/aside1.jsp"/>    
<!-- Middle Column -->
    <div class="w3-col m7">
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
                            <input type="file" class="custom-file-input" name="upFile" id="upFile1">

                        </div>
                        <div class="input-group-prepend" style="padding:0px;">
                            <span class="input-group-text">첨부파일2</span>
                        </div>
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" name="upFile" id="upFile2">
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
	      <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
	        <p style="display:inline-block;"><i class="fa fa-user fa-fw w3-margin-right w3-text-theme"></i>${b.member_id }</p>
	        <c:if test="${member.member_id eq b.member_id}">
	        <div style="flaot:right; display: inline-block;">
	        <button type="button" class="btn btn-warning" style="margin-right:5px;" onclick="updateBoard(${b.cb_num })">수정</button>
	        <button type="button" class="btn btn-danger" onclick="deleteBoard(${b.cb_num },'${b.member_id }')">삭제</button>
	        </div>
	        </c:if>
	        <span class="w3-right w3-opacity">${b.cb_date }</span>
	        <h4><bold>${b.cb_title }</bold></h4>
	        <hr class="w3-clear">
	        <p>
	        ${b.cb_content }
	        </p><br>
	        <c:if test="${b.cb_attachment ne 'notFoundFile' }">
	          <div class="w3-row-padding" style="margin:0 -16px" id="img_container">
	            <div class="w3-half">
	              <img src="board.jpg" style="width:200px; height:200px;" alt="게시글 사진1" class="w3-margin-bottom">
	            </div>
			 </div>
			 </c:if>
	        <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom" id="like_icon" onclick="like_button();"><i class="fa fa-thumbs-up"></i> 좋아요 </button>
	        <button type="button" class="w3-button w3-theme-d2 w3-margin-bottom" id="circle_comment"><i class="fa fa-comment"></i> 댓글 +7</button>
	        <div id="post_comment" >
	          <input type="text" class="form-control" name="comment1" id="comment1" placeholder="댓글을 작성해주세요." style="display:inline-block; width:90%;"/>
	          <input type="hidden" id="memberId" value="${member.member_id }"/>
	          <input type="hidden" id="no" value="${b.cb_num }"/>
	          <button type="button" class="btn btn-primary" id="comment_button"onclick="insertComment(${b.cb_num})">등록</button>
	         
	          <div><hr>
	            <table id="commentTable">
	            <c:forEach items="${clist}" var='cc' varStatus="cstatus">
	              <tr >
	                <td class="top"><strong>${cc.member_id }</strong>  ${cc. cb_comment_date}</td>
	                <td></td>
	              </tr>
	              <tr>
	                <td class="top">${cc.cb_comment_content }</td>
	                <c:if test="${member.member_id eq b.member_id}">
	                <td><button type="button" class="btn btn-warning" style="margin-right:5px;">수정</button></td>
	                <td><button type="button" class="btn btn-danger">삭제</button></td>
	                </c:if>
	              </tr>
	              </c:forEach>
	            </table><hr>
	          </div>
	          <p>댓글 더 보기</p>
	          <br>
	        </div>
	      </div>
	            <button type="button" class="btn btn-default btn-block" style="margin:0px 30px 0px 16px; width:96%;">더 보기</button>
	      </c:forEach>
	    </c:if> 
    <!-- End Middle Column -->
    </div>

      
<jsp:include page="/WEB-INF/views/clubPage/common/aside2.jsp"/>      