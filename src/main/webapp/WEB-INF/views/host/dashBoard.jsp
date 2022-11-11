<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대시보드</title>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
	.chart-container{
		width: 550px;
		height: 500px;
		board : 1px black;
		padding: 10px;
		border-radius:8px;
		float: left;
	}
</style>
<body>
<jsp:include page="../../views/common/menubar.jsp"></jsp:include>
<jsp:include page="../host/menuBar.jsp"></jsp:include>

	<div class="chart-container">
		<canvas id="hostChart"></canvas>
	</div>
	
	<div class="chart-container">
		<canvas id="hostChart2"></canvas>
	</div>
	
	<div class="chart-container">
		<canvas id="hostChart3"></canvas>
	</div>
	
	<script>
		const RevChart = document.getElementById('hostChart').getContext('2d');
		const SpaceChart = document.getElementById('hostChart2').getContext('2d');
		const ProfitChart = document.getElementById('hostChart3').getContext('2d');
		
		drawRevChart();
		drawSpaceChart();
		drawProfitChart();
		
		// 예약 현황 차트
		function drawRevChart() {
			$.ajax({
				url: "/host/drawspaceChart.kh",
				type: "get",
				success: function(data) {
					const rChart = new Chart(RevChart,{
						type: "line",	// 차트의 형태
						data: {			// 차트에 들어갈 데이터
							labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"], // x축
							datasets: [{		// 데이터
								label: '월별 예약 현황',		// 차트 제목
								data:[
									data[0].result[0],
									data[0].result[1],
									data[0].result[2],
									data[0].result[3],
									data[0].result[4],
									data[0].result[5],
									data[0].result[6],
									data[0].result[7],
									data[0].result[8],
									data[0].result[9],
									data[0].result[10],
									data[0].result[11],
									data[0].result[12]
									],		// x축의 value값
									backgroundColor:['rgba(0, 0, 0, 0)'],
									borderColor:['rgba(255, 99, 132, 1)',
										'rgba(54, 162, 235, 1)',
										'rgba(255, 206, 86, 1)',
										'rgba(75, 192, 192, 1)',
										'rgba(153, 102, 255, 1)',
										'rgba(255, 159, 64, 1)'],
									borderWidth:3,
									fill: true
							}]
						},
						options:{
							maintainAspectRatio : false,
						}
					})
				},
				error: function () {
					console.log("처리 실패");
				}
			})
		}
	
		 function drawSpaceChart() {
			$.ajax({
				url: "/host/spaceChart.kh",
				type: "get",
				success: function(data) {
					const sChart = new Chart(SpaceChart,{
						type: "line",
						data: {
							labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
							datasets: [{ 
								label: "월별 공간 등록 현황",
								data: [
									data[0].result[0],
									data[0].result[1],
									data[0].result[2],
									data[0].result[3],
									data[0].result[4],
									data[0].result[5],
									data[0].result[6],
									data[0].result[7],
									data[0].result[8],
									data[0].result[9],
									data[0].result[10],
									data[0].result[11],
									data[0].result[12],
									],
									backgroundColor: [
										'rgba(0, 0, 0, 0)'
								],
								borderColor: [
										'rgba(255, 99, 132, 1)',
										'rgba(54, 162, 235, 1)',
										'rgba(255, 206, 86, 1)',
										'rgba(75, 192, 192, 1)',
										'rgba(153, 102, 255, 1)',
										'rgba(255, 159, 64, 1)'
								],
								borderWidth: 3
							}]
						},
						options:{
							maintainAspectRatio : false,
						}
					})
				},
				error : function() {
					
				}
			})
		} 
		
		 
		 function drawProfitChart() {
			 $.ajax({
				 url: "/host/profitChart.kh",
				 type: "get",
				 success: function(data) {
					const fChart = new Chart(ProfitChart,{
						type: "line",
						data: {
							labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
							datasets: [{
								label: "월별 판매 금액 현황",
								data: [
									data[0].result[0],
									data[0].result[1],
									data[0].result[2],
									data[0].result[3],
									data[0].result[4],
									data[0].result[5],
									data[0].result[6],
									data[0].result[7],
									data[0].result[8],
									data[0].result[9],
									data[0].result[10],
									data[0].result[11],
									data[0].result[12]
								],
								backgroundColor: [
									'rgba(0, 0, 0, 0)'
							],
							borderColor: [
									'rgba(255, 99, 132, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(255, 206, 86, 1)',
									'rgba(75, 192, 192, 1)',
									'rgba(153, 102, 255, 1)',
									'rgba(255, 159, 64, 1)'
							],
							borderWidth: 3
							}]
						},
						options:{
							maintainAspectRatio : false,
						}
					
					})
				},
				
				error: function() {
				}
			 })
			
		}
	</script>
 <br><br><br><br><br><br><br><br> <br><br><br><br><br><br><b><br><br><br> <br><br><br><br><br><br><br><br> <br><br><br><br><br><br><br><br> <br><br><br><br><br><br><br><br>
 <jsp:include page="../../views/common/footer.jsp"></jsp:include>	
</body>
</html>