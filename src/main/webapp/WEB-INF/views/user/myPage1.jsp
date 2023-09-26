<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage ticketing check</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/reset.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/sub.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/user.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/myPage.css" type="text/css">
<link rel="stylesheet" type="text/css" href="https://image.yes24.com/sysimage/yesUI/yesUI.css?v=20230403" media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/myPageticketingcheck.css" type="text/css">

<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet">

<!-- 제이쿼리 최신버전 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>

</style>
</head>
<body>
	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- //헤더 -->
	<section>
		<div id="warp">
			<!-- container -->
			<div id="container">
				<!-- 본문 -->
				<div class="cont_section">
					<!-- aside -->
					<c:import url="/WEB-INF/views/includes/userNav.jsp"></c:import>
					<!-- //aside -->

					<div class="date_list bg">
						<br> <b class="subtitle">나의 예매리스트</b>
						<div>
							<ul>
								<li class="sec"><span>예매일자별 조회</span> <input id="txtStart"
									type="text" class="date imedisable w70 hasDatepicker"
									style="width: 90px; " autocomplete="off"><img
									class="ui-datepicker-trigger"
									src="https://stkfile.yes24.com/img/mypage/btn_cal.gif"
									alt="날짜를 선택하세요.
					
					<달력콘트롤>
					년(年)단위 이동: Ctrl + PgUp/PgDn 키
					월(月)단위 이동: PgUp/PgDn 키"
									title="날짜를 선택하세요.
					
					<달력콘트롤>
					년(年)단위 이동: Ctrl + PgUp/PgDn 키
					월(月)단위 이동: PgUp/PgDn 키">
									~ <input id="txtEnd" type="text"
									class="date imedisable w70 hasDatepicker"
									style="width: 90px; position: relative;"
									autocomplete="off"><img class="ui-datepicker-trigger"
									src="https://stkfile.yes24.com/img/mypage/btn_cal.gif"
									alt="날짜를 선택하세요.
					
					<달력콘트롤>
					년(年)단위 이동: Ctrl + PgUp/PgDn 키
					월(月)단위 이동: PgUp/PgDn 키"
									title="날짜를 선택하세요.
					
					<달력콘트롤>
					년(年)단위 이동: Ctrl + PgUp/PgDn 키
					월(月)단위 이동: PgUp/PgDn 키">
									<a id="imgSearch" href="#"><img
										src="https://stkfile.yes24.com/img/mypage/btn_srch.gif"
										alt="조회"></a></li>
							</ul>
						</div>
					</div>

					<div class="mypage_contain">
						<div class="mycont">
							<h2 class="tit">
								&nbsp;<b class="subtitle">예매내역</b> <span>${user.userName}님께서
									최근 3개월간 예매하신 내역입니다.</span>
							</h2>
							<div id="divOrderList" style="">
								<table class="tmypage" summary="최근 예매내역 리스트">
									<colgroup>
										<col width="12%">
										<col width="8%">
										<col width="*">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
									</colgroup>
									<thead>
										<tr>
											<th scope="row" class="fst">예매일</th>
											<th scope="row">예매번호</th>
											<th scope="row">공연명</th>
											<th scope="row">좌석</th>
											<th scope="row">관람일시</th>
											<th scope="row">금액</th>
											<th scope="row">예매상태</th>
											<th scope="row">버튼</th>
										</tr>
									</thead>
									<tbody>
										<!-- <tr>
												<td colspan="8" class="le ri">최근 예매내역이 없습니다.</td>
											</tr> -->
										<c:forEach items="${myTicketingList}" var="myTicketing">
											<tr>
												<td scope="row" class="fst">${myTicketing.ticketingDate}</td>
												<td scope="row">${myTicketing.ticketingSq}</td>
												<td scope="row"><a id="showHref"
													href="${pageContext.request.contextPath}/show/detail/${myTicketing.showSq}">${myTicketing.showName}</a></td>
												<td scope="row">${myTicketing.ticketSeat}</td>
												<td scope="row">${myTicketing.startTime}</td>
												<td scope="row"><fmt:formatNumber type="number"
														maxFractionDigits="3"
														value="${myTicketing.ticketSeatPrice}" />원</td>
												<c:if test="${myTicketing.ticketStat == '1'}">
													<td scope="row">예매</td>
												</c:if>
												<td scope="row"><button class="transferButton"
														type="button" data-ticketsq="${myTicketing.ticketSq}"
														data-showsq="${myTicketing.showSq}"
														data-showname="${myTicketing.showName}"
														data-ticketseat="${myTicketing.ticketSeat}"
														data-ticketingsq="${myTicketing.ticketingSq}"
														data-ticketingdate="${myTicketing.ticketingDate}"
														data-starttime="${myTicketing.startTime}"
														data-ticketseatprice="${myTicketing.ticketSeatPrice}">양도</button></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<div id="mypage_contain2" class="mypage_contain">
						<div class="mycont">
							<h2 class="tit">
								&nbsp;<b class="subtitle">양도 거래내역</b> <span>양준우님께서 최근
									3개월간 양도하신 내역입니다.</span>
							</h2>
							<div id="divOrderList" style="">
								<table class="tmypage" summary="최근 양도내역 리스트">
									<colgroup>
										<col width="12%">
										<col width="8%">
										<col width="*">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
									</colgroup>
									<thead>
										<tr>
											<th scope="row" class="fst">양도등록일</th>
											<th scope="row">게시번호</th>
											<th scope="row">공연명</th>
											<th scope="row">좌석</th>
											<th scope="row">티켓금액</th>
											<th scope="row">희망금액</th>
											<th scope="row">양도상태</th>
											<th scope="row" class="end">버튼</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${myTransferTicketList}" var="transferTicket">
											<tr>
												<td scope="row" class="fst">${transferTicket.transferBoardRegDate}</td>
												<td scope="row">${transferTicket.transferBoardSq}</td>
												<td scope="row"><a id="showHref2"
													href="${pageContext.request.contextPath}/show/detail/${transferTicket.showSq}">${transferTicket.showName}</a></td>
												<td scope="row">${transferTicket.ticketSeat}</td>												
												<td scope="row"><fmt:formatNumber type="number"
														maxFractionDigits="3"
														value="${transferTicket.ticketSeatPrice}" />원</td>
												<td scope="row"><fmt:formatNumber type="number"
														maxFractionDigits="3"
														value="${transferTicket.hopePrice}" />원</td>
												<c:if test="${transferTicket.ticketActive == 'Y'}">
													<td scope="row">양도중</td>
													<td scope="row"><button class="transferCancelButton"
														type="button" data-ticketsq="${transferTicket.ticketSq}"														
														data-transferboardsq="${transferTicket.transferBoardSq}">취소</button></td>
												</c:if>
												<c:if test="${transferTicket.ticketActive == 'N'}">
													<td scope="row">양도완료</td>
												</c:if>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

				<!-- //container -->

				<div class="mycont mypage_gray_box03">
					<h2 class="tit">
						<img src="https://stkfile.yes24.com/img/mypage/h2_mtit09.gif"
							alt="유의사항">
					</h2>
					<div class="gray_box03">
						<ul>
							<li class="red">- 취소 시 예매수수료는 예매 당일 밤 12시 이전까지 환불되며, 그 이후
								기간에는 환불되지 않습니다.</li>
							<li>- 티켓 수령 방법 변경(현장수령 -&gt; 배송)은 예매 완료된 건에 한하며, 배송비 결제는
								신용카드만 결제 가능합니다.(단 공연일 기준 12일 전까지 / 일부 공연 불가)</li>
							<li>- 다음과 같은 경우 PC/모바일에서는 취소 또는 부분취소가 불가하오니 고객센터로 문의해주시기
								바랍니다.<br> &nbsp;&nbsp; 1) YES머니, YES상품권, 쿠폰 등 예스24 결제수단을
								사용하여 예매한 경우<br> &nbsp;&nbsp; 2) 무통장입금 예매 후 신용카드로 배송비를 추가
								결제한 경우<br> &nbsp;&nbsp; 3) 티켓 배송이 완료되었거나 시작된 경우<br>
								&nbsp;&nbsp;&nbsp;&nbsp;(취소마감시간 이전에 고객센터로 반송되어야 취소 가능, 취소 수수료는
								티켓 도착일 기준으로 부과되며 배송비는 환불 불가)
							</li>
							<li>- 예매 티켓 배송은 예매완료 후 4~5일 이내(영업일 기준) 배송해드립니다. 티켓 분실 시 재발권이
								불가하오니, 보관에 주의해주시기 바랍니다.<br> &nbsp;&nbsp;&nbsp;(일괄배송 공연일 경우
								일괄배송일 기준 4~5일(영업일 기준) 이내에 수령 가능)
							</li>
							<li>- 예매 취소 시 결제 금액에서 수수료를 제외한 금액만큼 환불 처리 됩니다. <br>&nbsp;&nbsp;&nbsp;(부분
								취소 시에는 잔여 티켓 금액 + 수수료 등을 제외하고 환불 처리 됩니다.)
							</li>
							<li>- 복합결제로 예매한 경우 전체 취소 시 각 결제 수단(YES머니, YES상품권 등)으로
								자동환급됩니다. 단 YES상품권, 예매권 등 사용기한이 <br> &nbsp;&nbsp;&nbsp;만료된
								경우 재사용하실 수 없습니다.
							</li>
							<li>- 예매 취소 시점과 해당 카드사의 환불 처리 기준에 따라 환급방법과 환급일은 다소 차이가 있을 수
								있습니다.</li>
						</ul>
					</div>
				</div>
				<!-- //본문 -->
			</div>
			<!--//container -->
		</div>
	<!-- Footer -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- //Footer -->
	</section>


	<!-- 양도 등록 -->
	<section id="inquiry_popup" class="inquiry_popup"
		style="display: none;">
		<a href="#none" class="inquiry_close"><img
			src="images/ver02/close.png" alt=""></a>
		<div class="inquiry_write">
			<h3>양도등록</h3>
			<form id="moveForm1" action="#none" >
				<table>
					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>
					<tr>
						<th><label for="inquiry_tit">제목</label></th>
						<td><input type="text" id="showName" name="showName"
							required readonly>
							<input type="hidden" id="ticketSq">
							<input type="hidden" id="domain">
							</td>
					</tr>
					<tr>
						<th><label for="inquiry_cont">좌석 번호</label></th>
						<td><input type="text" id="seatNo" name="seatNo"
							required readonly></td>
					</tr>
					<tr>
						<th><label for="inquiry_cont">일시</label></th>
						<td><input type="text" id="startTime" name="startTime" required readonly></td>
					</tr>

					<tr>
						<th><label for="inquiry_cont">구입금액</label></th>
						<td> 
						<input type="text" id="byPrice" name="byPrice" required readonly />  						
						</td>
					</tr>
					<tr>
						<th><label for="inquiry_cont">판매금액</label></th>
						<td><input type="number" id="hopePrice" name="hopePrice" step="100"
							placeholder="판매희망 금액" required>
							</td>
					</tr>
					<tr>
						<th><label for="inquiry_cont">게시 내용</label></th>
						<td><textarea name="content" id="content"
								placeholder="100자 이하 입력가능" ></textarea>
							<div class="textLengthWrap">
								<span class="textCount">0자</span> <span class="textTotal">/
									100자</span>
							</div></td>
					</tr>
				</table>
				<div class="btn_wrap">
					<a id="insertTransfer" href="#none" class="order_btn">양도등록</a> <a
						href="#none" class="shopping_btn">취소</a>
				</div>
			</form>
		</div>
	</section>
</body>
<script>
	$(document).ready(function() {

			      
		//  양도버튼 클릭
		$(".transferButton").on("click", function() {
			$("#inquiry_popup").show();
			console.log("양도");
			// 양도등록창에 정보 보내기
			var ticketSq = $(this).data("ticketsq");
			var showSq = $(this).data("showsq");
			var showName = $(this).data("showname");
			var ticketSeat = $(this).data("ticketseat");
			var ticketingSq = $(this).data("ticketingsq");
			var ticketingDate = $(this).data("ticketingdate");
			var startTime = $(this).data("starttime");
			var price = $(this).data("ticketseatprice");
			
			// 금액포맷
			var ticketSeatPrice = new Intl.NumberFormat('ko-KR').format(price);   
		
					
			$("#ticketSq").val(ticketSq);
			$("#showName").val(showName);
			$("#seatNo").val(ticketSeat);
			$("#startTime").val(startTime);
			$("#byPrice").val(ticketSeatPrice+" 원");
			$("#hopePrice").attr("max",price);
			
			
			// 양도신청 버튼
			$("#insertTransfer").on("click", function() {
				console.log("양도등록");
				
				var priceCheck = $("#hopePrice").val();
				
				if(priceCheck < price){
					var transferBoardContent = $("#content").val();
					var hopePrice = $("#hopePrice").val();
					 
					TransferBoardVO = {ticketSq : ticketSq, transferBoardContent : transferBoardContent, hopePrice : hopePrice}
					
								
				 	$.ajax({
					    url: "${pageContext.request.contextPath}/transferTicket/insertTransferTicket",
					    type: "post",
					    //contentType: "application/json", 				    
					    data: TransferBoardVO ,
					    
					    dataType: "json",				    
					    success: function(result) {
					    	console.log(result);
					    
					    	location.reload();
					    },
					    error: function(XHR, status, error) {
					      console.error(status + " : " + error);
					    }
				 	});
				}else{
					
					alert("원래가격보다 높게 등록할수없습니다.");
				}
				
			});

		});

		// 양도 취소
		$(".transferCancelButton").on("click",function(){
			
			var result = confirm("정말 취소 하시겠습니까?");
			if (result) {
				
				var ticketSq = $(this).data("ticketsq");
				var transferboardsq = $(this).data("transferboardsq");
							
				MyTicketingVO = {ticketSq : ticketSq, transferBoardSq : transferboardsq};
				
				
				$.ajax({
				    url: "${pageContext.request.contextPath}/transferTicket/cancelTransferTicket",
				    type: "post",
				    //contentType: "application/json", 				    
				    data: MyTicketingVO ,
				    
				    dataType: "json",				    
				    success: function(result) {
				    	console.log(result);
				    
				    	location.reload();
				    },
				    error: function(XHR, status, error) {
				      console.error(status + " : " + error);
				    }
			 	});
			}else{
				
				
			}
			
		});
		
		
		// 양도등록폼 취소버튼
		$(".btn_wrap .shopping_btn").on("click", function() {
			console.log("취소");
			$('#inquiry_popup').hide();
		});	
		
		
	});
		
</script>

</html>