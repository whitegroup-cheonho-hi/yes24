<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ticketing</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/reset.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/ticketing.css"
	type="text/css">
<!-- 제이쿼리 최신 버전 -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<style>
#guideview {margin-left: 25px;}
#StepCtrlBtnPanel a{cursor: pointer; }
.gnb li {float: left;background:url("${pageContext.request.contextPath}/assets/images/예매순서.png");height: 52px;width: 120px;}
</style>




</head>
<body>
	<div id="header" class="header">
		<h1>
			<img src="${pageContext.request.contextPath}/assets/images/로고.png"
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
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<div>
			${SaveTicket.showingSq}
			${SaveTicket.showSq}
			${SaveTicket.seatClass[0]}
			${SaveTicket.seatNo[0]}
			${SaveTicket.seatPrice[0]}<br>
			${SaveTicket.seatClass[1]}
			${SaveTicket.seatNo[1]}
			${SaveTicket.seatPrice[1]}	
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
				<h3>
					<img src="http://tkfile.yes24.com/img/perfsale/h3_tit_result01.gif"
						alt="선택내역">
				</h3>
				<ul>
					<li><em><img
							src="http://tkfile.yes24.com/img/perfsale/r_tit01.gif" alt="날짜"></em><span
						id="tk_day">2023.08.19 (토)</span></li>
				</ul>
			</div>
			<div class="pay_infor">
				<h3>
					<img src="http://tkfile.yes24.com/img/perfsale/h3_tit_result02.gif"
						alt="결제내역">
				</h3>
				<div class="link01">
					<ul>
						<li class="tk_price"><em><img
								src="http://tkfile.yes24.com/img/perfsale/r_tit05.gif"
								alt="티켓금액"></em><span>0</span></li>

					</ul>
				</div>
			</div>
			<span class="t_result">0<span>원</span></span>
			<div class="btn">
				<div id="StepCtrlBtnPanel" class="tc">
					<div id="StepCtrlBtn05" style="display: block;">
						<a id="prevButton" class="dcursor"><img
							src="http://tkfile.yes24.com/img/perfsale/btn_prev.gif"
							alt="이전단계"></a> <a id="payment" class="dcursor"><img id="imgPayEnd"
							src="http://tkfile.yes24.com/img/perfsale/btn_succ.gif"
							alt="결제하기"></a>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>

<script>
	   var IMP = window.IMP;
	   IMP.init("imp61438883");
	   
	//결제 API
	$("#payment").on("click", function() {
	    console.log("결제");  
	    requestPay();
	});

	function requestPay() {
	    // IMP.request_pay(param, callback) 결제창 호출
	    
	    IMP.request_pay({
			    pg : 'kakaopay',
			    pay_method : 'card', //생략 가능
			    merchant_uid: "order_no_0004", // 상점에서 관리하는 주문 번호
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
	        } else {
	            // 결제 실패 시 로직
	            console.log("결제 실패");
	        }
	    });
	}
	
	//이전단계
	$("#prevButton").on("click",function(e) {
		e.preventDefault();
		console.log("이전");

		// showSq 값을 가져와서 URL 생성
		var showSq = "${show.showSq}"; // 이 부분은 JavaScript 변수로 대체해야 합니다.
		var url = "${pageContext.request.contextPath}/order/orderForm2/"
				+ showSq;

		// 페이지 이동
		location.href = url;

		// 추가 로직 작성
	});
</script>

</html>