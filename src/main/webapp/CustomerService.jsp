<%@page import="java.util.List"%>
<%@page import="com.spring.biz.faqboard.FaqBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
List<FaqBoardVO> faqboardList = (List<FaqBoardVO>) session.getAttribute("FaqboardList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<!-- 메뉴바 내려오기 -->
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
 	<style>
 		@font-face {
	  font-family: "GowunBatang-Regular";
	  src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunBatang-Regular.woff")
	    format("woff");
	  font-weight: normal;
	  font-style: normal;
	}	
	html, body {font-family: "GowunBatang-Regular";}
 	
 	
        .info_area {
            text-align: center;
        }
        .info_area h2 {
            color: red;
        }
         .qnaTabs {
            display: flex;
            list-style-type: none;
            padding: 0;
            text-align: center;
             width: 1000px; margin: auto;
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
         .qnaTabs li:nth-child(1) {
            background-color: black;
        }
         .qnaTabs li:nth-child(1) a {
            color: white;
        }
	  /* ul {
	    list-style-type: none;
	    padding: 0;
	    margin: 0;
	    display: flex;
	  }
	
	  li {
	    display: flex;
	    align-items: center;
	    margin-right: 10px;
	  } */
	
	  li img {
	    margin-right: 5px;
	  }
	  #categoryList ul {
	  margin:50px;
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
  list-style: none;
  padding: 0;
}

#categoryList li {
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
  margin-right: 10px;
  margin-bottom: 10px;
   position: relative;
}
 #categoryList li:hover {
    cursor: pointer;
  }
#categoryList li img {
  margin-bottom: 5px;
}
#categoryList li img {
  margin-bottom: 5px;
  width: 50px; /* Adjust the width to your desired size */
  height: 50px; /* Adjust the height to your desired size */
}
input[id*="answer"] {
	display: none;
}

/* input[id*="answer"] + label {
	width:1280px;
	margin:0 150px;
	display: block;
	padding: 20px;
	border: 1px solid #232188;
	border-bottom: 0;
	color: #fff;
	font-weight: 900;
	background: pink;
	cursor: pointer;
	position: relative;
} */

/* 수정함 기억하셈 동훈*/
input[id*="answer"] + label {
  width: 1280px;
  margin: 0 auto;
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


input[id*="answer"] + label em {
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

input[id*="answer"] + label + div {
	max-height: 0;
	transition: all .35s;
	overflow: hidden;
	background: #ebf8ff;
	font-size: 15px;
}

input[id*="answer"] + label + div p {
	margin: 0 auto;
	display: inline-block;
	padding: 20px;
}

input[id*="answer"]:checked + label + div {
	max-height: 100px;
}
input [id*="answer"]: checked +label em {
	background-position: 0 -300px;
}

/* html {
	padding: 0 100px; /* 좌우 패딩 설정 */
} */

.accordion {
	margin: 0 100px; /* 좌우 여백 설정 */
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
#paging {
	width:200px;
	margin: 0 auto;
	padding:20px;
	font-size: 2em;
	justify-content: center;
    align-items: center;
}
#faqContent {
	 width: 1280px;
	 margin: 0 auto;
  /* padding: 20px; */
}
#h2 {
	margin: 50px;
}

    </style>
</head>
<link rel="icon" href="/img/logoimg2.png">
<link rel="shortcut icon" href="/img/logoimg2.png" type="image/x-icon">
<link rel="canonical" href="https://jikso.co.kr">
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">

<link rel="stylesheet" href="css/styles.css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css"
	rel="stylesheet">
<body>
 <%@ include file="html/header.jspf" %>
	<div class="info_area">
		<h2 id="h2">아만나 서비스 이용</h2>
		<p>아만나를 사랑해주시는 고객 여러분 안녕하십니까
		<br>
		<br>
		항상 아만나를 아껴주시는 고객님께 진심으로 감사드리며 최대한 빠른 문의 서비스를 제공 해 드리겠습니다
		<br>
		<br>
		</p>
	</div>
		<ul class="qnaTabs">
  <li>
    <a>FAQ</a>
  </li>
  <li>
    <a id="qnaTab">QNA</a>
  </li>	
  <li>
    <a id="noticeTab">공지사항</a>
  </li>
</ul>
		<div>
			<div id="categoryList">
  <ul>
    <li onclick="selectCategory('전체')"><img src="pictures/total.png">"전체"</li>
    <li onclick="selectCategory('가입')"><img src="pictures/signup.png">"가입"</li>
    <li onclick="selectCategory('신청')"><img src="pictures/send.png">"신청"</li>
    <li onclick="selectCategory('결제')"><img src="pictures/pay.png">"결제"</li>
    <li onclick="selectCategory('매칭')"><img src="pictures/matching.png">"매칭"</li>
    <li onclick="selectCategory('만남')"><img src="pictures/meet.png">"만남"</li>
    <li onclick="selectCategory('취소/환불')"><img src="pictures/refund.png">"취소/환불"</li>
    <li onclick="selectCategory('EVENT')"><img src="pictures/event.png">"EVENT"</li>
    <li onclick="selectCategory('그외')"><img src="pictures/etc.gif" >"그외"</li>
  </ul>
</div>
			
			<div>
				<ul>
					<li></li>
				</ul>
			</div>
		</div>

		<c:forEach var="faqboard" items="${FaqboardList}" varStatus="status">
		  <div class="accordion">
		    <input type="radio" name="accordion" id="answer${status.index + 1}">
		    <label for="answer${status.index + 1}"><img src="pictures/question.png" width="30px" height="30px">${faqboard.title} <em></em></label>
		    <div id="faqContent"><p>${faqboard.content}</p></div>
		  </div>
		</c:forEach>
		
		<div id="paging">
			<c:forEach var="i" begin="1" end="${totalPage }">
				<a href="CustomerService.do?viewPage=${i }">${i }</a>
			</c:forEach>
		</div>
 <script>
    	document.getElementById("qnaTab").addEventListener("click", function() {
    	  window.location.href = "customerQnaList.do";
    	});

    	document.getElementById("noticeTab").addEventListener("click", function() {
    	  window.location.href = "customerNotice.do";
    	});
    	function selectCategory(category) {
    	    if (category === '전체') {
    	      window.location.href = 'CustomerService.do';
    	    } else {
    	      window.location.href = 'customerCategory.do?category=' + encodeURIComponent(category);
    	    }
    	  }
    </script>
    <%@include file="html/footer.jspf"%>
</body>
</html>