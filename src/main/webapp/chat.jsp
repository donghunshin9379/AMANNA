<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<title>채팅</title>

<style>
	html,body{
		-webkit-font-smoothing: antialiased;
		font-family: "GowunBatang-Regular";
	}
	@font-face {
  font-family: "GowunBatang-Regular";
  src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunBatang-Regular.woff")
    format("woff");
  font-weight: normal;
  font-style: normal;
}	
	h1 {text-align: center; margin: 0 auto; font-size: 28px;}
	h1 span {position: relative;
				display: inline-block;  animation: bounce .5s ease infinite alternate; }
				
h1 span:nth-child(2) { animation-delay: .1s; }
h1 span:nth-child(3) { animation-delay: .2s; }
h1 span:nth-child(4) { animation-delay: .3s; }
h1 span:nth-child(5) { animation-delay: .4s; }
h1 span:nth-child(6) { animation-delay: .5s; }

@keyframes bounce {
  100% {
    top: -20px;
    text-shadow: 0 1px 0 #ff93a2,
                 0 2px 0 #ff93a2,
                 0 3px 0 #ff93a2,
                 0 4px 0 #ff93a2,
                 0 5px 0 #ff93a2,
                 0 6px 0 #ff93a2,
                 0 50px 25px rgba(0, 0, 0, 0.1);
  }
}
	input{border-color:#ff93a2; }
	#container{font-family: "GowunBatang-Regular"; text-align: center; margin: 0 auto; 
				margin-top: 60px; margin-bottom: 100px;}
	#chatarea{margin: 0 auto; border: 10px solid #ff93a2; font-size: 20px;
		 border-radius: 20px 20px 20px 20px; color: black; overflow: auto; text-align: left;
		 background-image: url('resources/img/pink_heart2.jpeg');
		 font-weight: 700;}
		 
	#message{font-family: "GowunBatang-Regular"; width: 350px; height: 50px; margin-top: 30px; border-radius: 20px 20px 20px 20px; border: 4px solid #ff93a2;
		 text-align: left; font-size: 15px; color: black;}
		 
	#sendarea{width: 500px; margin: 0 auto;}
	
	#send {width: 70px; height:50px; background-color: #ff93a2; color: white; text-decoration: bold;
			border-radius: 35px 35px 35px 35px; border: 2px solid #ff93a2; cursor: pointer;}
			
	#exit {width: 70px; height:50px; background-color: #ff93a2; color: white; text-decoration: bold;
			border-radius: 35px 35px 35px 35px; border: 2px solid #ff93a2; cursor: pointer;}
	
</style>
</head>
<body>
<%-- <%@include file="html/header.jspf" %> --%>
	<div id="container">
	<h1>
	<span>아</span>
  	<span>만</span>
 	<span>나</span>
  	<span>채</span>
  	<span>팅</span>
  	<span>방</span>
  </h1>
	<input type="hidden" id="id" value="${member.name }">
	<div>
		<div id="chatarea" style="width: 500px; height: 700px;"></div>
		<div id="sendarea">
		<input type="text" id="message"  onkeydown="handleKeyDown(event)" placeholder="메시지를 입력하세요"/>
		<input type="button" id="send" value="보내기" />
		<input type="button" id="exit" value="나가기" />
		</div>
	</div>
	</div>
<%-- <%@include file="html/footer.jspf" %> --%>
</body>
<script type="text/javascript">
	//  입장
	let websocket;
	connect();
	function connect(){
// 		websocket = new WebSocket("ws://localhost:8080/www/chat-ws");
		websocket = new WebSocket("ws://localhost:8080/project/chat-ws.do");
			//웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
			websocket.onopen = onOpen;
			websocket.onmessage = onMessage;
	}
	
	// 연결 + 입력된 사용자 ID를 서버에 입장 메시지로 전송합니다
	function onOpen(){
		id = document.getElementById("id").value;
		websocket.send(id + "님 입장하셨습니다.");
	}
	
	// 메시지 전송 클릭
	document.getElementById("send").addEventListener("click", function() {
		send();
	});
	
	function send(){
		/* alert("메시지전송"); */
	  id = document.getElementById("id").value;
	  msg = document.getElementById("message").value.trim(); // 입력된 메시지의 앞뒤 공백을 제거합니다.
	  websocket.send(id + ":" + msg);
	  document.getElementById("message").value = "";
	}
	
	function onMessage(evt){
		data= evt.data;
		chatarea = document.getElementById("chatarea");
		chatarea.innerHTML = chatarea.innerHTML + "<br/>" + data
		chatarea.scrollTop = chatarea.scrollHeight;
	}
	
	// 연결해제
	document.getElementById("exit").addEventListener("click", function() {
		disconnect();
		window.close();
	});

	function disconnect(){
		id = document.getElementById("id").value;
		websocket.send(id+"님이 퇴장하셨습니다");
		websocket.close();
	}
	
	function handleKeyDown(event) {
		  if (event.key === "Enter") {
		    event.preventDefault(); // 기본 엔터 동작(새 줄 추가)을 막습니다.
		    document.getElementById("send").click(); // "보내기" 버튼의 클릭 이벤트를 트리거합니다.
		  }
		}
	
	var chatarea = document.getElementById("chatarea");
	chatarea.scrollTop = chatarea.scrollHeight;
	</script>
</html>