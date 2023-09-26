<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String id = request.getParameter("id");
	session.setAttribute("id", id);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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


<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<style>
.modal-content {

    /* 바로 상위 태그인 body를 기준으로 맞춰주게끔 */
    /* position의 absolute라는것이, 설정하게 되면
    바로 직계부모 태그의 영향아래 놓이게 된다는 말이다.
    더불어서 네모를 영역으로 봤을때 왼쪽 상단 꼭지점을
    기준으로 움직이게 된다. */
    position: absolute;

    left: 50%;
    top: 65%;
    transform: translate(-50%, -50%);
    width: 1300px;
    height: 1300px;
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


.radio {
    align-items: center;
    font-size: 20pt;
    width: 15px;
    height: 15px;
}


.table-container {
    display: flex;
    justify-content: space-between;
  } 
  
  .left-table,
  .right-table {
    width: 45%;
    margin-bottom: 20px;
    position : absolute;
  } 
  
 #signup-btn2 {
  width: 400px;
    height: 50px;
    left: 725px;
    top: 875px;
    background-color: #FFFFFF;
    color: #FFBEC3;
    border-radius: 8px;
    border: #FFBEC3 solid 1px;
 
 
 }
 
 input[type="button"]:hover {
  cursor: pointer;
}
main {
	height: 1300px;
}

footer {
position : relative;
bottom : 0;

}

</style>
<body>
<%@include file="html/header.jspf" %>
<main>
	<div class="modal-content">
	
         <nav>
             <h2> 회원가입 상세정보</h2>
         </nav>
         <form action="register2.do" method="post"  enctype="multipart/form-data">
         <div class="table-container">
          <table class="left-table">
                 <table>
					<tr>
                 		<td>
                 			<input type="hidden" name="id" value="${id }" id="user_id">
                 		</td> 
                 	</tr>	
					<tr>
						<td>
                     		<input type="radio" class="radio" name="sex" value="남성" id="user_sex">남성
                     		<input type="radio" class="radio" name="sex" value="여성" id="user_sex">여성
                     		<br><br>
                     	</td>
                    <br><br></tr>
                    <tr>
						<td>
							<label><strong>나이을 입력해주세요</strong>&nbsp;&nbsp;&nbsp;<span></span>
						</td>
					</tr>
					<tr>
						<td>
							<input type="number" name="age" id="user_age" placeholder="age"><br><br>
						</td>
					</tr>
					</label>
					<tr>
						<td>
							<label><strong>신장을 입력해주세요</strong>&nbsp;&nbsp;&nbsp;<span></span>
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="height" id="user_height" oninput="showTextWithCm()" placeholder="cm"><br><br>
						</td>
					</tr>
					</label>
					<tr>
						<td>
							<label><strong>몸무게를 입력해주세요</strong>&nbsp;&nbsp;&nbsp;<span></span>
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="weight" id="user_weight" placeholder="kg">
						</td>
					</tr>
					<tr><td><button type="submit" value="회원가입" id="signup-btn2">회원가입</button></td></tr>
					</label>
					</table>
					<table class="right-table">
					<tr>
						<td>
							<label><strong>졸업학교를 입력해주세요</strong>&nbsp;&nbsp;&nbsp;<span></span>
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="edu" id="user_edu"><br><br>
						</td>
					</tr>
					</label>
					<tr>
						<td>
							<label><strong>직업을 입력해주세요</strong>&nbsp;&nbsp;&nbsp;<span></span>
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="job" id="user_job"><br><br>
						</td>
					</tr>
					</label>
                    	<tr>
						<td>
							<label><strong>핸드폰번호를 입력해주세요</strong>&nbsp;&nbsp;&nbsp;<span id="phonechk"></span>
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="phone" id="user_phone"><br><br>
						</td>
					</tr>
					</label>
					<tr>
						<td>
							<label><strong>흡연여부를 선택해주세요</strong>&nbsp;&nbsp;&nbsp;<span></span>
						</td>
					</tr>
					</label>
					<tr>
						<td>
                     		<input type="radio" name="smoke" class="radio" value="흡연" id="user_smoke">흡연
                     		<input type="radio" name="smoke" class="radio" value="비흡연" id="user_smoke">비흡연
                     		<br><br>
                     	</td>
                    	</tr>
                    	
					<tr>
						<td>
							<label><strong>취미를 입력해주세요</strong>&nbsp;&nbsp;&nbsp;<span></span>
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="hobby" id="user_hobby"><br><br>
						</td>
					</tr>
					</label>
					<tr>
						<td>
							<label><strong>하고싶은말을 입력해주세요</strong>&nbsp;&nbsp;&nbsp;<span></span>
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="content" id="user_content"><br><br>
						</td>
					</tr>
					</label>
					<tr>
						<td>
							<label><strong>이미지를 넣어주세요</strong>&nbsp;&nbsp;&nbsp;<span></span>
						</td>
					</tr>
					<tr>
						<td>
							<div id="user_upload_img"></div>
							<input id="user_img" type="file" name="imgFile" onchange="previewImage(this, 'user_upload_img');"><br><br>
						</td>
					</tr>
					<tr>
						<td>
							<input style="width: 40%; display: inline;" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly" >
   							<button type="button" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
   							<input style="top: 5px;" placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" />
   							<input placeholder="상세주소" name="address" id="addr3" type="text"  />
						</td>
					</tr>
					</label>
                </table>
                </table>
               </div>
         </form>
        </div>
        </main>
        <%@include file="html/footer.jspf" %>
</body>
<script>
	const phoneRule= /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/; //핸드폰번호 정규식
	
	let chk1 = false;
	$(function(){
		
		
		//핸드폰번호 정규식체크
		$('#user_phone').keyup(function() {
		       if($(this).val() === '' ) {//지금 발생하는 이곳이 빈 문자열이니?
		          $(this).css('background-color', 'pink');
		          $('#phonechk').html('<b style="font-size: 14px; color: red">[핸드폰번호는 필수입력값입니다.]</b>');
		          chk1 = false;
		       } else if(!phoneRule.test($(this).val())) {//정규표현식이 틀렸다면
		        $(this).css('background-color', 'pink');
		        $('#phonechk').html('<b style="font-size: 14px; color: red">[핸드폰번호형식으로 입력해주세요.]</b>');
		        chk1 = false;
		       } else{
		    	  $('#user_phone').css('background-color', 'aqua');
				  $('#phonechk').html('<b style="font-size: 14px; color: green">[핸드폰번호가 사용이 가능합니다.]</b>');
				  chk1 = true;
		       }
		    });
	});
	
	// input file 이미지 미리보기 함수
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
		if(chk1 == true){
			alert("회원가입 성공!");

		}else{
			Swal.fire({
	            icon: 'error',              
	            title: '필수정보를 입력해주세요!',  
	        });
			return false;
		}
	}

</script>
</html>
