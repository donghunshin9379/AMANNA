<%@page import="java.util.List"%>
<%@page import="com.spring.biz.faqboard.FaqBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	List<FaqBoardVO> faqboardList = (List<FaqBoardVO>) session.getAttribute("FaqboardList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">
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

.qnaTabs {
	display: flex;
	list-style-type: none;
	padding: 0;
	text-align: center;
	width: 1000px;
	margin: 30px auto;
}

.qnaTabs li {
	flex: 7;
	border: 1px solid black;
	height: 50px;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 5px;
	margin: 5px;
}

.qnaTabs li:nth-child(2) {
	background-color: black;
}

.qnaTabs li:nth-child(2) a {
	color: white;
}

.accordion {
	margin-bottom: 10px;
}

.qnaTabs li {
	cursor: pointer;
}

.qnaTabs li:hover {
	cursor: pointer;
	cursor: pointer;
}

table {
	margin: auto;
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

tbody tr:nth-child(even) {
	background-color: #f9f9f9;
}

tbody tr:hover {
	background-color: #fce4ec;
}

form {
	margin-bottom: 20px;
}

select, input[type="text"], input[type="submit"], input[type="button"] {
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

select {
	width: 150px;
}

input[type="text"] {
	width: 300px;
}

input[type="submit"], input[type="button"] {
	background-color: #ff4081;
	color: white;
	border: none;
	font-size: 14px;
	cursor: pointer;
}

input[type="submit"]:hover, input[type="button"]:hover {
	background-color: #f50057;
}

.input-container {
	display: flex;
	margin-bottom: 10px;
}

.input-container input[type="text"], .input-container select {
	flex: 1;
	margin-right: 5px;
}

.add-button {
	background-color: #ff4081;
	color: white;
	border: none;
	padding: 8px 12px;
	font-size: 14px;
	cursor: pointer;
}

.add-button:hover {
	background-color: #f50057;
}

.add-button-container {
	margin-bottom: 20px;
	text-align: right;
}

.link {
	color: #ff4081;
	text-decoration: none;
}

.link:hover {
	text-decoration: underline;
}

tr td:nth-child(2) {
	position: relative;
}

tr td:nth-child(2) a {
	color: #ff4081;
}

tr td:nth-child(2) img {
	max-width: 30px;
	max-height: 20px;
	position: absolute;
	right
}

#container {
	margin: 0 150px; /* 좌우 여백 설정 */
}

.border-none {
	display: flex;
	justify-content: center;
	align-items: center;
}

#paging {
	width: 600px;
	margin: 100px auto;
	text-align: center;
	font-size: 1.5em;
}

#pagin>a {
	padding: 50px;
}

footer {
	position: relative;
	bottom: 0;
}

main {
	height: 1000px;
}
</style>


</head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
      $(function () {
        $(".mainnav1 >li").mouseover(function () {
          $(this).children(".site_nav").stop().slideDown(300);

          $(".mainnav1 > li").mouseleave(function () {
            $(this).children(".site_nav").stop().slideUp(300);
          });
        }); //메뉴

        setInterval(move, 3000);
        function move() {
          $(".menuslide ul").animate(
            {
              left: "-1350px",
            },
            1500,
            function () {
              $(this).append($(".menuul ul li").first());
              $(".menuslide ul").css("left", 0);
            }
          );
        } //
      }); //전체
    </script>
<body>
	<%@ include file="html/header.jspf"%>
	<main>
	<ul class="qnaTabs">
		<li><a id="CustomerService">FAQ</a></li>
		<li><a id="qnaTab">QNA</a></li>
		<li><a id="noticeTab">공지사항</a></li>
	</ul>
	<div id="container">
		<div>
			<form action="customerQnaList.do" method="get">
				<table class="border-none">
					<tr>
						<td><select name="searchCondition">
								<option value="qTitle">제목</option>
								<option value="qWriter">작성자</option>
						</select> <input type="text" name="searchKeyword"> <input
							type="submit" value="검색"> <input type="button"
							value="글 작성하기" onclick="location.href='insertBoard.jsp'">
						</td>
					</tr>
				</table>
			</form>
		</div>


		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>날짜</th>
					<th>답변</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${boardList }">
					<tr>
						<td>${board.qNo }</td>
						<td style="position: relative;"><a
							href="customerGetBoard.do?qNo=${board.qNo}&lockFlag=${board.lockFlag}">${board.qTitle}</a>
							<c:if test="${board.lockFlag eq 'N'}">
								<img src="pictures/padlock.png" alt="Lock Icon"
									style="max-width: 30px; max-height: 20px; position: absolute; right: 0;">
							</c:if></td>
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
			</tbody>
		</table>
	</div>


	<div id="paging">
		<c:forEach var="i" begin="1" end="${totalPage }">
			<a href="customerQnaList.do?viewPage=${i }">${i }</a>
		</c:forEach>
	</div>

	<script>
    	document.getElementById("CustomerService").addEventListener("click", function() {
    	  window.location.href = "CustomerService.do";
    	});

    	document.getElementById("noticeTab").addEventListener("click", function() {
    	  window.location.href = "customerNotice.do";
    	});
    	
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
	</main>
	<footer><%@ include file="html/footer.jspf"%></footer>
</body>
</html>