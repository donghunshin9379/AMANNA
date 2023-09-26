<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 작성하기</title>
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
	margin-top: 50px;
}

table th {
	background-color: #ffe3ee;
	width: 150px;
	color: black;
	font-weight: bold;
	border: 1px solid #ffe3ee;
	border-radius: 10px 10px 10px 10px;
	text-align: center;
}

h2 {width: 1000px;}

#cap {
	float: left;
	font-weight: bold;
	font-size: 25px;
}


    select, input[type="text"], textarea {
        padding: 5px;
        font-size: 16px;
        border: 3px solid #ffe3ee;
        width: 100%;
        font-family: "GowunBatang-Regular";
        
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
        background-color: #ffe3ee;
        color: black;
        border: none;
		border-radius: 10px;  
        cursor: pointer;
        font-family: "GowunBatang-Regular";
    }

    .submit-button:hover {
        background-color: #ff93ae;
        color: white;
    }

    .error-message {
        color: red;
        text-align: center;
        margin-top: 10px;
    }

</style>
<script>
function validateForm() {
    var category = document.getElementById("category").value;
    var title = document.getElementById("title").value;
    var content = document.getElementById("content").value;

    if (category === "" || title === "" || content === "") {
        alert("작성글을 확인 부탁드립니다");
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
<%@ include file="html/header2.jspf" %>
<link rel="stylesheet" href="css/header2.css">
</head>
<body style="background-color: white;">
<div id="all">


<div id="title1">
		<img src="resources/img/notice.png">
		<h1>공지사항</h1>
</div>
 <form action="insertFaqBoard.do" method="post" onsubmit="return validateForm()">
    <table>
	<caption id="cap">FAQ 작성하기</caption>
        <tr>
            <th class="wide-header">카테고리</th>
            <td colspan="3">
                <select id="category" name="category">
                    <option value="가입">가입</option>
                    <option value="신청">신청</option>
                    <option value="결제">결제</option>
                    <option value="매칭">매칭</option>
                    <option value="만남">만남</option>
                    <option value="취소/환불">취소/환불</option>
                    <option value="EVENT">event</option>
                    <option value="그외">그외</option>
                </select>
            </td>
        </tr>
        <tr>
            <th width="70">제목</th>
            <td>
                <input type="text" name="title" id="title">
            </td>
        </tr>
        <tr>
            <th>내용</th>
            <td>
                <textarea name="content" rows="10" cols="40" id="content"></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="center">
                <input type="submit" value="새글 등록" class="submit-button">
            </td>
        </tr>
        
    </table>
</form>
</div>
                
                

<%@ include file="html/footer.jspf" %>
<link rel="stylesheet" href="css/footer.css">
</body>
</html>
