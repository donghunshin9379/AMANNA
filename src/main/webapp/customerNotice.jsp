<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항(고객)</title>
<%@ include file="html/header.jspf"%>
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">
<style>
@font-face {
	font-family: "GowunBatang-Regular";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunBatang-Regular.woff")
		format("woff");
	font-weight: normal;
	font-style: normal;
}

html, body {
	font-family: "GowunBatang-Regular";
}

input[id*="answer"] {
	display: none;
}

input[id*="answer"]+label {
	display: block;
	padding: 20px;
	border: 1px solid #232188;
	border-bottom: 0;
	color: #fff;
	font-weight: 900;
	background: pink;
	cursor: pointer;
	position: relative;
}

input[id*="answer"]+label em {
	position: absolute;
	top: 50%;
	right: 50px;
	width: 50px; /* Adjusted to 40px */
	height: 60px; /* Adjusted to 60px */
	margin-top: -30px; /* Adjusted to vertically center the image */
	margin-left: 100px; display : inline-block;
	background: url('pictures/down.png') 0 0 no-repeat;
	display: inline-block;
}

input[id*="answer"]+label+div {
	max-height: 0;
	transition: all .35s;
	overflow: hidden;
	background: #ebf8ff;
	font-size: 15px;
}

input[id*="answer"]+label+div p {
	display: inline-block;
	padding: 20px;
}

input[id*="answer"]:checked+label+div {
	max-height: 100px;
}

input [id*="answer"]: checked+label em {
	background-position: 0 -300px;
}

.qnaTabs {
	display: flex;
	list-style-type: none;
	padding: 0;
	text-align: center;
	width: 1000px;
	margin: 30px auto;
}

.qnaTabs li {
	flex: 7;
	border: 1px solid black;
	height: 50px;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 5px;
	margin: 5px;
}

.qnaTabs li:nth-child(3) {
	background-color: black;
}

.qnaTabs li:nth-child(3) a {
	color: white;
}

.accordion {
	margin-bottom: 10px;
}

.qnaTabs li {
	/* 기존 스타일 */
	cursor: pointer;
}

.qnaTabs li:hover {
	cursor: pointer;
	cursor: pointer;
}

.accordion {
	margin: 0 150px; /* 좌우 여백 설정 */
}

h1, h3 {
	margin: 0 150px; /* 좌우 여백 설정 */
}
</style>
</head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
<body>
	<script>
		// JavaScript 코드
		const checkboxes = document.querySelectorAll('input[id*="answer"]');
		checkboxes.forEach((checkbox) => {
			checkbox.addEventListener('change', function () {
				const div = this.nextElementSibling.nextElementSibling;
				if (this.checked) {
					div.style.maxHeight = div.scrollHeight + 'px';
				} else {
					div.style.maxHeight = '0';
				}
			});
		});
	</script>

	<ul class="qnaTabs">
		<li><a id="CustomerService">FAQ</a></li>
		<li><a id="qnaTab">QNA</a></li>
		<li><a id="noticeTab">공지사항</a></li>
	</ul>
	<h1>공지사항</h1>
	<h3>Total ${total.total }건</h3>
	<c:forEach var="nlist" items="${nlist}" varStatus="status">
		<div class="accordion">
			<input type="radio" name="accordion" id="answer${status.index + 1}">
			<label for="answer${status.index + 1}"> <img
				src="pictures/noti.png" width="30px" height="30px">${nlist.title}
				(${nlist.notiDate })<em></em>
			</label>
			<div>
				<p>${nlist.content}</p>
			</div>
		</div>
	</c:forEach>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<script>
    function toggleContent(element) {
        var contentDiv = element.parentElement.nextElementSibling.querySelector('.content');

        if (contentDiv.style.display === "none") {
            contentDiv.style.display = "block";
        } else {
            contentDiv.style.display = "none";
        }
    }
    
    
    document.getElementById("qnaTab").addEventListener("click", function() {
  	  window.location.href = "customerQnaList.do";
  	});

  	document.getElementById("noticeTab").addEventListener("click", function() {
  	  window.location.href = "customerNotice.do";
  	});
  	document.getElementById("CustomerService").addEventListener("click", function() {
  	  window.location.href = "CustomerService.do";
  	});
</script>

<%@ include file="html/footer.jspf"%>
</body>
</html>