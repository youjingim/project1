<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
   .box {
        padding: 30px;
    }

    .icon {
        width: 30px;
        height: 30px;
        margin:10px;

    }

footer{
width:100%;
height:450px;
position:absolute;
background-color: #6CC0FF;
margin-top:0px;
z-index:100;
}
footer div#footer_container{
position:absolute;
width:100%;
height:400px;
}
footer p {
  font-family: dotum;
  font-size: 12px;
  color: #4d4d4d;
}
.footer_intro{
   margin:0px;
}

hr {
  border-color: #C2C2C2;
}
#footer_right{
top:20px;
margin:0px;
height:380px;

text-align: center;
font-family: 'Gothic A1', sans-serif;
}
#footer_left{
margin:0px;
height:300px;
top:50px;
}
#qa1{
width:100%;
height:200px;
left:0%;
display:inline-block;
padding:0px;

}
#qIcon{
display:block;
width:20%;
margin:0px 0px 0px 15%;
}
#rIcon{
display:block;
margin:40px 0px 0px 15%;
width:20%;
}

#quetion{
color:gray;font-size:25px;position:absolute;top:30px;left:40%;
}
#report{
color:gray;font-size:25px;position:absolute;top:180px;left:40%;
}
.footer_logo{
font-family: 'Lobster', cursive;
font-size:45px;
color:black;
position:absolute;
right:7%;
top:110px;
}


@media screen and (max-width: 1430px) {

	#qa1{
	height:300px;
	}
	#footer_container{
	height:300px;
	
	}
	#footer_left{
	height:300px;
	
	}
	#footer_right{
	height:300px;
	}

	
  	#report {
		top:180px;
		left:50%;
	}

	#quetion {
		left:50%;
		top:30px;
	}
 
}
@media screen and (max-width: 900px) {
footer{
height:700px;
}
  	#report {
		top:180px;
		left:55%;
	}

	#quetion {
		left:55%;
		top:30px;
	}


}


@media screen and (max-width: 850px) {
footer{
height:700px;
}



}

@media screen and (max-width: 400px) {
 	#report {
		top:150px;
		left:65%;
	}

	#quetion {
		left:65%;
		top:34px;
	}
	footer{
	height:800px;
	}

}
footer a{
font-weight:bold;
font-size:18px;
}
</style>

<footer>
<hr>

<div id="footer_container" class='row'>
<div id='footer-center' class='col-sm-3'>
<div class="footer_logo">Campus Pick</div>
</div>
<div id='footer_right' class='col-sm-6'>
        <div class='box'>
                <a href="http://www.instagram.com"><img class='icon' src="${pageContext.request.contextPath }/resources/image/instar.png"></a>
                <a href="http://www.facebook.com"><img class='icon' src="${pageContext.request.contextPath }/resources/image/facebook.png"></a>
                <a href="http://www.twiter.com"><img class='icon' src="${pageContext.request.contextPath }/resources/image/twiter.png"></a>
                <a href="http://www.google.com"><img class='icon' src="${pageContext.request.contextPath }/resources/image/google.png"></a>
            </div>
    <div style='color:black;text-decoration:none;'>
    	<a href="#" onclick="fnMove('1')" style='color:black;'><b>소 개</b></a>&nbsp;&nbsp; &nbsp;&nbsp; <a href="#" style='color:black;'><b>공지사항</b></a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="#" style='color:black;'><b>FAQ</b></a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="#" style='color:black;'><b>1:1 문의</b></a><br><br><br>
        <b>상호명 : (주)Campus pick</b> &nbsp 대표: 김유진<br/>
        <b>사업자등록번호</b> : 123-45-67890&nbsp |&nbsp <b>통신판매업신고번호</b> : 제 2013-강남 역삼-1234 호<br/>
        <b>서울특별시 강남구 테헤란로 14길 6</b> 남도빌딩 2F,3F,4F,5F &nbsp<b>대표번호</b> : 1544-9970<br/>
        AM 09:00 - PM 06:00 (WEEKEND/HOLIDAY OFF)<br/>
        <b>이용약관 &nbsp&nbsp 개인정보처리방침</b><br/>
        Copyright ⓒ rkddkwl <br/>
    </div>

</div>
<div id='footer_left' class='col-sm-3'>

</div>
</div>
</footer>

</body>
</html>