<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%
    Date d = new Date();
    SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
    String date1 = sd.format(d);
   	request.setAttribute("date",date1);

   %>
<c:set var = 'path' value='<%=request.getContextPath()%>'/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value='club' name='pageTitle'/>
</jsp:include>
<jsp:include page="/WEB-INF/views/clubPage/common/aside1.jsp"/>      
<script>
//budget_form
$(document).ready(function(){
	$("#budget_button").click(function(){
		var level='${memberLoggedIn.member_level}';
		
		if(level!=='L2'){
	    $("#budget_form").toggle();
		}
		else{
			alert('당신은 권한이 없습니다.');
			$("#budget_form").hide();
			history.go();
		}
		
		
	});
	$("#sub_bud").click(function(){
		var budDate=$('[name=used_date]').val();
		var inputMoney=$('[name=budget_input]').val();
		var outputMoney=$('[name=budget_output]').val();
		var budContent=$('[name=budget_content]').val();
		var today='${date}';
		if(today<=budDate){
			alert('현재 또는 이전의 날짜만 입력가능합니다.');
			return false;
		}
		
		if(inputMoney==""){
			$('[name=budget_input]').val(0);
		}
		if(outputMoney==""){
			$('[name=budget_output]').val(0);
		}
		if(budDate==""){
			alert('입금/출금 날짜를 입력해주세요.');
			return false;
		}
		if(inputMoney=="" && outputMoney==""){
			alert('지출이나 입금 하나는 꼭 입력해주세요.');
			return false;
		}
		if(budContent==""){
			alert('내용을 반드시 입력해주세요.');
			
			return false;
		}
		
		return true;
	});
});
    function fileDownload(oName, rName){
        //한글파일명이 있을 수 있으므로, 명시적으로 encoding
	    oName = encodeURIComponent(oName);
        location.href="${pageContext.request.contextPath}/budgetDownload.do?oName="+oName+"&rName="+rName;
  }
 </script>
<style>
/* 페이징 처리 css */
/* Pagination links */
.pagination a {
    color: black;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color .3s;
}

/* Style the active/current link */
.pagination a.active {
    background-color: dodgerblue;
    color: white;
}

/* Add a grey background color on mouse-over */
.pagination a:hover:not(.active) {background-color: #ddd;}
#budget_list th{
  text-align: center;
}
</style>
<!-- Middle Column -->
    <div class="w3-col m7">

      <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
        <div style="height:50px;">
        <h5 style="text-align:center;"><strong><c:out value="${club.circle_name }"/> 예산관리</strong></h5>
        <button type="button" class="btn btn-default" style="float:right;" id="budget_button">예산관리 작성</button>
        </div>
        <hr>
        <!-- 예산 관리 입력div -->
        <div id="budget_form" style="display:none;">
          <form action="insert_budget.do" method="post" enctype="multipart/form-data">
          <label id="budget_date">입금/출금 날짜</label> <input for="budget_date" class="form-control" type="date" name="used_date" placeholder="예산을  입력해주세요.">
          <label id="budget_output">지출</label> <input for="budget_output" class="form-control" type="number" name="budget_output" placeholder="출금액을 입력해주세요.">
          <label id="budget_input">입금</label> <input for="budget_input" class="form-control" type="number" name="budget_input" placeholder="입금액을 입력해주세요.">
          <label id="budget_content">내용</label> <input for="budget_content" class="form-control" type="text" name="budget_content" placeholder="내용을 입력해주세요.">
          <input type="hidden" name="circle_num" value="${club.circle_num }"/>
          <input type="hidden" name="member_id" value="${memberLoggedIn.member_id}"/>
          <div class="input-group-prepend" style="padding:0px;">
              <span class="input-group-text">영수증 첨부파일</span>
          </div>
          <div class="custom-file">
          <input type="file" class="custom-file-input" name="upFile" id="upFile1">
          </div>
          <input id="sub_bud" type="submit" class="btn btn-success" value="제출"style="float:right; margin:5px;"/><br><br>
        </form><hr><br>
        </div>


        <!-- 예산 관리 테이블 -->
        <div>
          <table class="table table-bordered" id="budget_list">
            <thead>
              <tr>
                <th>날짜</th>
                <th>내용</th>
                <th>수입금액</th>
                <th>지출금액</th>
                <th>잔액</th>
                <th>첨부파일</th>
                <th>작성자</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach items="${list }" var='b' varStatus="status">
              <tr>
                <td>${b.used_date }</td>
                <td>${b.budget_content }</td>
                <td style="text-align:right; color:blue;"><fmt:formatNumber value="${b.budget_input }" pattern="#,###"/></td>
                <td style="text-align:right; color:red;"><fmt:formatNumber value="${b.budget_output }" pattern="#,###"/></td>
                <td style="text-align:right;"><fmt:formatNumber value="${b.total }" pattern="#,###"/></td>
                <td align='center'>
                <c:if test='${not empty b.attachment }'>
							<img alt="첨부파일" src="${pageContext.request.contextPath }/resources/image/file.png" width=16px; onclick="fileDownload('${b.attachment}','${b.reattachment }');">
						</c:if>
                </td>
                <td>${b.member_id }</td>
              </tr>
             </c:forEach> 
            </tbody>
          </table>
          <!-- 페이징 처리 -->
	      <div class="pagination" style="display: table;margin-right: auto;margin-left: auto;">
	        ${pageBar }
	      </div>
          <div>
          <h6 style="float:right; color:blue;"><strong>현재 잔액 : <fmt:formatNumber value="${currentTotal }" pattern="#,###"/></strong></h6>
          </div>
        </div>
      </div>
    <!-- End Middle Column -->
    </div>

      
<jsp:include page="/WEB-INF/views/clubPage/common/aside2.jsp"/>      