<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>예약 확인</title>
</head>
<body>
	<div class="calendar"> 
    <div class="header">
      <div class="year-month"></div>  <!-- 월 표시 -->
      <div class="nav">
        <button class="nav-btn go-prev" onclick="prevMonth()">&lt;</button>
        <button class="nav-btn go-today" onclick="goToday()">Today</button>
        <button class="nav-btn go-next" onclick="nextMonth()">&gt;</button>
      </div>
    </div>
    <div class="main">
      <div class="days">
        <div class="day">일</div>
        <div class="day">월</div>
        <div class="day">화</div>
        <div class="day">수</div>
        <div class="day">목</div>
        <div class="day">금</div>
        <div class="day">토</div>
      </div>
      <div class="dates"></div>
    </div>
  </div>
  
  <script>
	  let date = new Date();
	
	  const renderCalender = function() {	
	    const viewYear = date.getFullYear();
	    const viewMonth = date.getMonth();
	
	    document.querySelector('.year-month').textContent = `${viewYear}년 ${viewMonth + 1}월`;
	
	    const prevLast = new Date(viewYear, viewMonth, 0);
	    const thisLast = new Date(viewYear, viewMonth + 1, 0);
	
	    const PLDate = prevLast.getDate();	// 지난달 일자
	    const PLDay = prevLast.getDay();	// 지난달 요일
	
	    const TLDate = thisLast.getDate();	// 이번달 일자
	    const TLDay = thisLast.getDay();	// 이번달 요일
	
	    const prevDates = [];
	    const thisDates = [...Array(TLDate + 1).keys()].slice(1);
	    const nextDates = [];
	
	    if (PLDay !== 6) {		// 받아온 날짜를 기준으로 배열에 day 숫자 값을 채워줌
	      for (let i = 0; i < PLDay + 1; i++) {
	        prevDates.unshift(PLDate - i);
	      }
	    }
	
	    for (let i = 1; i < 7 - TLDay; i++) {
	      nextDates.push(i);
	    }
	
	    const dates = prevDates.concat(thisDates, nextDates);
	    const firstDateIndex = dates.indexOf(1);
	    const lastDateIndex = dates.lastIndexOf(TLDate);
	
	    dates.forEach(function(date, i) {
	      const condition = i >= firstDateIndex && i < lastDateIndex + 1
	                        ? 'this'
	                        : 'other';
	      dates[i] = `<div class="date"><span class=${condition}>${date}</span></div>
	    	          <span id=${date}></span>`;
	    });
	
	    document.querySelector('.dates').innerHTML = dates.join('');
	
	    const today = new Date();
	    if (viewMonth === today.getMonth() && viewYear === today.getFullYear()) {
	      for (let date of document.querySelectorAll('.this')) {
	        if (+date.innerText === today.getDate()) {
	          date.classList.add('today');
	          break;
	        }
	      }
	    }
	  };
	
	  renderCalender();
	
	  const prevMonth = function() {
	    date.setMonth(date.getMonth() - 1);
	    renderCalender();
	  };
	
	  const nextMonth = function() {
	    date.setMonth(date.getMonth() + 1);
	    renderCalender();
	  };
	
	  const goToday = function() {
	    date = new Date();
	    renderCalender();
	  };
  </script>
</body>
</html>