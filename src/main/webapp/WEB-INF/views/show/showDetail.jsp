<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>show detail</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/reset.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/sub.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/detail.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/review.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/showDetail.css" type="text/css">
<link rel="stylesheet" type="text/css" href="https://image.yes24.com/sysimage/yesUI/yesUI.css?v=20230403" media="all">

<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet">

<!-- 제이쿼리 최신 버전 -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<!-- 다음지도API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1d8e22ec81bcdc862373ee6f17fdef96&libraries=services"></script>
<!-- 풀켈린더js -->
<script type="text/javascript" src='${pageContext.request.contextPath }/assets/js/index.global.min.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<style>

</style>
</head>
<body>
	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- //헤더 -->
	<section>
		<div class="renew-wrap">
			<div class="renew-content">				
				<div class="rn-02">
					<!--제목-->
					<p class="rn-big-title">${show.showName}<span id="noneTicketing"></span> </p>
					<div class="rn-product-short-data">
						<p>
							<span class="ps-date">${show.startDate} ~ ${show.endDate}</span><a
								href="#maptitle" id="ps-location"><span class="ps-location">공연장
									위치보기</span></a>
								<a href="#review" id="ps-location2"><span class="ps-location">리뷰 보기</span></a>
						</p>
					</div>
				</div>
				<!--rn-02-->
			</div>
		</div>
		<div class="renew-content">
			<div class="rn-03">
				<!--상단-->
				<div class="rn-03-left">
					<!--포스터, 지역, 동영상-->
					<div class="rn-product-imgbox">
						<img
							src="${pageContext.request.contextPath}/upload/${show.subImage}">
						<a href="#" class="rn-product-movie" style="display: none;"><img
							src="http://tkfile.yes24.com/imgNew/common/kv-movie.png" alt=""></a>
					</div>
					<div class="rn-product-maps" id="divPerfRelation"
						style="display: none;"></div>
					<div class="rn-product-social">
						<a href="javascript:;" class="rn-product-good"> <img
							src="http://tkfile.yes24.com/imgNew/sub/rn-product-good1.png"
							alt=""><img
							src="http://tkfile.yes24.com/imgNew/sub/rn-product-good2.png"
							alt=""><span class="rn-pdg-txt2">평점</span><span
							class="rn-pdg-txt1">${show.gradeAvg}점</span>
						</a>

					</div>
				</div>
				<!--rn-03-left-->
				<div class="rn-03-right">
					<!--상품정보-->
					<div class="rn-product-area1">
						<!--등급, 관람시간, 출연, 가격, 혜택-->
						<dl>
							<dt>등급</dt>
							<dd>&nbsp;${show.viewingAge}세 이상</dd>
							<dt>관람시간</dt>
							<dd>&nbsp;총 ${show.showTime}</dd>
							<dt>출연</dt>
							<dd>
								&nbsp;<a href="https://www.google.com/search?q=${show.cast}"
									target="_blank" class="rn-product-peole">${show.cast}</a>
							</dd>
							<dt>연출자</dt>
							<dd>
								&nbsp;<a href="https://www.google.com/search?q=${show.director}"
									target="_blank" class="rn-product-peole">${show.director}</a>
							</dd>
							<dt id="dtPrice">가격</dt>
							<dd id="divPrice" class="rn-product-price">
								<div id="mCSB_3"
									class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
									tabindex="0" style="max-height: none;">
									<div id="mCSB_3_container"
										class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
										style="position: relative; top: 0; left: 0;" dir="ltr">
										<ul
											class="rn-product-price1 scroll-color mCustomScrollbar _mCS_3 mCS_no_scrollbar">
											<c:forEach items="${show.seatClass}" var="seatClass"
												varStatus="status">
												<li>${seatClass}석&nbsp;:&nbsp;<span class="rn-red">
														<fmt:formatNumber type="number" maxFractionDigits="3"
															value="${show.seatPrice[status.index]}" />
												</span>원
												</li>
											</c:forEach>

										</ul>
									</div>
								</div>
							</dd>
						</dl>
					</div>
					<!--포인트-->

					<div class="rn-product-area3">
						<!--공연시간안내, 배송정보-->
						<dl>
							<dt><strong id="precautions">예매 유의사항</strong></dt>
							<dd>
								예매는 PC, 모바일, 고객센터 를 통해 신용카드, 가상계좌(무통장 입금) 등으로 예매하실 수 있습니다. <br>								
								무통장입금 결제 선택 시 입금 마감시간은 예매일 익일 밤 11시 29분까지입니다.<br> 
								입금 마감시간 내 미입금 된 경우 예매가 자동 취소됩니다. <br>
								(단, 상품에 따라 예매 당일 밤 11시 29분에 마감되는 경우가 있으니 예매 전후 반드시 확인해주시기 바랍니다.)<br>
								
							</dd>
						</dl>
					</div>
				</div>
			</div>
			
				<!-- ==================== 캘린더 영역 시작 ==================== -->
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
				<!-- ==================== 캘린더 영역 끝 ==================== -->				
			<div id="ticketingdiv">
				<div>
					<a id="ticketing" href="#none" class="ticketing">예매하기</a>
				</div>
			</div>
			<div class="rn-0803"><!--공연정보-->
				<h1>공연 정보</h1>					
			</div>
			<div id="detailedImage"><img src="${pageContext.request.contextPath}/upload/${show.detailedImage}"></div>
		<br id="maptitle">
		<br>
		<br>
		<br>
		<br>		
		<br>
		<br>
		<br>
		</div>
		<h2>공연장 위치 정보</h2>
		<br>
		<!-- 지도를 표시할 div 입니다 -->
		<div id="map" style="width: 1200px; height: 350px;"></div>
		<section id="review" style="width: 1200px;">
			<p class="rn-tab-area-tit"><span>관람후기</span></p>
			<div class="rn-0903"><!--후기등록전 안내문, 팝업버튼-->
				<div class="rn-09-tit tab02-afterword">
					<p class="rn-red">매매, 욕설 등 예스24 게시판 운영 규정에 위반되는 글은 사전 통보없이 삭제될 수 있습니다.</p>
					<p>개인정보가 포함된 내용은 삼가 주시기 바라며, 게시물로 인해 발생하는 문제는 작성자 본인에게 책임이 있습니다.</p>
					<a id="insertReviewForm" href="#none"><img src="http://tkfile.yes24.com/imgNew/sub/rn-btn-review.png" alt=""></a>
				</div>
			</div>
			<div class="rn-0904-container">
				<ul id="reviewul" class="rn-0904">
					<c:forEach items="${reviewList}" var="review">
						<li>
							<div class="rn-0904-ttbox">
								<span class="rn-0904-tt1">예매자</span>
								<span class="rn-0904-tt2">${review.userId}</span>
								<span class="rn-0904-tt3">${review.reviewRegDate}</span>
								<span class="rn-0904-tt4" data-star="4">
								<c:set var="endValue" value="${review.grade-1}" />
									<c:forEach begin="0" end="${endValue}">
										<c:if test="${review.grade != 0}">
											<img src="http://tkfile.yes24.com/imgNew/common/rn-ico-tt4-1.png" alt="">
										</c:if>
									</c:forEach>									
								</span>
								<%-- <span class="rn-0904-tt7">(관람일:${review.viewingday})</span> --%>
							</div>
							<div class="rn-0904-txt-wrap">
							<div class="rn-0904-txt">${review.reviewContent}</div>
							</div>
						</li>
					</c:forEach>
				</ul>
				<!-- 페이징 -->
				<c:if test="${empty keyword}">
					<ul class="paging pageInfo">
						<c:if test="${pageMaker.prev}">
							<li class="pageInfo_btn previous"><a
								href="${pageMaker.startPage - 1}">◀</a></li>
						</c:if>
						<!-- 각 번호 페이지 버튼 -->
						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }">
								<a class="anum" href="${num}">${num}</a>
							</li>
						</c:forEach>
						<!-- 다음페이지 버튼 -->
						<c:if test="${pageMaker.next}">
							<li class="pageInfo_btn next"><a
								href="${pageMaker.endPage + 1}">▶</a></li>
						</c:if>
					</ul>
				</c:if>
				<form id="moveForm"
					action="${pageContext.request.contextPath}/show/detail/${pageMaker.cri.keyword}?#review"
					method="get">
					<input type="hidden" name="pageNum"
						value="${pageMaker.cri.pageNum}"> <input type="hidden"
						name="amount" value="${pageMaker.cri.amount}"> <input
						type="hidden" id="keyword" name="keyword"
						value="${pageMaker.cri.keyword}"> 
				</form>
			</div>			
		</section>			
	</section>
	
	<!-- 탑버튼 -->
	<a href="#none" class="top_btn"><img
		src="${pageContext.request.contextPath }/assets/images/ver02/top.png"
		alt=""></a>
	<!-- /탑버튼 -->

	<!-- Footer -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- //Footer -->
	
	<!-- 리뷰 등록 -->	
		<section id="inquiry_popup" class="inquiry_popup"
			style="display: none;">
			<a href="#none" class="inquiry_close"><img
				src="images/ver02/close.png" alt=""></a>
			<div class="inquiry_write">
				<h3>리뷰</h3>
				<form id="moveForm1"
					action="#none">
					<table>
						<colgroup>
							<col width="20%">
							<col width="80%">
						</colgroup>						
						<tr>
							<th><label for="inquiry_tit">평점</label></th>
							<td><select id="grade" name="grade" class="grade">
										<option value="1" selected="selected">★☆☆☆☆</option>
										<option value="2">★★☆☆☆</option>
										<option value="3">★★★☆☆</option>
										<option value="4">★★★★☆</option>
										<option value="5">★★★★★</option>
								</select>
							</td>
						</tr>
						<tr>
							<th><label for="inquiry_cont">리뷰 내용</label></th>
							<td><textarea name="reviewContent" id="content"
									placeholder="700자 이하 입력가능" required></textarea>
								<div class="textLengthWrap">
									<span class="textCount">0자</span> <span class="textTotal">/
										700자</span>
								</div></td>
						</tr>
					</table>
					<div class="btn_wrap">
						<a id="insertReviewButton" href="#none" class="order_btn">리뷰작성</a> <a
							href="#none" class="shopping_btn">취소</a>
					</div>
				</form>
			</div>
		</section>
</body>

<script>
$(document).ready(function() {
	
	 var today = new Date();
     var year = today.getFullYear();
     var month = today.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줌
     var day = today.getDate();

     // 월과 일이 10보다 작은 경우 앞에 0을 붙여 두 자리로 만듭니다.
     if (month < 10) {
       month = '0' + month;
     }
     if (day < 10) {
       day = '0' + day;
     }

     // 결과를 특정 요소에 출력합니다. 원하는 형식으로 문자열을 생성합니다.
   	var sysdate =(year + '.' + month + '.' + day);
	
	let dayListEl;
	let dayList;
	let date;
	
	var showSq = '${show.showSq}';
	var showStat = '${show.showStat}';
	var authUser = '${sessionScope.authUser}'+'';

		
	//페이징 버튼 클릭
	$(".pageInfo a").on("click", function(e) {
		e.preventDefault();
		var pageNum = $(this).attr("href");
		$("#moveForm input[name='pageNum']").val(pageNum);
		$("#moveForm").submit();
	});
	
	// 관람후기 등록폼
	$("#insertReviewForm").on("click",function(){
		console.log("리뷰등록폼");

		// 로그인 안되면 로그인 페이지로
		if(authUser == ''){
			alert("로그인이 필요합니다.");
			window.location.href = '${pageContext.request.contextPath}/user/loginForm';
			
		}else{	
			
			ReviewVO = {showSq : showSq};
			
			$.ajax({
				
				url : "${pageContext.request.contextPath }/review/viewingCheck",		
				type : "post",
				data : ReviewVO,

				dataType : "json",
				success : function(result){
						
					if(result.data[0] != null){ 
	
						$("#inquiry_popup").show();
					
					}else{
						
						alert("관람후 작성 가능합니다.");
					}
					
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		}
	});
	
	// 후기등록폼 취소버튼
	$(".btn_wrap .shopping_btn").on("click", function() {
		console.log("취소");
		
		$("#grade").val("1").prop("selected", true);
		$("#content").val("");
		$('#inquiry_popup').hide();
		
	});	
	
	//후기 등록
	$("#insertReviewButton").on("click",function(){
		console.log("후기 등록");
		
		var grade = $("#grade").val();
		var reviewContent = $("#content").val();
		
		var ReviewVO = {grade : grade, reviewContent : reviewContent , showSq : showSq };
		
		$.ajax({
			
			url : "${pageContext.request.contextPath}/review/insertReview",		
			type : "post",
			//contentType : "application/json",
			data : ReviewVO,

			dataType : "json",
			success : function(result){
				console.log(result);
				var review = result.data;
				$("#grade").val("1").prop("selected", true);
				$("#content").val("");
				$('#inquiry_popup').hide();
				
				addReview(review);
				
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
	
	
	  //top버튼
    $( window ).scroll( function() {
      if ( $( this ).scrollTop() > 200 ) {
        $( '.top_btn' ).fadeIn();
      } else {
        $( '.top_btn' ).fadeOut();
      }
    } );
    $( '.top_btn' ).click( function() {
      $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
      return false;
    } );

	
	
		
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
		        if (result.data[0] != null) {
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
			   	}else{
			   		console.log("비었음");
			   		var item2 = '<div style="margin-bottom: 5px;">잔여 좌석이 없습니다</div>';
			   		Seat.append(item2);
			   	}    
		    },
		    error: function(XHR, status, error) {
		      console.error(status + " : " + error);
		    }
		  });
		}
	});
	dayList.render();
	
	
	

	if(showStat == 1){
				
		 $("#ticketingdiv").css("display", "none");
		 $("#noneTicketing").text("(개봉 예정작)");
		 
	}else{
		//예매버튼 클릭시
		$("#ticketing").on("click", function(e){
			e.preventDefault()
			console.log("예매");
			
				// 로그인 안되면 로그인 페이지로
				if(authUser == ''){
					alert("로그인이 필요합니다.");
					window.location.href = '${pageContext.request.contextPath}/user/loginForm';
					
				}else{		
					popup();
				}
		});
	}
	//팝업창
	function popup() {
    var url = '${pageContext.request.contextPath}/order/orderForm/'+showSq;
    var name = "ticketing";

    
    var width = 990;
    var height = 720;

    // 모니터의 가로 길이와 세로 길이를 구한다
    var screenWidth = window.screen.width;
    var screenHeight = window.screen.height;

    // 창을 모니터 가운데에 위치시키기 위한 좌표 값을 계산
    var left = (screenWidth - width) / 2;
    var top = (screenHeight - height) / 2;

    // 수정된 부분: 위치 및 창 속성을 설정
    var option = "width=" + width + ", height=" + height + ", top=" + top + ", left=" + left + ", location=no";

    window.open(url, name, option);
	}

	var mapContainer = $("#map"); // 지도를 표시할 div 
	var mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	// 지도를 표시할 div와 지도 옵션으로 지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer.get(0), mapOption);

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${concertHall.concertHallJibunAddr}', function(result, status) {
		// 정상적으로 검색이 완료됐으면
		if (status === kakao.maps.services.Status.OK) {
			var coords = new kakao.maps.LatLng(result[0].y,
					result[0].x);

			// 결과값으로 받은 위치를 마커로 표시합니다
			var marker = new kakao.maps.Marker({
				map : map,
				position : coords
			});

			// 인포윈도우로 장소에 대한 설명을 표시합니다
			var infowindow = new kakao.maps.InfoWindow(
					{
						content : '<div id="cName">&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/assets/images/극장.png"/> ${concertHall.concertHallName}</div>'
					});
			infowindow.open(map, marker);

			// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			map.setCenter(coords);
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
	
	// 리뷰 그리기
	function addReview(review){
		var item = '';
		item +='<li>';
		item +='	 <div class="rn-0904-ttbox">';
		item +='		<span class="rn-0904-tt1">예매자</span>';
		item +='		<span class="rn-0904-tt2">' + review.userId + '</span>';
		item +='		<span class="rn-0904-tt3">' + review.reviewRegDate + '</span>';
		item +='		<span class="rn-0904-tt4" data-star="4">';
		
		for (var i = 0; i < review.grade; i++) {
			
			item +='<img src="http://tkfile.yes24.com/imgNew/common/rn-ico-tt4-1.png" alt="">';
			
		}
		item +='		</span>';
		item +='		<span class="rn-0904-tt7">(관람일:' + review.viewingday + ')</span>';
		item +='	 </div>';
		item +='	 <div class="rn-0904-txt-wrap">';
		item +='	 <div class="rn-0904-txt">' + review.reviewContent + '</div>';
		item +='	 </div>';
		item +='</li>';
		
		$("#reviewul").prepend(item);
	};
	
});
</script>
</html>