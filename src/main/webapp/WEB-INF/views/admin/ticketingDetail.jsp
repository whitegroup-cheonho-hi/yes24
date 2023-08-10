<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ticketing detail</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/reset.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/admin2.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/detail.css" type="text/css">
<link rel="stylesheet" type="text/css" href="https://image.yes24.com/sysimage/yesUI/yesUI.css?v=20230403" media="all">

<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet">

<!-- 제이쿼리 최신 버전 -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<!-- 풀켈린더js -->
<script type="text/javascript" src='${pageContext.request.contextPath }/assets/js/index.global.min.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

<style>

.concertHall .position{margin-bottom: 50px;}
.concertHall .position{width: 1178px;display: flex;border: solid 1px #ec7d2c; padding: 10px;}
.concertHall .position #calendar,#dayList{margin-right: 20px; width: 390px;}
.concertHall .position #remainingSeats{ width: 355px;}
.concertHall .position h2{font-size: 20px;}
.concertHall .position .fc-scrollgrid-sync-table a{font-size: 15px; cursor: pointer;}
.concertHall .position .fc .fc-button{font-size: 12px;}

.position #calendar .fc-view-harness .fc-col-header .fc-col-header-cell{width:55px;}
.position #calendar .fc-scrollgrid-section .fc-scrollgrid-sync-table tbody .fc-day{width:55px;}
.fc .fc-daygrid-body-unbalanced .fc-daygrid-day-events {min-height: 0em;}
#fc-dom-87{border-bottom: solid 2px;}
#remaining{border: 1px solid #ddd;height: 200px;margin-top: 15px;padding: 10px; }
#remainingSeats h2{height: 55px;}
#remainingSeats .fc-view-harness{padding: 10px;}

.inpRow{ display: flex; margin-bottom: 20px; }
.imgBox{ width: 365px;  }
.imgBox img{ border-radius: 10px;  }
.infoBox{ width: 95%; }
.infoTb{ border-top: solid 2px rgb(62, 62, 62); border-bottom: solid 2px rgb(62, 62, 62); width: 98%; height: 100%; }
.infoTb tr{line-height: 45px; font-weight: 400; border-collapse: collapse; border-spacing: 0; margin: 0; 
	border-bottom: solid 1px #ddd; }
.infoTb td, .infoTb th{ vertical-align: middle; }
.showTit p{ font-size: 35px; color: #333; font-weight: bold;}
.showTit{  margin: 20px;}
.renew-content{ margin-top: 140px; }
h2 {margin-left: 0px;}
.navigation{margin-top: 40px;}

.fc-event{  cursor: pointer;}
</style>
</head>
<body>
	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/includes/adminHeader.jsp"></c:import>
	<!-- //헤더 -->
	<section>
		<div class="renew-content">
			<!-- ==================== 공연정보 영역 ==================== -->				
			<div class="showTit">
				<p>예매현황</p>
			</div>
			<div class="inpRow">
				<div class="imgBox">
					<img src="${pageContext.request.contextPath}/upload/${show.subImage}" style="width: 80%;" >
				</div>
				<div class="infoBox">
					<table class="infoTb">
						
						<tr>
							<th>작품명</th><td>${show.showName}</td>
							<th>공연장</th><td>${hallName.concertHallName}</td>
						</tr>
						<tr>
							<th>감독</th><td>${show.director}</td>
							<th>출연진</th><td>${show.cast}</td>
						</tr>
						<tr>
							<th>공연시간</th><td>${show.showTime}분</td>
							<th>관람연령</th><td>${show.viewingAge}세</td>
						</tr>
						<tr>
							<th>카테고리</th><td>${show.categoryName}</td>
							<th>평점</th><td>${show.gradeAvg}</td>
						</tr>
						<tr>
							<th>공연시작</th><td>${show.startDate}</td>
							<th>공연마감</th><td>${show.endDate}</td>
						</tr>
					</table>
					
				</div>
			</div>
			
			<!-- ==================== 캘린더 영역 ==================== -->
			<div class="concertHall">
				<div class="inpRow">
					<div class="concertHall">							
						<div class="position">
							<div id='calendar' class="calendar"></div>
							<div id='dayList' class="calendar"></div>
							
							<div id="remainingSeats"> 		
								<div class="fc-header-toolbar fc-toolbar ">
									<div class="fc-toolbar-chunk">
										<h2 class="fc-toolbar-title" id="fc-dom-87">예매가능 좌석</h2>
									</div>										
								</div>
								<div aria-labelledby="fc-dom-86"
									class="fc-view-harness fc-view-harness-active"
									style="height: 288.889px;">
									<div>										
									</div>
									<div id ="remaining">
										<div id="remainingSeat" class="fc-listDay-view fc-view fc-list fc-list-sticky"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>			
		</div>
		<br>
	</section>
</body>

<script>
$(document).ready(function() {
	let dayListEl;
	let dayList;
	let date;
	var showSq = '${show.showSq}';
		
	// 오늘날짜
	var currentDate = new Date();
	var formattedDate = currentDate.toISOString().split('T')[0];
	// 페리이 로드되면 오늘날짜로 회차정보 가지고오기
	getShowingInfo(formattedDate);
	
	// 날짜를 클릭하면 데이터 가져오기
	function dayEvent(date) { 
		  console.log(date);
		  dayList.removeAllEvents();
		  var Seat = $("#remainingSeat");
	      // 회차클릭시 잔여좌석 비우기
	      Seat.empty();	
		  getShowingInfo(date);
	
		 
		}

	// 달력 초기화
	var calendarEl = $('#calendar')[0];
	var calendar = new FullCalendar.Calendar(calendarEl, {
		initialView : 'dayGridMonth',
		selectable : true,
		// dateClick: true,
		locale : 'ko',
		timeZone : 'ko',
		dateClick : function(arg) {
			console.log(arg);
			date = moment(arg.date).format("YYYY-MM-DD");
			// date = arg.dateStr;
			dayEvent(date);
			dayList.gotoDate(date);
		}
	});
	calendar.render();
	
	getShowingDay();

	// 리스트 초기화
	dayListEl = $('#dayList')[0];
	// 리스트 클릭이벤트 
	dayList = new FullCalendar.Calendar(dayListEl, {
		initialView : 'listDay',
		locale : 'ko',
		timeZone : 'local',
		initialDate : moment().toDate(),
		eventClick : function(arg) {
			
		//백그라운드 초기화
		$('#dayList tr').not(arg.el).css('background-color', '');
		$(arg.el).css('background-color', 'rgb(255 124 124)');	
    	var Seat = $("#remainingSeat");
    	// 회차클릭시 잔여좌석 비우기
    	Seat.empty();
		var showingSq = arg.event.extendedProps.hiddenValue; 
					
		var ShowingVO = {showingSq : showingSq};
		  // 회차 정보 가져오기
		  $.ajax({
		    url: "${pageContext.request.contextPath}/showing/remainingSeats",
		    type: "post",
		    //contentType: "application/json",
		    data: ShowingVO,
		    
		    dataType: "json",
		    success: function(result) {		          	     
		               	  console.log(result);
			   
			    for (let index in result.data) {
			        if (result.data.hasOwnProperty(index)) {
			            //금액 포맷
			        	var seatPriceFormatted = new Intl.NumberFormat('ko-KR').format(result.data[index].seatPrice);

			            var item = '<div style="margin-bottom: 5px;">' + result.data[index].seatClass +'석'			            
			            	item += '&nbsp;&nbsp;';
			            	item += seatPriceFormatted  +'원';
			            	item += '&nbsp;&nbsp;';
			            	item += '<span style="color: orange"> 잔여 : ('+result.data[index].seatEa +'석)</span>';
			            	item +='</div>';
			            Seat.append(item);
			        }
			    }
		    },
		    error: function(XHR, status, error) {
		      console.error(status + " : " + error);
		    }
		  });
		}
	});
	dayList.render();

	
	// 날짜로 회차 데이터 가져오기
	function getShowingInfo(date) {
			console.log("호출");
		  var ShowingVO = { showingDate: date, showSq: showSq};
		  console.log(ShowingVO);
		  $.ajax({
		    url: "${pageContext.request.contextPath}/showing/getShowing",
		    type: "post",
		    //contentType: "application/json",
		    data: ShowingVO,
		    dataType: "json",
		    success: function(result) {
		    	console.log(result);
		      for (var i = 0; i < result.data.length; i++) {
		        var startTime = result.data[i].showingDate + 'T' + result.data[i].startTime;
		        var endTime = result.data[i].showingDate + 'T' + result.data[i].endTime;
		        var showingSq = result.data[i].showingSq;
		        dayList.addEvent({
		          title: [i + 1] + '회차',
		          start: startTime,
		          end: endTime,
		          hiddenValue: showingSq
		        });
		      }
		    },
		    error: function(XHR, status, error) {
		      console.error(status + " : " + error);
		    }
		  });
		}
	
	// 등록된 회차 보여주기
	function getShowingDay() {
        console.log('getShowingDay');
        calendar.removeAllEvents();
      	//ajax 한달 공연 스케쥴 불러오기		
		$.ajax({
	        url: "${pageContext.request.contextPath}/showing/getShowingDay",
	        type: "post",
	        //contentType: "application/json",
	        data: {showSq : showSq},
	        dataType: "json",
	        //성공시
	        success: function(result) {
		       
		        for(var i = 0; i < result.data.length; i++){
		        	calendar.addEvent({
		    			//title: '백그라운드 색상',
		                start: result.data[i],
		                //start: '2023-07-28',
		                display: 'background', // 백그라운드 색상을 표시하는 옵션
		                color: '#FF0000' // 원하는 색상 값으로 변경
		            });
		        }
	        },
	        error: function(XHR, status, error) {
	        	console.error(status + " : " + error);
	        }
	    });
	}
});
</script>
</html>