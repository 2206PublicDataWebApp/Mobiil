<p align="center"><img src="https://user-images.githubusercontent.com/110793386/199872240-a703eb91-b9ef-45d4-958e-7250dd120969.jpg" width = '150px'></p>

 
#  Mobiil  

###### _KH정보교육원 빌려조 Fianl Project_            
[고종규](https://github.com/JongGyuGo), [김다현], [정슬기](https://github.com/seulki1211), [최혜진]


## Purpose 
- 모빌은 모이고(MO) 빌리다(BIL)의 합성어입니다
    > 현재 서비스되는 웹 혹은 앱은 모임 형성이나 공간 대여에 충실하고 있습니다. 하지만 바쁜 현대인으로 살아가면서 매번 꾸준히 모임 활동을 유지하거나 매번 새로운 공간을 찾는 것은 쉽지 않은 일입니다. 
    > Mobiil은 '음악'이라는 취미 생활을 통해 내가 원하는 사람과, 내가 원하는 장소에서 만날 수 있도록 '사람'과 '사람', '사람'과 '공간'을 연결하는 서비스를 제공하고자 합니다.
- 회원 관계도
<p align="center"><img src="https://user-images.githubusercontent.com/110793386/200467714-f2250002-576a-472a-82c9-fb66631c3a23.png" width = '500px'></p>



## Features
* AJAX **실시간** 채팅
* **Chart.js** 관리자페이지 차트
* **SummerNote** 적용 게시판
* **mailsender** 메일 발송 및 임시 비밀번호 발급
* **카카오 MAP** API를 통한 지도
* **I'mport** API 결제시스템
* **CoolSMS** 결제 완료 문자 전송
* **달력 API** 예약일정 달력 적용
* 결제가 완료된 금액 정산 조회
* **소셜 로그인** API를 사용한 소셜 로그인


## Role 
##### 이름을 클릭해 보세요!


<details>
<summary>고종규</summary>
<div markdown="1">

 > 공간
 >  > 작성중
 
 > 예약
 >  > 작성 중
</div>
</details>
 
<details>
<summary>김다현</summary>
<div markdown="1">

> 공간
 >  > 작성중
 
 > 결제
 >  > 작성 중
</div>
</details>
 

<details>
<summary>정슬기</summary>
<div markdown="1">

 <details>
 <summary>  파트너</summary>
 <div markdown="1">
 
![final_partner_CRUD](https://user-images.githubusercontent.com/110793386/200469526-f8145459-5fe4-4672-a30d-f804710d8670.jpg)

    -  파트너 정보 CRUD 및 검색

https://user-images.githubusercontent.com/110793386/200464088-79b42844-ee91-4a7e-b1b2-ea8f48ba9078.mp4

<p align="center"><img src="https://user-images.githubusercontent.com/110793386/200465375-c937d8d3-b62f-4d55-9173-826f12947141.png" width = '500px'></p>


    -  파트너 승인 및 메일 발송
  
  
```java
if(!member.getMemberNick().equals(originNick)) {

  // 파트너 기존 정보 삭제
  Partner originPartner = pService.findByEmail(member.getMemberEmail());
  if(originPartner != null) {
   pService.deletePartner(originPartner.getPartnerNo());
  }
  
  // 기존 채팅방 삭제
  List<ChatRoom> cList = cService.listByMemberNick(originNick);
  for(int i = 0; i < cList.size(); i++) {
   cService.disableRoom(cList.get(i).getRoomNo());
  }
}
```
  
    - 파트너 닉네임 변경 시 기존 파트너 정보 및 채팅방 삭제
    
 </div>
 </details>

 <details>
 <summary>  Ajax 실시간 채팅</summary>
 <div markdown="1">

 
https://user-images.githubusercontent.com/110793386/199904349-0630f938-587c-4822-8f89-b0d8873f83a3.mp4

    -  기존 채팅로그 열람
    -  안읽은 메세지 카운트
    -  공간 검색 및 공유


```JS
function openChatRoom(createUser, withUser) {
	if(confirm("채팅을 시작하시겠습니까?")){
		$.ajax({
			url:"/chat/createChatRoom.kh",
			tyep: "get",
			data: {createUser: createUser,
					withUser:withUser},
			success:
				function(data) {
					if(data == "already"){
						alert("이미 생성된 채팅방입니다");
						window.open('/chat/chatWindow.kh?memberNick='+createUser+'', 'window', 'width=500, height=700, menubar=no, status=no, toolbar=no');
					}else if(data == "success"){
						alert("채팅이 시작됩니다.");
						window.open('/chat/chatWindow.kh?memberNick='+createUser+'', 'window', 'width=500, height=700, menubar=no, status=no, toolbar=no');
					}else if(data == "needRegist"){
						alert("파트너만 서비스 이용이 가능합니다");
					}else if(data == "needApproval"){
						alert("파트너 승인이 필요합니다")
					}else{
						alert("채팅방 생성 실패")
					}
				},
			error:
				function() {
					alert("에러")
				},
		})
	}
 ```


    -  채팅방 중복 생성 방지, 회원별 채팅 권한 제한
    
    

 
 

https://user-images.githubusercontent.com/110793386/199905369-77bbc08e-ec8f-443b-a3d0-532ca2370de7.mp4


![image](https://user-images.githubusercontent.com/110793386/200094181-a0430105-2471-4705-8189-32d85f02525b.png)

    -  오라클 JOB 객체 및 스케줄러를 이용한 채팅방 영구 삭제 
    
https://user-images.githubusercontent.com/110793386/199907210-96a1bf11-2761-4e2d-b58b-a249f2c7ade6.mp4

    -  상대방 프로필 사진 노출 마우스오버 이벤트
 

 </div>
 </details>

 <details>
 <summary>  기타 </summary>
 <div markdown="1">
 
 
 https://user-images.githubusercontent.com/110793386/199899456-bd299880-ffa7-4abf-8e04-64819cc76e0b.mp4

     - 회원 및 공간 정보 현황 대시보드
     - chart.js 및 카카오 map API 사용
     - 5분에 한 번 갱신해 실시간 현황 반영

![image](https://user-images.githubusercontent.com/110793386/200469816-f79a2d57-4914-443a-a342-94d3ce4c6daf.png)

     - 배너 CRUD 
     - 배너 수정 시 배너 이미지와 내용을 분리하여 수정

 </div>
 </details>

</div>
</details>
 
 

    
<details>
<summary>최혜진</summary>
<div markdown="1">

 > 회원가입 및 로그인
 >  > 작성중
 
 > 마이페이지 및 리뷰
 >  > 작성 중

</div>
</details>

## Tech
- Java(jdk 1.8)
- HTML5
- CSS3
- javascript
- jQuery
- Spring Framework
- Oracle DB

