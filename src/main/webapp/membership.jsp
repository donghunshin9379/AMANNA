<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리[admin]</title>
<link rel="stylesheet" type="text/css" href="css/header2.css">
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
/* #container {
	width: 1280px;
	margin: 0 auto;
	padding-top: 10px;
	border-bottom: 1.5px solid #ffdcdc;
	font-weight: bold;
} */
th {
	background-color: pink;
}

th, td {
	padding: 10px;
	border-bottom: 1px solid #ddd;
	text-align: center;
	font-family: "GowunBatang-Regular";
}

/* h1, h2, h3 {
	display: inline;
	font-family: "GowunBatang-Regular";
	margin-left: 50px;
} */

#gmBanner {
	width: 1280px;
	height: 270px;
	margin: 0 auto;
	border: 1.5px solid #ffdcdc;
}

#container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	text-align: center;
	width: 1280px;
	margin: 30px auto;
	padding-top: 10px;
	border-bottom: 1.5px solid #ffdcdc;
	font-weight: bold;
}

#container>img {
	width: 400px;
	height: 300px;
}

 #search td {
  display: flex;
  justify-content: center;
  margin: 0 auto;
  width: 150px;
  height: 30px;
  font-size: 20px;
  font-weight: bold;
} 

#login {
	font-weight: bold;
}


</style>
</head>
<script>
	function outGo(frm) {
		/* confirm("탈퇴시키겠습니까?"); */
		if (confirm("탈퇴시키겠습니까?") == true) {
			frm.action = "delete2.do";
			frm.submit();
			alert("탈퇴 되었습니다.");
		}
	}
</script>
<body>
	<%@include file="html/header2.jspf"%>
	<div id="container">
		<img alt="관리자회원목록" src="resources/img/user.png" id="test"><br>
		<h1>전체회원목록[admin]</h1>
		<br>
		<form action="getMemberList2.do" method="get">
			<table id="search">
				<tr>
					<td><select name="searchCondition">
							<c:forEach var="option" items="${conditionMap }">
								<option value="${option.value }">${option.key }</option>
							</c:forEach>
					</select> <input type="text" name="searchKeyword"> <input
						type="submit" value="검색"></td>
				</tr>
			</table>
		</form>
		<table>
			<thead>
				<tr>
					<th width="150">아이디</th>
					<th width="150">성별</th>
					<th width="150">이름</th>
					<th width="150">나이</th>
					<th width="150">신장</th>
					<th width="150">체중</th>
					<th width="300">학력</th>
					<th width="200">직업</th>
					<th width="150">흡연여부</th>
					<th width="150">매칭권</th>
					<th width="150">강제탈퇴</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${userList }">
					<tr>
						<td>${user.id }</td>
						<td>${user.sex }</td>
						<td>${user.name }</td>
						<td>${user.age }</td>
						<td>${user.height }</td>
						<td>${user.weight }</td>
						<td>${user.edu }</td>
						<td>${user.job }</td>
						<td>${user.smoke }</td>
						<td>${user.ticket }</td>
						<form method="post">
							<td><input type="button" value="강제탈퇴" name="강제탈퇴"
								onclick="outGo(this.form)"></td>
							<td><input type="hidden" value="${user.id }" name="id"></td>
						</form>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>




