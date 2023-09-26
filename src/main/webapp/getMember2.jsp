<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세보기</title>
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
<link rel="icon" href="/img/logoimg2.png">
<link rel="shortcut icon" href="/img/logoimg2.png" type="image/x-icon">
<link rel="canonical" href="https://jikso.co.kr">
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">

<link rel="stylesheet" href="css/styles.css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
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
width: 1000px;
margin: 0 auto;
margin-bottom: 100px;
margin-top: 100px;
}
h1 {
width: 1000px;
margin: 0 auto;
text-shadow: 2px 2px 2px #ff93a2;
}

table {
width:1000px;
text-align: center;
margin: 0 auto;
font-family: "GowunBatang-Regular";
border: 10px solid #ffe3ee;
border-radius: 10px;
background-image: url("resources/img/pink_heart4.jpeg");
font-weight: bold;
}



input {
	width:200px;
	height:30px;
	border: 3px solid #ffe3ee;
	border-radius: 5px;
	font-family: "GowunBatang-Regular";
	font-weight: 600;
}

#span {
	display: inline-block;
	width: 80px;
	height: 30px;
}


textarea {
	width: 200px;
	height:100px;
	font-family: "GowunBatang-Regular";
	border: 3px solid #ffe3ee;
	border-radius: 5px;
	text-align: left;
	font-weight: 600;
}

input[type="button"] {
	background-color: #ffe3ee;
	border-radius: 10px;
	cursor: pointer;
	border: none;
	margin-top: 10px;
}

input[type="button"]:hover {
	background-color: #ff93ae;
	color: white;
}
</style>

</head>
<script>
	let loginId = "${member.id }"
	if (loginId == "") {
		alert("로그인 후 이용 바랍니다.");
		location.href="login.jsp";
	} else {
		//const pwd = "${member.pwd}";
		//console.log("pwd : " + pwd);		
	}

</script>

<body>
<%@include file="html/header.jspf" %>	
<%-- \${member } : ${member } --%>
	<div id="container">
	
		<h1>PROFILE</h1>
			
				
			<!-- <form action="getMemberUpdate.jsp" method="post"> -->
				<input type="hidden" name="id" value="${member.id }">	
				<%-- <input type="hidden" name="pwd" value="${member.pwd }">		 --%>	
				<input type="hidden" name="phone" value="${member.phone }">
				<input type="hidden" name="imgName" value="${member.imgName }">	
			<table>				
				
				<tr>
					<td><span id="span">이름 :</span> <input type="text" name="name" value="${member.name }" readonly="readonly"></td>
				</tr>
				
				<tr>
					<td><span id="span">나이 :</span> <input type="number" name="age" value="${member.age }" readonly="readonly"></td>
				</tr>				
				<tr>
					<td><span id="span">키 :</span> <input type="text" name="height" value="${member.height }" readonly="readonly"></td>
				</tr>
				
				<tr>
					<td><span id="span">몸무게:</span> <input type="text" name="weight" value="${member.weight }" readonly="readonly"></td>
				</tr>
				
				<tr>
					<td><span id="span">최종학력 :</span> <input type="text" name="edu" value="${member.edu }" readonly="readonly"></td>
				</tr>
				
				<tr>
					<td><span id="span">직업 :</span> <input type="text" name="job" value="${member.job }" readonly="readonly"></td>
				</tr>
				<tr>
					<td><span id="span">흡연유무 :</span> <input type="text" name="smoke" value="${member.smoke }" readonly="readonly"></td>
				</tr>				
				<tr>
					<td><span id="span">취미 :</span> <input type="text" name=hobby value="${member.hobby }" readonly="readonly"></td>
				</tr>				
				<tr>
					<td>
					<span class="introduce">자기 소개 :</span>
						<textarea name="content" readonly="readonly">
						${member.content }</textarea>
					</td>
				</tr>						
				<tr>
					<td><span id="span">비밀번호 :</span> <input type="password" name="member_pwd" id= "member_pwd" value=""
					placeholder="정보 수정 시 필수 입력 사항"></td>
				</tr>
				<tr>
					<td colspan="2" class="center">
					
						<input type="button" value="회원상세정보 수정" id="updateMember">
						
					</td>					
				</tr>
				<tr>
					<td colspan="2" class="center">
				
					<input type="button" value="비밀번호 수정" id="updatePwd">
										
					</td>					
				</tr>
				
				<tr>
					<td colspan="2" class="center">					
				
					<input type="button" value="회원 탈퇴" onclick="deleteOne()">
					
					</td>								
				</tr>
				<tr>
					<td colspan="2" class="center">					
				
					<input type="button" value="목록 보기" onclick="getMembers()">
					
					</td>								
				</tr>
				
			</table>
			<!-- </form> -->
		
		<!-- <p>
			<a href="getMemberList.do">목록보기</a>
		</p> -->
	</div>
<footer><%@include file="html/footer.jspf" %></footer>
</body>
<script>
	let pChk = false; //비밀번호 확인값 일치 여부 (기본값: false)
	const pwd = "${member.pwd }"; //기존 비밀번호
	//console.log("pwd : " + pwd);
	$().ready(function () {
		$('#member_pwd').keyup(function() { //비밀번호 확인값 입력 시 반영
		const member_pwd = document.getElementById('member_pwd').value;	
		//console.log("member_pwd : " + member_pwd);
		//console.log("login_id : " + document.getElementById('login_id').value);
		//const login_id = document.getElementById('login_id').value;
	    //console.log("login_id : " + login_id);
		//const chkPwd = document.getElementById("member_pwd").value;
		//console.log("chkPwd : " + chkPwd);
		
		if (pwd == member_pwd) {
			pChk = true;			
			console.log("입력값 일치" + " (" + pChk + ")");
			
		} else {
			pChk = false;
			//console.log("입력값 불일치" + " (" + pChk + ")");
		}
		
		});	
		
	});
	
	$('#updateMember').click(function() {
		
		if (pChk == true) {
			alert("연결 성공! 회원정보 수정 페이지로 갑니다!!");
			location.href = "getMemberUpdate.jsp";
		} else {
			alert("비밀번호가 없거나 일치하지 않습니다! 다시 한 번 확인해주세요.");			
			$("#member_pwd").focus();
		}
		
	});
	
	$('#updatePwd').click(function() {
		
		if (pChk == true) {
			alert("연결 성공!\n 비밀번호 수정 페이지로 이동합니다!");
			location.href = "updatePass.jsp";
		} else {
			alert("비밀번호가 없거나 일치하지 않습니다! 한 번 더 확인해주세요.");			
			$("#member_pwd").focus();
		}
		
	});   
	
	function deleteOne(){
		const chk = confirm("정말 탈퇴하시겠습니까?\n 탈퇴 시 재가입이 불가능합니다.");
		if (chk == true) {
			//alert("회원 탈퇴 페이지로 이동합니다.");
			location.href = "deleteOne.jsp";			
		} else {
			//alert("취소되었습니다.");
			return;
		}
		
	}
	
	function getMembers(){
		//alert("회원 목록 페이지로 이동합니다.");
		location.href = "getMemberList.do";		
	}
	

</script>
</html>