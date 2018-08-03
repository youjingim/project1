<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
    <%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
    <%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
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
top:100px;
}
	div#board-continer{width:800px;margin:0 auto; text-align:center}
	div#board-continer input{margin-bottom:15px;}
</style>
<script>
 $(function(){
	$('[name=upFile]').on('change',function(){
		//var filename=$(this).val();
		var filename=this.files[0].name;
		//var filename=$(this).prop('files')[0].name;
		$(this).next('.custom-file-label').html(filename);
	});
 });
  function validate(){
        var content = $("[name=boardContent]").val();
        if(content.trim().length==0){
            alert("내용을 입력하세요");
            return false;
        }
        return true;
    }
 </script>
 <section>
     <div id="main_container">
     <div id="board-continer">
        <form name="boardFrm" action="${pageContext.request.contextPath}/board/boardFormEnd.do" method="post" onsubmit="return validate();"  enctype="multipart/form-data" >
            <input type="text" class="form-control" placeholder="제목" name="boardTitle" id="boardTitle" required>
            <input type="text" class="form-control" placeholder="아이디 (4글자이상)" name="boardWriter" value="${memberLoggedIn.userId}" readonly required>
            <!-- input:file소스 : https://getbootstrap.com/docs/4.1/components/input-group/#custom-file-input -->
            <!-- style.css에서 div의  padding:10px을 제거함 -->
            <div class="input-group mb-3" style="padding:0px;">
                <div class="input-group-prepend" style="padding:0px;">
                    <span class="input-group-text">첨부파일1</span>
                </div>
                <div class="custom-file">
                    <input type="file" class="custom-file-input" name="upFile" id="upFile1">
                    <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
                </div>
                <div class="input-group-prepend" style="padding:0px;">
                    <span class="input-group-text">첨부파일2</span>
                </div>
                <div class="custom-file">
                    <input type="file" class="custom-file-input" name="upFile" id="upFile2">
                    <label class="custom-file-label" for="upFile2">파일을 선택하세요</label>
                </div>
            </div>
            <textarea class="form-control" name="boardContent" placeholder="내용" required></textarea>
            <br />
            <input type="submit" class="btn btn-outline-success" value="저장" >
        </form>
        </div>
    </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	</section>
	