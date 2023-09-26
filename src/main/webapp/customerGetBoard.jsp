<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소개팅 사이트 Q&A</title>
<%@ include file="html/header.jspf"%>
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">
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

/* 적절한 스타일을 추가하세요 */
table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

input[type="button"] {
	margin: 10px;
	padding: 10px 20px;
	background-color: #4CAF50;
	color: white;
	border: none;
	cursor: pointer;
}

.viewComment {
	margin-top: 20px;
}

.viewComment table {
	width: 100%;
	border-collapse: collapse;
}

.viewComment th, .viewComment td {
	padding: 10px;
	text-align: left;
}

.viewComment th {
	background-color: #f2f2f2;
}

.viewComment a {
	color: blue;
}

.viewComment a:hover {
	text-decoration: underline;
}

footer {
	position: relative;
	bottom: 0;
}

main {
	height: 1000px;
}

#container, #viewDetail, #viewComment {
	width: 800px;
	margin: 30px auto;
}

h1 {
	font-weight: bold;
	margin: 30px auto;
	display: flex;
	justify-content: center;
}
</style>
</head>
<body>
	<main>
		<h1>QnA 상세보기</h1>
		<div id="container">
			<table>
				<tr>
					<th width="70">제목</th>
					<td>${board.qTitle }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${board.qWriter}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${board.qContent}</td>
				</tr>
				<tr>
					<th>공개여부</th>
					<td>${board.lockFlag}</td>
				</tr>
			</table>
		</div>

		<div id="viewDetail">
			<input type="button" value="업데이트"
				onclick="location.href='customerUpdateBoard.jsp'"> <input
				type="button" value="삭제하기"
				onclick="location.href='customerDeleteBoard.do?qNo=${board.qNo}'">
			<input type="button" value="목록으로 "
				onclick="location.href='customerQnaList.do'">
		</div>

		<div id="viewComment">
			<table>
				<tr>
					<th>번호</th>
					<th>답변</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
				<c:forEach var="qlist" items="${qlist}">
					<tr>
						<td>${qlist.qCno}</td>
						<td>${qlist.qcContent}</td>
						<td>${qlist.qcWriter}</td>
						<td>${qlist.qcCommentDate}</td>
					</tr>
				</c:forEach>
				<c:if test="${empty qlist}">
					<tr>
						<td colspan="4">답변이 없습니다. 작성일 기준 1~2안에 답변해드리도록
					</tr>
				</c:if>
			</table>
			<br> <br>
		</div>
	</main>
	<%@ include file="html/footer.jspf"%>
</body>
</html>

