<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/reset.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/sub.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/detail.css"
	type="text/css">
<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap"
	rel="stylesheet">
<!-- 제이쿼리 최신버전 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- //헤더 -->
	<section>
		<div class="renew-wrap">
			<div class="renew-content">
				<div class="rn-01">
					<!--로케이션, 라벨-->
					<p class="rn-location">
						<a
							href="/New/Genre/GenreMain.aspx?genre=15457&amp;Gcode=009_202_001">뮤지컬</a><a
							href="/New/Genre/GenreList.aspx?genretype=2&amp;genre=15466">오리지널</a>
					</p>
					<p class="rn-labels"></p>
				</div>
				<!--rn-01-->
				<div class="rn-02">
					<!--제목-->
					<p class="rn-big-title">${show.showName}</p>
					<div class="rn-product-short-data">
						<p>
							<span class="ps-date">${show.startDate} ~ ${show.endDate}</span><a
								href="#none" id="ps-location"><span class="ps-location">지도로가는링크</span></a>
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
							alt=""><span class="rn-pdg-txt2">33</span><span
							class="rn-pdg-txt1">Likes</span>
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
												<fmt:formatNumber type="number" maxFractionDigits="3" value="${show.seatPrice[status.index]}"/>
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
							<dt>공연시간 안내</dt>
							<dd>
								2023년 8월 11일(금) ~ 2023년 8월 20일(일) <br>수,목,금 오후 7시 30분 / 토
								오후 2시, 6시 30분 / 일 오후 2시 <br>* 8월 15일(화) 오후 2시, 6시 30분 <br>*
								8월 18일(금) 오후 3시, 7시 30분
							</dd>							
						</dl>
					</div>

					<!--자동주문방지적용-->


				</div>
				<!--rn-03-right-->
			</div>
			<!--rn-03-->

			<div class="rnplus-tk-bar" id="divPerfNoTimeInfo"
				style="display: none;">
				<span class="">※ 본 상품은 상시 관람 상품으로 관람일을 별도로 지정하지 않습니다.</span>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- //Footer -->
</body>
</html>