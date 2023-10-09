# :pushpin: AMANNA
> 유저 상호 매칭/채팅 웹
  

</br>

## 1. 제작 기간 & 참여 인원
  - 2023년 5월 18일 ~ 6월 20일
  - 팀 프로젝트 (6명)

</br>

## 2. 사용 기술
#### `Back-end`
  - Apache Tomcat 9.0.73
  - Java 1.8.0_361
  - MyBatis 3.4.6
  - Oracle Database 11g Express Edition Release 11.2.0.2.0
 
#### `Front-end`
  - Jquery 3.6.4
  - CSS
  - HTML
  - JavaScript

#### `Tools`
- Spring-tool-suite-3.9.13
- SQLDeveloper-22.2.1.234.1810
- Apache Maven

</br>

## 3. ERD 설계
![ERD](https://github.com/Integerous/all-in-one/assets/139945914/871ba24e-20b4-4064-b2f3-2d35ed87c309)


## 4. 핵심 기능
AMANNA는 유저간 상호 매칭을 서비스합니다.
마음에 드는 유저 프로필을 확인하고 매칭신청이 수락되었을 경우 
별도의 구매권을 통하여 채팅기능을 이용할 수 있습니다.

제가 담당한 매칭 기능을 사용자의 관점에서 어떻게 동작하는지 알려드리겠습니다.

<details>
<summary><b>매칭 기능 설명 펼치기</b></summary>
<div markdown="1">

### 4.1. 가입된 유저 목록 ( 프로필 )
![일반 유저 목록](https://github.com/Integerous/all-in-one/assets/139945914/c8c69ceb-c2ff-42b4-960f-b0055edf195f)
- **유저목록 확인**
- DB member 테이블에 저장된 유저목록 데이터 리스트를 Mybatis를 이용하여 모두 가져옵니다.
- table에 body 영역에서 c:forEach 방식으로 list를 표현합니다


### 4.2. 유저 프로필 확인
![유저 프로필 확인](https://github.com/Integerous/all-in-one/assets/139945914/d9c60193-501a-4d9f-bd8d-1f5fadfd751e)
- 특정 유저의 프로필을 확인하고 로그인 상태에서 매칭을 신청할 수 있습니다.
- '신청하기' 클릭시, 저장된 user.id 값이 <a>태그 내의 getMember.do를 실행합니다.
      
- 저장된 id값은 MemberVO 타입의 vo에 담기고 DAO를 통해 해당 id를 가진 유저의 모든 데이터를 가져옵니다

- 유저 회원가입 시 사진등록이 안 되었을 경우 '등록된 사진이 없습니다' 표시

-**코드 확인**
      ```
  	<tr>
	<td><img alt="등록한 사진이 없습니다" src="pictures/${user.imgName }"
	id="profilePic"></td>
 	</tr> ```

### 4.3 나의 매칭목록 ( 발신 / 수신 )
- ![나의 매칭목록](https://github.com/Integerous/all-in-one/assets/139945914/5ff31e1b-73e2-4160-a00f-be674c8854d9)
  - 화면 상단에 내가 받은 매칭, 하단에 보낸 매칭을 띄웁니다.
    
  - 수신된 매칭목록에서 특정 유저 프로필 확인
  - -**코드 확인**
     ```
    <td><a href="getCaller.do?seq=${match.seq }&id=${member.id}&matchId=${match.id}">프로필 확인</a>
    </td> ```
  - getCaller.do 로 실행된 컨트롤러를 통해서 이전에 받은 match.seq, member.id, match.id 값을 근거로 DAO를 거쳐 화면에 표시됩니다.
    
-**코드 확인**
    ``` 
    @RequestMapping("/getCaller.do")
	public String getCaller(MatchVO vo, Model model, HttpSession session) {
	// 세션에서 "member" 속성 값을 가져옴
	    MemberVO member = (MemberVO) session.getAttribute("member");
	    System.out.println("로그인 정보 : " + member);                                
 	    MatchVO caller = matchService.getCaller(vo);
	    model.addAttribute("caller", caller); // Model 객체 사용 View에 데이터 전달
	    System.out.println("caller의 이미지네임 : " + caller.getImgName());
	    return "getCaller.jsp";
	}  ``` 

 
    
  -**발신자 확인***
    ![매칭 수락하기](https://github.com/Integerous/all-in-one/assets/139945914/a31447ae-5b75-4afc-8e8c-7b3824165d42)
    매칭 발신자의 프로필을 확인하고 수락/거절을 동작할 수 있습니다.

  - 수락 시 form에 담긴 input 타입 yesMatch.do가 실행되어 하단의 값을 근거로 DB 진행상태 컬럼에 '수락'으로 표시 됩니다.
  - **코드 확인**
   ``` 
    <input type="hidden" name="seq" id="matchSeq"> <input type="submit" value="수락하기" onclick="setMatchAction('yesMatch.do')">
  ```

      
-**요청 수락 동작**
- DB의 진행상태 컬럼이 '수락'으로 변경(UPDATE)됩니다.
   - **코드 확인**
     
  	```
        public void yesMatch(MatchVO vo) {
		System.out.println("===> MyBatis 사용 yesMatch(vo) 실행");
		System.out.println("===> 담긴값 : " + vo);
		mybatis.update("yesMatch", vo);
	} ```
 
-**요청 거절 동작**
- 수락과 같은 방식으로 컬럼에 '거절'로 표시됩니다.
- 특이사항으로 거절,취소 상태인 경우 script를 통해 채팅실행을 방지했습니다.

-**코드 확인**
 ```
 function chatTest(progress){
	if (progress === "거절") {
		alert("거절상태 입니다")
	} else if (progress === "수락") {
		alert("채팅을 시작합니다")
		window.open("chat.jsp","아만나 채팅","width=550, height=900");
	} else if (progress === "취소") {
		alert("신청취소 상태입니다")
	} else {
		alert("미응답 상태입니다")
	}
}
 ```



### 4.4. 수락 후 1대1 채팅
![보낸매칭 수락](https://github.com/Integerous/all-in-one/assets/139945914/e59383fd-20b4-4e22-a4fb-3a971aaa20ce)
- 이전에 스크립트 코드를 통해 유저가 1대1 채팅을 할 수 있습니다. 

## 6. 회고 / 느낀점
