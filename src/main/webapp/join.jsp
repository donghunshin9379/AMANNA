<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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
</head>
<link rel="icon" href="/img/logoimg2.png">
<link rel="shortcut icon" href="/img/logoimg2.png" type="image/x-icon">
<link rel="canonical" href="https://jikso.co.kr">
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">

<link rel="stylesheet" href="css/styles.css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<style>
.modal-content {

    /* 바로 상위 태그인 body를 기준으로 맞춰주게끔 */
    /* position의 absolute라는것이, 설정하게 되면
    바로 직계부모 태그의 영향아래 놓이게 된다는 말이다.
    더불어서 네모를 영역으로 봤을때 왼쪽 상단 꼭지점을
    기준으로 움직이게 된다. */
    position: absolute;

    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    width: 670px;
    height: 800px;
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
}

h2 {
    width: 466px;
    height: 94px;
    left: 725px;
    top: 132px;

    font-family: 'Noto Sans CJK KR';
    font-style: normal;
    font-weight: 700;
    font-size: 32px;
    line-height: 47px;

    color: #FFAAAF;
    justify-content: space-evenly;


}

input {
    padding: 0px;
    border: none;
    border-bottom: 1px solid #CFCFCF;
    width: 466px;
    height: 30px;
}

input.agree {
    align-items: center;
    font-size: 20pt;
    width: 15px;
    height: 15px;
}

label {
    color: lightgrey;
}

#signup-btn {
    width: 400px;
    height: 50px;
    left: 725px;
    top: 875px;
    background-color: #FFFFFF;
    color: #FFBEC3;
    border-radius: 8px;
    border: #FFBEC3 solid 1px;
}


.radio-value {
    align-items: center;
    font-size: 20pt;
    width: 15px;
    height: 15px;
}

input[type="button"]:hover {
  cursor: pointer;
}

main {
	height: 1000px;
}

footer {
position : relative;
bottom : 0;

}


</style>
<body>
<%@include file="html/header.jspf" %>
<main>
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<h2>
				회원가입을 위해<br>정보를 입력해주세요.
			</h2>
			<br>
			<br>


			<div class="modal-body">
					<table>
						<tr>
							<td><label for="id"><strong>* 아이디.</strong>&nbsp;&nbsp;&nbsp;<span
									id="idChk"></span><br></td>
						</tr>
						<tr>
							<td><input type="text" name="id" id="user_id"
								class="form-control tooltipstered" maxlength="14"
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
								placeholder="숫자와 영어로 4-10자"></td>
						</tr>
						</label>
						<tr>
							<td><label for="password1"><strong>* 비밀번호.</strong>&nbsp;&nbsp;&nbsp;<span
									id="pwChk"></span></td>
						</tr>
						<tr>
							<td><input type="password" size="17" maxlength="20"
								id="password" name="pwd" class="form-control tooltipstered"
								maxlength="20" required="required" aria-required="true"
								style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
								placeholder="영문과 특수문자를 포함한 최소 8자"></td>
						</tr>
						</label>
						<tr>
							<td><label for="password1"><strong>* 비밀번호 재확인.</strong>&nbsp;&nbsp;&nbsp;<span
								id="pwChk2"></span></td>
						</tr>
						<tr>
							<td>
							<input type="password" size="17" maxlength="20"
								id="password_check" name="pwd_check"
								class="form-control tooltipstered" maxlength="20"
								required="required" aria-required="true"
								style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
								placeholder="비밀번호가 일치해야합니다.">
							</td>
						</tr>
                        </label>
                        <tr>
						<td>
							<label><strong>이메일을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="emailchk"></span>
						</td>
						</tr>
                 	<tr>
                 	<tr>
							<td><input type="email" name="email" id="user_email"
								class="form-control tooltipstered" 
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"></td>
						</tr>
                 	</label>
						<tr>
							<td>
							<label for="name"><strong>이름을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span
										id="nameChk"></span>
							</td>
						</tr>
						<tr>
							<td><input type="text" name="name" id="user_name"
								class="form-control tooltipstered" maxlength="6"
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
								placeholder="한글로 최대 6자"></td>
						</tr>
						
						<tr>
							<td><input type="hidden" name="m_no" id="user_num"
								class="form-control tooltipstered" maxlength="6"
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"></td>
						</tr>
						<tr>
							<td>
							<input
								type="button" value="다음으로"
								class="btn form-control tooltipstered" id="signup-btn">
							</td>
						</tr>
					</table>

			</div>
		</div>
	</div>
	</main>
	<%@include file="html/footer.jspf" %>
</body>
<script>
	const getIdCheck = RegExp(/^[a-zA-Z0-9]{4,14}$/); //영문자, 숫자조합 4~14로 쓰세요
	const getPwCheck = RegExp(/^(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$/); // 최소 8자 이상으로 숫자, 특수문자가 각각 최소 1개이상으로 쓰세요
	const getNameCheck = RegExp(/^[가-힣]+$/); //한글만가능
	const emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;//이메일 정규식
	let chk1 = false, chk2 = false, chk3 = false, chk4 = false, chk5 = false;
	$(function() {
		//각 입력값들의 유효성 검증을 위한 정규표현식을 변수로 선언.

		// 입력값 중 하나라도 만족하지 못한다면 회원가입 처리를 막기위한 논리형 변수 선언.

		//회원가입시 사용자의 입력값 검증!

		//1. ID입력값 검증 
		$('#user_id')
				.keyup(
						function() {
							if ($(this).val() === '') {//지금 발생하는 이곳이 빈 문자열이니?
								$(this).css('background-color', 'pink');
								$('#idChk')
										.html(
												'<b style="font-size: 14px; color: red">[아이디는 필수값입니다.]</b>');//텍스트를 집어넣을거야 
								chk1 = false;
							} else if (!getIdCheck.test($(this).val())) {//정규표현식이 틀렸다면
								$(this).css('background-color', 'pink');
								$('#idChk')
										.html(
												'<b style="font-size: 14px; color: red">[영문자, 숫자조합 4-14로쓰세요]</b>');
								chk1 = false;
							} else {
								//아이디 중복확인 ajax 사용, 특정 호직이 실행이 끝날 때까지 기다리지 않고 먼저 코드를 샐행 (페이지 전환 없이 통신)
								//ID중복 확인 통신을 위해 입력값을 가져오기
								const id = $(this).val();

								//ajax 호출.
								//클라이언트에서 서버와 비동기 통신을 진행하는 ajax함수.
								$
										.ajax({
											type : 'post', // 서버에 전송하는 http방식
											url : 'checkId.do', // 서버 요청 url
											headers : {
												'Content-Type' : 'application/json'
											},
											dataType : 'text', //서버로 부터 응답받을 데이터의 형태 
											data : id, // 서버로 전송할 데이터 // 위에서 지정한 const id 
											success : function(result) { // 매개변수에 통신성공시 데이터가 저장된다.
												//서버와 통신성공시 실행할 내용 작성.
												console.log('통신 성공!' + result);
												if (result === 'available') {
													$('#user_id').css(
															'background-color',
															'aqua');
													$('#idChk')
															.html(
																	'<b style="font-size: 14px; color: green">[아이디 사용이 가능합니다.]</b>');
													chk1 = true;
													console.log("chk1 : "
															+ chk1);
												} else {
													$('#user_id').css(
															'background-color',
															'pink');
													$('#idChk')
															.html(
																	'<b style="font-size: 14px; color: red">[아이디 중복!.]</b>');
													chk1 = false;
												}
											},
											error : function(status, error) { //통신에 실패했을때
												console.log('통신실패');
												console.log(status, error)
											}
										}); // end ajax(아이디 중복 확인)
							}
						});
		//2. pw입력값 검증
		$('#password')
				.keyup(
						function() {
							if ($(this).val() === '') {//지금 발생하는 이곳이 빈 문자열이니?
								$(this).css('background-color', 'pink');
								$('#pwChk')
										.html(
												'<b style="font-size: 14px; color: red">[비밀번호는 필수입력값입니다.]</b>');
								chk2 = false;
							} else if (!getPwCheck.test($(this).val())) {//정규표현식이 틀렸다면
								$(this).css('background-color', 'pink');
								$('#pwChk')
										.html(
												'<b style="font-size: 14px; color: red">[최소 8자 이상으로 숫자, 특수문자가 각각 최소 1개이상으로 쓰세요]</b>');
								chk2 = false;
							} else {
								$('#password').css('background-color', 'aqua');
								$('#pwChk')
										.html(
												'<b style="font-size: 14px; color: green">[비밀번호 사용이 가능하다.]</b>');
								chk2 = true;
								console.log("chk2 : " + chk2);
							}
						});
		//3. pw값 재입력 검증
		$('#password_check')
				.keyup(
						function() {
							var pwd1 = $('#password').val();
							if ($(this).val() === '') {//지금 발생하는 이곳이 빈 문자열이니?
								$(this).css('background-color', 'pink');
								$('#pwChk2')
										.html(
												'<b style="font-size: 14px; color: red">[비밀번호를 재입력해주세요.]</b>');
								chk3 = false;
							} else if (pwd1 == $(this).val()) {//비밀번호재입력값이 같지않다면
								$('#password_check').css('background-color',
										'aqua');
								$('#pwChk2')
										.html(
												'<b style="font-size: 14px; color: green">[비밀번호 입력값이 일치합니다.]</b>');
								chk3 = true;
								console.log("chk3 : " + chk3);
							} else {
								$(this).css('background-color', 'pink');
								$('#pwChk2')
										.html(
												'<b style="font-size: 14px; color: red">[비밀번호입력값이 일치하지않습니다.]</b>');
								chk3 = false;

							}
						});
		//4. 이메일 정규식체크
		$('#user_email')
				.keyup(
						function() {
							if ($(this).val() === '') {//지금 발생하는 이곳이 빈 문자열이니?
								$(this).css('background-color', 'pink');
								$('#emailchk')
										.html(
												'<b style="font-size: 14px; color: red">[이메일은 필수값입니다.]</b>');//텍스트를 집어넣을거야 
								chk4 = false;
							} else if (!emailRule.test($(this).val())) {//정규표현식이 틀렸다면
								$(this).css('background-color', 'pink');
								$('#emailchk')
										.html(
												'<b style="font-size: 14px; color: red">[이메일형식이 아닙니다.]</b>');
								chk4 = false;
							} else {
								//이메일 중복확인 ajax 사용, 특정 호직이 실행이 끝날 때까지 기다리지 않고 먼저 코드를 샐행 (페이지 전환 없이 통신)
								//email중복 확인 통신을 위해 입력값을 가져오기
								const e = $(this).val();

								//ajax 호출.
								//클라이언트에서 서버와 비동기 통신을 진행하는 ajax함수.
								$.ajax({
									type : 'post', // 서버에 전송하는 http방식
									url : 'chkEmail.do', // 서버 요청 url
									headers : {
										'Content-Type' : 'application/json'
									},
									dataType : 'text', //서버로 부터 응답받을 데이터의 형태 
									data : e, // 서버로 전송할 데이터 // 위에서 지정한 const email
									success : function(result) { // 매개변수에 통신성공시 데이터가 저장된다.
										//서버와 통신성공시 실행할 내용 작성.
										console.log('통신 성공!' + result);
										if (result === 'available') {
											$('#user_email').css(
													'background-color',
													'aqua');
											$('#emailchk')
													.html(
															'<b style="font-size: 14px; color: green">[이메일 사용이 가능합니다.]</b>');
											chk4 = true;
											console.log("chk4 : "
													+ chk4);
										} else {
											$('#user_email').css(
													'background-color',
													'pink');
											$('#emailchk')
													.html(
															'<b style="font-size: 14px; color: red">[이메일 중복!.]</b>');
											chk4 = false;
										}
									},
									error : function(status, error) { //통신에 실패했을때
										console.log('통신실패');
										console.log(status, error)
									}
								}); // end ajax(아이디 중복 확인)
					}
				});
		
		//5. 이름입력 검증
		$('#user_name')
				.keyup(
						function() {
							if ($(this).val() === '') {//지금 발생하는 이곳이 빈 문자열이니?
								$(this).css('background-color', 'pink');
								$('#nameChk')
										.html(
												'<b style="font-size: 14px; color: red">[이름입력은 필수입력값입니다.]</b>');
								chk5 = false;
							} else if (!getNameCheck.test($(this).val())) {//정규표현식이 틀렸다면
								$(this).css('background-color', 'pink');
								$('#nameChk')
										.html(
												'<b style="font-size: 14px; color: red">[한글만가능합니다.]</b>');
								chk5 = false;
							} else {
								$('#user_name').css('background-color', 'aqua');
								$('#nameChk')
										.html(
												'<b style="font-size: 14px; color: green">[이름이 사용이 가능하다.]</b>');
								chk5 = true;
								console.log("chk5 : " + chk5);
							}
						});

		//회원가입1차
		$('#signup-btn').click(function() {

			if (chk1 && chk2 && chk3 && chk4 && chk5) {

				//Id정보 
				const id = $("#user_id").val();
				//pw정보
				const pw = $('#password').val();
				//eamil정보
				const email = $('#user_email').val();
				//name
				const name = $('#user_name').val();
				//프로퍼티 이름은 반드시 userVO와 같아야 동작이 된다!! 매우 중요!
				const user = {
					"id" : id,
					"pwd" : pw,
					"email" : email,
					"name" : name
				// json 아님
				}

				// 비동기 통신 시작! 
				$.ajax({
					type : "post",
					url : "register.do",
					contentType : "application/json",
					dataType : "text",
					// 자바스크립트 객체를 json문자열로 변환해 주는 메소드
					data : JSON.stringify(user),
					success : function(result) {
						console.log("통신 성공" + result);
						alert('기본정보입력성공');
							location.href = "join2.jsp?id=" + id;
					},
					error : function() {
						Swal.fire({
							icon : 'error',
							title : '오류발생!',
						});
					}
				})
			} else {
				Swal.fire({
					icon : 'error',
					title : '필수정보를 입력해주세요!',
				});
			}

		})

	});
</script>
</html>
