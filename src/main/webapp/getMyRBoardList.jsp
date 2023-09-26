<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
@font-face {
	font-family: "GowunBatang-Regular";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunBatang-Regular.woff")
		format("woff");
	font-weight: normal;
	font-style: normal;
}

html, body {
	font-family: "GowunBatang-Regular";
}

table {
	width: 70%;
	border-collapse: collapse;
	margin: 0 auto;
}

th, td {
	padding: 10px;
	border-bottom: 1px solid #ddd;
	text-align: center;
	font-family: "GowunBatang-Regular";
}

th {
	background-color: #FFE3EE;
	font-family: "GowunBatang-Regular";
	font-style: normal;
	font-weight: 700;
	font-size: 18px;
	line-height: 20px;
	color: #FFAAAF;
	justify-content: space-evenly;
}

footer {
	position: relative;
	bottom: 0;
}

main {
	height: 1000px;
}

h1, #goReview {
	font-weight: bold;
	margin: 30px auto;
	display: flex;
	justify-content: center;
}
</style>
</head>
<link rel="icon" href="/img/logoimg2.png">
<link rel="shortcut icon" href="/img/logoimg2.png" type="image/x-icon">
<link rel="canonical" href="https://jikso.co.kr">
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">

<link rel="stylesheet" href="css/styles.css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css"
	rel="stylesheet">
<body>
	<%@include file="html/header.jspf"%>
	<main>
		<h1>나의 리뷰 목록</h1>
		<table border="">
			<thead>
				<tr>
					<th>글 번호</th>
					<th>제목</th>
					<th>작성날</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="rboard" items="${rboard }">
					<tr>
						<td>${rboard.rNo }</td>
						<td><a
							href="getMyRBoard.do?rNo=${rboard.rNo }&id=${member.id}">${rboard.rTitle }</a></td>
						<td>${rboard.rDate }</td>
					</tr>
				</c:forEach>
			</tbody>
			<div id="goReview">
				<a href="insertRBoard.jsp?id=${member.id}">리뷰 작성하기</a>
			</div>
		</table>
	</main>
	<footer><%@include file="html/footer.jspf"%></footer>
</body>
</html>