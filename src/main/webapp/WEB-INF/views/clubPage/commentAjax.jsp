<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<c:set var = 'path' value='<%=request.getContextPath()%>'/>
<c:forEach items="${list }" var='c' varStatus="ca">
<tr>
	<td class="top"><strong>${c.member_id }</strong>  ${c.cb_comment_date }</td>
	<td></td>
	</tr>
	<tr>
	<td class="top">${c.cb_comment_content }</td>
	<c:if test="${member.member_id eq b.member_id}">
	<td><button type="button" class="btn btn-warning" style="margin-right:5px;">수정</button></td>
	<td><button type="button" class="btn btn-danger">삭제</button></td>
	</c:if>
</tr>
</c:forEach>