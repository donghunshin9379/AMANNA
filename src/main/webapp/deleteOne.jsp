<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
\${member } : ${member }
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">
					<span style="color: #643691;">Spring</span> 회원 탈퇴
				</h4>

			</div>

			<div class="modal-body">
			<!-- <form action="delete.do" onsubmit="return deleteCom()"> -->
				<form action="delete.do" method="post">
				
					<table
						style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
						<tr>
							<td><input type="hidden" size="17" maxlength="20"
								name="id" class="form-control tooltipstered" 
								maxlength="20" required="required" aria-required="true"
								style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
								value="${member.id }"></td>
						</tr>
						
						<tr>
							<td style="text-align: left">
								<p><strong>비밀번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="pwChk"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="password" size="17" maxlength="20"
								name="pwd" id="pwd" class="form-control tooltipstered" 
								maxlength="20" required="required" aria-required="true"
								style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
								></td>
						</tr>
						
						<tr>
						<td style="width: 100%; text-align: center; colspan: 2;"><input
							type="submit" value="탈퇴" class="btn form-control tooltipstered"
							id="delete-btn"
							style="background-color: #643691; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">
						</td>
					</tr>
					</table>
					</form>
			
			</div>
		</div>
	</div>
</body>
<script>
	let pwChk = false; //비밀번호 확인값 일치 여부 (기본값: false)
	const pwd = "${member.pwd }"; //기존 비밀번호
	//console.log("pwd : " + pwd);
	$().ready(function () {
		$('#pwd').keyup(function() { //비밀번호 확인값 입력 시 반영
		const final_pwd = document.getElementById("pwd").value;
		console.log("fianl_pwd : " + final_pwd);
		
		if (pwd == final_pwd) {
			pwChk = true;			
			console.log("입력값 일치" + " (" + pwChk + ")");
			
		} else {
			pwChk = false;
			//console.log("입력값 불일치" + " (" + pwChk + ")");
		}
		
		});	
		
	});
	
	$('#delete-btn').click(function () {
		
		if (pwChk == true) {
			//alert("pwChk : " + pwChk);
			alert("연결 성공!!");
			location.href="delete.do";
		} else {
			//alert("pwChk : " + pwChk);
			alert("비밀번호가 없거나 일치하지 않습니다! 다시 한 번 확인해주세요.");			
			$("#pwd").focus();
		}
		
	});		
	
	

</script>
</html>
