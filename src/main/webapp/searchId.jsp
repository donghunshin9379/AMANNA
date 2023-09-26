<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ID 찾기</title>
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
			
			if ( document.pfrm.name.value.trim() == '' ) {
				alert( '실명을 입력해주세요' );
				return false;
			}
			if ( document.pfrm.email.value.trim() == '' ) {
				alert( '이메일을 입력해주세요' );
				return false;
			}
			 
			
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
margin-bottom: 100px;
margin-top: 150px;
border: 10px solid #ffe3ee;
background-image: url("resources/img/pink_heart4.jpeg");
margin-bottom: 300px;
}

h2 {
width: 500px;
text-shadow: 2px 2px 2px #ff93a2;
text-align: center;
}
.name { margin-left: 10px; margin-bottom: 15px;}
.email {margin-left: 10px; margin-bottom: 15px;}
#span {display:inline-block; width:60px; height: 30px; margin-left: 10px; margin-top: 15px;} 
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
}

#submit:hover {
	background-color: #ff93ae;
	color: white;
}
td {
	width :250px;
	font-weight: bold;
	
}
    main {
	height: 730px;
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
<div id="container">
<h2>ID 찾기</h2>
    <form action="getId.do" method="post" class="form-horizontal" name="pfrm">
		<table>
			<tr>
				<td>
				<span id="span">이름</span> <input type="text" name="name" class="name">
				</td>
			</tr>
			<tr>
				<td>
				<span id="span">이메일</span> <input type="text" name="email" class="email">
				</td>
			</tr>
		</table>
				<input type="submit" value="아이디 찾기" id="submit" onclick="result()">
      	

    </form>
</div>
</main>
<%@include file="html/footer.jspf" %>

</body>
</html>

	<!-- $(function(){
		// 클릭 시 이벤트 발생
		$("#submit").click(function(){
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









