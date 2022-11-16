<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=163c926f2747f3a404b998b190a36731&libraries=services"></script>
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"
/>
<title>Mobiil SpaceDetail</title>
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
<!-- fullcalendar CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/locales-all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js"></script>
<style type="text/css">
.fc-day-sat a {
  color: blue;
  text-decoration: none;
}
.fc-day-sun a {
  color: red;
  text-decoration: none;
}
.swiper {
        width: 550px;
        height: 400px;
        float:left;
      }

      .swiper-slide {
        text-align: left;
        font-size: 18px;
        background: #fff;

        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: inline-block;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: left;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
      }

      .swiper-slide img {
        display: inline-block;
        width: 550px;
        height: 400px;
        object-fit: fill;
	    border-radius: 10px;
	    cursor: pointer;
	    transition: 0.3s;
      }
      .swiper {
        margin-left: auto;
        margin-right: auto;
      }
      .swiper-button-next::after{
      	margin-right:80px;
      	padding-left:70px;
      	padding-right:30px;
      	padding-top:175px;
      	padding-bottom:175px;
      }
      .swiper-button-prev::after{
     	margin-left:80px;
      	padding-left:30px;
      	padding-right:70px;
      	padding-top:175px;
      	padding-bottom:175px;
      }
      
      
  /* 이미지 클릭 시, 밝기 조절 */
  .img:hover {opacity: 0.8;}
      .modal {
    display: none; /* 모달창 숨겨 놓기 */
    position: fixed; 
    z-index: 1; /* 모달창을 제일 앞에 두기 */
    padding-top: 100px;
    left: 0; top: 0;
    width: 100%; height: 100%;
    overflow: auto; /* 스크롤 허용 auto */
    cursor: pointer; /* 마우스 손가락모양 */
    background-color: rgba(0, 0, 0, 0.8);
  }
  /* 모달창 이미지 */
  .modal_content {
    margin: auto;
    display: block;
    width: 50%; height: auto;
    max-width: 1000px;
    border-radius: 10px;
    animation-name: zoom;
    animation-duration: 0.8s;
  }
  /* 모달창 애니메이션 추가 */
  @keyframes zoom {
    from {transform: scale(0)}
    to {transform: scale(1)}
  }
  /* 닫기 버튼 꾸미기 */
  .close {
    position: absolute;
    top: 15px;
    right: 35px;
    color: #f1f1f1;
    font-size: 40px;
    font-weight: bold;
    transition: 0.3s;
  }
  .close:hover, .close:focus{
    color: #bbb;
    text-decoration: none;
    cursor: pointer;
  }
  

</style>
</head>

<body>
<script type="text/javascript">

//채팅방 열기
function openChatRoom(createUser, withUser) {
	$.ajax({
		url:"/chat/createChatRoom.kh",
		tyep: "get",
		data: {createUser: createUser,
				withUser:withUser},
		success:
			function(data) {
			console.log(data);
				if(data == "already"){
					alert("이미 생성된 채팅방입니다");
					window.open('/chat/chatWindow.kh?memberNick='+createUser+'', 'window', 'width=500, height=700, menubar=no, status=no, toolbar=no');
				}else if(data == "success"){
					alert("채팅이 시작됩니다.");
					window.open('/chat/chatWindow.kh?memberNick='+createUser+'', 'window', 'width=500, height=700, menubar=no, status=no, toolbar=no');
				}else{
					alert("생성에 실패했습니다.");
				}
			},
		error:
			function() {
				alert("에러")
			}
	})
}
</script>

<jsp:include page="../../views/common/menubar.jsp"></jsp:include>
<div class="container">
        <div class="modal">
		  <span class="close">&times;</span>
		  <img class="modal_content" id="img01">
		</div>
<h1 style='margin-top:80px;;'>${space.spaceName }</h1>

	<!-- Swiper -->
    <div class="swiper mySwiper">
      <div class="swiper-wrapper">
      	<c:forEach items="${iList }" var="spaceImg">
        <div class="swiper-slide"><img class='img' src='../../resources/spaceuploadFiles/${spaceImg.spaceFileRename }' onclick='imgClick("${spaceImg.spaceFileRename }");'></div>
        </c:forEach>
      </div>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
      <div class="swiper-pagination"></div>
    </div>
    
<div class='reservDiv' style='display:inline-block;text-align:right;float:right;'>
<div style='text-align:right; '><img class='heartImg' style='cursor:pointer;'/></div>
	<br>
	<div style="float:center;width:300px;font-size:11px;" id='calendar'></div>
	<br>
		<div class='time' style='float:left;display:inline-block;'>
		<select id="startTime" onchange="check();" style='margin-right:5px;' class='commonSelect'>
			<option value="시작">시작</option>
			<option value="9">9시</option>
			<option value="10">10시</option>
			<option value="11">11시</option>
			<option value="12">12시</option>
			<option value="13">13시</option>
			<option value="14">14시</option>
			<option value="15">15시</option>
			<option value="16">16시</option>
			<option value="17">17시</option>
			<option value="18">18시</option>
			<option value="19">19시</option>
			<option value="20">20시</option>
			<option value="21">21시</option>
			<option value="22">22시</option>
			<option value="23">23시</option>
		</select>
		<select id="endTime" onchange="check();" style='margin-left:5px;' class='commonSelect'>
			<option value="끝">끝</option>
			<option value="10">10시</option>
			<option value="11">11시</option>
			<option value="12">12시</option>
			<option value="13">13시</option>
			<option value="14">14시</option>
			<option value="15">15시</option>
			<option value="16">16시</option>
			<option value="17">17시</option>
			<option value="18">18시</option>
			<option value="19">19시</option>
			<option value="20">20시</option>
			<option value="21">21시</option>
			<option value="22">22시</option>
			<option value="23">23시</option>
			<option value="24">24시</option>
		</select>
		<span class='sum' style='font-weight:bold;font-size:20px;margin-left:20px;'></span>
		<br><br>
		</div>
		<br><br>
		<div style='display:inline-block;width:300px;text-align:center;float:left;'>
		<input type="button" value="결제" onclick="payment()" style='margin-left:5px;' class='btn'>
		<c:if test='${!empty loginUser.memberNick }'>
				<input type="button" onclick="openChatRoom('${loginUser.memberNick}', '${memberNick }');" value='채팅' style='margin-right:5px;' class='btn'>
			</c:if>
			<c:if test='${!empty loginHost.hostEmail }'>
				<input type="button" onclick="openChatRoom('${loginHost.memberNick}', '${memberNick }');" value='채팅' style='margin-right:5px;' class='btn'>
			</c:if>
		<br><br>
		</div>
		<div id="map" style="width:300px;height:300px;"></div>
		<span>${space.address2} ${space.address3} ${space.address4}</span>

</div>
<div class='spaceComent' style='width:600px;display:inline-block;align:left;margin-top:80px;'>
${space.spaceComent }




<div style='width:700px;align:left;'><span style='font-size:24px;color:darkgreen;'><b id="rCount"></b></span></div>
<div id="reivewBox" style='width:700px;'>
</div>
</div>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>


<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			url: '/space/checkHeart.kh',
			data: { "memberEmail":"${loginUser.memberEmail}", "spaceNo":'${spaceNo}' },
			type: 'GET',
			success: function(result){
				if(result != 0){
					$('.heartImg').attr('src','');
					$('.heartImg').attr('src','../../../resources/images/heartson.png');
				}else{
					$('.heartImg').attr('src','');
					$('.heartImg').attr('src','../../../resources/images/heartsoff.png');
				}
			},
			error: function(){
				alert("통신 실패");
			}
		});
		
		$('.heartImg').on('click', function(){
			if(${loginUser == null}){
				alert("개인 회원만 가능합니다.");
			}else{
			$.ajax({
				url: '/space/checkHeart.kh',
				data: { "memberEmail":"${loginUser.memberEmail}", "spaceNo":'${spaceNo}' },
				type: 'GET',
				success: function(result){
					if(result != 0){
						$.ajax({
							url: '/space/deleteHeart.kh',
							type: 'GET',
							data: { "memberEmail":"${loginUser.memberEmail}", "spaceNo":'${spaceNo}' },
							success: function(result){
								if(result != 0){
									$('.heartImg').attr('src','');
									$('.heartImg').attr('src','../../../resources/images/heartsoff.png');
								}else{
									$('.heartImg').attr('src','');
									$('.heartImg').attr('src','../../../resources/images/heartson.png');
								}
							},
							error: function(){
								alert("통신 실패");
							}
						});
					}else{
						$.ajax({
							url: '/space/heart.kh',
							type: 'GET',
							data: { "memberEmail":"${loginUser.memberEmail}", "spaceNo":'${spaceNo}', "spaceName":'${space.spaceName }', "spaceFileRename":'${iList[0].spaceFileRename }', "spaceStatus":'${space.spaceStatus}' },
							success: function(result){
								if(result != 0){
									$('.heartImg').attr('src','');
									$('.heartImg').attr('src','../../../resources/images/heartson.png');
								}else{
									$('.heartImg').attr('src','');
									$('.heartImg').attr('src','../../../resources/images/heartsoff.png');
								}
							},
							error: function(){
								alert("통신 실패");
							}
						});
					}
				},
				error: function(){
					alert("통신 실패");
				}
			});
			}
		})
	});

	// 카카오 지도
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

	// 지도 생성   
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	// 주소-좌표 변환 객체 생성
	var geocoder = new kakao.maps.services.Geocoder();
	// 주소로 좌표를 검색
	geocoder.addressSearch('${space.address2} ${space.address3} ${space.address4}', function(result, status) {
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	        // 결과값 마커 표시
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	        // 인포윈도우로 장소에 대한 설명
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+'${space.spaceName}'+'</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
	
	
	// fullCalendar
	var sDate = "";
	var price = "";
	var end = "";
	var start = "";
	document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	    	headerToolbar: {
	    		left: 'prev',
	            center: 'title',
	            right: 'next'
	        },
	        locale: "ko",
	        height: 360,
	    	initialView: 'dayGridMonth',
	    	editable: false,
	    	unselectAuto : true,
	    	selectOverlap : false,
	    	dateClick: function (dateClickInfo) {
	    		  // get all fc-day element
	    		  const fcDayElements = document.querySelectorAll(
	    		    ".fc-daygrid-day.fc-day"
	    		  );
	    		  // init background color found element
	    		  fcDayElements.forEach((element, key, parent) => {
	    		    element.style.backgroundColor = "";
	    		  });
	    		  // set background color clicked Element
	    		  dateClickInfo.dayEl.style.backgroundColor = "#CAF5DC";
	    		  sDate = dateClickInfo.dateStr;
	    		  const clickDate = new Date(sDate);
	    		  const today = new Date();
	    		  if(today>clickDate){
	    			  alert("선택할 수 없는 날짜입니다.");
	    			  fcDayElements.forEach((element, key, parent) => {
	  	    		    element.style.backgroundColor = "";
	  	    		  });
	    		  }
	    		},
	    	  function( dropInfo ) { 
	    		  event.remove();
	    	  }
	    });
	    calendar.render();
	  });

	// 결제하기 누르면 날짜 및 시간 유효성 검사
	function payment(){
		if(${loginUser == null}){
			alert("개인 회원만 가능합니다.");
		}else{
			start = $('#startTime option:selected').val();
			end = $('#endTime option:selected').val();
			if(sDate == "" || start == "시작" || end == "끝"){
				alert("날짜 혹은 시간을 확인해주세요.");
			}
			$.ajax({
				url : "/space/checkTime.kh",
				data : {"start": start, "end":end, "reservDate":sDate},
				type : "get",
				success : function(result) {
					if(result != 0){
						alert("예약할 수 없는 시간입니다.");
					}else{
						location.href = '/space/payment.kh?sDate='+sDate+'&start='+start+'&end='+end+'&price='+price;
					}
				},
				error : function(){
					alert("통신 실패");
				}
			})
		}
		
	}
	
	getReviewList();
	function getReviewList(){
		var spaceNo = '${spaceNo}';
		$.ajax({
			url:'/space/reviewList.kh',
			data:{"spaceNo" : spaceNo},
			type: 'get',
			success : function(rList){
				var $reivewBox = $("#reivewBox");
				$reivewBox.html("");
				$("#rCount").text("리뷰(" + rList.length + ")");
				if(rList != null){
					for(var i in rList){
						var str = rList[i].reviewWriter;
						var reviewWriter = str.substr(0,1);
						var reviewContents = rList[i].reviewContents;
						reviewContents = reviewContents.replace(/(?:\r\n|\r|\n)/g, '<br>');
						var $div = $('<div>');
						var $hr = $('<hr>');
						var $rWriter = $("<span class='reviewWriter' style='font-size:17px;font-weight:bold;'>").text(reviewWriter+"**");
						var $rContentBox = $("<div style='margin-top:30px;margin-bottom:30px;' class='"+rList[i].reviewNo+"'>");
						var $rContent = $("<span class='rc"+rList[i].reviewNo+"'>").html(""+reviewContents);
						var $rUpdateDate = $("<span style='margin-left:20px;font-size:12px;color:lightgray;font-weight:normal;'>").text(rList[i].rUpdateDate);
						var $button = $("<div style='padding-top:30px;'>").append("<a style='text-decoration: underline;' href='javascript:void(0);' onclick='insertReplyView(this,"+rList[i].reviewNo+")'>답글달기</a>");
						var $rvNo = $('.'+rList[i].reviewNo);
						$reivewBox.append($div);
						$div.append($hr);
						$div.append($rWriter);
						$rWriter.append($rUpdateDate);
						$div.after($rContentBox);
						$rContentBox.append($rContent);
						$.ajax({
							url:'/space/imgList.kh',
							type:'get',
							data:{"reviewNo":rList[i].reviewNo},
							success:function(riList){
								if(riList != null){
									var $slideContainer = $("<div class='rvSlide-container' style='margin-bottom:20px;'>");
									var $slider = $("<div class='rvSlider' style='display:flex;overflow: auto;scroll-snap-type: x mandatory;'>");
									$slideContainer.append($slider);
									for(var k in riList){
										if(riList[k].reviewFileRename != null){
										$('.rc'+riList[k].reviewNo).before($slideContainer);
										var $rvImg = $("<div class='rvImgDiv' style='flex: none;scroll-snap-align: start;width:20%;'>");
										$rvImg.append("<img class='rvImg' style='display: inline-block;width:75px;height:75px;margin-left:10px;margin-right:10px;cursor:pointer;' src='../../../resources/reviewFiles/"+riList[k].reviewFileRename+"' onclick='window.open(this.src)' alt='reviewImg'/>");
										$slider.append($rvImg);
										}
									}
								}
								
							},
							error:function(){
							}
						});
						if('${loginHost.hostEmail }' == '${hostEmail }'){
							$rContentBox.append($button);
						}
						
						$.ajax({	
							url:'/space/replyList.kh',
							type:'get',
							data:{"reviewNo":rList[i].reviewNo},
							success:function(hrList){
								for(var j in hrList){
								var $rNo = $('.'+hrList[j].reviewNo);
								var $hdiv = $('<div id="hostReplyList" style="text-align:left;padding-left:50px;">');
								var $hrWriter = $("<span style='font-size:17px;font-weight:bold;color:green;'>").text("호스트");
								var $hrUpdateDate = $("<span style='text-align:left;padding-left:20px;font-size:12px;color:lightgray;'>").text(hrList[j].updateDate);
								var $hrContent = $("<div style='margin-bottom:30px;margin-top:20px;text-align:left;padding-left:50px;'>").append($("<span class='mdf"+hrList[j].replyNo+"'>").html(""+hrList[j].replyContents));
								var $modify = $("<span>").append("<a style='margin-left:20px;font-size:13px;' href='javascript:void(0);' onclick='modifyReplyView(this,"+hrList[j].replyNo+")'>수정</a>")
														 .append("<a style='margin-left:8px;font-size:13px;' href='javascript:void(0);' onclick='deleteReply("+hrList[j].replyNo+")'>삭제</a>");
									$rNo.after($hdiv);
									$hdiv.append($hrWriter);
									$hdiv.append($hrUpdateDate);
									$hdiv.after($hrContent);
									if('${loginHost.hostEmail }' == '${hostEmail }'){
										$hrUpdateDate.append($modify);
									}
							}
							}
						});
						
						
					}
				}
			},
			error : function(){
				alert("ajax 통신 실패");
			}
		})
	}
	
	
	function insertReplyView(obj, reviewNo){
		if($("#insertReplyView").length == 0){
		event.preventDefault();
		$div = $("<div id='insertReplyView' style='display: table;'>");
		$div.append("<textarea id='insertReply' style='display:table-cell;vertical-align:middle;height:50px;border-width:1px;width:450px;resize:none;'></textarea><a style='padding-left:10px;display:table-cell;vertical-align:middle;' href='javascript:void(0);' onclick='insertReply(this, "+reviewNo+")');'>등록</a>");
		$(obj).parent().parent().append($div);			
		} else{
			$("#insertReplyView").remove();
		}
	}
	
	function insertReply(obj, reviewNo){
		if(confirm("등록하시겠습니까?")){
		var replyContents = $("#insertReply").val();
		replyContents = replyContents.replace(/(?:\r\n|\r|\n)/g, '<br>');
		if(replyContents == ''){
			alert("내용을 입력해주세요.");
		}else{
			$.ajax({
			url:"/space/insertReply.kh",
			data:{"reviewNo":reviewNo, "replyContents": replyContents, "replyWriter":'${loginHost.companyName }', "hostEmail":'${loginHost.hostEmail }'},
			type:"post",
			success:function(result){
					if(result>0){
						$("#insertReply").val('');
						event.preventDefault();
						getReviewList();
					}
				},
			error: function(){
				alert("실패");
			}
		})
		}
		}else{
			return false;
		}
	}
	
	function modifyReplyView(obj, replyNo){
		if($("#modifyReplyView").length == 0){
		var rText = $(".mdf"+replyNo).html();
		rText = rText.replace(/<br\s*[\/]?>/gi, '\r\n');
		event.preventDefault();
		$(".mdf"+replyNo).css('display','none');
		$div = $("<div id='modifyReplyView' style='display: table;'>");
		$div.append("<textarea id='modifyReply' style='display:table-cell;vertical-align:middle;height:50px;border-width:1px;width:450px;resize:none;color:black;'></textarea><a style='padding-left:10px;display:table-cell;vertical-align:middle;' href='javascript:void(0);' onclick='modifyReply(this, "+replyNo+")');'>수정</a>");
		$(obj).parent().parent().append($div);
		$('#modifyReply').html(rText);
		} else{
			$("#modifyReplyView").remove();
			$(".mdf"+replyNo).css('display','block');
		}
	}
	
	function modifyReply(obj, replyNo){
		if(confirm("수정하시겠습니까?")){
		var modifyContents = $('#modifyReply').val();
		modifyContents = modifyContents.replace(/(?:\r\n|\r|\n)/g, '<br>');
		if(modifyContents == ''){
			alert("내용을 입력해주세요.");
		}else{
			$.ajax({
				url:"/space/modifyReply.kh",
				data:{"replyNo":replyNo, "replyContents": modifyContents},
				type:"post",
				success:function(result){
						if(result>0){
							$("#modifyReply").text('');
							event.preventDefault();
							getReviewList();
						}
					},
				error: function(){
					alert("실패");
				}
			})
		}			
		}else{
			return false;
		}
	}
	
	function deleteReply(replyNo){
		if(confirm("삭제하시겠습니까?")){
			$.ajax({
				url: '/space/deleteReply.kh',
				data: {'replyNo' : replyNo},
				type: 'get',
				success: function(result){
					if(result == 'O'){
						getReviewList();
						alert("삭제되었습니다.");
					} else{
						alert("삭제에 실패하였습니다.");
					}
				},
				error: function(){
					alert("ajax 통신 오류");
				}
			})
		}else{
			return false;
		}
	}
	
	// 시작시간 > 끝시간 선택시 option 리셋 유효성 검사
	function check(){
		start = $('#startTime option:selected').val();
		end = $('#endTime option:selected').val();
		if(Number(start) >= Number(end)){
			alert("잘못된 시간을 선택하셨습니다.");
			$('#startTime option:eq(0)').prop('selected', true);
			$('#endTime option:eq(0)').prop('selected', true);
		}
		if(Number(start) < Number(end)){
			price = ${space.spacePrice}*(Number(end) - Number(start));
			$(".sum").text('');
			$(".sum").text(price+"원");
		}
	}
	
    var swiper = new Swiper(".mySwiper", {
      slidesPerView: 1,
      spaceBetween: 30,
      loop: true,
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      }
    });
    
	    const modal = document.querySelector(".modal");
	    const img = document.querySelector(".img");
	    const modal_img = document.querySelector(".modal_content");
	    const span = document.querySelector(".close");
	    function imgClick(spaceFileRename){
		      modal_img.src = '../../resources/spaceuploadFiles/'+spaceFileRename;
		      modalDisplay("block");
	    	
	    }
	    span.addEventListener('click', ()=>{
	      modalDisplay("none");
	    });
	    modal.addEventListener('click', ()=>{
	      modalDisplay("none");
	    });
	    function modalDisplay(text){
	      modal.style.display = text;
	    }
	    
</script>
</body>
</html>