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
<script src="${pageContext.request.contextPath }/assets/js/slick.js"
	type="text/javascript" charset="utf-8"></script>
<style>
.wrapper {max-width: 1920px;margin: 0 auto;}
.center {width: 100%;}
.slider {margin: 100px auto 30px;}
.slick-slide {margin: 0px 15px ;}
.slick-slide img {width: 100%;height: 400px; }
.slick-prev, .slick-next {top: 48%;width: 50px;height: 60px;z-index: 99;}
.slick-next:before {content: '';display: block;width: 50px;height: 60px;background:	url('http://tkfile.yes24.com/imgNew/common/slide-dir-next.png')	no-repeat;}
.slick-prev:before {content: '';display: block;width: 50px;height: 60px;background:	url('http://tkfile.yes24.com/imgNew/common/slide-dir-prev.png')	no-repeat;}
.slick-next {right: 100px;}
.slick-prev {left: 100px;}
.slick-track {padding: 30px 0;}
.slick-slide {transition: all ease-in-out .3s;opacity: 0.7;}
.slick-current {opacity: 1;transform: scaleY(1.2) scaleX(1.1);}
.slick-active {	opacity: 1;}

section{width: 1200px; margin: 0 auto;     text-align: center;}
section ul {  display: flex;  justify-content: flex-start; flex-direction: row; flex-wrap: wrap; margin: 0 -15px; }
section ul li{ width: calc(25% - 92px); margin: 0 15px; margin-bottom: 70px;}
section ul li a img{width: 100%;margin-bottom:5px;}
section ul li a .gray{ color: #888;font-size: 18px;}
section ul li a .orange{ color: #ec7d2c; margin-top: 10px;}
section ul li a span{margin:0 6px; display: block; text-align: center; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;}
section ul li a span.tit{font-size: 14px; margin-top:15px;}
section ul li a span.price{font-weight: 600; font-size: 17px; margin-top: 2px;}

.paging{width: 1000px; margin: 20px auto; display: flex; justify-content: center;}
.paging li{margin: 0 10px; width: 14px;}
.paging li a{font-size: 18px; height: 100%;}
.paging li.on a{color: #4982cf;}
.paging li.first{width: 14px; margin-right: 0; background: url('https://flyairseoul.com/CW/public/images/icons/common-s57efedab2d.png') no-repeat; background-position: 0 -6983px;}
.paging li.pre{width: 9px; background: url('https://flyairseoul.com/CW/public/images/icons/common-s57efedab2d.png') no-repeat; background-position: 0 -7151px;}
.paging li.next{width: 9px; background: url('https://flyairseoul.com/CW/public/images/icons/common-s57efedab2d.png') no-repeat; background-position: 0 -7095px;}
.paging li.last{width: 14px;margin-left: 0; background: url('https://flyairseoul.com/CW/public/images/icons/common-s57efedab2d.png') no-repeat; background-position: 0 -7039px;}
.paging-area{width:1100px; margin: 0 auto;margin-left: 16%;}
.active .anum {color: #4982cf; font-weight: bold; font-size: 19px;}
</style>
</head>
<body>

	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- //헤더 -->

	<div class="wrapper">
		<section class="center slider">
			<c:forEach items="${showList}" var="show">
				<div>
					<a
						href="${pageContext.request.contextPath}/show/detail/${show.showSq}">
						<img
						src="${pageContext.request.contextPath}/upload/${show.subImage}">
					</a>
				</div>
			</c:forEach>
		</section>
	</div>
	<section>
		<div id="ySContent">
			<div id="show"></div>
			<!-- ==================== 정보 입력 영역 시작 ==================== -->
			<div class="">
				<div class="listItem">
				<p class="m2-tit"><img src="http://tkfile.yes24.com/imgNew/genre/m2-tit02.png" alt=""></p>

					<section>
						<ul>
							<c:forEach items="${showList2}" var="show">
								<li><a
									href="${pageContext.request.contextPath}/show/detail/${show.showSq}">
										<img
										src="${pageContext.request.contextPath}/upload/${show.subImage}">
										<span class="gray">${show.showName}</span> <span class="orange">${show.startDate}&nbsp;~&nbsp;${show.endDate}</span>
								</a></li>
							</c:forEach>
						</ul>
					</section>
					<!-- 페이징 -->
					<c:if test="${empty keyword}">
						<ul class="paging pageInfo">
							<c:if test="${pageMaker.prev}">
								<li class="pageInfo_btn previous"><a
									href="${pageMaker.startPage - 1}">◀</a></li>
							</c:if>
							<!-- 각 번호 페이지 버튼 -->
							<c:forEach var="num" begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}">
								<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }">
									<a class="anum" href="${num}">${num}</a>
								</li>
							</c:forEach>
							<!-- 다음페이지 버튼 -->
							<c:if test="${pageMaker.next}">
								<li class="pageInfo_btn next"><a
									href="${pageMaker.endPage + 1}">▶</a></li>
							</c:if>
						</ul>
					</c:if>
					<form id="moveForm"
						action="${pageContext.request.contextPath}/category/${pageMaker.cri.keyword}"
						method="get">
						<input type="hidden" name="pageNum"
							value="${pageMaker.cri.pageNum}"> <input type="hidden"
							name="amount" value="${pageMaker.cri.amount}"> <input
							type="hidden" id="keyword" name="keyword"
							value="${pageMaker.cri.keyword}"> <input type="hidden"
							id="keyword2" name="keyword2" value="${pageMaker.cri.keyword2}">
					</form>
				</div>
			</div>
		</div>
	</section>
	<!--키워드 검색 폼-->
		<form id="keywordForm" style="display: none;"
			action="${pageContext.request.contextPath}/category/${pageMaker.cri.keyword}"
			method="get">
			<input type="text" id="searchKeyword2" name="keyword2" value="${pageMaker.cri.keyword2}" />						
		</form>	
	<!-- Footer -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- //Footer -->

</body>

<script>
	$(document).on('ready', function() {
		
		// 포커스
		var category = '${category}';
		$("#l"+category).addClass("on");
				
		
		// 롤링
		$(".center").slick({
			//dots: true,
			centerPadding : "300px",
			autoplay : true,
			infinite : true,
			centerMode : true,
			slidesToShow : 3,
			slidesToScroll : 1
		});
		
		//페이징 버튼 클릭
		$(".pageInfo a").on("click", function(e) {
			e.preventDefault();
			var pageNum = $(this).attr("href");
			$("#moveForm input[name='pageNum']").val(pageNum);
			$("#moveForm").submit();
		});
		
		// 검색기능
		$("#searchButton").on("click",function(e){
			e.preventDefault();
			console.log("검색버튼");
			var keyword = $("#searchKeyword").val();
			console.log(keyword);			

			if(keyword != ""){
			
				$("#searchKeyword2").val(keyword);
				var k = $("#searchKeyword").val();
				console.log(k);
				
				$("#keywordForm").submit();
			}else{
				alert("검색어를 입력해주세요");
			}		
			
		});
		
	});
</script>

</html>