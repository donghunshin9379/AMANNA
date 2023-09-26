<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<title>매칭 목록</title>
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
	margin: 40px auto;
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
}

footer {
	position: relative;
	bottom: 0;
}

main {
	height: 1000px;
}
</style>
</head>
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

<body>
	<%@include file="html/header.jspf"%>
	<main>
	<div id="container">
		<h1>${member.name }님의매칭목록</h1>

		<!-- 데이터 표시 영역 -->
		<br> <br>
		<h2>받은 매칭</h2>
		<table>
			<thead>
				<tr>
					<th width="150">성별</th>
					<th width="150">이름</th>
					<th width="150">나이</th>
					<th width="200">직업</th>
					<th width="200">소개</th>
					<th width="150">진행상태</th>
					<th width="150">프로필 확인</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="match" items="${matchList }">
					<tr>
						<td>${match.sex }</td>
						<td>${match.name }</td>
						<td>${match.age }</td>
						<td>${match.job }</td>
						<td>${match.content }</td>
						<td>${match.progress }</td>
						<td><a
							href="getCaller.do?seq=${match.seq }&id=${member.id}&matchId=${match.id}">프로필
								확인</a></td>
					</tr>
				</c:forEach>

				<c:if test="${empty matchList }">
					<tr>
						<td colspan="5">데이터 가 없습니다</td>
					</tr>
				</c:if>
			</tbody>
		</table>
		<br> <br>
		<h2>보낸 매칭</h2>
		<table>
			<thead>
				<tr>
					<th width="150">성별</th>
					<th width="150">이름</th>
					<th width="150">나이</th>
					<th width="200">직업</th>
					<th width="200">소개</th>
					<th width="150">진행상태</th>
					<th width="150">프로필 확인</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="myMatch" items="${myMatchList }">
					<tr>
						<td>${myMatch.sex }</td>
						<td>${myMatch.name }</td>
						<td>${myMatch.age }</td>
						<td>${myMatch.job }</td>
						<td>${myMatch.content }</td>
						<td>${myMatch.progress }</td>
						<td><a
							href="getReceiver.do?seq=${myMatch.seq }&id=${member.id}&myMatchId=${myMatch.recId}">프로필
								확인</a></td>
					</tr>
				</c:forEach>
				<c:if test="${empty myMatchList }">
					<tr>
						<td colspan="5">데이터가 없습니다</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
	</main>
	<footer><%@include file="html/footer.jspf"%></footer>
</body>
</html>





