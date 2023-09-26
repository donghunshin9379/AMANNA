<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하기</title>
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


#title {width: 1000px; margin: 0 auto; text-align: center; margin-top: 80px;}
#title img {width: 100px; height: 100px; }
#title h1 {text-shadow: 2px 2px 2px #ff93a2; width: 1000px; text-align: center;}
   

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
#category {
	margin-top: 20px;
	border: 3px solid #ffe3ee;
}

#cap {
	float: left;
	font-weight: bold;
	font-size: 25px;
}

    th, td {
        padding: 10px;
        border: 1px solid #ffe3ee;
    }

    th {
        background-color: #880E4F;
        color: white;
        text-align: left;
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
       	font-weight: bold;
        border: none;
        cursor: pointer;
        border-radius: 10px;
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
    var title = document.forms["updateForm"]["title"].value;
    var content = document.forms["updateForm"]["content"].value;

    if (title === "" || content === "") {
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
<%@ include file="html/header2.jspf" %>
<link rel="stylesheet" href="css/header2.css">
</head>
<body>
<div id="all">

<div id="title">
	<img src="resources/img/faq.png">
	<h1>FAQ 관리</h1>
</div>

<h2>FAQ 수정하기</h2>
<form name="updateForm" action="updateFaqBoard.do" onsubmit="return validateForm()">
    <input type="hidden" name="faqno" value="${param.faqno}">
    <table>
    
        <select id="category" name="category">
            <option value="가입">가입</option>
            <option value="신청">신청</option>
            <option value="결제">결제</option>
            <option value="매칭">매칭</option>
            <option value="만남">만남</option>
            <option value="취소/환불">취소/환불</option>
            <option value="event">event</option>
            <option value="그 외">외</option>
        </select>
        <tr>
            <th width="70">제목</th>
            <td>
                <input type="text" name="title" value="${param.title}">
            </td>
        </tr>
        <tr>
            <th>내용</th>
            <td>
                <textarea name="content" rows="10" cols="40">${param.content}</textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="center">
                <input type="submit" value="수정하기" class="submit-button">
            </td>
        </tr>
    </table>
</form>
</div>
<%@ include file="html/footer.jspf" %>
<link rel="stylesheet" href="css/footer.css">
</body>
</html>
