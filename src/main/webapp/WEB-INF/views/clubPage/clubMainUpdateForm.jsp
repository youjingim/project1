<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<c:set var = 'path' value='<%=request.getContextPath()%>'/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value='club' name='pageTitle'/>
</jsp:include>
<jsp:include page="/WEB-INF/views/clubPage/common/aside1.jsp"/>
 <div class="w3-col m7">
      <div class="w3-row-padding" style="margin-top:16px;">
        <div class="w3-col m12">
          <div class="w3-card w3-round w3-white">
            <div class="w3-container w3-padding">
              <div id="post_header">
              <h6 class="w3-opacity" style="cursor:pointer"><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i>우리 동아리 소식을 공유해요~</h6>
              <span style="margin-top: -30px; float: right;">(수정)</span>
              </div>
              <div id="post" >
              <form action="clubMainUpdateBoardEnd.do" method="post" enctype="multipart/form-data" onsubmit="return validate();">
                    <input type="text" class="form-control" id="cb_title" name="cb_title" value="${c.cb_title }"><br>
                    <textarea class="form-control" rows="5" id="cb_content" name="cb_content">${c.cb_content }</textarea>
					<input type="hidden" name="cb_num"value="${c.cb_num }"/>
					<input type="hidden" name="member_id" value="${c.member_id }"/>
                	
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
                <input type="submit" class="w3-button w3-theme" style="float:right;" value="수정">
              </form>
              </div>
            </div>
          </div>
        </div>
      </div>
      </div>

      
<jsp:include page="/WEB-INF/views/clubPage/common/aside2.jsp"/>      