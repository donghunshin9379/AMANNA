<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용금액</title>
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

<!-- <link rel="stylesheet"
	href="https://jikso.co.kr/theme/basic/css/default.css?ver=28220620">
<link rel="stylesheet"
	href="https://jikso.co.kr/js/font-awesome/css/font-awesome.min.css?ver=220620"> -->
<link rel="icon" href="/img/logoimg2.png">
<link rel="shortcut icon" href="/img/logoimg2.png" type="image/x-icon">
<link rel="canonical" href="https://jikso.co.kr">
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">

<style>
.tableBox {
   width: 50%;
   margin: 0 auto;

}


.order:hover {
  cursor: pointer;
}

.paymenu {
    width: 50%;
    margin: 0 auto;
    display: flex;
    justify-content: center;
    align-items: center;


}

.order {
    width: 300px;
    margin: 0 auto;
    display: flex;
    justify-content: center;
    align-items: center;

}
</style>

</head>
<body>
<%@include file="html/header.jspf" %>	

	<div id="guideContent"></div>
	
<br><br><br>
<img src="resources/images/이용금액.png" class="paymenu">

        <div class="startbtn">
		<form action="order.do" method="post" id="aa">
			<input type="hidden" name="id" value="${member.id}">
			<img src="resources/images/주문버튼.png"  class="order"<a onclick="openOrderPage()" class="order" />>
			
		</form>
		</div>
	</div>
<%@include file="html/footer.jspf" %>
</body>
<script>
function openOrderPage() {
    var memberId = "${member.id}";
    var url = "order.do";
    console.log('주문열기');
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

	
</script>
</html>