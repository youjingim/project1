<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<c:set var = 'path' value='<%=request.getContextPath()%>'/>

<jsp:include page="/WEB-INF/views/clubPage/common/header.jsp">
   <jsp:param value=' ' name='pageTitle'/>
</jsp:include>
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

.w3-table th{
  text-align: center;
}
</style>
  <!-- Middle Column -->
    <div class="w3-col m7">

      <div class="w3-container w3-card w3-white w3-round w3-margin" style="height:700px;"><br>
        <div>
        <h5 style="text-align:center;"><strong>MJ 보안동아리 회원목록</strong></h5> <hr>
        </div>
        <div>
        <table class="w3-table">
        <tr>
          <th>번호</th>
          <th>이름</th>
          <th>회원등급</th>
          <th>전화번호</th>
          <th>이메일</th>
          <th>수정 / 삭제</th>
        </tr>
        <tr>
          <td>1</td>
          <td>홍길동</td>
          <td><select>
              <option value="0">일반회원</option>
              <option value="1">총부</option>
              <option value="2">부회장</option>
              <option value="3">회장</option>
            </select></td>
          <td>010-1234-5678</td>
          <td>gildong@gmail.com</td>
          <th><button>등급수정</button>  <button>회원삭제</button></th>
        </tr>
        <tr>
          <td>1</td>
          <td>홍길동</td>
          <td><select>
              <option value="0">일반회원</option>
              <option value="1">총부</option>
              <option value="2">부회장</option>
              <option value="3">회장</option>
            </select></td>
          <td>010-1234-5678</td>
          <td>gildong@gmail.com</td>
          <th><button>등급수정</button>  <button>회원삭제</button></th>
        </tr>
        <tr>
          <td>1</td>
          <td>홍길동</td>
          <td><select>
              <option value="0">일반회원</option>
              <option value="1">총부</option>
              <option value="2">부회장</option>
              <option value="3">회장</option>
            </select></td>
          <td>010-1234-5678</td>
          <td>gildong@gmail.com</td>
          <th><button>등급수정</button>  <button>회원삭제</button></th>
        </tr>
        <tr>
          <td>1</td>
          <td>홍길동</td>
          <td><select>
              <option value="0">일반회원</option>
              <option value="1">총부</option>
              <option value="2">부회장</option>
              <option value="3">회장</option>
            </select></td>
          <td>010-1234-5678</td>
          <td>gildong@gmail.com</td>
          <th><button>등급수정</button>  <button>회원삭제</button></th>
        </tr>
        <tr>
          <td>1</td>
          <td>홍길동</td>
          <td><select>
              <option value="0">일반회원</option>
              <option value="1">총부</option>
              <option value="2">부회장</option>
              <option value="3">회장</option>
            </select></td>
          <td>010-1234-5678</td>
          <td>gildong@gmail.com</td>
          <th><button>등급수정</button>  <button>회원삭제</button></th>
        </tr>
      </table>
      <!-- 페이징 처리 -->
      <div class="pagination" style="display: table;margin-right: auto;margin-left: auto;">
        <a href="#">&laquo;</a>
        <a href="#">1</a>
        <a class="active" href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#">&raquo;</a>
      </div>
    </div>
      </div>
    <!-- End Middle Column -->
    </div>

      
<jsp:include page="/WEB-INF/views/clubPage/common/footer.jsp"/>      