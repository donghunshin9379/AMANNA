   <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>header</title>
    <style>
    #myPagebtn{
    
    color: #FFAAAF;
    
    }
    
    #logout {
  font-size: 16px;
  color: #ff93a2;
  text-decoration: none;
  margin: 10px;
  font-family: "GowunBatang-Regular";
}

.top_gnb {
    font-family: "GowunBatang-Regular";
    
    
    }
    
    
#plus1 {
 font-family: "GowunBatang-Regular";
 font-size: 20px;



}

.review {
font-family: "GowunBatang-Regular";
font-size: 20px;
text-align: center;


}

.review th {
font-size: 30px;
 border : 1px solid black;
 background-color: #FFC8CD;

}



#event {
  margin-left: -80px;
}
    
    </style>

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
  <body>
    <div id="wrap">
      <!-- 헤더 시작 -->
      <div>
        <div class="top_gnb">
          <div class="body_wrap1">
            <div class="text">
              <span class="mungu">1:1 소개팅 하나만을 전문적으로 합니다.</span>
            </div>
            <div>
            <c:choose>
            <c:when test="${member.id == null }">
              <a href="login.jsp" id="login">로그인</a>
              <a href="logout.jsp" id="logout" style="display:none;">로그아웃</a>
            </c:when>
            <c:otherwise>
              <a href="login.jsp" id="login"  style="display:none;">로그인</a>
             ${member.id }님이 로그인중입니다.<a href="logout.jsp" id="logout">로그아웃</a>
             </c:otherwise>
             </c:choose>
              <a href="join.jsp" id="joinbtn">회원가입</a>
              <a href="mypage.jsp" id="myPagebtn">myPage</a>
            </div>
          </div>
        </div>
        <!--두번쨰 줄------------------------------------------------------- -->
        <div class="header_wrap">
          <nav class="body_wrap2">
            <div class="titleimg">
              <a href="main.do" onclick="eventopen();">
              <img src="resources/img/로고.png" alt="직장인소개팅" id="titleimg"/>
              </a>
            </div>
            <!-- 글자시작 -->

            <div class="mainav">
              <ul class="mainnav1">
                <li id="line1">
                  <a href="paymentPage.jsp" class="maintitle" id="line1">이용안내</a>
                  <ul class="site_nav">
                    <li>
                      <a href="guide.jsp" id="line"
                        >이용방법&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a
                      >
                    </li>
                    <li>
                      <a href="paymentPage.jsp" id="line"
                        >이용금액&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a
                      >
                    </li>
                    <li>
                      <a href="rule.jsp" id="line"
                        >세부규정&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a
                      >
                    </li>
                  </ul>
                </li>
                <li>
                  <a href="getRBoardList.do?id=${member.id }" class="maintitle">만남후기</a>
                  <ul class="site_nav" id="line1">
                    <li>
                      <a href="#" id="line"
                        >포토후기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a
                      >
                    </li>
                    <li>
                      <a href="#" id="line"
                        >생생리뷰&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a
                      >
                    </li>
                  </ul>
                </li>

                <li>
                  <a href="joinTest.jsp" class="maintitle">연애테스트</a>
                  <ul class="site_nav" id="line1">
                    <li>
                      <a href="joinTest.jsp" id="line"
                        >가입테스트&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a
                      >
                    </li>
                    <li>
                      <a href="#" id="line"
                        >심리테스트&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a
                      >
                    </li>
                  </ul>
                </li>

                <li>
                    <a href="CustomerService.do" class="maintitle" id="maintitle0">고객센터</a>
                </li>
                <li>
                  <a href="getMemberList.do?id=${member.id }" class="maintitle" id="maintitle0">신청하기</a>
                </li>
                <li>
                  <a href="event.jsp" class="maintitle" id="event">이벤트</a>
                </li>
              </ul>
            </div>
          </nav>
        </div>
        <div class="mmm">
          <div class="menuslide">
            <div class="menuul">
              <ul>
                <li>
                  <a><img src="resources/img/slide01.png" id="slideimg" /></a>
                </li>
                <li>
                  <a><img src="resources/img/slide02.png" id="slideimg" /></a>
                </li>
                <li>
                  <a><img src="resources/img/slide03.png" id="slideimg" /></a>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <!-- 2 -->
        <div class="qwert">
          <img src="resources/img/소개팅이미지.png" id="aaaa" />
        </div>
        <!-- 3 -->
        <div class="qwerty">
          <span>생생후기</span>
          <span class="plus"><a href="getRBoardList.do?id=${member.id }">더보기></a></span>
          <div class="review">
          
          
          
          <table>
			<colgroup>
				<col width="20%">
				<col width="60%">
				<col width="20%">
			</colgroup>
			<thead>
			<tr>
				<th>NO</th>
				<th>제목</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
		
		<c:forEach var="rboard" items="${rboardList }">
			<tr>
				<td>${rboard.rNo }</td>
				<td><a href="getRBoard.do?rNo=${rboard.rNo }&id=${member.id}">${rboard.rTitle }</a></td>
				<td>${rboard.count }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
          
          
          
        
		</div>
        </div>
        <!-- 4 -->
        <div class="total">
          <div id="one">
            <span>자주하시는 질문</span><span id="plus"><a href="CustomerService.do">더보기></a></span>
            <div id="plus1">
						<ul class="customerlist">
							<li><a href="CustomerService.do"><span>매칭은 어떻게 이루어지나요?﻿</span></a></li><br><hr>
							
							<li><a href="CustomerService.do"><span>매칭결과는 언제 알 수 있나요?</span></a></li><br><hr>
							
							<li><a href="CustomerService.do"><span>직업인증은 어떻게 하나요?</span></a></li><br><hr>
							
							<li><a href="CustomerService.do"><span>﻿재가입 할 수 있나요?</span></a></li><br><hr>
							
							<li><a href="CustomerService.do"><span>신청 전 인증이 완료되어야 하나요?</span></a></li>
						</ul>

					</div>
          </div>
          <div id="one">
            <span>문의사항</span><span id="plus"><a href="customerQnaList.do">더보기></a></span>
            <div id="plus1">
            <ul class="customerlist">
		<li>
		<a href="customerQnaList.do"><img src="pictures/padlock.png" style="max-width: 30px; max-height: 20px; position: absolute;">&nbsp;&nbsp;&nbsp;매칭관련 문의
		</a></li><br><hr>
		<li>
		<a href="customerQnaList.do"><img src="pictures/padlock.png" style="max-width: 30px; max-height: 20px; position: absolute;">&nbsp;&nbsp;&nbsp;결제/환불/이벤트 문의
		</a></li><br><hr>
		<li>
		<a href="customerQnaList.do"><img src="pictures/padlock.png" style="max-width: 30px; max-height: 20px; position: absolute;">&nbsp;&nbsp;&nbsp;이용방법 문의
		</a></li><br><hr>
		<li>
		<a href="customerQnaList.do"><img src="pictures/padlock.png" style="max-width: 30px; max-height: 20px; position: absolute;">&nbsp;&nbsp;&nbsp;만남관련 문의
		</a></li><br><hr>
		<li>
		<a href="customerQnaList.do"><img src="pictures/padlock.png" style="max-width: 30px; max-height: 20px; position: absolute;">&nbsp;&nbsp;&nbsp;신청관련 문의
		</a></li>
	    </ul>
            </div>
          </div>
          
          
          <div id="one">
            <span>공지사항</span><span id="plus"><a href="customerNotice.do">더보기></a></span>
            <div id="plus1">
        <ul class="customerlist">
		<li>
		<a href="customerNotice.do"> 환불률 상향 안내</a></li><br><hr>
		<li>
		<a href="customerNotice.do"> 환불규정 및 매칭결과 확인 가능일의 변경 안내</a></li><br><hr>
		<li>
		<a href="customerNotice.do"> 공지 프로필 확인가능 항목의 추가 안내</a></li><br><hr>
		<li>
		<a href="customerNotice.do"> 개별만남 방식 추가 안내</a></li><br><hr>
		<li>
		<a href="customerNotice.do"> 만나이 적용에 따른 안내</a></li>
	    </ul>
            
            </div>
          </div>
          
        </div>
        
        <!-- 5 -->
      </div>

      <!-- wrap div -->
    </div>

    <!-- footer -------------------------------------------- -->

    <footer>
      <div class="footerinfo">
        <div class="footer_head">
          <div class="body_wrap">
            <p>
              <img
                src="resources/img/로고.png"
                alt="직장인소개팅 로고"
                id="titleimg1"
              />
            </p>
            <ul class="ft_menu">
              <li><a href="#">이용약관&nbsp;&nbsp;</a></li>
              <li><a href="#">개인정보처리방침&nbsp;&nbsp;</a></li>
              <li><a href="#">회사소개&nbsp;&nbsp;</a></li>
              <li><a href="#">이용안내&nbsp;&nbsp;</a></li>
            </ul>
          </div>
        </div>
        <div class="body_wrap ft_subinfos">
          <div>
            <div class="copybox">
              <p class="copy">
                서비스명: 아만나 회사명: AMANNA 대표: qwerty <br />사업자번호:
                123-123-123123
              </p>
              <p class="copy">주소: 서울특별시 강남구 강남대로</p>
              <p class="copy">개인정보관리책임자:qwert E-MAIL: 123@.co.kr</p>
              <br />
            </div>

            <ul class="ft_sns">
              <li>
                <img src="resources/img/blog.png" alt="블로그" id="sns" />
              </li>
              <li>
                <img src="resources/img/insta.png" alt="인스타그램" id="sns" />
              </li>
              <li>
                <img src="resources/img/ka.png" alt="채널톡" id="sns" />
              </li>
            </ul>
          </div>
          <div class="azx">
            <h4>고객행복센터</h4>
            <p class="telnumber">02-1234-1234</p>
            <p class="timetxt">평일 13시 ~ 17시 ( 채널톡 09:30 ~ 17:00 )</p>
          </div>
        </div>
      </div>
    </footer>
  </body>
  <script>


  function eventopen() {
		var cookiedata = document.cookie; 
		
		if (cookiedata.indexOf("popup=done") < 0) {
			 window.open("popEvent.jsp","이벤트","width=380, height=500, left=700, top=200 ");
		} 
		
		if (cookiedata.indexOf("popup2=done") < 0){
			window.open("popNotice.jsp","공지사항","width=350, height=500, left=200, top=200 ");
			
		} else {
			return;
			
		}
	}



</script>
</html>