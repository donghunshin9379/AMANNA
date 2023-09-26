<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% int qNo = Integer.parseInt(request.getParameter("qNo")); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA 비밀번호 확인</title>
<%@ include file="html/header.jspf" %>
<link rel="stylesheet" href="css/header.css">
<style>
   body {
        background-color: white;
        font-family: Arial, sans-serif;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 100vh;
    }
    h1, h2, h3 {
        color: #880E4F;
    }
    form {
        margin-top: 20px;
        margin-bottom: 20px; /* 하단 간격 조정 */
    }
    input[type="text"], input[type="password"] {
        padding: 10px;
        font-size: 16px;
    }
    input[type="submit"] {
        padding: 10px 20px;
        font-size: 18px;
        background-color: #880E4F;
        color: white;
        border: none;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #AD1457;
    }
    main {
   height: 850px;
}

footer {
position : relative;
bottom : 0;

}
</style>
</head>
<body>
<main>
<br><br><br><br><br><br><br><br>
<h1>신청관련 문의</h1>
<h2>비밀글 기능으로 보호된 글입니다.</h2>
<h3>작성자와 관리자만 열람하실 수 있습니다.</h3><br>
<h3>본인이라면 비밀번호를 입력하세요.</h3>
<form id="passwordForm" action="customerPassPassword.do">
    <input type="hidden" name="qNo" value="<%= qNo %>">
    <input type="text" name="qPwd" id="passwordInput">
    <input type="submit" value="확인">
</form>
</main>
<%@ include file="html/footer.jspf" %>
<script>
    var form = document.getElementById("passwordForm");
    form.addEventListener("submit", function(event) {
        var passwordInput = document.getElementById("passwordInput");
        var password = passwordInput.value;
        
        // 비밀번호 유효성 검사 로직
        if (password === "") {
            event.preventDefault(); // 폼 제출 중지
            alert("비밀번호를 입력해주세요.");
        } 
    });
</script>
<link rel="stylesheet" href="css/footer.css">
</body>
</html>