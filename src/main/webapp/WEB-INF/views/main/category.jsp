<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>category</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/reset.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/sub.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/slick.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/slick-theme.css"
	type="text/css">

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
<script src="${pageContext.request.contextPath }/assets/js/slick.js"
	type="text/javascript" charset="utf-8"></script>
<style>
* {
	box-sizing: border-box;
}

.wrapper {
	max-width: 1920px;
	margin: 0 auto;
}

.center {
	width: 100%;
}

.slider {
	margin: 100px auto;
}

.slick-slide {
	margin: 0px 15px;
}

.slick-slide img {
	width: 100%;
}

.slick-prev, .slick-next {
	top: 48%;
	width: 50px;
	height: 60px;
	z-index: 99;
}

.slick-next:before {
	content: '';
	display: block;
	width: 50px;
	height: 60px;
	background:
		url('http://tkfile.yes24.com/imgNew/common/slide-dir-next.png')
		no-repeat;
}

.slick-prev:before {
	content: '';
	display: block;
	width: 50px;
	height: 60px;
	background:
		url('http://tkfile.yes24.com/imgNew/common/slide-dir-prev.png')
		no-repeat;
}

.slick-next {
	right: 100px;
}

.slick-prev {
	left: 100px;
}

.slick-track {
	padding: 30px 0;
}

.slick-slide {
	transition: all ease-in-out .3s;
	opacity: 0.7;
}

.slick-current {
	opacity: 1;
	transform: scaleY(1.1) scaleX(1.05);
}

.slick-active {
	opacity: 1;
}
</style>
</head>
<body>

	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- //헤더 -->

	<div class="wrapper">
		<section class="center slider">
			<div>
				<a href="${pageContext.request.contextPath}/show/detail"> <img
					src="${pageContext.request.contextPath }/assets/images/그날들카테고리.jpg">
				</a>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/show/detail"> <img
					src="${pageContext.request.contextPath }/assets/images/드림하이카테고리.jpg">
				</a>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/show/detail"> <img
					src="${pageContext.request.contextPath }/assets/images/루치아카테고리.jpg"></a>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/show/detail"> <img
					src="${pageContext.request.contextPath }/assets/images/맘마미아카테고리.jpg"></a>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/show/detail"> <img
					src="${pageContext.request.contextPath }/assets/images/아르토고흐카테고리.jpg"></a>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/show/detail"> <img
					src="${pageContext.request.contextPath }/assets/images/오페라이유령카테고리.jpg"></a>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/show/detail"> <img
					src="${pageContext.request.contextPath }/assets/images/쿠로이카테고리.jpg"></a>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/show/detail"> <img
					src="${pageContext.request.contextPath }/assets/images/맘마미아카테고리.jpg"></a>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/show/detail"> <img
					src="${pageContext.request.contextPath }/assets/images/아르토고흐카테고리.jpg"></a>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/show/detail"> <img
					src="${pageContext.request.contextPath }/assets/images/오페라이유령카테고리.jpg"></a>
			</div>
		</section>
	</div>

	<!-- Footer -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- //Footer -->

</body>

<script>
	$(document).on('ready', function() {
		$(".center").slick({
			//dots: true,
			centerPadding : "200px",
			autoplay : true,
			infinite : true,
			centerMode : true,
			slidesToShow : 3,
			slidesToScroll : 1
		});
	});
</script>

</html>