<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>id값 넘기기</title>
</head>
<body>
<div id="container">
	<h1>아이디값 넘기기</h1>
	<form action="payment.do" method="post">
	<table>
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="id">
			</td>
		</tr>
	</table>
	<button type="submit">아이디 넘기기</button>
	</form>
</div>
</body>
</html>