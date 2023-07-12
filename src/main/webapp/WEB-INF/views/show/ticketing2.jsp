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

.f_header {
	margin-top: 70px;
	margin-left: 10px;
}

#br {
	margin-bottom: 5px;
}

.minimap_m>* {
	padding: 5px;
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
		<div class="f_header">
			<ul>
				<li><em><img class="img"
						src="http://tkfile.yes24.com/img/perfsale/h3_tit_seat01.gif"
						alt="관람일변경"></em> <span> <select id="selFlashDateAll"
						onchange="fdc_selFlashDateAllChange(this.value);"
						style="width: 200px;"><option selected="">날짜선택</option>
							<option value="2023-08-11">2023.08.11 금요일</option>
							<option value="2023-08-12">2023.08.12 토요일</option>
							<option value="2023-08-13">2023.08.13 일요일</option>
							<option value="2023-08-15">2023.08.15 화요일</option>
							<option value="2023-08-16">2023.08.16 수요일</option>
							<option value="2023-08-17">2023.08.17 목요일</option>
							<option value="2023-08-18">2023.08.18 금요일</option>
							<option value="2023-08-19">2023.08.19 토요일</option>
							<option value="2023-08-20">2023.08.20 일요일</option></select>
				</span></li>
				<li><em><img class="img"
						src="http://tkfile.yes24.com/img/perfsale/h3_tit_seat02.gif"
						alt="회차변경"></em> <span> <select id="selFlashTime"
						onchange="fdc_SelFlashTimeChange(this.value);"
						style="width: 200px;"><option selected="" value="0">회차
								선택</option>
							<option value="1229994" timeoption="2" idhall="10182"
								seatviewmode="1" saleclose="2023.08.18"
								cancelclose="2023.08.18 17:00:00" limitcussalecnt="10"
								limittimesalecnt="10" timeinfo="14시 00분" yespointoption="N"
								perfdate="2023-08-19">[1회] 14시 00분</option>
							<option value="1230003" timeoption="2" idhall="10182"
								seatviewmode="1" saleclose="2023.08.18"
								cancelclose="2023.08.18 17:00:00" limitcussalecnt="10"
								limittimesalecnt="10" timeinfo="18시 30분" yespointoption="N"
								perfdate="2023-08-19">[2회] 18시 30분</option></select>
				</span></li>
			</ul>
		</div>
		<div id="ContentsArea" class="container" style="display: block;">
			<!-- 제 1 단계 : 관람일/회차 -->
			<div id="step01">
				<!-- 관람일선택 -->

			</div>
			<!-- //제 1 단계 : 관람일/회차 -->
		</div>
		<div class="result">
			<div class="seatinfo">
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
				<div class="minimap_m">
					<p>
						<img src="http://tkfile.yes24.com/img/htmlseat/tit2_minimap2.gif"
							alt="좌석 등급 및 가격" class="tit">
					</p>
					<ul id="ulLegend" style="height: 120px;">
						<li class="list_no"><img
							src="http://tkfile.yes24.com/images/ticket_new/bx3_minimap1.gif"
							alt=""></li>
						<li id="liLegend" class="bx3_wbg bx3_wbg2"><div></div></li>
						<li class="list_no"><img
							src="http://tkfile.yes24.com/images/ticket_new/bx3_minimap3.gif"
							alt=""></li>
					</ul>
					<!--  //좌석 등급/가격 -->
					<!--  선택좌석 -->
					<p>
						<a href="javascript:retrun false;"
							onmouseover="$('.t_info').show();"
							onmouseout="$('.t_info').hide();"><img
							src="http://tkfile.yes24.com/img/htmlseat/tit2_minimap4.gif"
							alt="선택좌석" class="tit"></a>
					</p>
					<ul>
						<li class="list_no"><img
							src="http://tkfile.yes24.com/images/ticket_new/bx3_minimap1.gif"
							alt=""></li>
						<li id="liSelSeat" class="bx3_wbg bx3_wbg3"></li>
						<li class="list_no"><img
							src="http://tkfile.yes24.com/images/ticket_new/bx3_minimap3.gif"
							alt=""></li>
					</ul>
					<!--  //선택좌석 -->
					<div class="btn"></div>
					<div>
						<p id="br">
							<a id="prevButton" href="#none"><img
								src="http://tkfile.yes24.com/images/ticket_new/btn_pre.gif"
								alt="이전화면"></a> <a href="javascript:ChoiceReset();"><img
								src="http://tkfile.yes24.com/images/ticket_new/btn_refresh.gif"
								alt="좌석선택다시"></a>
						</p>

						<p>
							<a id="clearButton" href="#none"><img
								src="http://tkfile.yes24.com/images/ticket_new/btn_booking.gif"
								alt="좌석선택완료" class="booking"></a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>

<script>
	//이전단계
	$("#prevButton").on(
			"click",
			function(e) {
				e.preventDefault();
				console.log("이전");

				// showSq 값을 가져와서 URL 생성
				var showSq = "${show.showSq}"; // 이 부분은 JavaScript 변수로 대체해야 합니다.
				var url = "${pageContext.request.contextPath}/order/orderForm/"
						+ showSq;

				// 페이지 이동
				location.href = url;

				// 추가 로직 작성
			});

	//좌석선택완료 결제로
	$("#clearButton")
			.on(
					"click",
					function(e) {
						e.preventDefault();
						console.log("결제");

						// showSq 값을 가져와서 URL 생성
						var showSq = "${show.showSq}"; // 이 부분은 JavaScript 변수로 대체해야 합니다.
						var url = "${pageContext.request.contextPath}/order/orderForm3/"
								+ showSq;

						// 페이지 이동
						location.href = url;

						// 추가 로직 작성
					});
</script>

</html>