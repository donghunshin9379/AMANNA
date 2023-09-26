<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
@font-face {
  font-family: "GowunBatang-Regular";
  src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunBatang-Regular.woff")
    format("woff");
  font-weight: normal;
  font-style: normal;
}	
body {
  font-family: "GowunBatang-Regular";
}

#all {
	width: 1000px;
	margin: 0 auto;
	margin-bottom: 100px;
}


#title {width: 1000px; margin: 0 auto; text-align: center; margin-top: 80px;}
#title img {width: 100px; height: 100px; }
#title h1 {text-shadow: 2px 2px 2px #ff93a2; width: 1000px; text-align: center;}

table {
	width: 1000px; 
	border: 10px solid #ffe3ee;
	border-radius: 10px 10px 10px 10px;
	margin: 0 auto;
	margin-top: 50px;
}

table th {
	background-color: #ffe3ee;
	width: 150px;
	color: black;
	font-weight: bold;
	border: 1px solid #ffe3ee;
	border-radius: 10px 10px 10px 10px;
	text-align: center;
}

form {
  margin-bottom: 20px;
}




input[type="text"],
input[type="email"],
textarea {
  width: 100%;
  padding: 8px;
  border: 3px solid #ffe3ee;
  border-radius: 4px;
  box-sizing: border-box;
  resize: vertical;
  font-family: "GowunBatang-Regular";
  font-size: 14px;
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
  background-color: #ffe3ee;
  color: black;
  border: none;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 14px;
  cursor: pointer;
  border-radius: 10px;
}

input[type="submit"]:hover {
  background-color: #ff93ae;
  color: white
}

</style>
<%@ include file="html/header2.jspf" %>
<link rel="stylesheet" href="css/header2.css">
</head>
<body>
	<div id="all">
	
	<div id="title">
	<img src="resources/img/qna.png">
	<h1>QNA 관리</h1>
</div>
	<form action="updateBoard.do">
	<input type="hidden" name="qNo" value="${board.qNo}">
	<table>
		<tr>
			<th width="70">제목</th>
			<td>${board.qNo }
				<input type="text" name="qTitle" value=" ${board.qTitle}">
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>
				<input type="email" name="qWriter" value="${board.qWriter }">
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="text" name="qPwd" value="${board.qPwd }">
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea name="qContent" rows="10" cols="40" value="${board.qContent }"></textarea>
			</td>
		</tr>
		<tr>
			<th>공개여부</th>
			<td>
				<input type="radio" name="lockFlag" value="N" >비공개
				<input type="radio" name="lockFlag" value="Y">공개
			</td>
		</tr>
		<tr>
			<td colspan="2" class="center">
				<input type="submit" value="업데이트하기">
			</td>
		</tr>
	</table>
	</form>
	</div>
<%@ include file="html/footer.jspf" %>
<link rel="stylesheet" href="css/footer.css">
</body>
</html>