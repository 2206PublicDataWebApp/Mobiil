const mVal = document.querySelector("#mVal").value;
let date = new Date(2022,mVal-1);

const renderCalender = () => {
  const viewYear = date.getFullYear();
  const viewMonth = date.getMonth();
  let sMonth = Number(date.getMonth())+1;
  if(sMonth < 10) {
  	sMonth = '0'+sMonth;
  }

  document.querySelector('.year-month').textContent = `${viewYear}년 ${viewMonth+1}월`;

  const prevLast = new Date(viewYear, viewMonth, 0);	 	// 지난달
  const thisLast = new Date(viewYear, viewMonth + 1, 0);	// 이번달

  const PLDate = prevLast.getDate();	// 지난달 마지막 일자
  const PLDay = prevLast.getDay();		// 지난달 마지막 요일

  const TLDate = thisLast.getDate();	// 이번달 마지막 일자
  const TLDay = thisLast.getDay();		// 이번달 마지막 요일

  const prevDates = [];
  const thisDates = [...Array(TLDate + 1).keys()].slice(0);
  const nextDates = [];

  if (PLDay !== 6) {
    for (let i = 0; i < PLDay + 1; i++) {
      prevDates.unshift("");
    }
  }

  for (let i = 1; i < 7 - TLDay; i++) {
    nextDates.push("");
  }

  const dates = prevDates.concat(thisDates, nextDates);
  const firstDateIndex = dates.indexOf(1);
  const lastDateIndex = dates.lastIndexOf(TLDate);

  dates.forEach((date, i) => {
    const condition = i >= firstDateIndex && i < lastDateIndex + 1 ? 'this' : 'other';
    
		  if(date < 10){
					dates[i] = `<div class="date"><span class=${condition}>${date}</span><br>
			    		    <span id=${viewYear + "-" + (sMonth) + "-" + "0" +date}> </span></div>`;
				}else{
					dates[i] = `<div class="date"><span class=${condition}>${date}</span><br>
			    		    <span id=${viewYear + "-" + (sMonth) + "-" +date}> </span></div>`;
				}	
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

const prevMonth = () => {
  const monthValue = date.getMonth();
  date.setMonth(monthValue);
  location.href = "/host/reservationCheck.mobiil?monthValue="+monthValue;
};

const nextMonth = () => {
  const monthValue = date.getMonth() + 2;
  date.setMonth(monthValue);
  location.href = "/host/reservationCheck.mobiil?monthValue="+monthValue;
};

const goToday = () => {
  date = new Date();
  renderCalender();
};
