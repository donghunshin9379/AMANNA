<%@page import="com.spring.biz.member.impl.MemberDAO"%>
<%@page import="com.spring.biz.member.MemberVO"%>
<%-- <%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%
	String email = request.getParameter("email");
	session.setAttribute("email", email);
%>
<script>
	if (email != "${board.email}") {
		alert("이메일 입력값이 일치하지 않습니다!");
		history.back();
	}
</script> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>비밀번호 변경 [updatePass.jsp] (로그인 /비밀번호 변경 페이지로 이동)</title>
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
height: 300px;
margin: 0 auto;
margin-bottom: 200px;
margin-top: 150px;
border: 10px solid #ffe3ee;
background-image: url("resources/img/pink_heart4.jpeg");

}

h2 {
width: 500px;
text-shadow: 2px 2px 2px #ff93a2;
margin: 0 auto;
font-size: 20px;
text-align: center;
}



#span {
	display:inline-block; 
	width:120px; height: 30px; 
	margin-left: 10px; 
	margin-top: 30px;
	font-weight: bold;
} 
#pwd1 {
	border: 3px solid #ffe3ee;
	margin-bottom: 10px;
	margin-left: 10px;
}

#pwd2 {
	border: 3px solid #ffe3ee;
	margin-bottom: 10px;
	margin-left: 10px;
}
input {
	border: 3px solid #ffe3ee;
	border-radius: 5px;
	width: 200px;
	height: 40px;
}

td {
	width :250px;
	font-weight: bold;
	
}
input[type="button"] {
  background-color: #4CAF50;
  color: white;
  border: none;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 14px;
  cursor: pointer;
}

#submit {
	width: 200px;
	height: 30px;
	float: right;
	background-color: #ffe3ee;
	border: none;
	border-radius: 10px;
	font-family: "GowunBatang-Regular";
	margin-right: 10px;
	cursor: pointer;	
	font-weight: bold;
	margin-top: -10px;
}

#submit:hover {
	background-color: #ff93ae;
	color: white;
}

main {
	position: relative;
	height: 700px;
}
</style>

<script>
	<%
		String email = request.getParameter("email");
		session.setAttribute("email", email);
		System.out.println("email : " + email);
	%>
		const mail = "${board.email }";
		if (mail != "<%=email%>") {
			alert("아이디나 메일이 없습니다.");
			history.back();
		}
		<%-- console.log("email : " + "<%=email%>"); --%>
		let pChk1 = false; //비밀번호 보안 조건 충족 여부 (기본값: false)
		let pChk2 = false; //비밀번호 확인값 일치 여부 (기본값: false)
		const getPwCheck = RegExp(/^(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$/); // 최소 8자 이상으로 숫자, 특수문자가 각각 최소 1개 이상
		//const pwd1 = $('#pwd1').val();
		//console.log("pwd1 : " + pwd1);
		$().ready(function () {
			$('#pwd1').keyup(function() { //비밀번호 확인값 입력 시 반영
				
				const pwd1 = document.getElementById('pwd1').value;	
				console.log("pwd1 : " + pwd1);
				
				if (pwd1 == '') {
					console.log("비밀번호 입력값이 없습니다!" + " (pChk : " + pChk1 + ")");
					pChk1 = false;			
					
				} else if (pwd1 == "${board.pwd }") {
					console.log("비밀번호 변동사항이 없습니다!" + " (pChk : " + pChk1 + ")");
					pChk1 = false;					
					
				} /* else if (!getPwCheck.test(pwd1){
					console.log("보안에 취약한 비밀번호입니다! (최소 8자 이상으로 숫자, 특수문자가 각각 최소 1개 이상 입력)" + " (pChk : " + pChk1 + ")");
					pChk1 = false;
				
				} */ else if ((pwd1).search("${board.id }") > -1) {//비밀번호에 아이디값 입력 시
					console.log("보안에 취약한 비밀번호입니다! (비밀번호에 아이디가 포함 불가)" + " (pChk1 : " + pChk1 + ")");
					pChk1 = false;
				
				} else if (pwd1.search(/\s/) > -1) {//비밀번호에 스페이스값 입력 시
					console.log("비밀번호에 빈 칸이 포함되어선 안 됩니다!" + " (pChk1 : " + pChk1 + ")");
					pChk1 = false;
					
				} else {
					console.log("비밀번호 변동 가능 : " + " (pChk1 : " + pChk1 + ")");
					pChk1 = true;
					
				}
				
				});
			
			$('#pwd2').keyup(function() { //비밀번호 확인값 입력 시 반영
			
			const pwd2 = document.getElementById('pwd2').value;	
			console.log("pwd2 : " + pwd2);
			
			if (pwd2 == $('#pwd1').val()) {
				pChk2 = true;			
				console.log("비밀번호가 같습니다" + " (pChk2 : " + pChk2 + ")");
				
				if (pChk1 == pChk2) {
					console.log("비밀번호 변동이 가능합니다!");
				}
				
			} else {
				pChk2 = false;
				console.log("입력값 불일치" + " (pChk2 : " + pChk2 + ")");
								
			}
			
			});	
			
		});
		
	function changePwd(){
		
		if (pChk1 == true) {
			alert("비밀번호 조건이 일치합니다!");
			
			if (pChk1 == pChk2) {
				alert("비밀번호 변경 확인 완료!");
				location.href="logout.do";	
			} else {
				alert("확인값 불일치!");
				$("#pwd2").focus();
				location.href="searchPwd.jsp";
			}			
			
		} else {
			alert("보안에 취약한 비밀번호입니다!\n (아이디 미포함, 최소 8자 이상으로 숫자, 특수문자가 각각 최소 1개 이상 입력 필수)");
			//$("#pwd1").focus();
			location.href="searchPwd.jsp";
			
		}
		
		/* if (pChk1 == true & pChk2 == true) {
			alert("비밀번호 조건이나 비밀번호 확인값이 일치합니다!");
			location.href="logout.do";			
			
		} else {
			alert("비밀번호 조건, 비밀번호 확인값이 일치하지 않습니다.!");
			$("#pwd2").focus();
			location.href="searchPwdResult.jsp";		
			
		} */
		
	}

</script>
</head>
<body>
<%@include file="html/header.jspf" %>
<form action="pwdChange.do" method="post">
<main>
 <div id="container">	
 	<h2>비밀번호 재설정</h2>		
<table>
		<tr>
			
			<td>
				<span id="span">재설정 비밀번호</span><input type="password"  name="pwd" id ="pwd1" value="${member.pwd }" placeholder="" required="required">
			</td>
		</tr>
		<tr>
			<td>
				<span id="span">비밀번호 확인</span><input type="password"  name="pwd2" id ="pwd2" placeholder="" required="required">
				
			</td>
		</tr>		
		
	</table>
	<input type="submit" value="비밀번호 변경" id="submit">
	<input type="hidden" name="id" value="${board.id }">

</div>
</form>
</main>
<%@include file="html/footer.jspf" %>
</body>
</html>