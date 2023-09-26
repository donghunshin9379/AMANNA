<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 프로필 확인</title>
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	$(function() {
		$(".mainnav1 >li").mouseover(function() {
			$(this).children(".site_nav").stop().slideDown(300);

			$(".mainnav1 > li").mouseleave(function() {
				$(this).children(".site_nav").stop().slideUp(300);
			});
		}); //메뉴

		setInterval(move, 3000);
		function move() {
			$(".menuslide ul").animate({
				left : "-1350px",
			}, 1500, function() {
				$(this).append($(".menuul ul li").first());
				$(".menuslide ul").css("left", 0);
			});
		} //
	}); //전체
</script>
<style>
@font-face {
	font-family: "GowunBatang-Regular";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunBatang-Regular.woff")
		format("woff");
	font-weight: normal;
	font-style: normal;
}

#container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	text-align: center;
}

h1, h2, h3, th, td, input {
	display: inline;
	font-family: "GowunBatang-Regular";
}

#profilePic {
	border: 3px solid pink;
	border-radius: 70px;`
}

footer {
	position: relative;
	bottom: 0;
}

main {
	height: 1000px;
}

h1 {
	margin: 30px auto;
}
#choice {
	margin: 30px auto;
}

input[type="submit"] {
	width: 80px;
	height: 40px;
	font-size: 1.3em;
	font-weight: bold;
	margin: 0 auto;
}
</style>
</head>
<script>
</script>
<body>
	<%@include file="html/header.jspf"%>
	<main>
	<div id="container">
		<h1>매칭 발신자</h1>
		<form id="matchForm" action="#" method="post">
			<table>
				<tr>
					<td><img alt="등록한 사진이 없습니다" src="pictures/${caller.imgName}"
						id="profilePic"></td>
				</tr>

				<tr>
					<td>이름 : ${caller.name }</td>
				</tr>

				<tr>
					<td>성별 : ${caller.sex }</td>
				</tr>

				<tr>
					<td>나이 : ${caller.age }</td>
				</tr>

				<tr>
					<td>키 : ${caller.height }</td>
				</tr>

				<tr>
					<td>몸무게: ${caller.weight }</td>
				</tr>

				<tr>
					<td>최종학력 : ${caller.edu }</td>
				</tr>

				<tr>
					<td>직업 : ${caller.job }</td>
				</tr>
				<tr>
					<td>흡연유무 :${caller.smoke }</td>
				</tr>

				<tr>
					<td>취미 : ${caller.hobby }</td>
				</tr>

				<tr>
					<td>소개 : ${caller.content }</td>
				</tr>

				<tr>
					<td>진행상태 : ${caller.progress }</td>
				</tr>
				<tr id="choice">
					<td colspan="2" class="center"><input type="hidden" name="id"
						id="matchId"> 
		<br><br><br>
						<input type="hidden" name="seq"	id="matchSeq"> <input type="submit" value="수락하기"
						onclick="setMatchAction('yesMatch.do')">
						 <input	type="submit" value="거절하기" onclick="setMatchAction('noMatch.do')">
						<h2>
							<a href="#" onclick="chatTest('${caller.progress}')">1대1 채팅</a>
						</h2></td>
				</tr>
			</table>
		</form>
	</div>
	<script>
// 수락하기, 거절하기 메소드
function setMatchAction(action) {
    var form = document.getElementById('matchForm');
    form.action = action;
    form.querySelector('#matchId').value = '${member.id}'; //로그인 아이디값
    form.querySelector('#matchSeq').value = '${caller.seq}';
    
    // "수락하기"와 "거절하기" 클릭 시 alert 메시지를 띄우는 로직
    if (action === 'yesMatch.do') {
        alert('매칭을 수락합니다 \n 티켓 1개가 소모됩니다.');
    } else if (action === 'noMatch.do') {
        alert('매칭을 거절합니다.');
    }
}

function chatTest(progress){
	if (progress === "거절") {
		alert("거절상태 입니다")
	} else if (progress === "수락") {
		alert("채팅을 시작합니다")
		window.open("chat.jsp","아만나 채팅","width=550, height=900");
	} else {
		alert("미응답  상태입니다")
	}
}

</script>
	</main>
	<%@include file="html/footer.jspf"%>
</body>
</html>