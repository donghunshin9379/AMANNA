<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트</title>
</head>
<link rel="stylesheet" href="css/styles.css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
  
<link rel="icon" href="/img/logoimg2.png">
<link rel="shortcut icon" href="/img/logoimg2.png" type="image/x-icon">
<link rel="canonical" href="https://jikso.co.kr">
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<style>
body {
	background-color: #FFF0F5;
}

footer {
	background-color: #FFF0F5;
}

#check {
	font-family: "GowunBatang-Regular";
}

h2 {
	text-align: center;
}

footer {
	position: absolute;
	bottom: 0;
}

.close {
	font-family: "GowunBatang-Regular";
	font-size: 20px;
	position: relative;
}

.btn {
	display: block;
	margin-left: auto;
	margin-right: auto;
}
</style>
<body>
<img src="resources/images/event.png">
<img src="resources/images/eventBtn.png" class="btn" onclick="openEvent()"  />

<footer>
<div id="layer_popup">
<div id="check">

<br><br>
	&nbsp&nbsp<input type="checkbox" value="checkbox" id="chkbox">
    <label for="chkbox">&nbsp;&nbsp;오늘 하루동안 보지 않기</label>
</div>

	<a href="javascript:closePop();" class="close">닫기</a>
</div>
</footer>
<script>
function setCookie( name, value, exDay ) {
    var todayDate = new Date();
    todayDate.setDate( todayDate.getDate() + exDay ); 
    document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}

function closePop() {
    var cookiedata = document.cookie; // cookiedata 변수를 closePop 함수 내부에서 선언

    // 하루동안 보지 않기
    if (chkbox.checked) {
        setCookie("popup", "done", 1); // 저장될 쿠키명, 쿠키 value값, 기간
        
    }
    window.close();
}

function openEvent() {
	window.opener.location.href = "event.jsp"; // 부모 창의 URL을 "login.jsp"로 변경
    window.close();
	
	
}
</script>
</body>

</html>