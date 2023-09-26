<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 수정</title>
</head>
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">

<script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10">
</script>
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
footer {
	position: relative;
	bottom: 0;
}

main {
	height: 800px;
}

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

h1 {
	font-weight: bold;
	margin: 30px auto;
	display: flex;
	justify-content: center;
}

#container {
	width: 1280px;
	margin: 0 auto;
	padding-top: 10px;
	display: flex;
	justify-content: center;
}

</style>
<body>
	<%@include file="html/header.jspf"%>s
	<main>
		<h1>나의 리뷰 수정</h1>
		<div id="container">
			<form action="updateRBoard.do">
				<input type="hidden" name="id" value="<%=id%>"> <input
					type="hidden" name="rNo" value="${rboard.rNo }">
				<table>
					<tr>
						<th>제목</th>
						<td><input type="text" name="rTitle"
							placeholder="${rboard.rTitle}"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="rContent" rows="10" cols="40"
								placeholder="${rboard.rContent }"> </textarea></td>
					</tr>
					<tr>
						<td colspan="2" class="center"><input type="submit"
							value="수정하기"></td>
					</tr>
				</table>
			</form>
		</div>
	</main>
	<footer><%@include file="html/footer.jspf"%></footer>
</body>
</html>