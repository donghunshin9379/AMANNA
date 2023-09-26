<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- 메뉴바 내려오기 -->
<script>
      $(function () {
        $(".mainnav1 >li").mouseover(function () {
          $(this).children(".site_nav").stop().slideDown(300);

          $(".mainnav1 > li").mouseleave(function () {
            $(this).children(".site_nav").stop().slideUp(300);
          });
        }); //메뉴

        setInterval(move, 3000);
        function move() {
          $(".menuslide ul").animate(
            {
              left: "-1350px",
            },
            1500,
            function () {
              $(this).append($(".menuul ul li").first());
              $(".menuslide ul").css("left", 0);
            }
          );
        } //
      }); //전체
    </script>

<link rel="icon" href="/img/logoimg2.png">
<link rel="shortcut icon" href="/img/logoimg2.png" type="image/x-icon">
<link rel="canonical" href="https://jikso.co.kr">
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">


</head>
<style>
.paymenu {
	width: 50%;
	margin: 0 auto;
	display: flex;
	justify-content: center;
	align-items: center;
}

.btn {
	width: 20%;
	margin: 0 auto;
	display: flex;
	justify-content: center;
	align-items: center;
}

.btn:hover {
	cursor: pointer;
}

footer {
	position: relative;
	bottom: 0;
}

main {
	height: 900px;
}
</style>
<body>
	<%@include file="html/header.jspf"%>
	<main>
		<img src="resources/images/joinTest2.png" class="paymenu">
		<!--  <input type="button" value="시작하기" onclick="location.href='https://waveon.io/apps/24464'"> -->
		<img src="resources/images/startBtn.png"
			onclick="location.href='https://waveon.io/apps/24464'" class="btn">
	</main>
	<footer><%@include file="html/footer.jspf"%></footer>
</body>
</html>