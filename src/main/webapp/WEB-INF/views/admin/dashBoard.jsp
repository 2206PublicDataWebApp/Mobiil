<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<style type="text/css">

</style>

</head>
<body>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<jsp:include page="../../views/common/admin-top.jsp"></jsp:include>

<div class="page-wrapper">
	<div class="container">
		<div class="row">
		<jsp:include page="../../views/common/admin-left-sidebar.jsp"></jsp:include>
			<div class="col-md-10">
				<canvas id="memberAmount" ></canvas>
			</div>
			<div class="col-md-10">
				<canvas id="partnerAmount" ></canvas>
			</div>
			<div class="col-md-10">
				<canvas id="weeklyChart" height ='300px'></canvas>
			</div>
		</div>
	</div>
</div>	

<script type="text/javascript">

	const mChart = document.getElementById('memberAmount').getContext('2d');
	const pChart = document.getElementById('partnerAmount').getContext('2d');
	const weeklyChart = document.getElementById('weeklyChart').getContext('2d');

	drawMemberAmount();
	drawPartnerAmount();
	drawWeeklyChart();
	
	function refreshChart() {
 		drawMemberAmount();
 		drawPartnerAmount();
 		drawWeeklyChart();
 	}
	setInterval("refreshChart()", 300000); //5분에 한번 갱신
	
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
							data:[data[0].before6, // 6일전
								data[0].before5,
								data[0].before4,
								data[0].before3,
								data[0].before2,
								data[0].before1,
								data[0].before0], // 오늘
								
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
								data[1].before0], // 오늘
								
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
								data[2].before0], // 오늘
								
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
					      maintainAspectRatio: false, //true 하게 되면 캔버스 width,height에 따라 리사이징된다.
						  title: {
								 display: true,
								 text: '주간 차트',
									 fontColor: 'black',
									 fontSize: 20,
							         align: 'center',
							         display: true,
							         fullWidth: true
							},
					      legend: {
				            position: 'right',
				            fontColor: 'black',
				            align: 'center',
				            display: true,
				            fullWidth: true,
				            labels: {
				            fontColor: 'rgb(0, 0, 0)'
				            }
					      },
					      scales: {
								yAxes: [{
									ticks: {
										min: 0,
										stepSize : 1,
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
						  responsive: true,
					      maintainAspectRatio: false, //true 하게 되면 캔버스 width,height에 따라 리사이징된다.
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
				            align: 'center',
				            display: true,
				            fullWidth: true,
				            labels: {
				            fontColor: 'rgb(0, 0, 0)'
				            }
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
				console.log(partner);
				const partnerChart = new Chart(pChart, {
					type: 'pie',
					data:{
						labels:['파트너 승인 회원', '파트너 미승인 회원', '파트너 미등록 회원 ' ],
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
						  responsive: true,
					      maintainAspectRatio: false, //true 하게 되면 캔버스 width,height에 따라 리사이징된다.
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
				            align: 'center',
				            display: true,
				            fullWidth: true,
				            labels: {
				            fontColor: 'rgb(0, 0, 0)'
				            }
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