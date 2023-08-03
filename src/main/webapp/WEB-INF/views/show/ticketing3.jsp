<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ticketing payment</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/reset.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/ticketing.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/ticketingpayment.css" type="text/css">

<!-- 제이쿼리 최신 버전 -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<style>
.gnb li {float: left;background:url("${pageContext.request.contextPath}/assets/images/예매순서.png");	height: 52px;width: 120px;}
#View {width: 688px;height: 300px; background:	url("${pageContext.request.contextPath}/assets/images/페이결제.png");}
</style>
</head>
<body>
	<div id="header" class="header">
		<h1>
			<img src="${pageContext.request.contextPath}/assets/images/로고2.PNG"
				alt="YES24.com">
		</h1>
		<ul class="gnb">
			<li class="m01"><span>관람일/회차</span></li>
			<li class="m02"><span>좌석선택</span></li>
			<li class="m03 on"><span>결제방법</span></li>
		</ul>
	</div>
	<section>
		<div id="ContentsArea" class="container" style="display: block;">
			<!-- 결제API -->
			<div id="step01"></div>					
			<div class="step05" id="step05" style="display: block;">
				<h2 style="">
					<img src="http://tkfile.yes24.com/img/perfsale/h2_tit06.gif"
						alt="결제방법"> <span><img
						src="http://tkfile.yes24.com/img/perfsale/icon_nt.gif" alt=""></span>
				</h2>
			</div>
			<br>			
			<div id="View"></div>
			
			<div class="caution bgbrn" id="cancelFeeInfo">
				<!--h5>취소수수료 안내 및 이용 약관</h5-->
				<table class="boardListTypeB tb_w">
					<colgroup>
						<col width="33%" align="center">
						<col width="38%" align="center">
						<col width="*">
					</colgroup>
					<thead>
						<tr>
							<th>내용</th>
							<th>취소수수료</th>
							<th>비고</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>예매 후 7일 이내</td>
							<td>없음</td>
							<td rowspan="5" class="bl_p alignLeft">- 취소 시 예매수수료는 예매 당일 밤
								12시 이전까지만 환불됩니다. <br> - 예매 후 7일 이내라도 취소시점이 관람일로부터 10일 이내라면
								그에 해당하는 취소수수료가 부과됩니다. <br> - 관람 당일 취소 가능 상품의 경우 관람 당일 취소 시
								티켓금액의 90%가 취소수수수료로 부과됩니다.
							</td>
						</tr>
						<tr>
							<td>예매 후 8일 ~ 관람일 10일 전까지</td>
							<td>뮤지컬, 콘서트, 클래식 등: <span class="red">장당 4,000원</span> /<br>
								연극, 전시 등: <span class="red">장당 2,000원</span> <br>(단, 티켓 금액의
								10% 이내)
							</td>
						</tr>
						<tr>
							<td>관람일 9일 전 ~ 관람일 7일 전까지</td>
							<td>티켓금액의 <em class="red">10%</em></td>
						</tr>
						<tr>
							<td>관람일 6일 전 ~ 관람일 3일 전까지</td>
							<td>티켓금액의 <em class="red">20%</em></td>
						</tr>
						<tr>
							<td>관람일 2일 전 ~ 관람일 1일 전까지</td>
							<td>티켓금액의 <em class="red">30%</em></td>
						</tr>
					</tbody>
				</table>
			</div>		
			<!-- end 결제API -->
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
					title="${show.concertHallName}">${show.concertHallName}</a></span>
			</div>
			<div class="select_infor">
				<h2>
					<img src="http://tkfile.yes24.com/img/perfsale/h3_tit_result01.gif"
						alt="선택내역">
				</h2>
				<br>
				<ul>
					<li><em>날짜</em><span
						id="tk_day">${showing.showingDate}일</span>
					</li>
				</ul>
				<div id="setaView">
				<br>
				<form id="insertForm" action="" method="POST" >
				     <!-- <input type="hidden" name="userSq" value="1"> -->       
				     <input type="hidden" name="showingSq" value="${SaveTicket.showingSq}">       
				     <input type="hidden" name="showSq" value="${SaveTicket.showSq}">       
				<c:forEach items="${SaveTicket.seatClass}" var="seatClass" varStatus="status">
				    <div id="${SaveTicket.seatNo[status.index]}">${seatClass}석&nbsp;
				    	${SaveTicket.seatNo[status.index]}&nbsp;:<span class="rn-red" data-price="${SaveTicket.seatPrice[status.index]}">
				        <fmt:formatNumber type="number" maxFractionDigits="3"
				            value="${SaveTicket.seatPrice[status.index]}" /></span>원
				     <input type="hidden" name="seatClass" value="${seatClass}">       
				     <input type="hidden" name="seatNo" value="${SaveTicket.seatNo[status.index]}">       
				     <input type="hidden" name="seatPrice" value="${SaveTicket.seatPrice[status.index]}">       
				    </div>
				</c:forEach>	
				</form>												
				</div>
			</div>			
			<span id="totalPrice" class="t_result"></span>
			<div class="btn">
				<div id="StepCtrlBtnPanel" class="tc">
					<div id="StepCtrlBtn05" style="display: block;">
						<a id="prevButton" class="dcursor"><img
							src="http://tkfile.yes24.com/img/perfsale/btn_prev.gif"
							alt="이전단계"></a> <a id="payment" class="dcursor"><img
							id="imgPayEnd"
							src="http://tkfile.yes24.com/img/perfsale/btn_succ.gif"
							alt="결제하기"></a>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>

<script>

$(document).ready(function() {
	var IMP = window.IMP;
	IMP.init("imp61438883");
	var totalPrice = 0;
	
	var seatNo = '${SaveTicket.seatNo}'.slice(1, -1).split(', ');
	
	for (var i = 0; i < seatNo.length; i++) {
	    var id = seatNo[i];
	    var price = $("#" + id).children("span").data("price");
	    totalPrice += price;
	}
		    
	var seatPriceFormatted = new Intl.NumberFormat('ko-KR').format(totalPrice);   
	$("#totalPrice").text(seatPriceFormatted+" 원");
	
	
	
	//결제 버튼시작
	$("#payment").on("click", function() {
	  console.log("결제");
	  	    
	    $.ajax({
	      url: "${pageContext.request.contextPath}/ticketing/insertTicketing",
	      type: "get",
	      
	      dataType: "json",
	      success: function(result) {
	        console.log(result.data);
	        
	        
	        // 예매번호로 결제 API호출
	        requestPay(result.data);
	        
	       	            
	      },
	      error: function(XHR, status, error) {
	        console.error(status + " : " + error);
	      }
	    });
  	
	});
	
	// 결제 API
	function requestPay(ticketingSq) {
		//IMP.request_pay(param, callback) 결제창 호출

		IMP.request_pay({
			pg : 'kakaopay',
			pay_method : 'card', //생략 가능
			merchant_uid : "T"+ticketingSq, // 상점에서 관리하는 주문 번호
			name : '주문명:결제테스트',
			amount : 100,
			buyer_email : 'iamport@siot.do',
			buyer_name : '구매자이름',
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456'
		}, function(rsp) { // callback
			if (rsp.success) {				
				// 결제 성공 시 로직
				console.log("결제 성공");
				// 폼데이터 보내기
				insertFormSubmit(ticketingSq)
				// 팝업창 닫기					
				closeParentWindow();
		
			} else {
				// 결제 실패 시 로직
				console.log("결제 실패");
				// 결제 실패시 예매삭제
				deleteTicketing(ticketingSq);
				
				
			}
		});
	}

	//이전단계
	$("#prevButton").on("click",function(e) {
		e.preventDefault();
		console.log("이전");

		// showSq 값을 가져와서 URL 생성
		var showSq = "${show.showSq}"; // 이 부분은 JavaScript 변수로 대체해야 합니다.
		var showingDate	= "${showing.showingDate}";
		var url = "${pageContext.request.contextPath}/order/orderForm2/"
				+ showSq + "/" + showingDate;

		// 페이지 이동
		location.href = url;

		// 추가 로직 작성
	});
	
	// 부모창을 닫는 함수
	function closeParentWindow() {
		
	  // 현재 창이 팝업 창인지 확인하고, 팝업 창이면 부모 창을 닫기
	  if (window.opener && !window.opener.closed) {
	    window.opener.location.reload(); // 부모 창을 새로고침
	    window.close(); // 현재 창을 닫기
	  }
	}
	
	// 결제 완료시 폼데이터 보내기
	function insertFormSubmit(ticketingSq){
		var sq = ticketingSq;
		  // 폼 이벤트 헨들러
		  $("#insertForm").submit(function(event) {
		    event.preventDefault(); 
		
		    var formData = $(this).serialize() + "&ticketingSq="+sq; // 폼 데이터 직렬화
		   				    
		    $.ajax({
		      url: "${pageContext.request.contextPath}/ticketing/insertTicket",
		      type: "post",
		      data: formData,
		      dataType: "json",
		      success: function(result) {
		        console.log(result);
		      },
		      error: function(XHR, status, error) {
		        console.error(status + " : " + error);
		      }
		    });
		  });
		
		  // 폼 제출 이벤트 트리거
		  $("#insertForm").submit(); 
	};
	
	// 결제 실패시 예매삭제
	function deleteTicketing(ticketingSq){
		$.ajax({
		      url: "${pageContext.request.contextPath}/ticketing/deleteTicketing",
		      type: "get",
		      data : {ticketingSq:ticketingSq},
		      
		      dataType: "json",
		      success: function(result) {
		        console.log(result.data);
		        window.close;
		      },
		      error: function(XHR, status, error) {
		        console.error(status + " : " + error);
		      }
		});
		};
	  
});
</script>

</html>