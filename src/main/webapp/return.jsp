<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Insert title here</title>
<!-- 메뉴바 내려오기 -->
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
    
<link rel="stylesheet" href="css/styles.css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
  
<link rel="icon" href="/img/logoimg2.png">
<link rel="shortcut icon" href="/img/logoimg2.png" type="image/x-icon">
<link rel="canonical" href="https://jikso.co.kr">
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">

<style>
footer {
position : absolute;
bottom : 0;

}

h2{
text-align: center;
font-size: 60px;
font-family: "GowunBatang-Regular";
color: #F07878;

}

* {
  box-sizing: border-box;
  font-family: 'Noto Sans KR', sans-serif;
  border-radius: 5px;
}
 
body {
  margin: 0;
  
}
 
.container {

    /* 바로 상위 태그인 body를 기준으로 맞춰주게끔 */
    /* position의 absolute라는것이, 설정하게 되면
    바로 직계부모 태그의 영향아래 놓이게 된다는 말이다.
    더불어서 네모를 영역으로 봤을때 왼쪽 상단 꼭지점을
    기준으로 움직이게 된다. */
    position: absolute;

    left: 50%;
    top: 45%;
    transform: translate(-50%, -50%);
    width: 470px;
    height: 600px;
    background: #FFFFFF;
    border: 1px solid #FFB4B9;
    box-shadow: 7px 7px 39px rgba(0, 104, 255, 0.25);
    border-radius: 20px;

    /* 이것의 의미는 타겟팅된 영역에 대해 
    지정된 만큼 움직여주는 거라고 한다. */
    /* justify-content: space-evenly;
    align-content: column; */

    margin: 0px;
    padding: 100px;
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    flex-wrap: nowrap;
    
    text-align: center;
    
}
 
.text-field {
      font-size: 14px;
      padding: 10px;
      border: none;
      width: 260px;
      margin-bottom: 10px;
}
 
.submit-btn {
  font-size: 14px;
  border: none;
  padding: 10px;
  width: 260px;
  background-color: #FFC0CB;
  margin-bottom: 30px;
  color: white;
  
}
 
.links {
    text-align: center;
}
 
.links a {
  font-size: 15px;
  color: #9B9B9B;
}

h3 {
 font-size: 50px;
 color: #FFC8CD;
 text-align: center;

}

</style>
</head>
<body>
<%@include file="html/header.jspf" %>
<br><br>
<h2>회원가입 후 확인 가능합니다.</h2>
<br><br><br><br><br><br>






  <div class="container">
    <h3>AMANNA</h3>
    <form action="login.do" method="post">
      <br><br><br><br>
      <input type="text" name="id" id="login_id" class="text-field" placeholder="아이디">
      <br>
      <input type="password" name="password" id="login_pwd" class="text-field" placeholder="비밀번호">
      <br><br>
      <input type="button" value="로그인" id="loginBtn" class="submit-btn">
    </form>
 
    <div class="links">
      <a href="join.jsp">회원가입</a><br><br><br>
      <a href="searchId.jsp">아이디/</a><a href="searchPwd.jsp">비밀번호를 잊으셨나요?</a>
          </div>
  </div>





<footer><%@include file="html/footer.jspf" %></footer>
</body>

<script>
	let chk1 = false, chk2 = false;
$().ready(function () {
	//id창 비어잇나
    $('#login_id').keyup(function() {
       if($(this).val() === '' ) {//지금 발생하는 이곳이 빈 문자열이니?
          chk1 = false;
       } else{
		  chk1 = true;
       }
    });
  //pwd창 비어잇나
    $('#login_pwd').keyup(function() {
       if($(this).val() === '' ) {//지금 발생하는 이곳이 빈 문자열이니?
          chk2 = false;
       } else{
		  chk2 = true;
       }
    });
	
	   //로그인체크
    $('#loginBtn').click(function() {
		
		if(chk1 && chk2  == true){
			
			//Id정보 
			const id = $("#login_id").val();
			//pw정보
			const pwd = $('#login_pwd').val();
			
			//프로퍼티 이름은 반드시 memberVO와 같아야 동작이 된다!! 매우 중요!
			const user ={
					"id" : id,
					"pwd" : pwd
					// json 아님
			}
			
			// 비동기 통신 시작! 
			$.ajax({
				type : "post",
				url : "login.do",
				contentType : "application/json",
				dataType : "text",
				// 자바스크립트 객체를 json문자열로 변환해 주는 메소드
				data : JSON.stringify(user),
				success : function(result) {
					console.log("통신 성공" + result);
					if(result == 0){
						//아이디 비밀번호 틀릴시
						Swal.fire({
					            icon: 'question',              
					            title: '아이디 혹은 비밀번호가 틀립니다.',    
					        }).then(function(){
								$("#login_id").focus();
					        });
					}else if(result == "admin"){
						 Swal.fire({
					            icon: 'success',              
					            title: '관리자로그인 성공!',  
					        }).then(function(){
					        	location.href="admin.jsp";                   
					        });
					}else{
						//로그인 성공 시
						 Swal.fire({
					            icon: 'success',              
					            title: '로그인 성공!',  
					        }).then(function(){
					        	location.href="main.do";                   
					        });
					}
				},
				error : function() {
					//통신실패시
					 Swal.fire({
				            icon: 'error',              
				            title: '오류발생!',  
				        });
				}
			})
		}else if($("#login_id").val() == ''){
			//빈 문자열있을시
			 Swal.fire({
		            icon: 'warning',              
		            title: '아이디가 누락되었습니다.', 
		        })
		     $("#login_id").focus();
		}else if($("#login_pwd").val() == ''){
			//빈 문자열있을시
			 Swal.fire({
		            icon: 'warning',              
		            title: '비밀번호가 누락되었습니다.', 
		        })
		     $("#login_pwd").focus();
		}else if($("#login_id").val() == "admin") {
			
			
		}
		
		
		
	})
});
</script>
</html>