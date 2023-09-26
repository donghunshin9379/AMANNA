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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>아이디 찾기 결과 [searchIdResult.jsp] (로그인 /비밀번호 찾기 페이지로 이동)</title>
<style>
body {
  font-family: Arial, sans-serif;
  font-size: 14px;
  line-height: 1.6;
}

.container {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
}

table {
  width: 100%;
  border-collapse: collapse;
}

th, td {
  padding: 12px;
  border: 1px solid #ddd;
  text-align: left;
}

th {
  background-color: #f5f5f5;
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

input[type="button"]:hover {
  background-color: #45a049;
}


</style>
\${board } : ${board }
<script>
	<%
		String email = request.getParameter("email");
		session.setAttribute("email", email);
	%>
		const mail = "${board.email }";
		if (mail != "<%=email%>") {
			alert("가입된 이름이나 메일이 없습니다.");
			history.back();
		}		
</script>
</head>
<body>
\${board }: ${board }
<form action="pwdChange.do" method="post" onsubmit="return changePwd()">
 <div class="container">			
<table>
		<tr>
			<th width="70"></th>
			<td>
				ID 찾기 페이지
			</td>
		</tr>
		<tr>
			<th>ID</th>
			<td>
				${board.id}
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				${board.email}
			</td>
		</tr>
		<%-- <tr>
			<th>재설정 비밀번호</th>
			<td>
				<input type="password" class="form-control" name="pwd" id ="pwd1" value="${member.pwd }" placeholder="" required="required">
			</td>
		</tr>
		<tr>
			<th>재설정 비밀번호 확인</th>
			<td>
				<input type="password" class="form-control" name="pwd2" id ="pwd2" placeholder="" required="required">
				&nbsp;&nbsp;&nbsp;<span id="pChk"></span>
			</td>
		</tr>		 --%>
		
	</table>
	<input type="button" value="로그인 페이지로 이동" onclick="loginOk()">
	<input type="button" value="비밀번호 찾기" onclick="searchPass()">
	<input type="hidden" name="name" value="${board.name }">
</div>

</form>
</body>
<script>
	function loginOk() {
		location.href = "login.jsp";
	}

	function searchPass() {
		location.href = "searchPwd.jsp";
	}
		
	

</script>
</html>