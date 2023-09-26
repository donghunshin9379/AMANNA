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
  src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunBatang-Regular.woff")
    format("woff");
  font-weight: normal;
  font-style: normal;
}	
body {
  font-family: "GowunBatang-Regular";
}

#title {width: 1000px; margin: 0 auto; text-align: center; margin-top: 80px;}
#title img {width: 100px; height: 100px; }
#title h1 {text-shadow: 2px 2px 2px #ff93a2; width: 1000px; text-align: center;}


#all {
	width: 1000px;
	margin: 0 auto;
	margin-bottom: 100px;
}

table {
	width: 1000px;
	margin: 0 auto;
	font-weight: bold;
	border: 10px solid #ffe3ee;
	margin-top: 50px;
	border-radius: 10px;
	text-align: center;
}

textarea {
	border: 3px solid #ffe3ee;
	font-family: "GowunBatang-Regular";
	margin-top: 10px;
	
}

td {
	border-right: 3px solid #ffe3ee;
	border-top: 3px solid #ffe3ee;
}

th {
	background-color: #ffe3ee;
}

#btn {
  background-color: #ffe3ee;
  color: black;
  border: none;
  border-radius: 10px;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 14px;
  cursor: pointer;
  font-family: "GowunBatang-Regular";
  font-weight: bold;
  float: left;
  margin-right: 10px;
  margin-bottom: 10px;
}

#btn:hover {
  background-color: #ff93ae;
  color: white;
}
</style>
</head>
<body>
${qcboard }
<%@ include file="html/header2.jspf" %>
<link rel="stylesheet" href="css/header2.css">
<div id="all">


<div id="title">
	<img src="resources/img/qna.png">
	<h1>QNA 관리</h1>
</div>		
<form action="updateQcBoard.do">
<input type="hidden" name="qCno" value="${qcboard.qCno }">
<table>
	<tr>
		<th>작성날짜</th>
		<th>작성내용</th>
	</tr>
	<tr>
		<td>${qcboard.qcCommentDate }</td>
		<td> <textarea name="qcContent" rows="10" cols="40" placeholder="${qcboard.qcContent }"></textarea></td>
	</tr>
	<tr>
		<input type="submit" id="btn" name="수정" value="수정">
<button onclick="location.href='deleteQcBoard.do?qCno=${qcboard.qCno }';" id="btn">삭제하기</button>
	
	</tr>
</table>
</form>
</div>
<%@ include file="html/footer.jspf" %>
<link rel="stylesheet" href="css/footer.css">
</body>
</html>