<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 리뷰 모드</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

a {text-decoration: none; color: black;}

#title {width: 1000px; margin: 0 auto; text-align: center; margin-top: 80px;}
#title img {width: 100px; height: 100px; }
#title h1 {text-shadow: 2px 2px 2px #ff93a2; width: 1000px; text-align: center;}

#all {
	width: 1000px;
	margin: 0 auto;
	margin-bottom: 500px;
}


table {
	width: 1000px;
	margin: 0 auto;
	border: 10px solid #ffe3ee;
	text-align: center;
	border-radius: 10px 10px 10px 10px;
	font-family: "GowunBatang-Regular";
	margin-top: 50px;
}

th {background-color: #ffe3ee; color: #ffaaaf; font-weight: bold;}
th:nth-child(1){
	width: 50px;
}
.name{text-align: left; width: 900px;}
.num {font-weight: bold; width: 50px;}
.cnt {width: 50px;}

#tr {height: 30px;}

td {
	border-bottom: 3px solid #ffe3ee;
	border-right: 3px solid #ffe3ee;
}

td:nth-last-child() {
	border-bottom: 0;
}


select,
input[type="text"],
textarea {
    padding: 5px;
    font-size: 16px;
    border: 1px solid #ddd;
    width: 100%;
}

textarea {
    height: 150px;
    resize: vertical;
}

.center {
    text-align: center;
}

.submit-button {
    padding: 10px 20px;
    font-size: 18px;
    background-color: #880E4F;
    color: white;
    border: none;
    cursor: pointer;
    
}

.submit-button:hover {
    background-color: #AD1457;
}

.error-message {
    color: red;
    text-align: center;
    margin-top: 10px;
}

.button-container {
    text-align: center;
    margin-top: 10px;
}

.button-container button {
    padding: 10px 20px;
    font-size: 16px;
    background-color: #880E4F;
    color: white;
    border: none;
    cursor: pointer;
}

.button-container button:hover {
    background-color: #AD1457;
}

#page {width: 120px; margin: 0 auto;}
#p_num {
	background-color: #ffe3ee; 
	display: inline-block;
	width: 30px;
	margin-left: 5px;
	}
#p_num:hover {
	background-color: #ff93ae;
	color: #fff;
}


</style>
<script>
$(function () {
    $(".mainnav1 >li").mouseover(function () {
      $(this).children(".site_nav").stop().slideDown(300);

      $(".mainnav1 > li").mouseleave(function () {
        $(this).children(".site_nav").stop().slideUp(300);
      });
    }); //메뉴
    
  }); //전체
</script>
</head>
<body style="background-color: white;">
<%@ include file="html/header2.jspf" %>
<link rel="stylesheet" href="css/header2.css">
<div id="all">
	<div id="title">
	<img src="resources/img/review.png">
	<h1>리뷰관리</h1>
	</div>
	<table>
		<thead>
			<tr>
				<th>NO</th>
				<th>제목</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="rboard" items="${rboardList }">
				<tr id="tr">
					<td class="num">${rboard.rNo }</td>
					<td class="name"><a href="getAdminRBoard.do?rNo=${rboard.rNo }&id=${member.id}">${rboard.rContent }</a></td>
					<td class="cnt">${rboard.count }</td>
				</tr>
			</c:forEach>
	</tbody>
</table>
<div style="margin-top: 20px; text-align: center;" id="page">
    <c:forEach var="i" begin="1" end="${totalPage}">
        <a href="getAdminRBoardList.do?viewPage=${i}" id="p_num">${i}</a>
    </c:forEach>
</div>
</div>
	<%@ include file="html/footer.jspf" %>
<link rel="stylesheet" href="css/footer.css">
</body>
</html>