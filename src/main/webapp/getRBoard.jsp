<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   session.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getRBoard.jsp</title>
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
      function showLoginAlert() {
          alert("로그인이 필요합니다. 로그인 페이지로 이동합니다.");
          window.location.href = "login.jsp"; // 로그인 페이지의 URL로 변경해주세요
      }
    </script>
</head>
<link rel="icon" href="/img/logoimg2.png">
<link rel="shortcut icon" href="/img/logoimg2.png" type="image/x-icon">
<link rel="canonical" href="https://jikso.co.kr">
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">

<link rel="stylesheet" href="css/styles.css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css"
   rel="stylesheet">
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
.table1 {
   width: 70%;
   border-collapse: collapse;
   margin: 0 auto;
}

.table2 {
   width: 70%;
   border-collapse: collapse;
   margin: 0 auto;
}

.table3 {
   width: 70%;
   border-collapse: collapse;
   margin: 0 auto;
}

.table1 th {
   background-color: #FFE3EE;
   font-family: "GowunBatang-Regular";
   font-style: normal;
   font-weight: 700;
   font-size: 20px;
   line-height: 40px;
   color: #FFAAAF;
   justify-content: space-evenly;
}

.table1 td {
   padding: 10px;
   font-size: 15px;
   border-bottom: 1px solid #ddd;
   text-align: center;
   font-family: "GowunBatang-Regular";
   line-height: 40px;
}

.table2 th {
   background-color: #FFF0F5;
   font-family: "GowunBatang-Regular";
   font-style: normal;
   font-weight: 700;
   font-size: 15px;
   line-height: 20px;
   color: #FFAAAF;
   justify-content: space-evenly;
}

.table2 td {
   padding: 10px;
   font-size: 13px;
   border-bottom: 1px solid #ddd;
   text-align: center;
   font-family: "GowunBatang-Regular";
}

.table3 th {
   background-color: #FFE3EE;
   font-family: "GowunBatang-Regular";
   font-style: normal;
   font-weight: 700;
   font-size: 20px;
   line-height: 40px;
   color: #FFAAAF;
   justify-content: space-evenly;
}

.table3 td {
   padding: 10px;
   font-size: 15px;
   border-bottom: 1px solid #ddd;
   text-align: center;
   font-family: "GowunBatang-Regular";
   line-height: 40px;
}

.writeComment {
   display: flex;
   justify-content: center;
}

textarea {
   width: 100%;
   height: 100px;
   padding: 10px;
   box-sizing: border-box;
   border: solid 2px #FFBCB9;
   border-radius: 5px;
   font-size: 16px;
   margin: 0 auto;
}

footer {
   position: absolute;
   bottom: 0;
}

#container {
   margin: 30px auto;
}

.table1{
   margin-bottom: 50px;
}

h1 {
   display:flex;
   margin: 30px auto;
   justify-content: center;
}

footer {
position : relative;
bottom : 0;
}
</style>
<body>
   <%@include file="html/header.jspf"%>
   <div id="container">
      <div>
      <h1>후기</h1>
         <table class="table3">
            <thead>
               <tr>
                  <th>글 내용</th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td>${rboard.rContent}</td>
               </tr>
               <c:if test="${not empty rboard.uploadFile1}">
                  <tr>
                     <td><img src="reviewPictures/${rboard.uploadFile1}" alt="Attached Image"></td>
                  </tr>
               </c:if>
            </tbody>
         </table>
      </div>
   
      <div>
      
      <table class="table1">
         <thead>
            <tr>
               <th>작성자</th>
               <th>작성일</th>
               <th>조회수</th>
            </tr>
         </thead>
         <tbody>
            <tr>
               <td>${rboard.id }</td>
               <td>${rboard.rDate }</td>
               <td>${rboard.count }</td>
            </tr>
         </tbody>
      </table>
      </div>

      <div>
         <h1>후기 댓글</h1>
         <table class="table2">
            <c:forEach var="qlist" items="${qlist }">
               <tr>
                  <th style="width:10%;">${qlist.rcWriter }</th>
                  <td style="width:70%;">${qlist.rcContent}</td>
                  <th><c:if
                        test="${member != null && member.id eq qlist.rcWriter}">
                        <a
                           href="updelQrBoard.jsp?rcNo=${qlist.rcNo}&&rcContent=${qlist.rcContent}">삭제
                           및 수정</a>
                     </c:if> <c:if test="${member == null || member.id ne qlist.rcWriter}">
                         작성자만 수정 가능합니다
                    </c:if></th>
               </tr>
            </c:forEach>
         </table>
         <br>
      </div>
      <div class="writeComment">
         <c:if test="${member != null}">
            <form action="insertQrBoard.do">
               <input type="hidden" name="rcWriter" value="${member.id}">
               <input type="hidden" name="rNo" value="${rboard.rNo}">
               <textarea rows="20" cols="50" name="rcContent"></textarea>
               <input type="submit" value="댓글달기">
            </form>
         </c:if>
         <c:if test="${member == null}">
            <p>댓글을 작성하려면 로그인이 필요합니다.</p>
            <button onclick="showLoginAlert()">로그인</button>
         </c:if>
      </div>
   </div>
   <footer><%@include file="html/footer.jspf"%></footer>
</body>
</html>