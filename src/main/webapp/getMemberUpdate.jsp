<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<title>회원 상세보기</title>
<link rel="icon" href="/img/logoimg2.png">
<link rel="shortcut icon" href="/img/logoimg2.png" type="image/x-icon">
<link rel="canonical" href="https://jikso.co.kr">
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">

<link rel="stylesheet" href="css/styles.css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<style>
@font-face {
  font-family: "GowunBatang-Regular";
  src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunBatang-Regular.woff")
    format("woff");
  font-weight: normal;
  font-style: normal;
}	
body {
  font-family: "GowunBatang-Regular";
}   
    
#container {
width: 1000px;
margin: 0 auto;
margin-bottom: 100px;
margin-top: 100px;
}
h1 {
width: 1000px;
margin: 0 auto;
text-shadow: 2px 2px 2px #ff93a2;
}

table {
width:1000px;
text-align: center;
margin: 0 auto;
font-family: "GowunBatang-Regular";
border: 10px solid #ffe3ee;
border-radius: 10px;
background-image: url("resources/img/pink_heart4.jpeg");
font-weight: bold;
}



input {
	width:200px;
	height:30px;
	border: 3px solid #ffe3ee;
	border-radius: 5px;
	font-family: "GowunBatang-Regular";
	font-weight: 600;
}

#span {
	display: inline-block;
	width: 80px;
	height: 30px;
}


textarea {
	width: 200px;
	height:100px;
	font-family: "GowunBatang-Regular";
	border: 3px solid #ffe3ee;
	border-radius: 5px;
	text-align: left;
	font-weight: 600;
}

input[type="button"] {
	background-color: #ffe3ee;
	border-radius: 10px;
	cursor: pointer;
	border: none;
	margin-top: 10px;
}

input[type="button"]:hover {
	background-color: #ff93ae;
	color: white;
}
</style>

</head>
<script>
	let loginId = "${member.id }"
	if (loginId == "") {
		alert("로그인 후 이용 바랍니다.");
		location.href="login.jsp";
	} else {
		//const pwd = "${member.pwd}";
		//console.log("pwd : " + pwd);		
	}

</script>
</head>
<body>
<%@include file="html/header.jspf" %>	
	<div id="container">
		<h1>PROFILE</h1>
		
			<form action="update.do" method="post" enctype="multipart/form-data" onsubmit="return test()">
				<table>
				<tr>
					<td>
						<span id="span">인물사진 :</span><img alt="이미지" src="resources/images/${member.imgName }">
					</td>
				</tr>
				<tr>
					<td><span id="span">이름 :</span><input type="text" name="name" value="${member.name }">
							 <input type="hidden" name="id" value="${member.id }">
					</td>
				</tr>
				<tr>
					<td><span id="span">비밀번호 :</span><input type="text" name="pwd" value="${member.pwd }"></td>
				</tr>
				<tr>
					<td>
                   		<span id="span">성별 :</span><input type="text" name="sex" value="${member.sex }" >
	                </td>
	            </tr>
				<tr>
					<td><span id="span">나이 :</span><input type="number" name="age" value="${member.age }"></td>
				</tr>
				
				<tr>
					<td><span id="span">키 :</span><input type="text" name="height" value="${member.height }"></td>
				</tr>
				
				<tr>
					<td><span id="span">몸무게 :</span><input type="text" name="weight" value="${member.weight }"></td>
				</tr>
				
				<tr>
					<td><span id="span">최종학력 :</span><input type="text" name="edu" value="${member.edu }"></td>
				</tr>
				
				<tr>
					<td><span id="span">직업 :</span><input type="text" name="job" value="${member.job }"></td>
				</tr>
				<tr>
					<td><span id="span">흡연유무 :</span><input type="text" name="smoke" value="${member.smoke }"></td>
				</tr>
				<tr>
					<td><span id="span">핸드폰 :</span><input type="text" name="phone" value="${member.phone }"></td>
				</tr>
				<tr>
					<td><span id="span">이메일 :</span><input type="text" name=email value="${member.email }"></td>
				</tr>
				<tr>
					<td><span id="span">취미 :</span><input type="text" name=hobby value="${member.hobby }"></td>
				</tr>
				<tr>
					<td>
						<span id="span">주소지 :</span><input style="width: 40%; display: inline;" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly" >
  						<button type="button" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
					</td>
				</tr>
				<tr>
					<td>
  						<span id="span">상세주소 :</span><input style="top: 5px;" placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" />
  						<input placeholder="상세주소" name="address" id="addr3" type="text" value="${member.address }" />
					</td>
				</tr>
				<tr>
					<td>
						<span id="span">미리보기 </span><div id="user_upload_img"></div>
						<input id="user_img" type="file" name="imgFile" onchange="previewImage(this, 'user_upload_img');" >
					</td>
				</tr>
				<tr>
					<td>
						<span id="span">하고싶은말 </span><textarea name="content" rows="" cols="30" >${member.content }</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="10" class="center">
					<input type="submit" value="수정하기">
					</td>
				</tr>
			</table>
			</form>
	</div>
	<footer><%@include file="html/footer.jspf" %></footer>
</body>
<script>
//input file 이미지 미리보기 함수
function previewImage(targetObj, previewId) {
 
    var ext = $(targetObj).val().split('.').pop().toLowerCase();
 
    if ($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
        alert('gif, png, jpg, jpeg 파일만 업로드 할수 있습니다.');
        return;
    }
 
    var preview = document.getElementById(previewId); // 미리보기 div id   
    var ua = window.navigator.userAgent;
 
    if (ua.indexOf("MSIE") > -1) { //ie일때
 
        targetObj.select();
 
        try {
            var src = document.selection.createRange().text; // get file full path 
            var ie_preview_error = document
                    .getElementById("ie_preview_error_" + previewId);
 
            if (ie_preview_error) {
                preview.removeChild(ie_preview_error); //error가 있으면 delete
            }
 
            var img = document.getElementById(previewId); //이미지가 뿌려질 곳 
 
            img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"
                    + src + "', sizingMethod='scale')"; //이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
        } catch (e) {
            if (!document.getElementById("ie_preview_error_" + previewId)) {
                var info = document.createElement("<p>");
                info.id = "ie_preview_error_" + previewId;
                info.innerHTML = "a";
                preview.insertBefore(info, null);
            }
        }
    } else { //ie가 아닐때
        var files = targetObj.files;
        for ( var i = 0; i < files.length; i++) {
 
            var file = files[i];
 
            var imageType = /image.*/; //이미지 파일일 경우만 뿌려줌.
            if (!file.type.match(imageType))
                continue;
 
            var prevImg = document.getElementById("prev_" + previewId); // 이전에 미리보기가 있다면 삭제
            if (prevImg) {
                preview.removeChild(prevImg);
            }
 
            var img = document.createElement("img"); // 크롬은 div에 이미지가 뿌려지지 않기때문에 자식 Element를 만듬.
            img.id = "prev_" + previewId;
            img.classList.add("obj");
            img.file = file;
            
            preview.appendChild(img);
 
            if (window.FileReader) { // FireFox, Chrome, Opera 확인.
                var reader = new FileReader();
                reader.onloadend = (function(aImg) {
                    return function(e) {
                        aImg.src = e.target.result;
                    };
                })(img);
                reader.readAsDataURL(file);
            } else { // safari is not supported FileReader
                //alert('not supported FileReader');
                if (!document.getElementById("sfr_preview_error_"+ previewId)) {
                    var info = document.createElement("p");
                    info.id = "sfr_preview_error_" + previewId;
                    info.innerHTML = "not supported FileReader";
                    preview.insertBefore(info, null);
                }
            }
        }
    }
}
//주소api
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
       		// 우편번호와 주소 정보를 해당 필드에 넣는다.
           $("[name=addr1]").val(data.zonecode);
           $("[name=addr2]").val(fullRoadAddr);
       }
    }).open();
}
function test() {
	alert("회원정보수정 성공!");
}
</script>
</html>