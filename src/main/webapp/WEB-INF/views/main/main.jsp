<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/reset.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/sub.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/main.css"
	type="text/css">
<link rel="stylesheet" type="text/css"
	href="https://image.yes24.com/sysimage/yesUI/yesUI.css?v=20230403"
	media="all">
<!-- 스와이퍼 CSS -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper@8/swiper-bundle.min.css" type="text/css">

<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap"
	rel="stylesheet">

<!-- 스와이퍼 js -->
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<!-- 제이쿼리 최신버전 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


<style>
.swiper-wrapper {
	margin-top: 110px;
}

.swiper1 .swiper-slide img {
	width: 100%;
	margin: auto;
	display: block;
}

.swiper1 .swiper-button-prev {
	color: #8f9090;
	left: 50px;
}

.swiper1 .swiper-button-next {
	color: #8f9090;
	right: 50px;
}

section {
	width: 1200px;
	margin: 0 auto;
	text-align: center;
}

#section ul {
	display: flex;
	justify-content: flex-start;
	flex-direction: row;
	flex-wrap: wrap;
	margin: 0 -15px;
}

#section ul li {
	width: calc(25% - 92px);
	margin: 0 15px;
	margin-bottom: 70px;
}

#section ul li a img {
	width: 100%;
	margin-bottom: 5px;
}

#section ul li a .gray {
	color: #888;
	margin-top: 10px;
	font-size: 18px;
}

#section ul li a .orange {
	margin-top: 10px;
	color: #ec7d2c;
}

section ul li a span {
	margin: 0 6px;
	display: block;
	text-align: center;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

#section ul li a span.tit {
	font-size: 14px;
	margin-top: 15px;
}

#section ul li a span.price {
	font-weight: 600;
	font-size: 17px;
	margin-top: 2px;
}
#sec02div{ margin-top: 80px;}


</style>
</head>
<body>
	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- //헤더 -->
	<!-- 메인 롤링배너 (KV) -->
	<div class="swiper swiper1">
		<div class="swiper-wrapper">
			<c:forEach items="${showList}" var="show">
				<div class="swiper-slide banner01">
					<a
						href="${pageContext.request.contextPath}/show/detail/${show.showSq}">
						<img
						src="${pageContext.request.contextPath}/upload/${show.mainImage}">
					</a>
				</div>
			</c:forEach>
		</div>
		<div class="swiper-pagination"></div>
		<div class="swiper-button-prev"></div>
		<div class="swiper-button-next"></div>
	</div>
	<!-- /메인 롤링배너 (KV) -->
	<section class="sec01">
    <p class="cont-tit"><img src="http://tkfile.yes24.com/imgNew/main/tit1.png" alt=""></p>
 	


<div class="cont">
	<div class="whot-area">
		<ul id="ulWhatshot"><li><div class="big-one"><a href="/Perf/46310?Gcode=009_207"><img src="http://tkfile.yes24.com/upload2/perfblog/202306/20230619/20230619-46310.jpg/dims/quality/70/" alt=""><div class="big-one-txt"><p class="big-tit">뮤지컬 구텐버그</p><p class="big-detail">2023. 08. 02.~2023. 10. 22. 플러스씨어터 / <span>조기예매 할인 20%</span></p></div><p class="big-circle">20%</p></a></div></li><li><div class="whot-list"><a href="/Perf/46296?Gcode=009_207"><img src="http://tkfile.yes24.com/upload2/perfblog/202306/20230619/20230619-46296.jpg/dims/quality/70/" alt="" class="lazyload"><div class="whot-list-txt"><div><p class="whot-tit">연극 라스트 세션</p><p class="whot-detail">2023. 07. 08.~2023. 09. 10.<br>대학로 TOM 1관</p><p class="whot-event">청소년 할인 35%</p></div></div><p class="whot-list-circle"><span>35%</span></p></a></div></li><li><div class="whot-list"><a href="/Perf/46523?Gcode=009_207"><img src="http://tkfile.yes24.com/upload2/perfblog/202307/20230712/20230712-46523.jpg/dims/quality/70/" alt="" class="lazyload"><div class="whot-list-txt"><div><p class="whot-tit">김기태 전국투어 콘서트</p><p class="whot-detail">2023. 09. 02.<br>한전아트센터</p><p class="whot-event"></p></div></div></a></div></li><li><div class="whot-list"><a href="http://ticket.yes24.com/New/Search/SearchList.aspx?SearchText=%EC%9B%8C%ED%84%B0%EB%B0%A4%202023&amp;Gcode=009_207"><img src="http://tkfile.yes24.com/upload2/perfblog/202305/20230502/20230502-45215.jpg/dims/quality/70/" alt="" class="lazyload"><div class="whot-list-txt"><div><p class="whot-tit">워터밤 2023</p><p class="whot-detail">2023. 07.~<br>전국투어</p><p class="whot-event"></p></div></div><p class="whot-list-circle"><span>전국</span></p></a></div></li><li><div class="whot-list"><a href="http://ticket.yes24.com/New/Genre/GenreBridge.aspx?genre=15457&amp;id=1130&amp;Gcode=009_207"><img src="http://tkfile.yes24.com/upload2/perfblog/202305/20230511/20230511-45925.jpg/dims/quality/70/" alt="" class="lazyload"><div class="whot-list-txt"><div><p class="whot-tit">뮤지컬 맘마미아</p><p class="whot-detail">2023. 07.~<br>전국투어</p><p class="whot-event"></p></div></div><p class="whot-list-circle"><span>전국</span></p></a></div></li><li><div class="whot-list"><a href="/Perf/45677?Gcode=009_207"><img src="http://tkfile.yes24.com/upload2/perfblog/202306/20230626/20230626-45677.jpg/dims/quality/70/" alt="" class="lazyload"><div class="whot-list-txt"><div><p class="whot-tit">뮤지컬 보이A</p><p class="whot-detail">2023. 05. 30.~2023. 08. 20.<br>예스24스테이지 3관</p><p class="whot-event">재관람 할인 30%</p></div></div><p class="whot-list-circle"><span>30%</span></p></a></div></li><li><div class="whot-list"><a href="/Perf/45419?Gcode=009_207"><img src="http://tkfile.yes24.com/upload2/perfblog/202306/20230628/20230628-45419.jpg/dims/quality/70/" alt="" class="lazyload"><div class="whot-list-txt"><div><p class="whot-tit">연극 나무 위의 군대</p><p class="whot-detail">2023. 06. 20.~2023. 08. 12.<br>LG아트센터 서울 U+스테이지</p><p class="whot-event"></p></div></div></a></div></li></ul>
	</div>
</div>
 </section>
	<!-- 개봉예정작 -->
	<section id="section" class="sec02">
	<p class="cont-tit"><img src="http://tkfile.yes24.com/imgNew/main/tit2-1.png" alt=""></p>
		<div id="sec02div">
			<ul>
				<c:forEach items="${ticketingScheduled}" var="show">
					<li class="donut-area"><a href="${pageContext.request.contextPath}/show/detail/${show.showSq}">
							<img src="${pageContext.request.contextPath}/upload/${show.subImage}">
							<c:choose>
							    <c:when test="${show.dDay > 0}">
							        <span class="donut-dday">D-${show.dDay}</span>
							    </c:when>
							    <c:otherwise>
							        <span class="donut-dday today">Today</span>
							    </c:otherwise>
							</c:choose>
							<span class="orange">${show.reservationDate}</span>
							<span class="gray">(${show.categoryName}) ${show.showName}</span> 
					</a></li>
				</c:forEach>
			</ul>
		</div>
	</section>

	<!-- Footer -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- //Footer -->
</body>

<script>
	$(document).ready(function() {
		//메인 롤링배너(kv)
		var swiper = new Swiper(".swiper", {
			effect : 'fade', // 페이드 효과 사용		
			type : 'horizontal',
			spaceBetween : 50, // 슬라이드 사이 여백
			slidesPerView : 'auto', // 한 슬라이드에 보여줄 갯수
			centeredSlides : true, //센터모드
			autoplay : { //자동슬라이드 (false-비활성화)
				delay : 2500, // 시간 설정
				disableOnInteraction : false, // false-스와이프 후 자동 재생
			},
			loop : true, // 슬라이드 반복 여부
			loopAdditionalSlides : 1, // 슬라이드 반복 시 마지막 슬라이드에서 다음 슬라이드가 보여지지 않는 현상 수정
			// pagination: { // 호출(pager) 여부
			//   el: ".swiper-pagination", //버튼을 담을 태그 설정
			//   clickable: true, // 버튼 클릭 여부
			// },
			navigation : { // 버튼
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev",
			},
		});
	});

	$("#nav li").on("click", function() {
		// 다른 li 요소들에서 on 클래스 제거
		$("#nav li").removeClass("on");

		// 클릭된 li 요소에 on 클래스 추가
		$(this).addClass("on");

		// 추가로 수행하고자 하는 동작 작성
		// ...
	});
</script>

</html>