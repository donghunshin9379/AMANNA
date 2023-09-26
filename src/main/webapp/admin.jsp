<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/header2.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<style>
@font-face {
  font-family: "GowunBatang-Regular";
  src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunBatang-Regular.woff")
    format("woff");
  font-weight: normal;
  font-style: normal;
}	
	html, body {font-family: "GowunBatang-Regular";}
	#menu > a {text-decoration: none; color: black; font-weight: bold; font-size: 20px; }
	#name {text-align: center; width: 1200px; text-shadow: 2px 2px 2px #ff93a2; font-size: 30px;}
	#menu > a > img {width: 200px; height: 200px; margin: 0 auto; text-align: center;}
	
	#container {margin: 0 auto; text-align: center; 
		width: 1200px; height: 100%; margin-top: 80px;  }
	
	#menu_box {/* position: relative; top: 200px;  */width: 1200px; 
				margin: auto; height: 900px; margin: 0 auto; margin-top: 100px; margin-left: 7px; }
	
	#menu {width: 33.33%; height: 250px;
		 float: left; margin-left: 50px; margin-bottom: 20px; margin: 0 auto; border: 2px solid #ffe3ee;}
	#menu > a {display: inline-block; width: 250px; height: 250px;  }
	
}
</style>
</head>
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
<body>
<%@include file="html/header2.jspf" %>
	<div id=container>
	<h1 id=name>관리자페이지</h1>
		<div id="menu_box">
		<div id="menu"><a href="getMemberList2.do"><img src="resources/img/user.png"> <br>회원관리</a></div>
		<div id="menu"><a href="getNotiBoardList.do"><img src="resources/img/notice.png"> <br>공지사항</a></div>
		<div id="menu"><a href="getAdminRBoardList.do"><img src="resources/img/review.png"> <br>리뷰관리</a></div>
		<div id="menu"><a href="getFaqBoardList.do"><img src="resources/img/faq.png"> <br>FAQ관리</a></div>
		<div id="menu"><a href="getBoardList.do"><img src="resources/img/qna.png"> <br>QNA관리</a></div>
		<div id="menu"><a href="getManTotPay.do"><img src="resources/img/chart.png"> <br>매출 통계</a></div>
		<div id="menu"><a href="getSexCnt.do"><img src="resources/img/alluser.png"> <br>전체 회원수</a></div>
		<div id="menu" class="empty"><a href="#"></a></div>
		<div id="menu"><a href="main.do"><img src="resources/img/heart_main.png"> <br>메인화면</a></div>
		</div>
	</div>

<%@include file="html/footer.jspf" %>
</body>
</html>