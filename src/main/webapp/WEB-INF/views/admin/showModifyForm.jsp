<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>showModifyForm</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/reset.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/joinForm.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/admin.css"
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
<!-- 제이쿼리 최신버전 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 에디터 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/summernote-ko-KR.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/summernote-lite.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/summernote-lite.css">
<style>
#ySContent {
	width: 1200px;
}

#ySContent .ySContRow {
	width: 900px;
}

#ySContent .yesIpt {
	margin-right: 10px;
	margin-top: 10px;
}

#category {
	width: 890px;
}
</style>
</head>
<body>
	<section>
		<!-- 헤더 -->
		<c:import url="/WEB-INF/views/includes/adminHeader.jsp"></c:import>
		<!-- //헤더 -->

		<section>
			<div id="ySContent">
				<form name="" method="post"
					action="${pageContext.request.contextPath}/show/updateShow"
					id="updateShow" enctype="multipart/form-data">
					<div class="ySContRow w_900">
						<!-- ==================== 정보 입력 영역 시작 ==================== -->
						<div class="tm_grp">
							<h3 class="tmM_txt">
								<em class="tit_txt"><strong id="adminTit">공연정보 수정</strong></em>
							</h3>
						</div>

						<!-- ==================== 이미지 입력 영역 시작 ==================== -->
						<div class="concertHall">
							<div class="imgGrp">
								<div class="imgCol">
									<strong>메인 이미지 수정</strong>
								</div>
								<div class="imgCol">
									<strong>서브 이미지 수정</strong>
								</div>
							</div>
							<div>
								<div class="inpRow cols">
									<div class="inpRow">
										<div class="colGrp">
											<div class="colCell w_280">
												<span class="yesIpt b_size ipt_wSizeF hallWidth"> <input
													id="mainImage" name="file1" type="file">
													<input id="mainImage" name="mainImage" type="hidden" value="${show.mainImage}">
												</span>
											</div>
											<div class="colCell w_280">
												<span class="yesIpt b_size ipt_wSizeF hallWidth"> <input
													id="subImage" name="file2" type="file">
													<input id="subImage" name="subImage" type="hidden" value="${show.subImage}">
												</span>
											</div>
										</div>
									</div>
									<div class="inpRow">
										<dl class="concertHall">
											<dt class="imgCol">
												<strong>공연정보</strong>
											</dt>
										</dl>
									</div>
								</div>
							</div>
						</div>
						<!-- ==================== 공연일정 입력 영역 시작 ==================== -->
						<div class="concertHall">
							<div class="inpRow">
								<div class="imgGrp">
									<div class="imgCol">
										<strong>예매 시작일</strong>
									</div>
									<div class="imgCol">
										<strong>공연 시간</strong>
									</div>
								</div>
								<div>
									<div class="inpRow cols">
										<div class="inpRow">
											<div class="colGrp">
												<div class="colCell w_280">
													<span class="yesIpt b_size ipt_wSizeF hallWidth"> <input
														id="reservationDate" name="reservationDate" type="date">
													</span>
												</div>
												<div class="colCell w_280">
													<span class="yesIpt b_size ipt_wSizeF hallWidth"> <input
														id="showTime" name="showTime" type="text"
														placeholder="공연시간 입력" class="inpwid"
														value="${show.showTime}">분
													</span>
												</div>

											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="inpRow">
								<div class="imgGrp">
									<div class="imgCol">
										<strong>공연 시작일</strong>
									</div>
									<div class="imgCol">
										<strong>공연 종료일</strong>
									</div>
								</div>
								<div>
									<div class="inpRow cols">
										<div class="inpRow">
											<div class="colGrp">
												<div class="colCell w_280">
													<span class="yesIpt b_size ipt_wSizeF hallWidth"> <input
														id="startDate" name="startDate" type="date"
														value="${show.startDate}">
													</span>
												</div>
												<div class="colCell w_280">
													<span class="yesIpt b_size ipt_wSizeF hallWidth"> <input
														id="endDate" name="endDate" type="date"
														value="${show.endDate}">
													</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- ==================== 공연 정보 입력 영역 시작 ==================== -->
						<div class="concertHall">
							<div class="inpRow">
								<div class="imgGrp">
									<div class="imgCol">
										<strong>공연명</strong>
									</div>
									<div class="imgCol">
										<strong>관람가</strong>
									</div>
									<div class="imgCol">
										<strong>공연장</strong>
									</div>
								</div>
								<div>
									<div class="inpRow cols">
										<div class="inpRow">
											<div class="colGrp">
												<div class="colCell w_280">
													<span class="yesIpt b_size ipt_wSizeF hallWidth"> 
													<input
														id="showSq" name="showSq" type="hidden"
														value="${show.showSq}">
													<input
														id="showName" name="showName" type="text"
														value="${show.showName}">
													</span>
												</div>
												<div class="colCell w_280">
													<span class="yesIpt b_size ipt_wSizeF hallWidth"> <input
														id="viewingAge" name="viewingAge" type="text"
														value="${show.viewingAge}" class="inpwid">세
													</span>
												</div>
												<div class="colCell w_280">
													<span class="yesIpt b_size ipt_wSizeF hallWidth"> <select
														id="concertHallName" name="concertHallSq"
														aria-selected="undefined">
														<c:forEach items="${concertHallList}" var="concertHall">
															<option id="concertHall${concertHall.concertHallSq}" value="${concertHall.concertHallSq}">${concertHall.concertHallName}</option>
														</c:forEach>
													</select>
													</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="inpRow">
								<div class="imgGrp">
									<div class="imgCol">
										<strong>연출</strong>
									</div>
									<div class="imgCol">
										<strong>출연진</strong>
									</div>
								</div>
								<div>
									<div class="inpRow cols">
										<div class="inpRow">
											<div class="colGrp">
												<div class="colCell w_280">
													<span class="yesIpt b_size ipt_wSizeF hallWidth"> <input
														id="director" name="director" type="text"
														value="${show.director}">
													</span>
												</div>
												<div class="colCell w_280">
													<span class="yesIpt b_size ipt_wSizeF hallWidth"> <input
														id="cast" name="cast" type="text" value="${show.cast}">
													</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- ==================== 공연금액 입력 영역 시작 ==================== -->
						<!-- ==================== 카테고리 정보 영역 시작 ==================== -->
						<dl class="concertHall">
							<dt>
								<strong>카테고리</strong>
							</dt>
							<dd>
								<div class="inpRow cols">
									<div id="category">
										<div class="cateGrp">
											<input id="category1" type="radio" name="category" value="1">뮤지컬
										</div>
										<div class="cateGrp">
											<input id="category2" type="radio" name="category" value="2">콘서트
										</div>
										<div class="cateGrp">
											<input id="category3" type="radio" name="category" value="3">연극
										</div>
										<div class="cateGrp">
											<input id="category4" type="radio" name="category" value="4">전시
										</div>
										<div class="cateGrp">
											<input id="category5" type="radio" name="category" value="5">클래식
										</div>
										<div class="cateGrp">
											<input id="category6" type="radio" name="category" value="6">아동
										</div>
									</div>
								</div>
							</dd>
						</dl>

						<div class="yesFormBtn">
							<div class="formBtn_btn">
								<a id="updateButton" href="#none"
									class="btnC xb_size btn_blue btn_wSizeH "> <span
									class="bWrap"><em id="emtxt" class="txt">수정</em></span>
								</a> <a id="cencleConcertHall" href=""
									class="btnC xb_size btn_blue btn_wSizeH "> <span
									class="bWrap"><em id="emtxt" class="txt">취소</em></span>
								</a>
							</div>
						</div>

						<!-- ==================== 정보 입력 영역 끝 ==================== -->
					</div>
				</form>

				<div id="wrapperContent"></div>
			</div>
		</section>
	</section>
</body>

<script>
	$(document).ready(function() {
		// 공연장 selected
		var concertHallSq = "${show.concertHallSq}";	
		$("#concertHall" + concertHallSq).prop("selected", true);
		
		// 카테고리 체크드
		var category = "${show.category}";
		$("#category" + category).prop("checked", true);

		// 날짜 Date타입 value에 넣기
		// 공연예정 날짜
		var reserv = "${show.reservationDate}";
		var parts = reserv.split(".");
		var reservationDate = parts[0] + "-" + parts[1] + "-" + parts[2];
		$("#reservationDate").val(reservationDate);
		// 공연시작 날짜
		var start = "${show.startDate}";
		var parts2 = start.split(".");
		var startDate = parts2[0] + "-" + parts2[1] + "-" + parts2[2];
		$("#startDate").val(startDate);
		// 공연 끝 날짜
		var end = "${show.endDate}";
		var parts3 = end.split(".");
		var endDate = parts3[0] + "-" + parts3[1] + "-" + parts3[2];
		$("#endDate").val(endDate);

		//수정버튼
		$("#updateButton").on("click", function() {
			console.log("수정");
			$("#updateShow").submit();
		});
	
	});
</script>
</html>