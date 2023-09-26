<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가쓴 댓글 수정,삭제</title>
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

.upde {
	margin: 0 auto;
	text-align: center;
}

footer {
	position: relative;
	bottom: 0;
}

main {
	height: 800px;
}

h1 {
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
		<h1>리뷰 상세보기</h1>
		<table>
			<tr>
				<th>제목</th>
				<td>${rboard.rTitle }
				</th>
			</tr>
			<tr>
				<th>작성시간</th>
				<td>${rboard.rDate }
				</th>
			</tr>
			<tr>
				<th>내용</th>
				<td>${rboard.rContent }
				</th>
			</tr>
			<%-- <tr>
				<td><img src="reviewPictures/${rboard.uploadFile1}"
					alt="Attached Image"></td>
			</tr> --%>
		</table>
		<div class="upde">
			<a href="deleteRBoard.do?rNo=${rboard.rNo }&id=<%= id %>">삭제하기</a> <a
				href="updateRBoard.jsp?rNo=${rboard.rNo }&id=<%= id %>">수정하기</a> <a
				href="getMyRBoardList.do?id=<%=id%>">내글 목록으로 가기</a>
		</div>
	</main>
	<footer><%@include file="html/footer.jspf"%></footer>
</body>
</html>