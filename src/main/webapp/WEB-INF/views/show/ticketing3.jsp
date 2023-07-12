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
	href="${pageContext.request.contextPath }/assets/css/ticketing.css"
	type="text/css">
<!-- 제이쿼리 최신 버전 -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
#guideview {
	margin-left: 25px;
}
</style>
</head>
<body>
	<div id="header" class="header">
		<h1>
			<img src="${pageContext.request.contextPath}/assets/images/로고.png"
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
			<!-- 결제API -->
			<div id="step01"></div>
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
					title="${show.concertHallName}">${show.concertHallName}</a></span><input
					id="hiddenGenreId" type="hidden" value="15457"><input
					id="hiddenDisplayRemainSeat" type="hidden" value="0">
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
							alt="이전단계"></a> <a class="dcursor"><img id="imgPayEnd"
							src="http://tkfile.yes24.com/img/perfsale/btn_succ.gif"
							alt="결제하기"></a>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>

<script>
	//이전단계
	$("#prevButton")
			.on(
					"click",
					function(e) {
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