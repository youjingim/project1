<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<c:set var = 'path' value='<%=request.getContextPath()%>'/>
<!DOCType html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>메세지 알림창</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script>
			alert("${msg}");
			location.href="${pageContext.request.contextPath}/${loc}";
		</script>
	</head>
<body>

</body>
</html>
