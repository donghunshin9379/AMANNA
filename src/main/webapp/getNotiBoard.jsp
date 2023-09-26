<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 내용보기</title>
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

#title {width: 1000px; margin: 0 auto; text-align: center; margin-top: 80px;}
#title img {width: 100px; height: 100px; }
#title h1 {text-shadow: 2px 2px 2px #ff93a2; width: 1000px; text-align: center;}

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

#line_ {
	border-bottom: 2px solid #ffe3ee;
	text-align: left;
}
.content > td {width: 850px; height: 300px; }
/* 테이블 스타일링 */
/* table {
  width: 100%;
  border-collapse: collapse;
  border: 1px solid #ccc;
}

thead th {
  background-color: #f5f5f5;
  border: 1px solid #ccc;
  padding: 8px;
  text-align: left;
}

thead td {
  border: 1px solid #ccc;
  padding: 8px;
}

/* 버튼 스타일링 */

.content_1 {height: 300px;}
#button:hover {
  background-color: #ff93ae;
  color:white;
}

.button-container {
  margin-top: 30px;
  width: 1000px;
  height: 50px;
  margin-top: 20px;
  
}

#button {
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


#all {
	width: 1000px; 
	height: 700px; 
	margin: 0 auto;
	margin-bottom: 100px;
}

/* footer {
position : absolute;
bottom : 0;

} */
</style>
<script type="text/javascript">
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
<%@ include file="html/header2.jspf" %>
<link rel="stylesheet" href="css/header2.css">
<body>
<div id="all">
<div id="title">
	<img src="resources/img/notice.png">
	<h1>공지사항</h1>
</div>
<table>
	<thead>
		<tr>
			<th>No</th>
			<td id="line_">${ndetail.notino }</td>
		</tr>
		<tr>
			<th>주제</th>
			<td id="line_">${ndetail.title}</td>
		</tr>
		<tr>
			<th class="content">글 내용</th>
			<td class="content_1">${ndetail.content}</td>
		</tr>
	</thead>
</table>
<div class="button-container">
  <a href="updateNotiBoard.jsp?notino=${ndetail.notino}&title=${ndetail.title}&content=${ndetail.content}" id="button">수정하기</a>
  <a href="deleteNotiBoard.do?notino=${ndetail.notino}" id="button">삭제하기</a>
  <a href="getNotiBoardList.do" id="button">목록으로</a>
</div>
</div>

<%@ include file="html/footer.jspf" %>

<link rel="stylesheet" href="css/footer.css">
</body>
</html>
