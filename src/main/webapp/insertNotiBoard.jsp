<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
#title1 h1 {
	text-shadow: 2px 2px 2px #ff93a2;
 	color: black; width: 1000px;
   	text-align: center;
   	
   }
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
  /* padding: 12px; */
  /* border: 1px solid #ddd; */
  text-align: center;
  margin-right: 10px;
}

th {
  background-color: #ffe3ee;
  font-weight: bold;
  width: 150px;
  color: #FFAAAF;
  border: 1px solid #ffe3ee;
  border-radius: 10px 10px 10px 10px;
  margin-left: 10px;
  }

input[type="text"],
input[type="email"],
textarea {
  width: 850px;
  /* padding: 8px; */
  border-radius: 4px;
  box-sizing: border-box;
  resize: vertical;
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

#line {/* border: 1px solid #ccc; */}

#title {width: 850px;  border: 2px solid #ffe3ee; height: 25px; border-radius: 10px 10px 10px 10px;}
#content {width: 850px;  border: 2px solid #ffe3ee; height: 155px; border-radius: 10px 10px 10px 10px;}

footer {
position : absolute;
bottom : 0;

}	
</style>
<%@ include file="html/header.jspf" %>
<link rel="stylesheet" href="css/header.css">
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
<body>
	<div id="all">
	<div id="title1">
	<img src="resources/img/notice.png">
	<h1>공지사항</h1>
	</div>
	<form action="insertNotiBoard.do" onsubmit="return validateForm()">
	<table>
	<h2>공지 작성</h2>
		<tr>
			<th width="150">제목</th>
			<td id="line">
				<input type="text" name="title" id="title">
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td id="line">
				<textarea name="content" rows="10" cols="40" id="content"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" class="center">
				<input type="submit" value="새글 등록" id="submit">
			</td>
		</tr>
	</table>
	</form>
	</div>
	<script>
		function validateForm() {
			var title = document.getElementById("title").value;
			var content = document.getElementById("content").value;
			
			if (title.trim() === "" || content.trim() === "") {
				alert("작성글을 확인 바랍니다");
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
