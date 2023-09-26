<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 수정</title>
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


.container {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
}

h1 {
	font-size: 24px;
	margin-bottom: 20px;
}

form {
	margin-bottom: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 12px;
	border: 1px solid #ddd;
	text-align: left;
}

th {
	background-color: #f5f5f5;
	font-weight: bold;
	width: 150px;
}

input[type="text"], input[type="email"], textarea {
	width: 100%;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	resize: vertical;
}

input[type="radio"] {
	margin-right: 10px;
}

textarea {
	height: 150px;
}

.center {
	text-align: center;
}

input[type="submit"] {
	background-color: #4CAF50;
	color: white;
	border: none;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #45a049;
}

footer {
	position: relative;
	bottom: 0;
}

main {
	height: 800px;
}

#container {
	width: 1280px;
	margin: 40px auto;
	padding-top: 10px;
	border-bottom: 1.5px solid #ffdcdc;
}

</style>
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
<script>
function validateForm() {
	  var title = document.forms["updateForm"]["qTitle"].value;
	  var content = document.forms["updateForm"]["qContent"].value;
	  var lockFlag = document.forms["updateForm"]["lockFlag"].value;

	  if (title == "") {
	    alert("제목을 입력해주세요.");
	    return false;
	  }

	  if (content == "") {
	    alert("내용을 입력해주세요.");
	    return false;
	  }

	  if (lockFlag == "") {
	    alert("공개여부를 선택해주세요.");
	    return false;
	  }
	}
</script>
<%@ include file="html/header.jspf"%>
<link rel="stylesheet" href="css/header.css">
</head>
<body>
<main>	
	<div id="container">
	<form name="updateForm" action="customerUpdate.do"
		onsubmit="return validateForm()">
		<input type="hidden" name="qNo" value="${board.qNo}">
		<table>
			<tr>
				<th width="70">제목</th>
				<td><input type="text" name="qTitle" value=" ${board.qTitle}">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="qContent" rows="10" cols="40">${board.qContent}</textarea>
				</td>
			</tr>
			<tr>
				<th>공개여부</th>
				<td><input type="radio" name="lockFlag" value="N">비공개
					<input type="radio" name="lockFlag" value="Y">공개</td>
			</tr>
			<tr>
				<td colspan="2" class="center"><input type="submit"
					value="업데이트하기"></td>
			</tr>
		</table>
	</form>
</div>	
	<link rel="stylesheet" href="css/footer.css">
</main>	
	<footer><%@ include file="html/footer.jspf"%></footer>
</body>
</html>