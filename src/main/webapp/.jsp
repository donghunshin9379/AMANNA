<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용금액</title>
<link rel="stylesheet"
	href="https://jikso.co.kr/theme/basic/css/default.css?ver=28220620">
<link rel="stylesheet"
	href="https://jikso.co.kr/js/font-awesome/css/font-awesome.min.css?ver=220620">
<link rel="icon" href="/img/logoimg2.png">
<link rel="shortcut icon" href="/img/logoimg2.png" type="image/x-icon">
<link rel="canonical" href="https://jikso.co.kr">


<style>
.tableBox {
   width: 50%;
   margin: 0 auto;

}


.order:hover {
  cursor: pointer;
}

</style>

</head>

<body>
	
	<div class="subTop_wrap1">
		<div class="subTop">
			<p class="subTop_tit">이용안내</p>

			<div class="subpgNav">
				<ul>
					<li><a id="guide" href="guide.jsp" class="">이용방법</a></li>
					<li><a href="selectMember.jsp" class="on">이용금액</a></li>
					<li><a href="rule.jsp" class="">세부규정</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div id="guideContent"></div>

<a href="main.jsp">메인으로</a>
<div class="tableBox" id="tableBox">
<table class="basetb mb30">
<p class="pgsubtle">이용금액</p>
<h4 class="title4">개별만남 1회 기준</h4>
<thead>
  <tr>
    <th colspan="4" class="mint">남성</th>
  </tr>
  <tr>
     <th class="gray">연령</th>
     <th class="gray">만남비용</th>
  </tr>
</thead>
<tbody>
   <tr>
    <td>
       <b>26~28세</b>
    </td>
    <td>
       <b>55,000원</b>
    </td>
   </tr>
   <tr>
    <td>
       <b>29~33세</b>
    </td>
    <td>
       <b>60,000원</b>
    </td>
   </tr>
   <tr>
    <td>
       <b>34~36세</b>
    </td>
    <td>
       <b>65,000원</b>
    </td>
   </tr>
   <tr>
    <td>
       <b>37~39세</b>
    </td>
    <td>
       <b>70,000원</b>
    </td>
   </tr>
   <tr>
    <td>
       <b>40~58세 </b>
    </td>
    <td>
       <b>75,000원</b>
    </td>
   </tr>


</tbody>

</table>

<br><br><br><br><br><br>
<table class="basetb mb30">
<thead>
  <tr>
    <th colspan="4">여성</th>
  </tr>
  <tr>
     <th class="gray">연령</th>
     <th class="gray">만남비용</th>
  </tr>
</thead>
<tbody>
   <tr>
    <td>
       <b>23~26세</b>
    </td>
    <td>
       <b>30,000원</b>
    </td>
   </tr>
   <tr>
    <td>
       <b>27~32세</b>
    </td>
    <td>
       <b>35,000원</b>
    </td>
   </tr>
   <tr>
    <td>
       <b>33~36세</b>
    </td>
    <td>
       <b>40,000원</b>
    </td>
   </tr>
   <tr>
    <td>
       <b>37~39세</b>
    </td>
    <td>
       <b>45,000원</b>
    </td>
   </tr>
   <tr>
    <td>
       <b>40~58세 </b>
    </td>
    <td>
       <b>50,000원</b>
    </td>
   </tr>


</tbody>

</table>
        <div class="startbtn">
		<form action="order.do" method="post" id="aa">
			<input type="hidden" name="id" value="${member.id}">
			<a onclick="openOrderPage()" class="order">주문페이지열기</a>
		</form>
		</div>
	</div>
</body>
<script>
function openOrderPage() {
    var memberId = "${member.id}";
    var url = "order.do";

    // AJAX 요청 보내기
    var xhr = new XMLHttpRequest();
    xhr.open("POST", url, true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            // AJAX 요청이 성공적으로 완료되면 팝업창 열기
            var windowName = "주문 페이지";
            var windowFeatures = "width=800,height=900";
            var popupWindow = window.open(url, windowName, windowFeatures);
        }
    };

    // 요청 데이터 생성
    var formData = "id=" + encodeURIComponent(memberId);

    // AJAX 요청 전송
    xhr.send(formData);
}

/*
$(document).ready(function() {
	
	  $('#guide').click(function() {
	    showGuide();
	    hideTableBox();
	  });
	  
	  $('#tableBox').click(function() {
		showTableBox();
		hideGuideContent();
		  });
	  
	});


	function showGuide() {
	  $.ajax({
	    url: 'guide.jsp',
	    type: 'GET',
	    success: function(response) {
	      $('#guideContent').html(response);
	    },
	    error: function(xhr, status, error) {
	      console.log(error);
	    }
	  });
	}
	
	
	function hideTableBox() {
		  $('.tablebox').hide();
		}
	
	function hideGuideContent() {
		  $('#guideContent').empty();
		}
	

	function showTableBox() {
		  $('.tableBox').show();
		}
	*/
	
</script>
</html>








