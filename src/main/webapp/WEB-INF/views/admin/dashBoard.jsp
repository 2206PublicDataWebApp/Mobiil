<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<style type="text/css">

#memberAmount{
float: left;}
#partnerAmount{
float: left;}

</style>

</head>
<body>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e8e046b2f013965924b2b6bf64a16385&libraries=services"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<jsp:include page="../../views/common/admin-top.jsp"></jsp:include>

<div class="page-wrapper">
	<div class="container">
		<div class="row">
		<jsp:include page="../../views/common/admin-left-sidebar.jsp"></jsp:include>
			<div class="col-md-10">
				<canvas id="memberAmount" width='300vw' height='300vh'></canvas>
				<canvas id="partnerAmount" width='300vw'  height='300vh' ></canvas>
				<canvas id="areaAmount" width='300vw'  height='300vh' ></canvas>
				<h2> 공간 전체 지도 </h2>
				<div id="map" style="width:100%; height:400px;"></div>
				<br>		<br>		<br>		<br>
				<canvas id="weeklyChart"  height= '20vh' width= '50vw'></canvas>
			</div>
		</div>
	</div>
</div>	




<script type="text/javascript">
var geocoder = new kakao.maps.services.Geocoder(); // 지오코더 서비스 

// 지도 기본
var container = document.getElementById('map'); //지도를 담을 영역의 DOM 
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(37.566381 , 126.977717), //지도의 중심좌표.
	level: 9 //지도의 레벨(확대, 축소 정도)
};
var map = new kakao.maps.Map(container, options); //컨테이너에 옵션을 담은 맵 생성


// 인포윈도우(주소 + 상호 표기 + 해당상세페이지 연결)
// 우리 공간 지도 그리기
function printAllSpace() {
	$.ajax({
		url:"/admin/dashboard/spaceMap.kh",
		type:"get",
		success: function(data) { // data는 공간리스트
			for(i = 0; i < data.length; i++){ // 리스트 돌면서 콜백으로 위지지정, 생성, 마커꽂음
				let infoContents = "";
				var markerPosition = "";
				var marker = "";
				var approval = data[i].approval;
				
				if(approval == 'Y'){
					infoContents = '<div style="padding:5px; text-align:center;"><a href="/space/spaceDetail.kh?spaceNo='+data[i].spaceNo+'" style="color:blue;text-align:center" target="_blank">'+data[i].spaceName+'</a></div>'
				}else if(approval == 'N'){
					infoContents = '<div style="padding:5px;"><span style="color: red;">'+data[i].spaceName+'</span></div>'
				}
				
				geocoder.addressSearch(data[i].address2, function(result, status) { // data는 공간리스트
				    if (status === kakao.maps.services.Status.OK) {
				    	markerPosition = new kakao.maps.LatLng(result[0].y,result[0].x); // 마커 위치 지정
				     	marker = new kakao.maps.Marker({ 
					     	map : map,
					     	position: markerPosition // 마커 생성
				     	});
					}; 
					var infowindow = new kakao.maps.InfoWindow({
				     		map : map,
					     	position: markerPosition,
			    		});
				     		infowindow.open(map, marker); // 인포윈도 꽂기
							infowindow.setContent(infoContents);
					})   
				}
			},
		error: function() {
			console.log("에러")
		}
	})
	
}


	// 레전드(범례) 영역 컨피그
	var labelsConfig = {
    	boxWidth: 20,
        fontColor: 'rgb(0, 0, 0)'
    }

	const mChart = document.getElementById('memberAmount').getContext('2d');
	const pChart = document.getElementById('partnerAmount').getContext('2d');
	const weeklyChart = document.getElementById('weeklyChart').getContext('2d');
	const aChart = document.getElementById('areaAmount').getContext('2d');
	
	printAllSpace();
	drawMemberAmount();
	drawPartnerAmount();
	drawWeeklyChart();
	drawAreaChart();
	
	setTimeout('location.reload()',1000*5*60)

	
	//공간 지역분포(파이)
	function drawAreaChart() {
		$.ajax({
			url: "/admin/dashboard/area.kh",
			type:"get",
			success: function(area) {
				const areaChart = new Chart(aChart, {
					type: 'pie',
					data:{
						labels:['강동', '강서', '강남' , '강북'],
						datasets:[{
							label: '회원 수',
							data:[area.east, area.west, area.south, area.north], // 동서남북
							backgroundColor:[
								'#ffd950',  // 강동
								 'rgb(255, 159, 64)', //  서
								 'rgb(75, 192, 192)', //  남
								 'rgb(153, 102, 255)'//북
							],
							borderColor:[
								  'white'
							],
							borderWidth:1
						}]
					},
					options:{
						  responsive: false,
					      maintainAspectRatio: true, //true 하게 되면 캔버스 width,height에 따라 리사이징된다.
					      title: {
					            text: '공간 지역 현황',
					    	 	display: true,
					    		fontColor: 'black',
					    		fontSize: 20,
					            align: 'center',
					            display: true,
					            fullWidth: true
					      },
					      legend: {
					            position: 'top',
					            fontColor: 'black',
					            align: 'right',
					            display: true,
					            fullWidth: true,
					            labels: labelsConfig
					      }
					}
				}) 
			},
			error: function() {
				console.log("처리 실패");
			}
		})
	}
	
	// 하루에 생긴 챗룸수 + 신규 가입자 수 비교(line)
	function drawWeeklyChart() {
		$.ajax({
			url: "/admin/dashboard/weekly.kh",
			type:"get",
			success: function(data) {
				console.log(data)
				const dailyNewChatRoomChart = new Chart(weeklyChart, {
					type: 'line',
					data:{
						labels:['6일전','5일전','4일전', '3일전', '2일전', '1일전', '오늘'], // day-6부터 today까지
						datasets:[
						{
							label: '신규 채팅룸',
							fill: false,
							data:[
								data[0].before6, // 6일전
								data[0].before5,
								data[0].before4,
								data[0].before3,
								data[0].before2,
								data[0].before1,
								data[0].before0 // 오늘
								], 
								
							borderColor: '#ffd950',
							backgroundColor: '#ffd950',
							pointStyle: 'circle',
						    pointRadius: 5,
						    pointHoverRadius: 10,
							borderWidth:1
						},
						{
							label: '신규 일반 가입',
							 fill: false,
							data:[data[1].before6, // 6일전
								data[1].before5,
								data[1].before4,
								data[1].before3,
								data[1].before2,
								data[1].before1,
								data[1].before0  // 오늘
								],
								
							borderColor: 'rgb(255, 99, 132)',
							backgroundColor: 'rgb(255, 99, 132)',
							pointStyle: 'circle',
						    pointRadius: 5,
						    pointHoverRadius: 10,
							borderWidth:1
						},
						{
							label: '신규 호스트 가입',
							 fill: false,
							data:[data[2].before6, // 6일전
								data[2].before5,
								data[2].before4,
								data[2].before3,
								data[2].before2,
								data[2].before1,
								data[2].before0 // 오늘
								], 
								
							borderColor:  'rgb(75, 192, 192)',
							backgroundColor:  'rgb(75, 192, 192)',
							pointStyle: 'circle',
						    pointRadius: 5,
						    pointHoverRadius: 10,
							borderWidth:1
						}
						
						]
					},
					options:{
						  responsive: true,
					      maintainAspectRatio: true, //true 하게 되면 캔버스 width,height에 따라 리사이징된다.
					      title: {
					    	text: '주간 차트',
					    	display: true,
							fontColor: 'black',
							fontSize: 20,
					        align: 'center',
					        display: true,
					        fullWidth: true
					 
					        },
					      legend: {
				            position: 'top',
				            fontColor: 'black',
				            align: 'center',
				            display: true,
				            fullWidth: true,
				            labels: labelsConfig
					      },
					      scales: {
								yAxes: [{
									ticks: {
										min: 0,
									}
								}]
							}
					}
				}) 
			},
			error: function() {
				console.log("처리 실패");
			}
		})
		
	}
	
	
	// 개인회원+기업회원 / 총멤버수 파이차트 그리기
	function drawMemberAmount() {
		$.ajax({
			url: "/admin/dashboard/member.kh",
			type:"get",
			success: function(data) {
				const memberChart = new Chart(mChart, {
					type: 'pie',
					data:{
						labels:['개인 회원', '호스트 회원'],
						datasets:[{
							label: '회원 수',
							data:[data.individual, data.company], // 파트너, 비파트너 순으로 기재
							backgroundColor:[
								'#ffd950',  // 개인 회원 
								'#02bc77'  //  호스트 회원
							],
							borderColor:[
								  'white'
							],
							borderWidth:1
						}]
					},
					options:{
						  responsive: false,
					      maintainAspectRatio: true, //true 하게 되면 캔버스 width,height에 따라 리사이징된다.
					      title: {
								 display: true,
								 text: '회원 현황',
									 fontColor: 'black',
									 fontSize: 20,
							         align: 'center',
							         display: true,
							         fullWidth: true
							},
					      legend: {
				            position: 'top',
				            fontColor: 'black',
				            align: 'right',
				            display: true,
				            fullWidth: true,
				            labels:labelsConfig
					      }
					}
				}) 
			},
			error: function() {
				console.log("처리 실패");
			}
		})
		
	}
		
		// 파트너 파이차트 그리기
	function drawPartnerAmount() {
		$.ajax({
			url: "/admin/dashboard/partner.kh",
			type:"get",
			success: function(partner) {
				const partnerChart = new Chart(pChart, {
					type: 'pie',
					data:{
						labels:['승인', '미승인', '미등록 ' ],
						datasets:[{
							label: '회원 수',
							data:[partner.approved, partner.notApproved, partner.notPartner], // 개인회원, 기업회원 순으로 기재
							backgroundColor:[
								'#ffd950',  // 파트너 승인 회원
								'#02bc77',  //  파트너 미승인 회원
								'#28c3d7'  //  파트너 미등록 회원
							],
							borderColor:[
								  'white'
							],
							borderWidth:1
						}]
					},
					options:{
						  responsive: false,
					      maintainAspectRatio: true, //true 하게 되면 캔버스 width,height에 따라 리사이징된다.
					      title: {
								 display: true,
								 text: '파트너 등록 현황',
									 fontColor: 'black',
									 fontSize: 20,
							         align: 'center',
							         display: true,
							         fullWidth: true
							},
					      legend: {
				            position: 'top',
				            fontColor: 'black',
				            align: 'right',
				            display: true,
				            fullWidth: true,
				            labels: labelsConfig
					      }
					}
				}) 
			},
			error: function() {
				console.log("처리 실패");
			}
		})
	}
	
</script>
</body>
</html>