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
			<li class="m05"><span>결제방법</span></li>
		</ul>
	</div>
	<section>
		<div id="ContentsArea" class="container" style="display: block;">
			<!-- 제 1 단계 : 관람일/회차 -->
			<div id="step01">
				<!-- 관람일선택 -->
				<div id="step01_date" class="step01_date" style="display: block;">
					<h2>
						<img src="http://tkfile.yes24.com/img/perfsale/h2_tit01.gif"
							alt="관람일선택"><span><img
							src="http://tkfile.yes24.com/img/perfsale/icon_nt.gif" alt=""></span>
					</h2>
					<div id="calendar" class="calendar">
						<div class="cal_selectDay">
							<a class="pre dcursor" onclick="fdc_CtrlStep(jcSTEP1_1);"
								title="이전달"><img
								src="http://tkfile.yes24.com/img/perfsale/btn_pre.gif" alt="이전달"></a><a
								class="next dcursor" onclick="fdc_CtrlStep(jcSTEP1_2);"
								title="다음달"><img
								src="http://tkfile.yes24.com/img/perfsale/btn_next.gif"
								alt="다음달"></a><span>2023. 08</span>
						</div>
						<table summary="공연일정을 선택할 수 있는 달력 형태의 표">
							<caption>공연일정 달력</caption>
							<tbody>
								<tr>
									<td style="border: none;"><img
										src="http://tkfile.yes24.com/img/perfsale/day_sun.gif"
										alt="sun"></td>
									<td style="border: none;"><img
										src="http://tkfile.yes24.com/img/perfsale/day_mon.gif"
										alt="mon"></td>
									<td style="border: none;"><img
										src="http://tkfile.yes24.com/img/perfsale/day_tue.gif"
										alt="tue"></td>
									<td style="border: none;"><img
										src="http://tkfile.yes24.com/img/perfsale/day_wed.gif"
										alt="wed"></td>
									<td style="border: none;"><img
										src="http://tkfile.yes24.com/img/perfsale/day_thu.gif"
										alt="thu"></td>
									<td style="border: none;"><img
										src="http://tkfile.yes24.com/img/perfsale/day_fri.gif"
										alt="fri"></td>
									<td style="border: none;"><img
										src="http://tkfile.yes24.com/img/perfsale/day_sat.gif"
										alt="sat"></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td><a caldays="1"
										onclick="fdc_CalDateClick(&quot;2023-08-01&quot;);"
										class="dcursor" id="2023-08-01" title="해당일은 공연이 없습니다.">1</a></td>
									<td><a caldays="1"
										onclick="fdc_CalDateClick(&quot;2023-08-02&quot;);"
										class="dcursor" id="2023-08-02" title="해당일은 공연이 없습니다.">2</a></td>
									<td><a caldays="1"
										onclick="fdc_CalDateClick(&quot;2023-08-03&quot;);"
										class="dcursor" id="2023-08-03" title="해당일은 공연이 없습니다.">3</a></td>
									<td><a caldays="1"
										onclick="fdc_CalDateClick(&quot;2023-08-04&quot;);"
										class="dcursor" id="2023-08-04" title="해당일은 공연이 없습니다.">4</a></td>
									<td><a caldays="1"
										onclick="fdc_CalDateClick(&quot;2023-08-05&quot;);"
										class="dcursor" id="2023-08-05" title="해당일은 공연이 없습니다.">5</a></td>
								</tr>
								<tr>
									<td><a caldays="1"
										onclick="fdc_CalDateClick(&quot;2023-08-06&quot;);"
										class="dcursor" id="2023-08-06" title="해당일은 공연이 없습니다.">6</a></td>
									<td><a caldays="1"
										onclick="fdc_CalDateClick(&quot;2023-08-07&quot;);"
										class="dcursor" id="2023-08-07" title="해당일은 공연이 없습니다.">7</a></td>
									<td><a caldays="1"
										onclick="fdc_CalDateClick(&quot;2023-08-08&quot;);"
										class="dcursor" id="2023-08-08" title="해당일은 공연이 없습니다.">8</a></td>
									<td><a caldays="1"
										onclick="fdc_CalDateClick(&quot;2023-08-09&quot;);"
										class="dcursor" id="2023-08-09" title="해당일은 공연이 없습니다.">9</a></td>
									<td><a caldays="1"
										onclick="fdc_CalDateClick(&quot;2023-08-10&quot;);"
										class="dcursor" id="2023-08-10" title="해당일은 공연이 없습니다.">10</a></td>
									<td class="select"><a caldays="1"
										onclick="fdc_CalDateClick(&quot;2023-08-11&quot;);"
										class="dcursor" id="2023-08-11" title="2023-08-11">11</a></td>
									<td class="select"><a caldays="1"
										onclick="fdc_CalDateClick(&quot;2023-08-12&quot;);"
										class="dcursor" id="2023-08-12" title="2023-08-12">12</a></td>
								</tr>
								<tr>
									<td class="select"><a caldays="1"
										onclick="fdc_CalDateClick(&quot;2023-08-13&quot;);"
										class="dcursor" id="2023-08-13" title="2023-08-13">13</a></td>
									<td><a caldays="1"
										onclick="fdc_CalDateClick(&quot;2023-08-14&quot;);"
										class="dcursor" id="2023-08-14" title="해당일은 공연이 없습니다.">14</a></td>
									<td class="select"><a caldays="1"
										onclick="fdc_CalDateClick(&quot;2023-08-15&quot;);"
										class="dcursor" id="2023-08-15" title="2023-08-15">15</a></td>
									<td class="select"><a caldays="1"
										onclick="fdc_CalDateClick(&quot;2023-08-16&quot;);"
										class="dcursor" id="2023-08-16" title="2023-08-16">16</a></td>
									<td class="select"><a caldays="1"
										onclick="fdc_CalDateClick(&quot;2023-08-17&quot;);"
										class="dcursor" id="2023-08-17" title="2023-08-17">17</a></td>
									<td class="select"><a caldays="1"
										onclick="fdc_CalDateClick(&quot;2023-08-18&quot;);"
										class="dcursor" id="2023-08-18" title="2023-08-18">18</a></td>
									<td class="term"><a caldays="1"
										onclick="fdc_CalDateClick(&quot;2023-08-19&quot;);"
										class="dcursor" id="2023-08-19" title="2023-08-19">19</a></td>
								</tr>
								<tr>
									<td class="select"><a caldays="1"
										onclick="fdc_CalDateClick(&quot;2023-08-20&quot;);"
										class="dcursor" id="2023-08-20" title="2023-08-20">20</a></td>
									<td><a caldays="1"
										onclick="fdc_CalDateClick(&quot;2023-08-21&quot;);"
										class="dcursor" id="2023-08-21" title="해당일은 공연이 없습니다.">21</a></td>
									<td><a caldays="1"
										onclick="fdc_CalDateClick(&quot;2023-08-22&quot;);"
										class="dcursor" id="2023-08-22" title="해당일은 공연이 없습니다.">22</a></td>
									<td><a caldays="1"
										onclick="fdc_CalDateClick(&quot;2023-08-23&quot;);"
										class="dcursor" id="2023-08-23" title="해당일은 공연이 없습니다.">23</a></td>
									<td><a caldays="1"
										onclick="fdc_CalDateClick(&quot;2023-08-24&quot;);"
										class="dcursor" id="2023-08-24" title="해당일은 공연이 없습니다.">24</a></td>
									<td><a caldays="1"
										onclick="fdc_CalDateClick(&quot;2023-08-25&quot;);"
										class="dcursor" id="2023-08-25" title="해당일은 공연이 없습니다.">25</a></td>
									<td><a caldays="1"
										onclick="fdc_CalDateClick(&quot;2023-08-26&quot;);"
										class="dcursor" id="2023-08-26" title="해당일은 공연이 없습니다.">26</a></td>
								</tr>
								<tr>
									<td><a caldays="1"
										onclick="fdc_CalDateClick(&quot;2023-08-27&quot;);"
										class="dcursor" id="2023-08-27" title="해당일은 공연이 없습니다.">27</a></td>
									<td><a caldays="1"
										onclick="fdc_CalDateClick(&quot;2023-08-28&quot;);"
										class="dcursor" id="2023-08-28" title="해당일은 공연이 없습니다.">28</a></td>
									<td><a caldays="1"
										onclick="fdc_CalDateClick(&quot;2023-08-29&quot;);"
										class="dcursor" id="2023-08-29" title="해당일은 공연이 없습니다.">29</a></td>
									<td><a caldays="1"
										onclick="fdc_CalDateClick(&quot;2023-08-30&quot;);"
										class="dcursor" id="2023-08-30" title="해당일은 공연이 없습니다.">30</a></td>
									<td><a caldays="1"
										onclick="fdc_CalDateClick(&quot;2023-08-31&quot;);"
										class="dcursor" id="2023-08-31" title="해당일은 공연이 없습니다.">31</a></td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
						<p class="tc">
							<img src="http://tkfile.yes24.com/img/perfsale/img_selday.gif"
								alt="선택하신날짜 / 예매가능날짜">
						</p>
					</div>
				</div>
				<!-- //관람일선택 -->
				<!--회차선택 -->
				<div id="step01_time" class="step01_time" style="display: block;">
					<div style="display: none;">
						<p>
							<img src="http://tkfile.yes24.com/img/perfsale/img_select.gif"
								alt="관람일을 선택해주세요">
						</p>
					</div>
					<div style="display: block;">
						<h2>
							<img src="http://tkfile.yes24.com/img/perfsale/h2_tit02.gif"
								alt="회차선택"><span><img
								src="http://tkfile.yes24.com/img/perfsale/icon_nt.gif" alt=""></span>
						</h2>
						<div class="choie_select">
							<div class="select_day">
								<em class="tit">선택날짜</em><span>2023. 8. 19.</span>
							</div>
							<div class="number">
								<em class="tit">회차선택</em>
								<ul id="ulTime">
									<li value="1229994" timeoption="2" idhall="10182"
										seatviewmode="1" saleclose="2023.08.18"
										cancelclose="2023.08.18 17:00:00" limitcussalecnt="10"
										limittimesalecnt="10" timeinfo="14시 00분" yespointoption="N"
										perfdate="2023-08-19" class="on">[1회] 14시 00분</li>
									<li value="1230003" timeoption="2" idhall="10182"
										seatviewmode="1" saleclose="2023.08.18"
										cancelclose="2023.08.18 17:00:00" limitcussalecnt="10"
										limittimesalecnt="10" timeinfo="18시 30분" yespointoption="N"
										perfdate="2023-08-19">[2회] 18시 30분</li>
								</ul>
								<div style="display: none;" class="point">
									<img src="http://tkfile.yes24.com/img/common/btn_p02.gif"
										alt="YES포인트"><span><em>적립 제외 회차</em></span>
								</div>
							</div>
							<div class="seat">
								<em class="tit">좌석등급/잔여석</em>
								<ul id="ulSeatSpace" class="hi">
									<li><strong>VIP석</strong>170,000원 (잔여:<span class="red">49석</span>)</li>
									<li><strong>R석</strong>140,000원 (잔여:<span class="red">87석</span>)</li>
									<li><strong>S석</strong>110,000원 (잔여:<span class="red">44석</span>)</li>
									<li><strong>A석</strong>80,000원 (잔여:<span class="red">116석</span>)</li>
								</ul>
							</div>
							<div class="btn">
								<div class="fr">
									<img id="btnSeatSelect"
										src="http://tkfile.yes24.com/img/perfsale/btn_seat.gif"
										alt="좌석선택" class="dcursor" onclick="fdc_ChoiceSeat();"
										style="display: block;">
								</div>
							</div>
						</div>
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

//다음단계
$("#nextButton").on("click", function(e) {
    e.preventDefault();
    console.log("다음");

    // showSq 값을 가져와서 URL 생성
    var showSq = "${show.showSq}"; // 이 부분은 JavaScript 변수로 대체해야 합니다.
    var url = "${pageContext.request.contextPath}/order/orderForm2/" + showSq;

    // 페이지 이동
    location.href = url;

    // 추가 로직 작성
});


</script>

</html>