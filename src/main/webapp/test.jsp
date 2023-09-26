<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용방법</title>
<!-- 메뉴바 내려오기 -->
 

</head>
<style>
* {
  box-sizing: border-box;
  font-family: 'Noto Sans KR', sans-serif;
  border-radius: 5px;
}
 
body {
  margin: 0;
}
 
.login-form {
    width: 500px;
    background-color: #EEEFF1;
    margin-right: auto;
    margin-left: auto;
    margin-top: 50px;
    padding: 20px;
    text-align: center;
    border: none;
    
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
</style>
<body>
<!DOCTYPE html>
<html>
<head>
  <title>로그인</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="css/styles.css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
</head>
<body>
  <div class="login-form">
    <form action="login.do" method="post">
      <br><br><br><br>
      <input type="text" name="email" id="login_id" class="text-field" placeholder="아이디">
      <br>
      <input type="password" name="password" id="login_pwd" class="text-field" placeholder="비밀번호">
      <br><br>
      <input type="submit" value="로그인" id="loginBtn" class="submit-btn">
    </form>
 
    <div class="links">
      <a href="join.jsp">회원가입</a><br><br><br>
      <a href="#">비밀번호를 잊어버리셨나요?</a>
    </div>
  </div>
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
					}else{
						//로그인 성공 시
						 Swal.fire({
					            icon: 'success',              
					            title: '로그인 성공!',  
					        }).then(function(){
					        	location.href="main.jsp";                   
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
		}
	})
});
</script>
</html>

