<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
    <%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
    <%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
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
top:100px;
}
    </style>
        <script>
    function fileDownload(oName, rName){
        //한글파일명이 있을 수 있으므로, 명시적으로 encoding
	    oName = encodeURIComponent(oName);
        location.href="${pageContext.request.contextPath}/board/fileDownload.do?oName="+oName+"&rName="+rName;
    }
    </script>
    <section>
<div id="main_container">
    
    <div id="board-container">
        <input type="text" class="form-control" placeholder="제목" name="boardTitle" id="boardTitle" value="${board.boardTitle }" required>
        <input type="text" class="form-control" name="boardWriter" value="${memberLoggedIn.userId}" readonly required>

        <c:forEach items="${attachList}" var="a" varStatus="vs">
            <button type="button" 
                    class="btn btn-outline-success btn-block"
                    onclick="fileDownload('${a.originalFileName}','${a.renameFileName }');">
                첨부파일${vs.count} - ${a.originalFileName }
            </button>
        </c:forEach>
        
        <textarea class="form-control" name="boardContent" placeholder="내용" required>${board.boardContent }</textarea>
    </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</section>

	
	