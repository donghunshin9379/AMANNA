<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>받은 ticket값 확인</title>
<style>
@font-face {
     font-family: 'S-CoreDream-3Light';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
     font-weight: normal;
     font-style: normal;
}
body {
 font-family: S-CoreDream-3Light;
 text-align: center;

}

.btn {
   background: none;
  border: 2px solid black;
  padding: 0;
  width: 80px;
  height: 40px;
  font-family: S-CoreDream-3Light;
  font-size: 20px;

}
.btn:hover {
  cursor: pointer;
}

.a {
font-size: 30px;

}

</style>
</head>
<body>
<h2>충전이 완료되었습니다</h2>

<form action="back.do">
<input type="hidden" name="id" value="${member.id}"">
<input type="hidden" name="ticket" value="${member.ticket}">
<div class="a">
<p>이름 : ${member.name} </p>
<p>보유 티켓 : ${member.ticket} </p>
</div>

<div>
<button class="btn" onclick="back()">
닫기
</button>
</div>
</form>



</body>
<script>
function back(){
window.close();
};
</script>
</html>