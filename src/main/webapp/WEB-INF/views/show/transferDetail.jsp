<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>transfer detail</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/reset.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/sub.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/detail.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/transferdetail.css" type="text/css">
<link rel="stylesheet" type="text/css" href="https://image.yes24.com/sysimage/yesUI/yesUI.css?v=20230403" media="all">

<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet">

<!-- 제이쿼리 최신 버전 -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<!-- 다음지도API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1d8e22ec81bcdc862373ee6f17fdef96&libraries=services"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<style>
.check {
  background-image: url("${pageContext.request.contextPath}/assets/images/체크버튼.PNG"); 
  background-size: cover; 
  background-position: center center; 
}
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
					<p class="rn-big-title">${show.showName}
						<c:if test="${transferBoard.transferStat == 'N'}">
						<span style="color:red">(판매 완료)</span>
						</c:if>
					</p>
					<div class="rn-product-short-data">
						<p>
							<span class="ps-date">${show.startDate} ~ ${show.endDate}</span><a
								href="#map" id="ps-location"><span class="ps-location">공연장
									위치보기</span></a>
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
							<dd>&nbsp;총 ${show.showTime}분 (인터미션 20분)</dd>
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
							<dt id="startTime">공연 날짜</dt>
							<dd id="divstartTime" class="rn-product-price">
							&nbsp;
							${transferBoard.startTime}
							</dd>
							<dt id="ticketSeat">좌석 번호</dt>
							<dd id="divticketSeat" class="rn-product-price">
							&nbsp;
							<span id="ticketSeatClass"></span>&nbsp;:&nbsp;${transferBoard.ticketSeat}좌석
							</dd>
							<dt id="hopePrice">판매 희망가</dt>
							<dd id="divhopePrice" class="rn-product-price">
							&nbsp;
							<span>
							<fmt:formatNumber type="number" maxFractionDigits="3"
							value="${transferBoard.hopePrice}" />원</span>
							</dd>
							<dt id="sellUserId">판매자</dt>
							<dd id="divsellUserId" class="rn-product-price">
							&nbsp;
							${transferBoard.userId}
							</dd>
							<dt id="transferBoardContent">게시내용</dt>
							<dd id="divtransferBoardContent" class="rn-product-price">
							&nbsp;
							${transferBoard.transferBoardContent}
							</dd>
						</dl>
					</div>
					<!--포인트-->
					<div>
					<form id="buyTicketButton" action="${pageContext.request.contextPath}/transferTicket/buyTransferTicket" method="post" style="display: none;">
						<input type="hidden" name ="transferBoardSq" value="${transferBoard.transferBoardSq}">
						<input type="hidden" name ="ticketSq" value="${transferBoard.ticketSq}">
						<input type="hidden" name ="ticketSeat" value="${transferBoard.ticketSeat}">
					</form>
					</div>
					<div class="rn-product-area3">
						<!--공연시간안내, 배송정보-->
						<dl>
							<dt>
								<strong id="precautions">양도거래간 유의사항</strong>
							</dt>
							<dd>
								양도 거래 완료 후 환불을 원하시면 환불 규정을 확인해주세요<br>
							</dd>
						</dl>
					</div>
				</div>
			</div>
			<div>
				<div class="rn-0803"><!--공연정보-->
					<h1>좌석 정보</h1>					
				</div>
				<div id="seatClassForm">
					<c:forEach items="${show.seatClass}" var="seatClass">
					<span class="${seatClass} seatClass">${seatClass}</span>
					</c:forEach>	
				</div>
				<br>
				<div id="container" class="container">
				<c:forEach items="${showSeatList}" var="showSeat">
					<span class="item ${showSeat.seatClass}" id="${showSeat.seatNo}" data-seatClass="${showSeat.seatClass}"></span>
				</c:forEach>
				</div>
			</div>		
		</div>	
		<div class="concertHall">					
			<div id="ticketingdiv">
			    <c:if test="${transferBoard.transferStat == 'Y'}">
					<div>
					        <a id="ticketing" href="#none" class="ticketing">양도표 구매하기</a>
					</div>
			    </c:if>					 				  
			</div>
			<div class="rn-0803"><!--공연정보-->
				<h1>공연 정보</h1>					
			</div>
			<div id="detailedImage"><img src="${pageContext.request.contextPath}/upload/${show.detailedImage}"></div>
		</div>
		<br>
		<h2>공연장 위치 정보</h2>
		
		<!-- 지도를 표시할 div 입니다 -->
		<div id="map" style="width: 1200px; height: 350px;"></div>
	</section>
	<!-- 탑버튼 -->
	<a href="#none" class="top_btn"><img
		src="${pageContext.request.contextPath }/assets/images/ver02/top.png"
		alt=""></a>
	<!-- /탑버튼 -->
	<!-- Footer -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- //Footer -->
</body>

<script>
	$(document).ready(function() {
		
		var authUser = '${sessionScope.authUser}'+'';
		
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
		
		//결제 API
		var IMP = window.IMP;
		IMP.init("imp61438883");
	
		// 양도표 좌석
		var seatNo = '${transferBoard.ticketSeat}';
		// 좌석 체크
		$("#"+seatNo).addClass("check");
		var ticketSeatClass = $(".check").data("seatclass");
		$("#ticketSeatClass").text(ticketSeatClass+'석');
		
		// 공연장 그리기
		var width = parseInt('${concertHall.concertHallWidth}');
	      // 공연장 세로 좌석 크기
	      var height = parseInt('${concertHall.concertHallHeight}');
	      var container = $('.container');
	      // 좌석 css
	      container.css({
	        'grid-template-columns': 'repeat(' + width + ', 30px)',
	        'display': 'grid',
	        'justify-content': 'center'
	      });
	      
	      const set = new Set();
	      // 모든 좌석의 등급가지고오기
	      var seatClassList = $("#container").children("span").map(function() {
	    	    return $(this).data("seatclass");
	    	}).get();
	      // 좌석등급 중복제거
	      for(index of seatClassList){
	    	  set.add(index);
	      }
	      
	      // 클래스 명 배열에 저장
	      var cssarr = ['red', 'pink', 'blue', 'green'];
	      var index2 = 0; // 클래스배열에서 사용할 인덱스
	      for (let index of set) {
	        $("." + index).addClass(cssarr[index2]);
	        index2++;
	      }
	    
	      
	    // 결제 번호 생성 ex)VIPB12023-07-24 10:42:37
	    var today = new Date();
	    var formattedDateTime = today.toISOString().slice(0, 19).replace('T', ' ');
	    var PaymentNumber = ticketSeatClass + seatNo + formattedDateTime;
	    	   	      	      
		 //구매버튼 클릭시
		$("#ticketing").on("click", function(e) {
			e.preventDefault()
			console.log("구매");
			if(authUser == ''){
				alert("로그인이 필요합니다.");
				window.location.href = '${pageContext.request.contextPath}/user/loginForm';
			}else{		
				var result = confirm("정말 구매 하시겠습니까?");
				if(result){
					IMP.request_pay({
						pg : 'kakaopay',
						pay_method : 'card', //생략 가능
						merchant_uid : PaymentNumber, // 상점에서 관리하는 주문 번호
						name : '주문명:결제테스트',
						amount : 100,
						buyer_email : 'iamport@siot.do',
						buyer_name : '구매자이름',
						buyer_tel : '010-1234-5678',
						buyer_addr : '서울특별시 강남구 삼성동',
						buyer_postcode : '123-456'
					}, function(rsp) { // callback
						if (rsp.success) {		
							console.log("결제 성공");
							
							$("#buyTicketButton").submit();
						
					
						} else {
							// 결제 실패 시 로직
							console.log("결제 실패");												
							
						}
					});
				}else{   }
			}	
		}); 

		var mapContainer = $("#map"); // 지도를 표시할 div 
		var mapOption = {
			center : new kakao.maps.LatLng(33.450701,
					126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 표시할 div와 지도 옵션으로 지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer.get(0),
				mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${concertHall.concertHallJibunAddr}',function(result, status) {
			// 정상적으로 검색이 완료됐으면
			if (status === kakao.maps.services.Status.OK) {
				var coords = new kakao.maps.LatLng(
						result[0].y,
						result[0].x);

				// 결과값으로 받은 위치를 마커로 표시합니다
				var marker = new kakao.maps.Marker(
						{
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

	});
</script>
</html>