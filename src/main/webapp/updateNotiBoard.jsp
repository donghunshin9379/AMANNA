<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String notino = request.getParameter("notino");  
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 수정</title>
</head>
<body>
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

#title1 {width: 1000px; margin: 0 auto; text-align: center; margin-top: 80px;}
#title1 img {width: 100px; height: 100px; }
#title1 h1 {text-shadow: 2px 2px 2px #ff93a2; width: 1000px; text-align: center;}

.container {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
}

h2 {
  font-size: 24px;
  margin-bottom: 20px;
  width: 1000px;
  float: left;
  color: #FFAAAF;
  text-shadow: 2px 2px 2px #ccc;
  margin-left: 10px;
}

form {
  margin-bottom: 20px;
}

table {
  width: 1000px;
	margin: 0 auto;
	margin-top: 30px;
}

th, td {
  text-align: left;
  margin-right: 10px;
}

th {
  background-color: #ffe3ee;
  font-weight: bold;
  width:150px;
  color: #FFAAAF;
  border: 1px solid #ffe3ee;
  border-radius: 10px 10px 10px 10px;
  margin-left: 10px;
  text-align: center;
}


input[type="text"],
input[type="email"],
textarea {
 width: 850px;
  border-radius: 4px;
  box-sizing: border-box;
  resize: vertical;
  font-family: "GowunBatang-Regular";
  font-size: 14px;
}

input[type="radio"] {
  margin-right: 10px;
}

textarea {
  height: 150px;
}

.center {
  text-align: center;
}

/* input[type="submit"] {
  background-color: #4CAF50;
  color: white;
  border: none;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 14px;
  cursor: pointer;
} */

/* input[type="submit"]:hover {
  background-color: #45a049;
} */
#submit{
	background-color: #ffe3ee;
  color: #FFAAAF;
  border: none;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 14px;
  cursor: pointer;
  font-family: "GowunBatang-Regular";
  font-weight: bold;
  border-radius: 10px 10px 10px 10px;
  float: right;
  margin-top: 30px;
}

#submit:hover {
  background-color: #ff93a2;
  color: #fff;
}

#all {
	width: 1000px; 
	height: 500px; 
	margin: 0 auto;
	margin-top: 100px;
	margin-bottom: 100px;
}

#title {width: 850px;  border: 3px solid #ffe3ee; height: 25px; border-radius: 10px 10px 10px 10px;}
#content {width: 850px;  border: 3px solid #ffe3ee; height: 155px; border-radius: 10px 10px 10px 10px;}
</style>

</head>
<body>
<%@ include file="html/header2.jspf" %>
<link rel="stylesheet" href="css/header2.css">
<div id="all">
	<div id="title1">
		<img src="resources/img/notice.png">
		<h1>공지사항</h1>
	</div>
	<h2>공지사항 수정</h2>
	<form name="updateForm" action="updateNotiBoard.do" onsubmit="return validateForm()">
	<input type="hidden" name="notino" value="<%= notino %> ">
	<table>
		<tr>
			<th width="150">제목</th>
			<td id="line">
				<input type="text" name="title" value="${param.title}" required id="title">
			</td>
		</tr>
		<tr>
			<th id="c_title">내용</th>
			<td>
				<textarea name="content" rows="10" cols="40" required id="content">${param.content}</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" class="center">
				<input type="submit" value="수정하기" id="submit">
			</td>
		</tr>
	</table>
	</form>
</div>
<br><br><br><br><br>
<script>
function validateForm() {
    var title = document.forms["updateForm"]["title"].value;
    var content = document.forms["updateForm"]["content"].value;

    if (title.trim() === "" || content.trim() === "") {
        alert("작성글을 확인 부탁드립니다.");
        return false;
    }
    
    var maxTitleLength = 30; // 제목의 최대 길이
    if (title.length > maxTitleLength) {
        alert("제목은 최대 " + maxTitleLength + "자까지 입력할 수 있습니다");
        return false;
    }

    var maxContentLength = 600; // 내용의 최대 길이
    if (content.length > maxContentLength) {
        alert("내용은 최대 " + maxContentLength + "자까지 입력할 수 있습니다");
        return false;
    }

    return true; // 모든 조건을 통과하면 폼 제출 허용
}
</script>

<footer>
	<%@ include file="html/footer.jspf" %>
</footer>
<link rel="stylesheet" href="css/footer.css">
</body>
</html>
</body>
</html>
