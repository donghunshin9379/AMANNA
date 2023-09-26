<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 프로필(신청하기)</title>
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

	function showAlert() {
		alert("신청이 완료되었습니다!");
	}
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
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	text-align: center;
	margin: 40px auto;
}

h1, h2, h3, th, td, input {
	display: inline;
	font-family: "GowunBatang-Regular";
}

#profilePic {
	border: 3px solid pink;
	border-radius: 70px;
}

input {
	width: 100px;
	height: 60px;
	font-size: 1.3em;
}

main {
	height: 800px;
}

footer {
	position: relative;
	bottom: 0;
}
</style>

</head>
<body>
	<%@include file="html/header.jspf"%>
	<main>
		<div id="container">
			<h1>PROFILE</h1>

			<form action="insertMatching.do" method="get">
				<input type="hidden" name="id" value="${member.id }"> <input
					type="hidden" name="recId" value="${user.id }">
				<table>
					<tr>
						<td><img alt="등록한 사진이 없습니다" src="pictures/${user.imgName }"
							id="profilePic"></td>
					</tr>

					<tr>
						<td>이름 : ${user.name }</td>
					</tr>

					<tr>
						<td>나이 : ${user.age }</td>
					</tr>

					<tr>
						<td>키 : ${user.height }</td>
					</tr>

					<tr>
						<td>몸무게: ${user.weight }</td>
					</tr>

					<tr>
						<td>최종학력 : ${user.edu }</td>
					</tr>

					<tr>
						<td>직업 : ${user.job }</td>
					</tr>
					<tr>
						<td>흡연유무 : ${user.smoke }</td>
					</tr>

					<tr>
						<td>취미 : ${user.hobby }</td>
					</tr>

					<tr>
						<td>소개 : ${user.content }</td>
					</tr>
					<tr>
						<td colspan="2" class="center"><br> <input type="submit"
							value="신청하기" onclick="showAlert()"></td>
					</tr>
				</table>
			</form>
		</div>
	</main>
	<footer><%@include file="html/footer.jspf"%></footer>
</body>
</html>