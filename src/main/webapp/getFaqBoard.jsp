<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 보여주기</title>
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
	height: 700px;
	margin: 0 auto;
}

table {
	width: 1000px; 
	border: 10px solid #ffe3ee;
	border-radius: 10px 10px 10px 10px;
	margin: 0 auto;
	margin-top: 100px;
}

table th {
	background-color: #ffe3ee;
	width: 150px;
	color: black;
	font-weight: bold;
	border: 1px solid #ffe3ee;
	border-radius: 10px 10px 10px 10px;
}

table td {
	border-top: 3px solid #ffe3ee;
	border-bottom: 3px solid #ffe3ee;
}
#title {width: 1000px; margin: 0 auto; text-align: center; margin-top: 80px;}
#title img {width: 100px; height: 100px; }
#title h1 {text-shadow: 2px 2px 2px #ff93a2; width: 1000px; text-align: center;}
     
#detail {
	float: left;
	font-weight: bold;
	font-size: 25px;
}

.button-container {
    margin-top: 30px;
  width: 1000px;
  height: 50px;
  margin-top: 20px;
}

.button-container a {
    display: inline-block;
  background-color: #ffe3ee;
  color: black;
  font-weight: bold;
  text-decoration: none;
  cursor: pointer;
  margin-left: 10px;
  width: 100px;
  height: 50px;
  text-align: center;
  border-radius: 10px 10px 10px 10px;
  padding: 12px;
  float: right;
}

.button-container a:hover {
    background-color: #ff93ae;
    color: white;
}
</style>

<%@ include file="html/header2.jspf" %>
<link rel="stylesheet" href="css/header2.css">
</head>
<body style="background-color: white;">
<div id="all">

<div id="title">
	<img src="resources/img/faq.png">
	<h1>FAQ 관리</h1>
</div>
<table>
    <thead>
	<caption id="detail">FAQ 상세보기</caption>
        <tr>
            <th>카테고리</th>
            <td>${faqboard.category}</td>
        </tr>
        <tr>
            <th>주제</th>
            <td>${faqboard.title}</td>
        </tr>
        <tr>
            <th>글 내용</th>
            <td>${faqboard.content}</td>
        </tr>
    </thead>
</table>
<div class="button-container">
     <a href="updateFaqBoard.jsp?faqno=${faqboard.faqno}&category=${faqboard.category}&title=${faqboard.title}&content=${faqboard.content}">수정하기</a>
    <a href="deleteFaqBoard.do?faqno=${faqboard.faqno}">삭제하기</a>
    <a href="getFaqBoardList.do?viewPage=${faqboard.viewPage }">목록으로</a>
</div>
</div>
<%@ include file="html/footer.jspf" %>
<link rel="stylesheet" href="css/footer.css">
</body>
</html>
