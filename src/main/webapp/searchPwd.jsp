<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
 <script>
      $(function () {
        $(".mainnav1 >li").mouseover(function () {
          $(this).children(".site_nav").stop().slideDown(300);

          $(".mainnav1 > li").mouseleave(function () {
            $(this).children(".site_nav").stop().slideUp(300);
          });
        }); //메뉴
      }); //전체
    </script>
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">

<script>
	
	window.onload = function() {
		document.getElementById('submit').onclick = function() {
			
			if ( document.pfrm.id.value.trim() == '' ) {
				alert( 'ID를 입력해주세요' );
				return false;
			}
			if ( document.pfrm.mail.value.trim() == '' ) {
				alert( '메일을 입력해주세요' );
				return false;
			}
			document.pfrm.submit();
		}
	}
</script>
<style>
@font-face {
  font-family: "GowunBatang-Regular";
  src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunBatang-Regular.woff")
    format("woff");
  font-weight: normal;
  font-style: normal;
}	
body {
  font-family: "GowunBatang-Regular";
}   
    
#container {
width: 500px;
height: 300px;
margin: 0 auto;
margin-bottom: 200px;
margin-top: 150px;
border: 10px solid #ffe3ee;
background-image: url("resources/img/pink_heart4.jpeg");

}

h2 {
width: 1000px;
text-shadow: 2px 2px 2px #ff93a2;
margin: 0 auto;
text-align: center;
font-size: 20px;
}
.noti {
	margin-top: 40px;
}
.sub {
	width: 500px;
	text-align: center;
}
.name {width: 350px; margin-top: 25px;  margin-left: 10px;}
.num {width: 350px; margin-top: 25px; margin-left: 10px;}
#span {display: inline-block; width: 100px; height: 30px; font-weight: bold;} 
input {
	border:3px solid #ffe3ee;
	border-radius: 5px;
	width: 200px;
	height: 40px;
}

#submit {
	width: 200px;
	height: 30px;
	float: right;
	background-color: #ffe3ee;
	border: none;
	border-radius: 10px;
	font-family: "GowunBatang-Regular";
	margin-right: 10px;
	cursor: pointer;
	font-weight: bold;
	margin-top: 20px;
}

#submit:hover {
	background-color: #ff93ae;
	color: white;
}


    main {
	height: 830px;
}
footer {

position: relative;
bottom: 0;

}
</style>
</head>
<body>
<%@include file="html/header.jspf" %>
<main>
			<h2 class="noti">비밀번호의 경우 암호화 저장되어 분실 시 찾아드릴 수 없는 정보 입니다.<br>
				입력하신 정보를 통해  데이터 조회 후 비밀번호 재설정 페이지로 이동합니다.</h2>
<div id="container">
    <form action="searchPwd.do" method="post" class="form-horizontal" name="pfrm">
	
      	<div class="row">
        	<div align="center">
        	<h2 class="sub">PW 찾기</h2>
		</div>	
      	</div>			
        <div class="name">
		<span id="span">아이디</span>
		<div class="col-8">
			<input type="text" class="form-control" name="id" placeholder="아이디를 입력하세요." required="required">
		</div>        	
        </div>

	<div class="num">
		<span id="span">이메일</span>
		<div class="col-8">
			<input type="text" class="form-control" name="email" placeholder="메일을 입력하세요." required="required">
		</div>        	
        </div>
	<div class="btn">
		<button type="submit" id="submit">비밀번호 찾기</button>
	</div>		

    </form>
</div>
</main>
<%@include file="html/footer.jspf" %>
</body>

	<!-- $(function(){
		// 클릭 시 inputBtn의 이벤트 발생
		$("#inputBtn").click(function(){
			//input값 확인
			var name = $("#name").val();
			console.log("name : " + name);						
			var phone = $("#phone").val();
			console.log("phone : " + phone);
			
			if (name == ""||phone == "") {
				alert("필수 정보가 입력되지 않았습니다!\n 다시 입력하세요.");
			} else {
				//alert("이름, 전화번호 : " + name + ", " + phone);			
				alert("결과 페이지로 이동합니다.\n (가입이 되어 있을 시 결과 출력)");
				location.href = "searchIdResult.jsp"; //다음 화면
			
			}
						
		});
		
	}); -->









