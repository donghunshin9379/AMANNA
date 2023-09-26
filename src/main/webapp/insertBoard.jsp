<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

h1 {
	margin: 40px auto;
	display: flex;
	justify-content: center;
	align-items: center;
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

#container {
	width: 500px;
	margin: 20px auto;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	margin-bottom: 100px;
}
</style>
<%@ include file="html/header.jspf"%>
<link rel="stylesheet" href="css/header.css">
</head>
<body>
<div id="container">
	<form action="insertBoard.do">
		<table>
			<tr>
				<th width="70">제목</th>
				<td><input type="text" name="qTitle" placeholder="최대 33자 입니다">
				</td>
			</tr>
			<tr>
				<th>E-mail</th>
				<td><input type="email" name="qWriter"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="qPwd" placeholder="숫자만 입력 가능합니다">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="qContent" rows="10" cols="40"
						placeholder="최대  600자 입력 가능합니다"></textarea></td>
			</tr>
			<tr>
				<th>공개여부</th>
				<td><input type="radio" name="lockFlag" value="N">비공개 <input
					type="radio" name="lockFlag" value="Y">공개</td>
			</tr>
			<tr>
				<td colspan="2" class="center"><input type="submit"
					value="새글 등록">
					<button type="button" onclick="location.href='customerQnaList.do'"
						class="list-button">목록으로</button></td>
			</tr>
		</table>
	</form>
</div>
	<script>
  var form = document.querySelector("form");
  var titleInput = document.querySelector('input[name="qTitle"]');
  var contentInput = document.querySelector('textarea[name="qContent"]');
  var passwordInput = document.querySelector('input[name="qPwd"]');

  form.addEventListener("submit", function(event) {
    // 제목 길이 제한
    if (titleInput.value.length > 33) {
      event.preventDefault(); // 폼 제출 중지
      alert("제목은 최대 33자까지 작성 가능합니다.");
      return;
    }

    // 내용 길이 제한
    if (contentInput.value.length > 600) {
      event.preventDefault(); // 폼 제출 중지
      alert("내용은 최대 600자까지 작성 가능합니다.");
      return;
    }

    // 비밀번호 숫자 제한
    var password = passwordInput.value;
    if (!/^\d+$/.test(password)) {
      event.preventDefault(); // 폼 제출 중지
      alert("비밀번호는 숫자로만 입력해주세요.");
      return;
    }
  });

  titleInput.addEventListener("input", function(event) {
    var value = event.target.value;
    if (value.length > 33) {
      event.target.value = value.slice(0, 33);
      alert("제목은 최대 33자까지 작성 가능합니다.");
    }
  });

  contentInput.addEventListener("input", function(event) {
    var value = event.target.value;
    if (value.length > 600) {
      event.target.value = value.slice(0, 600);
      alert("내용은 최대 600자까지 작성 가능합니다.");
    }
  });

  passwordInput.addEventListener("input", function(event) {
    var value = event.target.value;
    if (!/^\d*$/.test(value)) {
      event.target.value = value.replace(/[^\d]/g, "");
      alert("비밀번호는 숫자로만 입력해주세요.");
    }
  });
</script>

     <br><br><br><br><br><br><br><br><br><br><br><br>
	<%@ include file="html/footer.jspf"%>
	<link rel="stylesheet" href="css/footer.css">
</body>
</html>