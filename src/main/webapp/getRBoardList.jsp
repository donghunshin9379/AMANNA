<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<title>후기게시판</title>
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
</head>
<link rel="icon" href="/img/logoimg2.png">
<link rel="shortcut icon" href="/img/logoimg2.png" type="image/x-icon">
<link rel="canonical" href="https://jikso.co.kr">
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">

<link rel="stylesheet" href="css/styles.css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<style>
table {
	width: 50%;
	border-collapse: collapse;
	margin: 0 auto;
	
}

th, td {
	padding: 10px;
	border-bottom: 1px solid #ddd;
	text-align: center;
	font-family: "GowunBatang-Regular";
}

th {
	background-color: #FFE3EE;
	font-family: "GowunBatang-Regular";
    font-style: normal;
    font-weight: 700;
    font-size: 18px;
    line-height: 20px;

    color: #FFAAAF;
    justify-content: space-evenly;
	
}

.page {
	margin: 0 auto;
}

.img {
    width: 13%;
    margin: 0 auto;
    display: flex;
    justify-content: center;
    align-items: center;


}

footer {
	position: absolute;
	bottom: 0;
}
</style>
<body>
<%@include file="html/header.jspf" %>
<br>
<div>
<img src="resources/images/a1.png" class="img">
</div>
<div>
	<table>
			<colgroup>
				<col width="20%">
				<col width="60%">
				<col width="20%">
			</colgroup>
			<thead>
			<tr>
				<th>NO</th>
				<th>제목</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="rboard" items="${rboardList }">
			<tr>
				<td>${rboard.rNo }</td>
				<td><a href="getRBoard.do?rNo=${rboard.rNo }&id=${member.id}">${rboard.rTitle }</a></td>
				<td>${rboard.count }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>

<div style="width:600px;margin-top:5px; text-align: center;" class="page">
	<c:forEach var="i" begin="1" end="${totalPage }">
	<a href="getRBoardList.do?viewPage=${i }">${i }</a>
	</c:forEach>
</div>
	<footer><%@include file="html/footer.jspf" %></footer>
</body>
</html>