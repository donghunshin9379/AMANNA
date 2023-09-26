<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getBoard</title>
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

#table {
	width: 1000px;
	margin: 0 auto;
	font-weight: bold;
	border: 10px solid #ffe3ee;
	margin-top: 50px;
	border-radius: 10px;
}

#table2 {
	width: 700px;
	border: 10px solid #ffe3ee;
	margin-top: 50px;
	border-radius: 10px;
	text-align: center;
	}
#table th {
	background-color: #ffe3ee;
	width: 150px;
	color: black;
	font-weight: bold;
	border: 1px solid #ffe3ee;
	border-radius: 10px 10px 10px 10px;
}
#table th, td {
	padding: 10px;
	border-bottom: 3px solid #ffe3ee;
}
#table th {
	width: 150px;
}
#table td {
	border: 1px sold #ffe3ee;
	text-align: left;
	
}
td {
	padding: 10px;
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
  margin-top: 20px;
  font-family: "GowunBatang-Regular";
  font-weight: bold;
  float: right;
  margin-left: 30px;
}

#btn:hover {
  background-color: #ff93ae;
  color: white;
}


#sub {
	border: 3px solid #ffe3ee;
	margin-left: 50px;
}
input[type="submit"] {
	background-color: #ffe3ee;
	width: 80px;
	height: 40px;
	border: none;
	border-radius: 10px;
	font-family: "GowunBatang-Regular";
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #ff93ae;
	color: white;
}

</style>
</head>
<body>
<%@ include file="html/header2.jspf" %>
<link rel="stylesheet" href="css/header2.css">
 <div id="all">
 <div id="title">
	<img src="resources/img/qna.png">
	<h1>QNA 관리</h1>
</div>		
<table id="table">
		<tr>
			<th>제목</th>
			<td>
				${board.qTitle }
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>
				${board.qWriter}
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				${board.qContent}
			</td>
		</tr>
		<tr>
			<th>공개여부</th>
			<td>
				${board.lockFlag}
			</td>
		</tr>
	</table>
	<input type="button" value="삭제하기" onclick="location.href='deleteBoard.do?qNo=${board.qNo}'" id="btn">
	<input type="button" value="업데이트" onclick= "location.href='updateBoard.jsp'" id="btn">
	
	<div class="viewComment">
	<table id="table2">
		<tr>
			<th>번호</th>
			<th>답변</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>수정/삭제 </th>
		</tr>
		<c:forEach var="qlist" items="${qlist }">
		<tr>
			<td>${qlist.qCno }</td>
			<td>${qlist.qcContent}</td>
			<td>${qlist.qcWriter}</td>
			<td>${qlist.qcCommentDate}</td>
			<td>
			 <a href="upDelQcBoard.do?qCno=${qlist.qCno }">수정 및 삭제</a>
			</td>
		</tr>
		</c:forEach>
		<c:if test="${empty qlist }">
				<tr>
					<td colspan="4">답변이 없습니다. 작성일 기준 1~2안에 답변해드리도록 하겠습니다.</td>
				</tr>
			</c:if>
	</table>
	<br>
	<br>
	</div>
	<div class="writeComment">
		<form action="insertQcBoard.do">
		<input type="hidden" name="qNo" value="${board.qNo}">
		<textarea rows="20" cols="50" name="qcContent" id="sub"></textarea>
		<input type="submit" value="답변하기">
		</form>
	</div>
</div>
<%@ include file="html/footer.jspf" %>
<link rel="stylesheet" href="css/footer.css">
</body>
</html>