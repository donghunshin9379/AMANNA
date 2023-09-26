<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글목록</title>
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

ul {
	list-style: none;
	width: 30%;
	display: inline-block;
}

li {
	float: left;
	margin-left: 5px;
}

#container {
	width: 1000px;
	margin: 60px auto;
}

table {
	border-collapse: collapse;
	width: 100%;
	font-family: Arial, sans-serif;
}
/* 
thead th {
  background-color: #f9f9f9;
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
} */
tbody tr:nth-child(even) {
	background-color: #f2f2f2;
}

tbody td {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

tbody td:nth-child(1) {
	width: 5%;
}

tbody td:nth-child(2) {
	width: 40%;
}

tbody td:nth-child(3) {
	width: 20%;
}

tbody td:nth-child(4) {
	width: 15%;
}

tbody td:nth-child(5) {
	width: 10%;
}

tbody td:last-child {
	text-align: left;
}

tbody td a {
	color: #000000;
	text-decoration: none;
}

tbody td a:hover {
	text-decoration: underline;
}

h1 {
	text-align: center;
	justify-content: center;
	margin: 50px auto;
}

th {
	background-color: pink;
}

th, td {
	padding: 10px;
	border-bottom: 1px solid #ddd;
	text-align: center;
	font-family: "GowunBatang-Regular";
}

#search td {
	display: flex;
	justify-content: center;
	margin: 0 auto;
	width: 300px;
	height: 30px;
	font-size: 20px;
	font-weight: bold;
	border: none; /* 테두리 없음 */
}

.pagination-container {
	margin: 0 auto;
	display: flex;
	justify-content: center;
}

.pagination-container>a {
	margin: 30px 30px;
	font-weight: bold;
	font-size: 1.7em;
}

  .centered-input{
	display: flex;
    justify-content: center;
    align-items: center;
    height: 100%;
}

</style>

</head>
<link rel="stylesheet" type="text/css" href="css/header2.css">
<body>
<%@include file="html/header2.jspf"%>
	<div id="container">
		<h1>QNA 목록</h1>
		<%-- <h1>total: ${total.total }</h1>
		<h1>전체 페이지수 ${totalPage}</h1> --%>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>답변</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${boardList }">
					<tr>
						<td>${board.qNo }</td>
						<td style="position: relative;"><a
							href="getBoard.do?qNo=${board.qNo }">${board.qTitle }</a> <c:choose>
								<c:when test="${board.lockFlag eq 'N' or board.lockFlag eq 'n'}">
									<img src="pictures/padlock.png" alt="Lock Icon"
										style="max-width: 30px; max-height: 20px; position: absolute; right: 0;">
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose></td>
						<td>${board.qWriter }</td>
						<td>${board.qDate }</td>
						<td>${board.confirm }</td>
					</tr>
				</c:forEach>
				<c:if test="${empty boardList }">
					<tr>
						<td colspan="5">데이터가 없습니다</td>
					</tr>
				</c:if>


				<div>
					<form action="getBoardList.do" method="get">
						<table class="border-none">
							<tr>
								<td>
								<div class="centered-input">
								<select name="searchCondition">
										<option value="qTitle">제목</option>
										<option value="qWriter">작성자</option>
								</select> <input type="text" name="searchKeyword"> <input
									type="submit" value="검색">
									</div>
									</td>
							</tr>
						</table>
					</form>
				</div>
			</tbody>
		</table>
		<div class="pagination-container">
			<c:forEach var="i" begin="1" end="${totalPage }">
				<a href="getBoardList.do?viewPage=${i }" class="pagination-link">${i }</a>
			</c:forEach>
		</div>


		<script>
const confirmCells = document.querySelectorAll('td:nth-child(5)');

confirmCells.forEach(cell => {
  const confirmValue = cell.textContent.trim();

  if (confirmValue === '답변 완료') {
	  cell.style.color = 'red';
  } else{
	  cell.style.color = 'blue'
  }
});

const titleCells = document.querySelectorAll('td:nth-child(3)');

titleCells.forEach(cell => {
  const title = cell.textContent.trim();
  const truncatedTitle = title.substring(0, 3) + '*'.repeat(title.length - 3);
  cell.textContent = truncatedTitle;
});
</script>
</body>
</html>




