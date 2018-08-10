<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<c:set var = 'path' value='<%=request.getContextPath()%>'/>

<jsp:include page="/WEB-INF/views/clubPage/common/header.jsp">
   <jsp:param value=' ' name='pageTitle'/>
</jsp:include>

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
              <form action="/club/main.do" method="get">
                    <input type="text" class="form-control" id="usr" placeholder="게시글 제목을 작성해주세요."><br>
                    <textarea class="form-control" rows="5" id="comment" placeholder="게시글 내용을 작성해주세요."></textarea>

                    <!-- <input type="button" name="upload1" id="upload1" value="첨부파일"/><br>
                    <input type="button" name="upload1" id="upload1" value="첨부파일"/> -->
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
                <button type="button" class="w3-button w3-theme" style="float:right;"><i class="fa fa-pencil"></i> 등록</button>
              </form>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
        <p><i class="fa fa-user fa-fw w3-margin-right w3-text-theme"></i>총 동아리장</p>
        <span class="w3-right w3-opacity">1 min</span>
        <h4><bold>3회 교내 컨퍼런스 대회를 실시합니다.</bold></h4>
        <hr class="w3-clear">
        <p>
        2018년 7월 31일 교내 보안 동아리 컨퍼런스를 실시합니다. 장소는 공학관 B1층 컨퍼런스 홀에서 PM 3시부터 시작될 예정입니다. 학과장님 뿐만 아니라 교외에 전문가분들도 많이 참석하시는 컨퍼런스인 만큼 가급적이면 빠짐없이 모두 참석해주시면 감사하겠습니다.

        </p>
          <div class="w3-row-padding" style="margin:0 -16px">
            <div class="w3-half">
              <img src="board.jpg" style="width:100%" alt="게시글 사진1" class="w3-margin-bottom">
            </div>

        </div>
        <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom" id="like_icon"><i class="fa fa-thumbs-up"></i> 좋아요 +50</button>
        <button type="button" class="w3-button w3-theme-d2 w3-margin-bottom" id="circle_comment"><i class="fa fa-comment"></i> 댓글 +7</button>
        <div id="post_comment" >
          <input type="text" class="form-control" name="comment1" id="comment1" placeholder="댓글을 작성해주세요." style="display:inline-block; width:90%;"/>
          <button type="button" class="btn btn-primary">등록</button>
          <div><hr>
            <table>
              <tr >
                <td class="top"><strong>총동아리장</strong>  2018.03.05</td>
                <td></td>
              </tr>
              <tr>
                <td class="top">오 이번에는 꼭 참석할게요!</td>
                <td><button type="button" class="btn btn-warning" style="margin-right:5px;">수정</button></td>
                <td><button type="button" class="btn btn-danger">삭제</button></td>
              </tr>
            </table><hr>
          </div>
          <p>댓글 더 보기</p>
          <br>
        </div>
      </div>
            <button type="button" class="btn btn-default btn-block" style="margin:0px 30px 0px 16px; width:96%;">더 보기</button>
    <!-- End Middle Column -->
    </div>
      
<jsp:include page="/WEB-INF/views/clubPage/common/footer.jsp"/>      