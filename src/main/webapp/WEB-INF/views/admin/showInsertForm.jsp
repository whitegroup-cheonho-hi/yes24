<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>showInsertForm</title>
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

.admRow .admSpan .container {
	border-top: solid 1px rgb(0, 0, 0);
	border-left: solid 1px rgb(0, 0, 0);
	align-items: center;
	display: none;
}
.tm_grp {height: 72px; margin-bottom: 25px;}
.tm_grp .tmM_txt{ display: inline-block;}
#concertHallName{cursor: pointer;}
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
					action="${pageContext.request.contextPath}/show/insertShow"
					id="insertShow" enctype="multipart/form-data">
					<div class="ySContRow w_900">
						<!-- ==================== 정보 입력 영역 시작 ==================== -->
						<div class="tm_grp">
							<h3 class="tmM_txt">
								<em class="tit_txt"><strong id="adminTit">공연 등록</strong></em>
							</h3>
						</div>

						<!-- ==================== 이미지 입력 영역 시작 ==================== -->
						<div class="concertHall">
							<div class="imgGrp">
								<div class="imgCol">
									<strong>메인 이미지 등록</strong>
								</div>
								<div class="imgCol">
									<strong>서브 이미지 등록</strong>
								</div>
							</div>
							<div>
								<div class="inpRow cols">
									<div class="inpRow">
										<div class="colGrp">
											<div class="colCell w_280">
												<span class="yesIpt b_size ipt_wSizeF hallWidth"> <input
													id="mainImage" name="file" type="file">
												</span>
											</div>
											<div class="colCell w_280">
												<span class="yesIpt b_size ipt_wSizeF hallWidth"> <input
													id="subImage" name="file" type="file">
												</span>
											</div>
										</div>
									</div>
									<div class="inpRow">
										<div class="concertHall">
											<div class="imgCol">
												<strong>상세 이미지 등록</strong>
											</div>
											<div class="colCell w_280">
												<span class="yesIpt b_size ipt_wSizeF hallWidth"> <input
													id="detailedImage" name="file" type="file">
												</span>
											</div>
										</div>
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
														placeholder="공연시간 입력" class="inpwid">분
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
														id="startDate" name="startDate" type="date">
													</span>
												</div>
												<div class="colCell w_280">
													<span class="yesIpt b_size ipt_wSizeF hallWidth"> <input
														id="endDate" name="endDate" type="date">
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
													<span class="yesIpt b_size ipt_wSizeF hallWidth"> <input
														id="showName" name="showName" type="text"
														placeholder="제목 입력">
													</span>
												</div>
												<div class="colCell w_280">
													<span class="yesIpt b_size ipt_wSizeF hallWidth"> <input
														id="viewingAge" name="viewingAge" type="text"
														placeholder="관람연령 입력" class="inpwid">세
													</span>
												</div>
												<div class="colCell w_280">
													<span class="yesIpt b_size ipt_wSizeF hallWidth"> <select
														id="concertHallName" name="concertHallSq"
														aria-selected="undefined">
															<option id="concertHall0" value="0" data-width="0">극장선택</option>
															<c:forEach items="${concertHallList}" var="concertHall">
																<option id="concertHall${concertHall.concertHallSq}"
																	data-width="${concertHall.concertHallWidth}"
																	data-height="${concertHall.concertHallHeight}"
																	value="${concertHall.concertHallSq}">${concertHall.concertHallName}</option>
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
														placeholder="연출자 입력">
													</span>
												</div>
												<div class="colCell w_280">
													<span class="yesIpt b_size ipt_wSizeF hallWidth"> <input
														id="cast" name="cast" type="text" placeholder="출연진 입력">
													</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- ==================== 카테고리 정보 영역 시작 ==================== -->
						<dl class="concertHall">
							<dt>
								<strong>카테고리</strong>
							</dt>
							<dd>
								<div class="inpRow cols">
									<div id="category">
										<div class="cateGrp">
											<input type="radio" name="category" value="1" checked="checked">뮤지컬
										</div>
										<div class="cateGrp">
											<input type="radio" name="category" value="2">콘서트
										</div>
										<div class="cateGrp">
											<input type="radio" name="category" value="3">연극
										</div>
										<div class="cateGrp">
											<input type="radio" name="category" value="4">전시
										</div>
										<div class="cateGrp">
											<input type="radio" name="category" value="5">클래식
										</div>
									</div>
								</div>
							</dd>
						</dl>

						<div class="yesFormBtn">
							<div class="formBtn_btn">
								<a id="insertButton" href="#none"
									class="btnC xb_size btn_blue btn_wSizeH "> <span
									class="bWrap"><em id="emtxt" class="txt">등록</em></span>
								</a> <a id="cencleConcertHall" href=""
									class="btnC xb_size btn_blue btn_wSizeH "> <span
									class="bWrap"><em id="emtxt" class="txt">취소</em></span>
								</a>
							</div>
						</div>
					</div>
				</form>
				<div id="wrapperContent"></div>
			</div>
		</section>
	</section>
</body>

<script>
	$(document).ready(function() {
		//공연등록
		$("#insertButton").on("click", function() {
			console.log("등록");
			$("#insertShow").submit();
		});

	});
</script>
</html>