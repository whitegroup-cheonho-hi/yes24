<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ticketing</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/reset.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/ticketing2.css"
	type="text/css">
<!-- 제이쿼리 최신 버전 -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<!-- 풀켈린더js -->
<script type="text/javascript"
	src='${pageContext.request.contextPath }/assets/js/index.global.min.js'></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<style>
.position .calendar{padding:0px;}
#guideview {margin-left: 25px;}
.step01_date {height: 417px;}
.step01_time {height: 417px;}
#header{background-color: #363636;}
.result{background-color: #363636; color : #fff}
#ptitle a{color: #FFFFFF; font-size: 15px;}
.select_infor{height: 422px;}
.select_infor h2{font-size: 15px;}
#StepCtrlBtn01 img{width: 240px;}
#day,#tk_day{font-size: 15px;}
#ContentsArea .position{width: 665px; height: 374px;display: flex;padding: 10px;}
#ContentsArea .position h2{font-size: 15px; background:none; border:none;}
#ContentsArea .position #calendar{margin-right: 20px; width: 238px;}
#ContentsArea .position #dayList{margin-right: 8px; width: 241px;}
#ContentsArea .position #remainingSeats{ width: 165px;}
#ContentsArea .position .fc-daygrid-day-frame{height: 10px}
#ContentsArea .position .fc-today-button{display: none;}
#ContentsArea .position .fc .fc-button { font-size: 10px;}
#ContentsArea .position .fc .fc-scrollgrid-sync-inner {font-size: 14px;}
#ContentsArea .position .fc-scrollgrid-sync-table a{font-size: 11px; cursor: pointer;}
#ContentsArea .position .fc .fc-daygrid-body-unbalanced .fc-daygrid-day-events {min-height: 0em;}
#ContentsArea .position .fc-daygrid-body .fc-scrollgrid-sync-table .fc-day {height: 36px;}
#ContentsArea .position .fc-daygrid-body .fc-scrollgrid-sync-table .fc-day .fc-daygrid-day-events{display: none;}
#ContentsArea .concertHall .position .fc .fc-scrollgrid-sync-inner{font-size: 12px;}
.gnb li{float:left;  background: url("${pageContext.request.contextPath}/assets/images/예매순서.png"); height:52px; width:120px;}
#dayList .fc-view-harness{font-size: 12px;}
#fc-dom-87{border-bottom: solid 2px;}
#remaining{border: 1px solid #ddd;height: 308px;margin-top: 15px;padding: 10px;}
#remainingSeats .fc-header-toolbar{height: 15px; margin-top: 4px;}
#remainingSeats h2{height: 51px;padding-top: 3px;}
#remainingSeats .fc-view-harness{padding: 10px; font-size: 12px;}
.focus{background-color : red;}
.fc-event{cursor: pointer;}
</style>
</head>
<body>
	<div id="header" class="header">
		<h1>
			<img src="${pageContext.request.contextPath}/assets/images/로고2.PNG"
				alt="YES24.com">
		</h1>
		<ul class="gnb">
			<li class="m01 on"><span>관람일/회차</span></li>
			<li class="m02"><span>좌석선택</span></li>
			<li class="m03"><span>결제방법</span></li>
		</ul>
	</div>
	<section>
		<div id="ContentsArea" class="container" style="display: block;">
			<!-- 제 1 단계 : 관람일/회차 -->
			<div id="step01">
				<!-- 관람일선택 -->
				<div id="step01_date" class="step01_date concertHall" style="display: block;">
					<h2>
						<img src="http://tkfile.yes24.com/img/perfsale/h2_tit01.gif"
							alt="관람일선택"><span><img
							src="http://tkfile.yes24.com/img/perfsale/icon_nt.gif" alt=""></span>
					</h2>
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
									class="fc-view-harness fc-view-harness-active">
									<div>										
									</div>
									<div id ="remaining">
										<div id="remainingSeat" class="fc-listDay-view fc-view fc-list fc-list-sticky"></div>
									</div>
								</div>
							</div>						
						</div>
					</div>
				<!-- //관람일선택 -->
				<!--회차선택 -->
				<div id="step01_time" class="step01_time" style="display: block;">
					<div style="display: block;">
						<h2>
							<img src="http://tkfile.yes24.com/img/perfsale/h2_tit02.gif"
								alt="회차선택"><span><img
								src="http://tkfile.yes24.com/img/perfsale/icon_nt.gif" alt=""></span>
						</h2>
						
					</div>
				</div>
				<!-- //회차선택 -->
				<!-- 공연안내 -->
				<div id="step01_notice" class="step01_notice"
					style="display: block;">
					<h3>
						<img src="http://tkfile.yes24.com/img/perfsale/h3_tit_notice.gif"
							alt="유의사항">
					</h3>
					<div id="guideview">
						<ul>
							<li>- 안내되어 있는 잔여석은 결제 진행 중인 좌석을 포함하고 있어 예매 가능 좌석과 다를 수 있습니다.</li>
							<li>- 할인은 자동선택 되지 않으니, 적용 받고자 하는 할인이 있는 경우 직접 선택해주시기 바랍니다.</li>
							<li>- 장애인, 국가유공자, 학생 할인 등 증빙서류가 필요한 경우 현장수령만 가능하며, 현장에서 증빙서류
								미지참 시 차액 지불하셔야 합니다.</li>
							<li>- 관람 당일 공연 예매 시에는 변경/취소/환불이 불가합니다.</li>
							<li>- 경우에 따라 ATM 기기에서 가상계좌 입금이 안 될 수 있으니 가급적 인터넷/폰뱅킹 등을
								이용해주시기 바랍니다.</li>
							<li>- 예매 취소 시 예매수수료는 예매 당일 밤 12시 이전까지 환불되며, 그 이후 기간에는 환불되지
								않습니다.</li>
							<li>- 예매 취소 시점에 따라 취소수수료가 부과될 수 있습니다. 예매 후 취소마감시간과 함께 취소수수료를
								꼭 확인해주시기 바랍니다.</li>
						</ul>
					</div>
				</div>
				<!-- //공연안내 -->
			</div>
			<!-- //제 1 단계 : 관람일/회차 -->
		</div>
		<div class="result">
			<div id="perfboard" class="title">
				<p>
					<img
						src="${pageContext.request.contextPath}/upload/${show.subImage}"
						width="79" height="98" alt="">
				</p>
				<span id="ptitle" class="tit"><a title="${show.showName}">${show.showName}</a></span><span
					class="date">${show.startDate} ~ ${show.endDate}</span><span
					id="ptheatername" class="date"><a
					title="${show.concertHallName}">${show.concertHallName}</a></span><input
					id="hiddenGenreId" type="hidden" value="15457"><input
					id="hiddenDisplayRemainSeat" type="hidden" value="0">
			</div>
			<div class="select_infor">
				<h2>
					선택내역
				</h2>
				<br>
				<ul>
					<li><em id="day">날짜</em><span
						id="tk_day"></span></li>
				</ul>
			</div>		
			<div class="btn">
				<div id="StepCtrlBtnPanel" class="tc">
					<div id="StepCtrlBtn01" style="display: block;">
						<a id="nextButton" href="#none" class="dcursor"><img
							src="http://tkfile.yes24.com/img/perfsale/btn_next04.gif"
							alt="다음단계"></a>
					</div>
					<div id="StepCtrlBtn03" style="display: none;">
						<a class="dcursor" onclick="fdc_GoPrevStep(jcSTEP1);"><img
							src="http://tkfile.yes24.com/img/perfsale/btn_prev.gif"
							alt="이전단계"></a> <a class="dcursor"
							onclick="fdc_PromotionEnd();"><img
							src="http://tkfile.yes24.com/img/perfsale/btn_next02.gif"
							alt="다음단계"></a>
					</div>

				</div>
			</div>
		</div>
	</section>
</body>

<script>

$(document).ready(function() {
	let dayListEl;
	let dayList;
	var date;
	var showSq='${show.showSq}';
	console.log(showSq);
	var showingSq;
	
	// 오늘날짜
	var currentDate = new Date();
	var formattedDate = currentDate.toISOString().split('T')[0];
	// 페이지 로드되면 오늘날짜로 회차정보 가지고오기
	getShowingInfo(formattedDate);
	
	// 날짜를 클릭하면 데이터 가져오기
	function dayEvent(date) { 
		  console.log(date);
		  dayList.removeAllEvents();
		  var Seat = $("#remainingSeat");
		  $("#tk_day").text(date + "일");
		  
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
		showingSq = arg.event.extendedProps.hiddenValue; 
					
		var ShowingVO = {showingSq : showingSq};
		getshowing(ShowingVO);	
		
		}
	});
	dayList.render();
	
	//다음단계
	$("#nextButton").on("click", function(e) {
	    e.preventDefault();
	    console.log("다음");
	   
	    if (showingSq == null) {
	        alert("회차를 선택해주세요");
	    } else {
	
	    var url = "${pageContext.request.contextPath}/order/orderForm2/" + showSq+"/"+date;
	    // 페이지 이동
	    location.href = url; 
	    	
	    }
	
	});
	
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
		        //var endTime = result.data[i].showingDate + 'T' + result.data[i].endTime;
		        var showingSq = result.data[i].showingSq;
		        dayList.addEvent({
		          title: [i + 1] + '회차',
		          start: startTime,		         
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
	
	// 잔여좌석 정보 가져오기
	function getshowing(ShowingVO){
		var Seat = $("#remainingSeat");
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
			            	item += '<br>';    	
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
	};
	
});


</script>

</html>