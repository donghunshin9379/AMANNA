
<%@page import="com.spring.biz.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 통합</title>

<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
	
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	
	
<style>
@font-face {
     font-family: 'S-CoreDream-3Light';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
     font-weight: normal;
     font-style: normal;
}
body {
 font-family: S-CoreDream-3Light;

}

.ticket {
   width: 80%;
   margin: 0 auto;
    border: 10px solid #FF8E99;
    text-align: center;

}

h2, h3 {
text-align: center;
}

.btn {
  background: none;
  border: 2px solid black;
  padding: 0;
  width: 500px;
  height: 100px;
}

.btn2 {
   background: none;
  border: 1px solid black;
  padding: 0;
  width: 80px;
  height: 40px;
  color:white;
  font-family: S-CoreDream-3Light;
  font-size: 20px;
  background-color: #FF8E99;
  border-color: #FF8E99;

}

.btn img {
  display: block;
  width: 100%;
  height: 100%;
  object-fit: cover;
  
}

.container {
  display: flex;
  justify-content: center;
}

.btn:hover {
  cursor: pointer;
}

.btn2:hover {
  cursor: pointer;
}

.totpay {
  font-size: 20px;
}

/* 수량입력 스타일 */
.container .btn {
  width: 250px;
  height: 100px;
  margin: 0 10px;
  border: 2px solid black;
  border-radius: 5px;
  font-size: 30px;
  color: white;
  font-family: S-CoreDream-3Light;
  background-color: #FF8E99;
  border-color: #FF8E99;
  
}

.quantity-input {
  width: 200px; /* 수량 입력란의 너비 설정 */
  height: 30px;
}

input[type="number"] {
  font-size: 20px;
  width: fit-content;
  padding: 5px;
}

</style>
</head>

<body>

	
	<%-- 나이 값을 확인할 수 있는 로직을 통해 age 값을 설정 --%>
	<%
	MemberVO member = (MemberVO) request.getAttribute("member");
	String id = member.getId();
	System.out.println("id : " + id);
	int age = member.getAge();
	String sex = member.getSex();
	System.out.println("age : " + age);
	System.out.println("sex : " + sex);
	%>
    
	<form id="paySubmit" action="getMoney.do" method="post">
		<div class="ticket" id="ticket">
			<input type="hidden" value="${member.id }"> 
			<input type="hidden" value="${member.pay }"> 
			<input type="hidden" value="${member.age }">
			<input type="hidden" value="${member.sex }">
			<h2>티켓충전</h2> 
            <br><br>

			<%-- 결제 금액 선택을 위한 조건문 --%>
			
			<%-- 남성 결제금액 --%>
			<%
			    if( sex.equals("남성")){
			%>
			<%
				if (age >= 26 && age <= 28 ) {
			%>
			<label class="box-radio-input"><input type="radio"
				name="pay" value="55000"><span>티켓1개당(55,000원)<br><br><br></span></label>
			<%
				} else if (age >= 29 && age <= 33) {
			%>
			<label class="box-radio-input"><input type="radio"
				name="pay" value="60000"><span>티켓1개당(60,000원)<br><br><br></span></label>
			<%
				} else if (age >= 34 && age <= 36) {
			%>
			<label class="box-radio-input"><input type="radio"
				name="pay" value="65000"><span>티켓1개당(65,000원)<br><br><br></span></label>
			<%
				} else if (age >= 37 && age <= 39) {
			%>
			<label class="box-radio-input"><input type="radio"
				name="pay" value="70000"><span>티켓1개당(70,000원)<br><br><br></span></label>
			<%
				} else if (age >= 40 && age <= 58) {
			%>
			<label class="box-radio-input"><input type="radio"
				name="pay" value="75000"><span>티켓1개당(75,000원)<br><br><br></span></label>
			<%
				} else {
			%>
			<p>선택 가능한 결제 금액이 없습니다.</p>
			<%
			}
			    }
			%>
			
			
			
			<%-- 여성 결제금액 --%>
			<%
			    if( sex.equals("여성")){
			%>
			<%
				if (age >= 23 && age <= 26 ) {
			%>
			<label class="box-radio-input"><input type="radio"
				name="pay" value="30000"><span>티켓1개당(30,000원)<br><br><br></span></label>
			<%
				} else if (age >= 29 && age <= 33) {
			%>
			<label class="box-radio-input"><input type="radio"
				name="pay" value="35000"><span>티켓1개당(35,000원)<br><br><br></span></label>
			<%
				} else if (age >= 34 && age <= 36) {
			%>
			<label class="box-radio-input"><input type="radio"
				name="pay" value="40000"><span>티켓1개당(40,000원)<br><br><br></span></label>
			<%
				} else if (age >= 37 && age <= 39) {
			%>
			<label class="box-radio-input"><input type="radio"
				name="pay" value="45000"><span>티켓1개당(45,000원)<br><br><br></span></label>
			<%
				} else if (age >= 40 && age <= 58) {
			%>
			<label class="box-radio-input"><input type="radio"
				name="pay" value="50000"><span>티켓1개당(50,000원)<br><br><br></span></label>
			<%
				} else {
			%>
			<p>선택 가능한 결제 금액이 없습니다.</p>
			<%
			}
			    }
			%>
			<div class="container">
			<br><br><label for="quantity">티켓 수량 &nbsp;&nbsp;&nbsp;</label>
			<input type="number" id="quantity" name="ticket" min="1" value="1" class="quantity-input">
		&nbsp;&nbsp;&nbsp;<button type="button" onclick="calculateTotal()" class="btn2">확인</button>
			</div>
			<hr>
			<%-- 변경된 내용 출력을 위한 div 태그 --%>
			<div class="container">
				<p id="totalAmount" class="totpay" name="totpay">총결제금액 : </p>
			</div>
			<hr>
			<h3>결제 수단</h3>
			<table>
			<tr>
			<button type="button" class="btn"
				id="charge_kakao">
				<img src="resources/images/kakaopay.png" alt="카카오페이" width="500"
					height="100">
			</button>
			</tr>
			<br><br>
			<div class="container">
			<button type="button" class="btn"
				id="charge_kg">
			계좌이체
			</button>
			<button type="button" class="btn"
				id="charge_card">
		          신용카드
			</button>
			</div>
			
			</table>
			<br><br><img width=100% src="resources/images/결제하단.png" />
		</div>
	</form>
</body>


<script>
	var memberName = '${member.name}';
	var memberAge = '${member.age}';
	var memberSex = '${member.sex}';
	
	function calculateTotal() {
		var quantity = document.getElementById("quantity").value;
		var ticketPrice = document.querySelector('input[name="pay"]:checked').value;
		var totpay = quantity * ticketPrice;
		document.getElementById("totalAmount").innerHTML = "총결제금액: " + totpay + "원";
	}

	// 계좌이체
	$('#charge_kg').click(function() {
		var IMP = window.IMP;
		IMP.init('imp48636600');
		var age = memberAge;
		var quantity = $('#quantity').val();
		var selectedPay = $('input[name="pay"]:checked').val();
		var pay = selectedPay * quantity;
      
		

		if (pay === null) {
			console.error('선택된 결제 금액이 없습니다.');
			return;
		}

		IMP.request_pay({
			pg : 'html5_inicis',
			pay_method : 'trans',
			merchant_uid : "INIBillTst" + new Date().getTime(), // 상점에서 관리하는 주문 번호
			name : '주문명:결제테스트',
			amount : pay,
			buyer_email : 'iamport@siot.do',
			buyer_name : memberName,
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456'
		}, function(rsp) {
			if (rsp.success) {
				
				document.getElementById('paySubmit').submit();

			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;

				alert(msg);
			}
		});
	});

	
	// 카카오페이
	$('#charge_kakao').click(function() {
		var IMP = window.IMP;
		IMP.init('imp48636600');
		var age = memberAge;
		var quantity = $('#quantity').val();
		var selectedPay = $('input[name="pay"]:checked').val();
		
		var pay = selectedPay * quantity;
		
		
		if (pay === null) {
			console.error('선택된 결제 금액이 없습니다.');
			return;
		}

		IMP.request_pay({
			pg : 'kakaopay',
			merchant_uid : 'TC0ONETIME' + new Date().getTime(),
			name : '주문명 : 티켓',
			amount : pay,
			buyer_email : 'iamport@siot.do',
			buyer_name : memberName,
			buyer_tel : '010-1234-5678',
			buyer_addr : '인천광역시 부평구',
			buyer_postcode : '123-456'
		}, function(rsp) {
			console.log(rsp);
			if (rsp.success) {
				document.getElementById('paySubmit').submit();
				
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
		});
	});

	// 신용카드 충전

	$('#charge_card').click(function() {
		var IMP = window.IMP;
		IMP.init('imp48636600');
		var age = memberAge;
		var quantity = $('#quantity').val();
		var selectedPay = $('input[name="pay"]:checked').val();
		
		var pay = selectedPay * quantity;
		
		if (pay === null) {
			console.error('선택된 결제 금액이 없습니다.');
			return;
		}
		IMP.request_pay({
			pg : 'uplus',
			pay_method : 'card',
			merchant_uid : 'tlgdacomxpay' + new Date().getTime(), //상점에서 생성한 고유 주문번호
			name : '주문명:결제테스트', //필수 파라미터 입니다.
			amount : pay,
			buyer_email : 'iamport@siot.do',
			buyer_name : '구매자이름',
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456',
		}, function(rsp) {
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '\n구매자 : ' + memberName;
				msg += '\n아만나 만남티켓';
				msg += '\n결제 금액 : ' + rsp.paid_amount;

				alert(msg);
				document.getElementById('paySubmit').submit();
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				alert(msg);
			}
		});

	});
	
	


</script>
</html>