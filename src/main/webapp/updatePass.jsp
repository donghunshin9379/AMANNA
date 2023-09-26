<%@page import="com.spring.biz.member.impl.MemberDAO"%>
<%@page import="com.spring.biz.member.MemberVO"%>
<%-- <%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경[searchPwdResult.jsp] (로그인 /비밀번호 변경 페이지로 이동)</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<style>
@font-face {
  font-family: "GowunBatang-Regular";
  src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunBatang-Regular.woff")
    format("woff");
  font-weight: normal;
  font-style: normal;
}	
body {
  font-family: "GowunBatang-Regular";
}   
    
#container {
width: 500px;
height: 700px;
margin: 0 auto;
margin-bottom: 100px;
margin-top: 150px;
}

h1 {
width: 500px;
margin: 0 auto;
text-shadow: 2px 2px 2px #ff93a2;
text-align: center;
margin-top: 50px;
}

table {
	width: 500px; 
	border: 10px solid #ffe3ee;
	border-radius: 10px 10px 10px 10px;
	margin: 0 auto;
	margin-top: 80px;
	/* background-image: url("resources/img/pink_heart4.jpeg"); */
	font-weight: bold;
}

table th {
	width: 200px;
	height:30px;
	border: 3px solid #ffe3ee;
	border-radius: 10px;
	margin-bottom: 10px;
	text-align: center;
}
input {
	border: 3px solid #ffe3ee;
	border-radius: 5px;
	width: 200px;
	height: 30px;
	margin-left: 10px;
	border: none;
	font-family: "GowunBatang-Regular";
	
}

table td {
	margin-left: 10px;
	border-bottom: 3px solid #ffe3ee;
}

input[type="button"] {
	background-color: #ffe3ee;
	border-radius: 10px;
	cursor: pointer;
	border: none;
	margin-top: 30px;
	font-weight: 700;
}

input[type="button"]:hover {
	background-color: #ff93ae;
	color: white;
}

#btn {
	width: 500px;
	margin: 0 auto;
	margin-bottom: 350px;
}
.btn1 {
	float: left;
}
.btn2 {
	float: right;
}
</style>
<script>
	function changePwd(){
						
		let passChk = false;
		passChk = true;
		
		if (passChk == true) {
			alert("확인 성공!");
			location.href = "mypage.jsp";
		} else {
			alert("확인 실패!");
			return;
		}
		
	}

</script>
</head>
<body>
<%@include file="html/header.jspf" %>
 <div class="container">
<table>
 <h1>비밀번호 재설정</h1>			
		<tr>
			<th>ID</th>
			<td>
				${member.id}
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>
				${member.phone}
			</td>
		</tr>
		<tr>
			<th>기본 비밀번호</th>
			<td>
				<input type="password" class="form-control" name="pwd" value="${member.pwd }" required="required">
			</td>
		</tr>
		<tr>
			<th>재설정 비밀번호</th>
			<td>
				<input type="password" class="form-control" name="pwd1" placeholder="" required="required">
			</td>
		</tr>
		<tr>
			<th>재설정 비밀번호 확인</th>
			<td>
				<input type="password" class="form-control" name="pwd2" placeholder="" required="required">
			</td>
		</tr>		
	</table>
	<div id="btn">
	<input type="button" value="로그인" onclick= "location.href='login.jsp'" class="btn1">
	<input type="button" value="비밀번호 변경" onclick="changePwd()" class="btn2">
	</div>
	
	
</div>
<%@include file="html/footer.jspf" %>
</body>
</html>