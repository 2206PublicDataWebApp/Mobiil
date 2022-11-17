<p align="center"><img src="https://user-images.githubusercontent.com/110793386/199872240-a703eb91-b9ef-45d4-958e-7250dd120969.jpg" width = '150px'></p>

 
#  Mobiil  

###### _KH정보교육원 빌려조 Final Project_            
[고종규](https://github.com/JongGyuGo), [김다현](https://github.com/hhdk0), [정슬기](https://github.com/seulki1211), [최혜진](https://github.com/Choehyejin)

  > 문서: 2022.10.05. ~ 2022.10.14.
  
  > 개발: 2022.10.17. ~ 2022.11.14.

 


## Purpose 
- 모빌은 모이고(MO) 빌리다(BIL)의 합성어입니다
    > 현재 서비스되는 웹 혹은 앱은 모임 형성이나 공간 대여에 충실하고 있습니다. 하지만 바쁜 현대인으로 살아가면서 매번 꾸준히 모임 활동을 유지하거나 매번 새로운 공간을 찾는 것은 쉽지 않은 일입니다. 
    > Mobiil은 '음악'이라는 취미 생활을 통해 내가 원하는 사람과, 내가 원하는 장소에서 만날 수 있도록 '사람'과 '사람', '사람'과 '공간'을 연결하는 서비스를 제공하고자 합니다.
- 회원 관계도
<p align="center"><img src="https://user-images.githubusercontent.com/110793386/200467714-f2250002-576a-472a-82c9-fb66631c3a23.png" width = '500px'></p>



## Features
* AJAX **실시간** 채팅
* **Chart.js** 차트 구현
* **SummerNote** 게시판 적용
* **mailsender**  메일 발송 및 임시 비밀번호 발급
* **카카오 MAP** API 적용
* **I'mport** API 적용 및 결제
* **CoolSMS** 결제 완료 문자 전송
* **fullcalendar API** 적용 예약 및 일정 관리
* **카카오 소셜로그인** API 
* 결제가 완료된 금액 정산 조회

## Role 
##### 이름을 클릭해 보세요!


<details>
<summary>고종규</summary>
<div markdown="1">
<br>
<br>
   
* <b>예약 일정 확인</b>
   
https://user-images.githubusercontent.com/109054053/202122427-f0d51ef0-390e-4669-b3a3-29743d5748c8.mp4
	
	- 해당 호스트가 등록한 공간을 예약한 예약자 정보를 불러와서 예약한 일자에 보여준다.
	
<br>

* <b>기간별 판매 금액 확인</b>

https://user-images.githubusercontent.com/109054053/202375613-b0420b3d-9cba-4c70-82cc-297c046c30b2.mp4

	- 조회하고싶은 기간을 선택하게되면 예약 리스트를 보여주고, 그 기간내의 총 판매금액을 보여준다.
	
	<!-- 정산 확인 총 금액  -->
	  <select id="priceSumByHostemail" resultType="_int">
	  	SELECT SUM((REV_END-REV_START)*PRICE) AS PRICE
	  	FROM RESERVATION_TBL
	  	WHERE RESERV_DATE BETWEEN  #{date1} AND #{date2} AND HOST_EMAIL = #{hostEmail}
	  </select>
<br>
	
* <b>월별 데이터 현황</b>

https://user-images.githubusercontent.com/109054053/202375412-e5092ff5-d5db-45c4-811f-624238cb0f28.mp4

	- 해당 호스트의 월별 예약 현황, 월별 공간 갯수, 월별 판매 금액을 차트로 보여준다.
	
	/**
	 * 월별 예약 건수
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/host/drawspaceChart.kh", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public String drawspaceChart(HttpServletRequest request) {
		Gson gson = new Gson();
		
		HttpSession session = request.getSession();
		Host host = (Host) session.getAttribute("loginHost");
		String hostEmail = host.getHostEmail();
		
		List<Reservation> result = hService.getRegervationCountByMonth(hostEmail);
		JSONObject obj = new JSONObject();
		obj.put("result", result);
		JSONArray arr = new JSONArray();
		arr.add(obj);
		return gson.toJson(arr);
	}
	
	/**
	 * 월별 공간 등록수
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/host/spaceChart.kh", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public String drawspaceChart2(HttpServletRequest request) {
		Gson gson = new Gson();
		
		HttpSession session = request.getSession();
		Host host = (Host)session.getAttribute("loginHost");
		String hostEmail = host.getHostEmail();
		
		List<Space> result = hService.getSpaceCountByMonth(hostEmail);
		
		JSONObject obj = new JSONObject();
		obj.put("result", result);
		
		JSONArray arr = new JSONArray();
		arr.add(obj);
		
		return gson.toJson(arr);
	}
	
	/**
	 * 월별 판매금액
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/host/profitChart.kh", method = RequestMethod.GET, produces="application/json;charset=utf-8")
	public String drawProfitChart(HttpServletRequest request) {
		
		Gson gson = new Gson();
		
		HttpSession session = request.getSession();
		Host host = (Host)session.getAttribute("loginHost");
		String hostEmail = host.getHostEmail();
		
		List<Reservation> result = hService.getProfitByMonth(hostEmail);
		
		JSONObject obj = new JSONObject();
		obj.put("result", result);
		
		JSONArray arr = new JSONArray();
		arr.add(obj);
		
		return gson.toJson(arr);
	}
	
	 <!-- 월별 예약 건수  -->
  	 <select id="getRegervationCountByMonth" resultType="map">
 		SELECT TO_CHAR(A.RESERV_DATE, 'YYYY-MM') as RESERV_DATE, COUNT(B.RESERV_DATE) as RevCount
        FROM MONTH_TBL A
        LEFT OUTER JOIN RESERVATION_TBL B ON (TO_CHAR(A.RESERV_DATE,'YYYY-MM') = TO_CHAR( B.RESERV_DATE, 'YYYY-MM'))
        AND B.RESERV_STATUS = 'Y' AND B.HOST_EMAIL = #{hostEmail}
        GROUP BY TO_CHAR(A.RESERV_DATE, 'YYYY-MM')
        ORDER BY RESERV_DATE
  	 </select>
  	   	 
  	 <!-- 월별 공간수 -->
  	 <select id="getSpaceCountByMonth" resultType="map">
  	 	SELECT TO_CHAR(A.RESERV_DATE, 'YYYY-MM') AS RESERV_DATE, COUNT(B.SPACE_NO) as SpaCount
	    FROM MONTH_TBL A
	    LEFT OUTER JOIN SPACE_TBL B ON (TO_CHAR(A.RESERV_DATE,'YYYY-MM') = TO_CHAR(B.APPROVAL_DATE, 'YYYY-MM'))
	    AND B.SPACE_STATUS = 'Y' AND B.HOST_EMAIL = #{hostEmail}
        GROUP BY TO_CHAR(A.RESERV_DATE, 'YYYY-MM')
	    ORDER BY RESERV_DATE
  	 </select>
  	 
  	 <!-- 월별 판매금액 -->
  	 <select id="getProfitByMonth" resultType="map">
  	 	SELECT TO_CHAR(A.RESERV_DATE, 'YYYY-MM') AS RESERV_DATE, SUM(FLOOR(B.REV_END-B.REV_START)*B.PRICE) as PRICE
	    FROM MONTH_TBL A
        LEFT OUTER JOIN RESERVATION_TBL B ON (TO_CHAR(A.RESERV_DATE,'YYYY-MM') = TO_CHAR(B.RESERV_DATE, 'YYYY-MM'))
	    AND B.RESERV_STATUS = 'Y' AND B.HOST_EMAIL = #{hostEmail}
	    GROUP BY TO_CHAR(A.RESERV_DATE, 'YYYY-MM')
	    ORDER BY RESERV_DATE, 'YYYY-MM'
  	 </select>
<br>
	
* <b>기타 기능</b>
   
1. 호스트 정보 조회 및 정보 수정
2. 공간 CRUD
3. 예약 CRUD
<br>
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


https://user-images.githubusercontent.com/110793386/200994969-a9473587-26be-477d-afa4-0e71a4e97160.mp4
	 
![final_calendar_service](https://user-images.githubusercontent.com/110793386/200994979-a99d0a3b-71c6-46f3-9e2a-009e52de0aca.png)

     - 일정 달력 CRUD

	 
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
<div> 
  <img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white"> 
  <br>
  <img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> 
  <br>
  <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> 
  <br>
  <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> 
  <br>
  <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">
  <br>
  <img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white"> 
  <br>
  <img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white"> 
  <br>
  <img src="https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white"> 
  <br>
  <img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white">
  <br>
  <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">
  <br>
</div>
