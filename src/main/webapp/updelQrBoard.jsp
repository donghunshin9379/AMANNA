<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    int rcNo = Integer.parseInt(request.getParameter("rcNo"));
    String rcContent = request.getParameter("rcContent");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 수정</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function() {
  $(".mainnav1 > li").mouseover(function() {
    $(this).children(".site_nav").stop().slideDown(300);
  });

  $(".mainnav1 > li").mouseleave(function() {
    $(this).children(".site_nav").stop().slideUp(300);
  });

  setInterval(move, 3000);
  function move() {
    $(".menuslide ul").animate({
      left: "-1350px"
    }, 1500, function() {
      $(this).append($(".menuul ul li").first());
      $(".menuslide ul").css("left", 0);
    });
  }
});

function validateForm() {
  var rcContent = document.forms["updateForm"]["rcContent"].value;

  if (rcContent.length === 0) {
    alert("내용을 입력해주세요.");
    return false;
  }

  if (rcContent.length > 200) {
    alert("200자 이하로 작성해주세요.");
    return false;
  }
}
</script>
</head>
<link rel="icon" href="/img/logoimg2.png">
<link rel="shortcut icon" href="/img/logoimg2.png" type="image/x-icon">
<link rel="canonical" href="https://jikso.co.kr">
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">

<link rel="stylesheet" href="css/styles.css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<body>
<%@include file="html/header.jspf" %>
<form name="updateForm" action="updateQrBoard.do" onsubmit="return validateForm()">
<input type="hidden" name="rcNo" value="<%= rcNo %>">
<input type="hidden" name="rcWriter" value="${member.id}">
<input type="hidden" name="rNo" value="${rboard.rNo}">
<table>
    <tr>
        <th>작성내용</th>
    </tr>
    <tr>
        <td>
            <textarea name="rcContent" rows="10" cols="40"><%= rcContent %></textarea> 
        </td>
    </tr>
</table>
<input type="submit" value="수정">
</form>
<button onclick="location.href='deleteQrBoard.do?rcWriter=${member.id}&rNo=${rboard.rNo}&rcNo=<%= rcNo %>';">삭제하기</button>  
<footer>
    <%@include file="html/footer.jspf" %>
</footer>
</body>
</html>
