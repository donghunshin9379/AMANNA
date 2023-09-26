<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 리뷰 관리</title>
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

.table {
	width: 1000px;
	margin: 0 auto;
	font-weight: bold;
	border: 10px solid #ffe3ee;
	margin-top: 50px;
	border-radius: 10px;
}

th, td {
  padding: 10px;
  border: 1px solid #ddd;
}

th {
  background-color: #ffe3ee;
  color: black;
  text-align: center;
}

td:nth-child(2) { /* Increase the width of the content column */
  width: 40%;
}

select, input[type="text"], textarea {
  padding: 5px;
  font-size: 16px;
  border: 1px solid #ddd;
  width: 100%;
}

textarea {
  height: 300px; /* Increase the height of the textarea */
  resize: vertical;
}

.center {
  text-align: center;
}

#btn {
  padding: 10px 20px;
  font-size: 18px;
  background-color: #ffe3ee;
  color: black;
  border: none;
  cursor: pointer;
  border-radius: 10px;
  font-family: "GowunBatang-Regular";
  
}

#btn:hover {
  background-color: #ff93ae;
  color: white;
}

.error-message {
  color: red;
  text-align: center;
  margin-top: 10px;
}

.button-wrapper {
  text-align: right;
  margin-top: 20px;
}

.button-wrapper button {
  padding: 10px 20px;
  font-size: 16px;
  background-color: #880E4F;
  color: white;
  border: none;
  cursor: pointer;
}

.button-wrapper button:hover {
  background-color: #AD1457;
}

#look {
	display: inline-block;
	width: 150px;
	background-color: #ffe3ee;
	height: 50px;
	float: right;
	border-radius: 10px;
	padding: 15px;
}

.look {
	text-align: center;
}
#look:hover {
	background-color: #ff93ae;
	color: white;
}

.table2 {
	display: block;
	width: 650px;
	height: 200px;
	margin: 0 auto;
	font-weight: bold;
	border: 10px solid #ffe3ee;
	margin-top: 50px;
	border-radius: 10px;
	overflow-y: scroll;

	
	
	
}

.table2::-webkit-scrollbar {
	width: 10px;
	background-color: #ff93ae;
}

.table2::-webkit-scrollbar-thumb {
    background-color: #ff93ae;
    border-radius: 5px;
  }
.table2::-webkit-scrollbar-track {
    background-color: #ffe3ee;
  }
  

</style>
<%@ include file="html/header2.jspf" %>
<link rel="stylesheet" href="css/header2.css">
</head>
<body style="background-color: white;">
<div id="all">
<div id="title">
	<img src="resources/img/review.png">
	<h1>리뷰 관리</h1>
</div>		
<form action="eventChoose.do">
<table class="table">
	<thead>
		<tr>
			<th>작성자</th>
			<th>글 내용</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>삭제</th>
			<th>이벤트</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>${rboard.id}</td>
			<td>${rboard.rContent}</td>
			<td>${rboard.rDate}</td>
			<td>${rboard.count}</td>
			<td>
				<button onclick="confirmDelete('${rboard.rNo}')" id="btn">삭제하기</button>
			</td>
			<td>
				<input type="submit" value="채택하기" id="btn">
				<input type="hidden" name="id" value="${rboard.id }">
				<input type="hidden" name="rNo" value="${rboard.rNo }">
			</td>
		</tr>
	</tbody>
</table>
</form>
	<div>
		<table class="table2">
			<c:forEach var="qlist" items="${qlist }">
			<tr>
			  <td class="author-column" style="width:10%;">${qlist.rcWriter }</td>
			  <td class="wide-column" style="width:60%;">${qlist.rcContent}</td>
			  <th><a href="deleteAdminQrBoard.do?rcNo=${qlist.rcNo}&rNo=${rboard.rNo}">삭제</a></th>
			</tr>
			</c:forEach>
		</table>
		<br>
	</div>
	<div class="look"><a href="getAdminRBoardList.do" id="look">전체 리뷰 보기</a></div>
</div>
<script>
	function confirmDelete(id) {
		if (confirm('정말로 삭제하시겠습니까?')) {
			window.location.href = 'deleteAdminRBoard.do?rNo=' + ${rboard.rNo };
		}
	}
	
</script>
<%@ include file="html/footer.jspf" %>
<link rel="stylesheet" href="css/footer.css">
</body>
</html>