<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">

<link rel="icon" href="/img/logoimg2.png">
<link rel="shortcut icon" href="/img/logoimg2.png" type="image/x-icon">
<link rel="canonical" href="https://jikso.co.kr">
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">

<link rel="stylesheet" href="css/styles.css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css"
	rel="stylesheet">
<title>My page</title>

<!-- 메뉴바 내려오기 -->
<script>
	$(function() {
		$(".mainnav1 >li").mouseover(function() {
			$(this).children(".site_nav").stop().slideDown(300);

			$(".mainnav1 > li").mouseleave(function() {
				$(this).children(".site_nav").stop().slideUp(300);
			});
		}); //메뉴

		setInterval(move, 3000);
		function move() {
			$(".menuslide ul").animate({
				left : "-1350px",
			}, 1500, function() {
				$(this).append($(".menuul ul li").first());
				$(".menuslide ul").css("left", 0);
			});
		} //
	}); //전체
</script>

<style>
html, body {
	font-family: "GowunBatang-Regular";
}

h1 {
	text-align: center;
}

#container {
	margin: 0 auto;
	text-align: center;
	width: 1200px;
	height: 100%;
}

#menu>a>img {
	width: 100px;
	height: 100px;
	margin: 0 auto;
	text-align: center;
}

#menu>a {
	text-decoration: none;
	color: black;
	font-weight: bold;
	font-size: 20px;
}

#menu_box { /* position: relative; top: 200px;  */
	width: 1200px;
	margin: auto;
	height: 500px;
	margin: 0 auto;
	margin-top: 100px;
}

#menu {
	width: 33.33%;
	height: 250px;
	float: left;
	margin-left: 50px;
	margin-bottom: 20px;
	margin: 0 auto;
}

#menu>a {
	display: inline-block;
	width: 250px;
	height: 250px;
}

footer {
	position: relative;
	bottom: 0;
}

main {
	height: 700px;
}
</style>
</head>
<body>
	<%@include file="html/header.jspf"%>
	<main>


		<div id="container">
			<div id="menu_box">
				<div id=menu>
					<a href="getMember2.jsp"><img src="pictures/회원정보조회.png">
						<br>회원정보 조회</a>
				</div>
				<div id=menu>
					<a href="getMatchList.do?$id=${member.id }"><img
						src="pictures/나의매칭목록.png"> <br>나의 매칭</a>
				</div>
				<div id=menu>
					<a href="getRBoardList.do?id=${member.id }"><img
						src="pictures/리뷰게시판.png"> <br>리뷰 게시판</a>
				</div>
				<div id=menu>
					<a href="insertRBoard.jsp?id=${member.id }"><img
						src="pictures/리뷰작성.png"> <br>리뷰 작성</a>
				</div>
				<div id=menu>
					<a href="getMyRBoardList.do?id=${member.id }"><img
						src="pictures/내리뷰보기.png"> <br>나의 리뷰</a>
				</div>
				<div id=menu>
					<a href="CustomerService.jsp"><img src="pictures/고객센터.png">
						<br>고객센터 문의</a>
				</div>
			</div>
		</div>
	</main>
	<footer><%@include file="html/footer.jspf"%></footer>
</body>
</html>