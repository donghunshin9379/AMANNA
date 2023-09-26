<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<link rel="stylesheet" href="css/styles.css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
  
<link rel="icon" href="/img/logoimg2.png">
<link rel="shortcut icon" href="/img/logoimg2.png" type="image/x-icon">
<link rel="canonical" href="https://jikso.co.kr">
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<style>

#check {

font-family: "GowunBatang-Regular";

}

h2 {
text-align: center;

}

footer {
position : absolute;
bottom : 0;

}


</style>
<body>
<div id="layer_popup">
<div id="check">
<h2>공지사항</h2>
<table>
     <tr>
        <th>개별만남 방식 추가 안내</th>
     </tr>
     <tr>
        <td>
                           아래와 같은 업데이트 사항이 있습니다. <br>■개별만남 방식 추가 → 사이트 일정으로 만남(매니저소개)이 어려우신 경우 및 지방 회원님들을 위하여 "개별만남" 방식을 추가하였습니다. 
                           자세한 사항은 문의하기의 별도 공지사항을 참고 부탁드립니다. 감사합니다.
        </td>
     </tr>  
     <tr>
        <th>남성 가입기준 강화안내</th>
     </tr>
     <tr>
        <td>
                            아래와 같은 업데이트 사항이 있습니다.<br> ■남성 가입기준 강화 → 성비 균형 및 매칭률 향상을 위하여 남성 가입 기준이 강화되었습니다. 
                            전문직,공무원,공기업,대기업,외국계기업 재직자 또는 아래의 조건을 만족 31~35세 : 연수입 4,000만원 이상 36~39세 : 연수입 4,500만원 이상 30세 이하 : 연수입 3,500만원 이상 40세 이상 : 연수입 5,000만원 이상 ※기존 회원은 가입 조건과 관계없이 이용 가능합니다. ※대학원생은 관계없이 가입 가능합니다. 감사합니다.
        </td>
     </tr>
     <tr>
        <th>공지 프로필 확인가능 항목의 추가 안내</th>
     </tr>
     <tr>
        <td>
                            아래와 같은 업데이트 사항이 있습니다.<br> ■가입시 프로필 및 매칭 후 상대 프로필 확인가능 항목의 추가 1)가입시 프로필 항목의 추가 : 고용형태, 혈액형, 재혼여부, 흡연여부 2)매칭 후 상대 프로필 확인 가능 항목의 추가 : 사진(상호 동의시에만), 종교, 혈액형, 고용형태, 재혼여부, 흡연여부 ※자세한 사항은 "회원가입" 페이지를 참고 부탁드립니다.
                             ※기존 회원의 경우 "회원정보수정"에서 변경된 부분의 추가 기재를 부탁드립니다. 감사합니다.
        </td>
     </tr>
</table>
<br><br>
	<input type="checkbox" value="checkbox" id="chkbox">
    <label for="chkbox">&nbsp;&nbsp;오늘 하루동안 보지 않기</label>
</div>

	<a href="javascript:closePop();">닫기</a>
</div>
<script>
function setCookie( name, value, exDay ) {
    var todayDate = new Date();
    todayDate.setDate( todayDate.getDate() + exDay ); 
    document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}

function closePop() {
    var cookiedata = document.cookie; // cookiedata 변수를 closePop 함수 내부에서 선언

    // 하루동안 보지 않기
    if (chkbox.checked) {
        setCookie("popup2", "done", 1); // 저장될 쿠키명, 쿠키 value값, 기간
        
    }
    window.close();
}


</script>
</body>

</html>