<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 목록</title>
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

<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">

<style>
@font-face {
	font-family: "GowunBatang-Regular";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunBatang-Regular.woff")
		format("woff");
	font-weight: normal;
	font-style: normal;
}

#container {
	width: 1280px;
	margin: 0 auto;
	padding-top: 10px;
	border-bottom: 1.5px solid #ffdcdc;
}

th {
	background-color: pink;
}

th, td {
	padding: 10px;
	border-bottom: 1px solid #ddd;
	text-align: center;
	font-family: "GowunBatang-Regular";
}

h1, h2, h3 {
	display: inline;
	font-family: "GowunBatang-Regular";
	margin-left: 50px;
}

#gmBanner {
	width: 1280px;
	height: 270px;
	margin: 0 auto;
	border: 1.5px solid #ffdcdc;
}

footer {
	position: relative;
	bottom: 0;
}

main {
	height: 1300px;
}
</style>
</head>
<body>
	<%@include file="html/header.jspf"%>
	<main>

	<!-- 데이터 표시 영역 -->
	<div id="container">
		<img alt="유저목록배너사진" src="pictures/1280.png" id="gmBanner">
		<table>
			<thead>
				<tr>
					<th width="150">아이디</th>
					<th width="150">성별</th>
					<th width="150">이름</th>
					<th width="150">나이</th>
					<th width="150">신장</th>
					<th width="150">체중</th>
					<th width="300">학력</th>
					<th width="200">직업</th>
					<th width="150">흡연여부</th>
					<th width="150">신청</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${memberlist }">
					<tr>
						<td>${user.id }</td>
						<td>${user.sex }</td>
						<td>${user.name }</td>
						<td>${user.age }</td>
						<td>${user.height }</td>
						<td>${user.weight }</td>
						<td>${user.edu }</td>
						<td>${user.job }</td>
						<td>${user.smoke }</td>
						<td>
							<!-- 피신청자 아이디 --> <a href="getMember.do?id=${user.id }"> 신청하기<br>(상세보기)
						</a>
						</td>
					</tr>
				<input type="hidden" name="id" value="${member.id }">
				</c:forEach>
				<c:if test="${empty memberlist }">
					<tr>
						<td colspan="5">데이터가 없습니다</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>

    <div
		style="width: 100%; text-align: center; margin-top: 20px; font-size: 1.5em;"
		class="page">
		<c:forEach var="i" begin="1" end="${totalPage }">
			<a href="getMemberList.do?viewPage=${i }&&id=${member.id}">${i }</a>
		</c:forEach>
	</div> 
	<br>
	<br>
	<br>

</main>
	<footer><%@include file="html/footer.jspf"%></footer>
</body>
</html>




