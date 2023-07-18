<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/reset.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/adminForm.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/admin2.css"
	type="text/css">
<!-- 부트스트랩 -->
<link
	href="${pageContext.request.contextPath }/assets/css/bootstrap.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="https://image.yes24.com/sysimage/yesUI/yesUI.css?v=20230403"
	media="all">
<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap"
	rel="stylesheet">
<!-- 제이쿼리 최신버전 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 부트스트랩js -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
<!-- 풀켈린더js -->
<script type="text/javascript"
	src='${pageContext.request.contextPath }/assets/js/index.global.min.js'></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<style>
#bWrap1{height: 50px;}
#bWrap2{height: 50px;}
#bWrap1 .txt{height: 20px;width: 150px; display: flex; align-items: center; justify-content: center; }
#bWrap2 .txt{height: 20px;width: 150px; display: flex; align-items: center; justify-content: center;}
</style>
</head>
<body>
	<section>
		<!-- 헤더 -->
		<c:import url="/WEB-INF/views/includes/adminHeader.jsp"></c:import>
		<!-- //헤더 -->
	</section>

	<section>
		<div id="ySContent">
			<form id="showingInsertForm" method="get"
				action="${pageContext.request.contextPath}/admin/showingInsertForm">
				<!-- <div class="ySContRow w_900"> -->
				<!-- ==================== 정보 입력 영역 시작 ==================== -->
				<div class="tm_grp">
					<h3 class="tmM_txt">
						<em class="tit_txt"><strong id="adminTit"
							style="margin-left: 20px;">회차 등록</strong></em>
					</h3>
				</div>

				<!-- ==================== 캘린더 영역 시작 ==================== -->
				<div class="concertHall">
					<div class="inpRow">
						<div class="concertHall">
							<div class="imgCol" style="text-align: left; margin-left: 20px;">
								<strong>회차정보</strong>
							</div>
							<div class="position">
								<div id='calendar' class="calendar">1</div>
								<div id='dayList' class="calendar">2</div>
							</div>
						</div>
					</div>
				</div>

				<div class="yesFormBtn">
					<div class="formBtn_btn">
						<a id="insertConcertHall" href="" onclick=""
							class="btnC xb_size btn_blue btn_wSizeH "> <span id="bWrap1"
							class="bWrap"><em id="insertShowing" class="txt">등록</em></span>
						</a> <a id="cencleConcertHall" href="" onclick=""
							class="btnC xb_size btn_blue btn_wSizeH "> <span id="bWrap2"
							class="bWrap"><em id="emtxt" class="txt">취소</em></span>
						</a>
					</div>
				</div>
				<!-- </div> -->
			</form>
		</div>
	</section>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel"
						style="font-weight: bold;">회차추가 모달</h4>
				</div>
				<div class="modal-body">
					<table class="fc-list-table">
						<thead>
							<tr class="fc-list-day-cushion fc-cell-shaded"
								style="text-align: left; margin-top: 10px">
								<td>화요일</td>
							</tr>
							<tr class="modalhr">
								<th scope="col">공연명</th>
								<th scope="col">공연시간</th>
							</tr>
						</thead>
						<tbody class="tbshowing">
							<tr data-date="" class="">
							</tr>
							<tr class="showingInput">
								<td><input type="text" id="title" class="showingInput" readonly></td>
								<td><input type="time" id="startTime" class="showingInput" step="1800">
									~ <input type="time" id="endTime" class="showingInput" step="1800"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
			        <button id="btnInsert" type="button" class="btn btn-primary">등록</button>
			        <button id="btnDelete" type="button" class="btn btn-primary">삭제</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	
</body>
<script>
	$(document).ready(function() {
		let dayListEl;
		let dayList;
		let date;
		//let showName = '${show.showName}';

		/* function dayEvent(date) { // 날짜누르면 데이터 가지고오기
			// console.log(date);
			dayList.removeAllEvents();
			dayList.addEvent({
				// DB연결해서 데이터 불러오는 영역
				title : '오페라의 유령 1회',
				start : '2023-07-12T11:30:00',
				end : '2023-07-12T14:00:00'
			});
			dayList.render();
		}
		 */
		
		function dayEvent(date) { // 날짜를 클릭하면 데이터 가져오기
	        console.log(date);
	        dayList.removeAllEvents();

	        const ShowingVO = { showingDate: date, showSq: '${show.showSq}' }; // ShowingVO 객체를 생성하고 데이터 할당
	        /* console.log(ShowingVO); */

	        // 회차 정보 가져오기
	        $.ajax({
	          url: "${pageContext.request.contextPath}/show1/getShowing",
	          type: "post",
	          //contentType: "application/json",
	          data: ShowingVO,
	          
	          dataType: "json",
	          success: function(result) {    
	        	console.log(result);
	            for(var i = 0; i < result.data.length; i++){
	            	var showname = result.data[i].showName;
	               	var startTime =result.data[i].showingDate+'T'+result.data[i].startTime;
	               	var endTime =result.data[i].showingDate+'T'+result.data[i].endTime;
	               	var showingSq =  result.data[i].showingSq;
	               	dayList.addEvent({
	                  // DB연결해서 데이터 불러오는 영역
	                  title : showname + ' ' + [i+1] + '회차',
	                  start : startTime,                  
	                  end : endTime,
	                  hiddenValue: showingSq
	               });
	              }        
	          },
	          error: function(XHR, status, error) {
	            console.error(status + " : " + error);
	          }
	        });
			dayList.render();
	      }
		 
		//모달창 오픈 버튼 클릭		 
		function insertEvent(arg) { 
			// ShowingVO 객체를 생성하고 데이터 할당
			/* const VO = { 
				showName: '${show.showName}' 
			};  */
		
			//모달창 열기&초기화
			$('#myModal').modal('show');
			$('#title').val('${show.showName}');
			$('#startTime').val('');
			$('#endTime').val('');
		}
		
		//회차 삭제이벤트
		function deleteEvent(arg) {
			$('#btnDelete').on("click", function() {
				console.log(arg.event.extendedProps.hiddenValue);
			});
		}
		
		//ajax 회차등록 클릭 이벤트
		$('#btnInsert').on("click",	function() {
			const VO = { 
					showingDate: date, showSq: '${show.showSq}', showName: '${show.showName}' 
				}; 
			/* console.log($('#startTime').val());
			console.log($('#endTime').val()); */
			//데이터 모으기
			var startTime = date + '-' + $('#startTime').val();
			var endTime = date + '-' + $('#endTime').val();
			var ShowingVO = {
					showSq: VO.showSq,
					showingDate: VO.showingDate,
					startTime: startTime,
					endTime: endTime,
					showName: VO.showName
			}
			console.log(ShowingVO);
			// VO 넘기기
	        $.ajax({
	          url: "${pageContext.request.contextPath}/show1/InsertShowing",
	          type: "post",
	          //contentType: "application/json",
	          data: ShowingVO,
	          
	          dataType: "json",
	          success: function(result) {
	        	  console.log("ajax");
	        	  dayEvent(date);
	          },
	          error: function(XHR, status, error) {
	            console.error(status + " : " + error);
	          }
	        });
			//dayList.render();
			$("#myModal").modal("hide");
		});

		// 달력 초기화
		var calendarEl = $('#calendar')[0];
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth',
			selectable : true,
			// dateClick: true,
			locale : 'ko',
			timeZone : 'ko',
			dateClick : function(arg) {
				//console.log(arg);
				date = moment(arg.date).format("YYYY-MM-DD");
				// date = arg.dateStr;
				dayEvent(date);
				dayList.gotoDate(date);
			}
		});
		calendar.render();

		// 리스트 초기화
		dayListEl = $('#dayList')[0];
		dayList = new FullCalendar.Calendar(dayListEl, {
			initialView : 'listDay',
			locale : 'ko',
			timeZone : 'local',
			initialDate : moment().toDate(),
			eventClick : function(arg) {
				/* console.log(arg.event.title); // 클릭한 이벤트의 타이틀
				console.log(arg.event.start); // 클릭한 이벤트의 시작 시간
				console.log(arg.event.end); // 클릭한 이벤트의 종료 시간 */
				console.log('hiddenValue');
				var showingSq = arg.event.extendedProps.hiddenValue; 
				console.log(showingSq);
				$('#myModal').modal('show');
				$('#title').val(arg.event.title);
				$('#startTime').val(moment(arg.event.start).format('HH:mm'));
				$('#endTime').val(moment(arg.event.end).format('HH:mm'));
				$('#btnInsert').hide();
		        $('#btnDelete').show();
			},
			headerToolbar : {
				center : 'addEventButton'
			},
			customButtons : {
				addEventButton : {
					text : "회차추가",
					click : function(arg) {
						console.log("회차추가");
						console.log(date);
						/* console.log(arg); */
						insertEvent(arg);
						$('#btnInsert').show();
		                $('#btnDelete').hide();
					}
				}
			}
		});
	});
</script>
</html>