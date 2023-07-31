<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>category</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/reset.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/sub.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/slick.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/slick-theme.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/category.css" type="text/css">
<link rel="stylesheet" type="text/css" href="https://image.yes24.com/sysimage/yesUI/yesUI.css?v=20230403" media="all">

<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet">

<!-- 스와이퍼 js -->
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<!-- 스와이퍼 CSS -->
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" type="text/css">
<!-- 제이쿼리 최신버전 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/slick.js" type="text/javascript" charset="utf-8"></script>
<style>
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
										<span class="gray">${show.showName}
										<c:if test="${show.reservationDate eq 'N'}">
										<b id="noneTicketing">(개봉 예정작)</b>
										</c:if>
										</span>
										<span class="orange">${show.startDate}&nbsp;~&nbsp;${show.endDate}</span>
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
		
		 var today = new Date();
	     var year = today.getFullYear();
	     var month = today.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줌
	     var day = today.getDate();
	 	 var reservationDate = '${show.reservationDate}';
	     // 월과 일이 10보다 작은 경우 앞에 0을 붙여 두 자리로 만듭니다.
	     if (month < 10) {
	       month = '0' + month;
	     }
	     if (day < 10) {
	       day = '0' + day;
	     }

	     // 결과를 특정 요소에 출력합니다. 원하는 형식으로 문자열을 생성합니다.
	   	var sysdate =(year + '.' + month + '.' + day);
	        		
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