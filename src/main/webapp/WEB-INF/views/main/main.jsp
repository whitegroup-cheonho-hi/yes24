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
<link rel="stylesheet" type="text/css"
	href="https://image.yes24.com/sysimage/yesUI/yesUI.css?v=20230403"
	media="all">
<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap"
	rel="stylesheet">
<!-- 스와이퍼 js -->
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<!-- 스와이퍼 CSS -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper@8/swiper-bundle.min.css" type="text/css">
<!-- 제이쿼리 최신버전 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


<style>
.swiper-wrapper{margin-top: 110px;}
.swiper1 .swiper-slide img{width: 100%; margin: auto; display: block; }
.swiper1 .swiper-button-prev{color: #8f9090; left:50px;}
.swiper1 .swiper-button-next{color: #8f9090; right:50px;}
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