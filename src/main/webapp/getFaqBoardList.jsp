<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Faq list</title>
</head>
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


}

#all {
	width: 1000px;
	margin: 0 auto;
	height: 100%;
}

#title {width: 1000px; margin: 0 auto; text-align: center; margin-top: 80px;}
#title img {width: 100px; height: 100px; }
#title h1 {text-shadow: 2px 2px 2px #ff93a2; width: 1000px; text-align: center;}
     

table {
	width: 1000px;
    margin: 0 auto;
    text-align: center;
    font-weight: bold;
    border: 10px solid #ffe3ee;
    margin-top: 50px;
    /* table-layout:fixed; */
}

th {
	background-color: #ffe3ee; color: #ffaaaf;}
}


.th {width: 50px;}

.td1 {width: 75px;}
.td2 {width: 125px;}
.td3 {width: 800px;}


.content {width: 750px; height:100px; text-overflow: ellipsis;}
#tr:nth-child(even) {
	background-color: #ffe3ee;
	
}


td {
	border-bottom: 3px solid #ffe3ee;
	border-right: 3px solid #ffe3ee;
	
}	


a {color: black; text-decoration: none;}
a:hover {
    text-decoration: underline;
}

.pagination {
    width: 600px;
    margin: 5px auto;
    text-align: center;
}

.pagination a {
    display: inline-block;
    padding: 5px 10px;
    background-color: #ddd;
    color: #880E4F;
    margin-right: 5px;
}

.pagination a:hover {
    background-color: #880E4F;
    color: white;
}

.pagination .current {
    background-color: #880E4F;
    color: white;
}
     


.button-container {
    width: 1000px;
    margin: 0 auto;
    
}

.button {
    display: inline-block;
    padding: 10px 20px;
    font-size: 16px;
    background-color: #ffe3ee;
    color: black;
    font-weight : bold;
    border-radius: 10px;
    text-decoration: none;
    cursor: pointer;
    margin-top: 40px;
    float: right;
}

.button:hover {
    background-color: #ff93ae;
    color: white;
    text-decoration: none;
}
.pagination-container {
    width: 1000px;
    text-align: center;
    margin: 0 auto;
}

.pagination-link {
    width : 20px;
    display: inline-block;
    text-align: center;
    margin: 20px auto;
    background-color: #ffe3ee;
    
}

    </style>
</style>
<body style="background-color: white;">
<%@ include file="html/header2.jspf" %>
<link rel="stylesheet" href="css/header2.css">
<div id="all">
<div id="title">
	<img src="resources/img/faq.png">
	<h1>FAQ 관리</h1>
</div>
<div id="table">
	<table>
		<thead>
			<tr id="name">
				<th class="th1">번호</th>
				<th class="th2">카테고리</th>
				<th class="th3">주제</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="faqboard" items="${FaqboardList }">
			<tr id="tr">
				<td class="td1">${faqboard.faqno }</td>
				<td class="td2">${faqboard.category }</td>
				<td class="td3"><a href="getfaqBoard.do?faqno=${faqboard.faqno }">${faqboard.title }</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
<div class="button-container">
    <a href="insertFaqBoard.jsp" class="button">FAQ 작성하기</a>
</div>


<div class="pagination-container">
    <c:forEach var="i" begin="1" end="${totalPage }">
        <a href="getFaqBoardList.do?viewPage=${i }" class="pagination-link">${i }</a>
    </c:forEach>
</div>
</div>
<br><br><br><br><br><br>
	<%@ include file="html/footer.jspf" %>
<link rel="stylesheet" href="css/footer.css">

</body>
</html>