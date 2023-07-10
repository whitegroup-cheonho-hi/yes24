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
<!-- 에디터 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/summernote-ko-KR.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/summernote-lite.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/summernote-lite.css">
</head>
<body>
	<section>
		<!-- 헤더 -->
		<c:import url="/WEB-INF/views/includes/adminHeader.jsp"></c:import>
		<!-- //헤더 -->

		<section>
			<div id="ySContent">
				<form name="" method="post" action="" id="" >
					<div class="ySContRow w_900">
						<!-- ==================== 정보 입력 영역 시작 ==================== -->
						<div class="tm_grp">
							<h3 class="tmM_txt">
								<em class="tit_txt"><strong id="adminTit">공연 등록</strong></em>
							</h3>
						</div>

						<!-- ==================== 이미지 입력 영역 시작 ==================== -->
						<dl class="concertHall">
							<div class="imgGrp">
								<dt class="imgCol">
									<strong>메인 이미지 등록</strong>
								</dt>
								<dt class="imgCol">
									<strong>서브 이미지 등록</strong>
								</dt>
							</div>
							<dd>
								<div class="inpRow cols">
									<div class="inpRow">
										<div class="colGrp">
											<div class="colCell w_280">
												<span id="hallWidth" class="yesIpt b_size ipt_wSizeF">
													<input id="mainImage" name="mainImage" type="file">
												</span>
											</div>
											<div class="colCell w_280">
												<span id="hallHeight" class="yesIpt b_size ipt_wSizeF">
													<input id="subImage" name="subImage" type="file">
												</span>
											</div>
										</div>
									</div>
									<div class="inpRow">
										<dl class="concertHall">
											<dt class="imgCol">
												<strong>공연정보</strong>
											</dt>
											<div id="editor" name="showContent">
												<!-- <textarea id="showContent" name="showContent"></textarea> -->
											</div>
										</dl>
									</div>
								</div>
							</dd>
						</dl>
						<!-- ==================== 공연일정 입력 영역 시작 ==================== -->
						<dl class="concertHall">
							<div class="inpRow">
								<div class="imgGrp">
									<dt class="imgCol">
										<strong>예매 시작일</strong>
									</dt>
									<dt class="imgCol">
										<strong>공연 시간</strong>
									</dt>
								</div>
								<dd>
									<div class="inpRow cols">
										<div class="inpRow">
											<div class="colGrp">
												<div class="colCell w_280">
													<span id="hallWidth" class="yesIpt b_size ipt_wSizeF">
														<input id="reservationDate" name="reservationDate"
														type="date">
													</span>
												</div>
												<div class="colCell w_280">
													<span id="hallHeight" class="yesIpt b_size ipt_wSizeF">
														<input id="showTime" name="showTime" type="text"
														placeholder="공연시간 입력" class="inpwid">분
													</span>
												</div>

											</div>
										</div>
									</div>
								</dd>
							</div>
							<div class="inpRow">
								<div class="imgGrp">
									<dt class="imgCol">
										<strong>공연 시작일</strong>
									</dt>
									<dt class="imgCol">
										<strong>공연 종료일</strong>
									</dt>
								</div>
								<dd>
									<div class="inpRow cols">
										<div class="inpRow">
											<div class="colGrp">
												<div class="colCell w_280">
													<span id="hallWidth" class="yesIpt b_size ipt_wSizeF">
														<input id="startDate" name="startDate" type="date">
													</span>
												</div>
												<div class="colCell w_280">
													<span id="hallHeight" class="yesIpt b_size ipt_wSizeF">
														<input id="endDate" name="endDate" type="date">
													</span>
												</div>
											</div>
										</div>
									</div>
								</dd>
							</div>
						</dl>
						<!-- ==================== 공연 정보 입력 영역 시작 ==================== -->
						<dl class="concertHall">
							<div class="inpRow">
								<div class="imgGrp">
									<dt class="imgCol">
										<strong>공연명</strong>
									</dt>
									<dt class="imgCol">
										<strong>관람가</strong>
									</dt>
									<dt class="imgCol">
										<strong>공연장</strong>
									</dt>
								</div>
								<dd>
									<div class="inpRow cols">
										<div class="inpRow">
											<div class="colGrp">
												<div class="colCell w_280">
													<span id="hallWidth" class="yesIpt b_size ipt_wSizeF">
														<input id="showName" name="showName" type="text"
														placeholder="제목 입력">
													</span>
												</div>
												<div class="colCell w_280">
													<span id="hallWidth" class="yesIpt b_size ipt_wSizeF">
														<input id="viewingAge" name="viewingAge" type="text"
														placeholder="관람연령 입력" class="inpwid">세
													</span>
												</div>
												<div class="colCell w_280">
													<span id="hallHeight" class="yesIpt b_size ipt_wSizeF">
														<select id="concertHallName" name="concertHallName"
														aria-selected="undefined">
															<option value="" selected disabled hidden></option>
															<option value="천호홀">천호홀</option>
															<option value="잠실홀">잠실홀</option>
															<option value="강남홀">강남홀</option>
													</select>
													</span>
												</div>
											</div>
										</div>
									</div>
								</dd>
							</div>
							<div class="inpRow">
								<div class="imgGrp">
									<dt class="imgCol">
										<strong>연출</strong>
									</dt>
									<dt class="imgCol">
										<strong>출연진</strong>
									</dt>
								</div>
								<dd>
									<div class="inpRow cols">
										<div class="inpRow">
											<div class="colGrp">
												<div class="colCell w_280">
													<span id="hallWidth" class="yesIpt b_size ipt_wSizeF">
														<input id="director" name="director" type="text"
														placeholder="연출자 입력">
													</span>
												</div>
												<div class="colCell w_280">
													<span id="hallHeight" class="yesIpt b_size ipt_wSizeF">
														<input id="cast" name="cast" type="text"
														placeholder="출연진 입력">
													</span>
												</div>
											</div>
										</div>
									</div>
								</dd>
							</div>
						</dl>
						<!-- ==================== 공연금액 입력 영역 시작 ==================== -->
						<dl class="concertHall">
							<dt class="imgCol">
								<strong>좌석설정</strong>
							</dt>
							<div class="inpRow">
								<dd>
									<div class="inpRow cols">
										<div class="inpRow">
											<div class="colGrp">
												<div class="colCell w_280">
													<span id="hallWidth" class="yesIpt b_size ipt_wSizeF">
														<input id="seetClass1" name="seetClass1" type="text"
														class="inpwid" placeholder="좌석등급 입력">석
													</span>
												</div>
												<div class="colCell w_280">
													<span id="hallHeight" class="yesIpt b_size ipt_wSizeF">
														<input id="seetPrice1" name="seetPrice1" type="text"
														class="inpwid" placeholder="좌석금액 입력">원
													</span>
												</div>
											</div>
										</div>
									</div>
								</dd>
							</div>
							<div class="inpRow">
								<dd>
									<div class="inpRow cols">
										<div class="inpRow">
											<div class="colGrp">
												<div class="colCell w_280">
													<span id="hallWidth" class="yesIpt b_size ipt_wSizeF">
														<input id="seetClass2" name="seetClass2" type="text"
														class="inpwid" placeholder="좌석등급 입력">석
													</span>
												</div>
												<div class="colCell w_280">
													<span id="hallHeight" class="yesIpt b_size ipt_wSizeF">
														<input id="seetPrice2" name="seetPrice2" type="text"
														class="inpwid" placeholder="좌석금액 입력">원
													</span>
												</div>
											</div>
										</div>
									</div>
								</dd>
							</div>
							<div class="inpRow">
								<dd>
									<div class="inpRow cols">
										<div class="inpRow">
											<div class="colGrp">
												<div class="colCell w_280">
													<span id="hallWidth" class="yesIpt b_size ipt_wSizeF">
														<input id="seetClass3" name="seetClass3" type="text"
														class="inpwid" placeholder="좌석등급 입력">석
													</span>
												</div>
												<div class="colCell w_280">
													<span id="hallHeight" class="yesIpt b_size ipt_wSizeF">
														<input id="seetPrice3" name="seetPrice3" type="text"
														class="inpwid" placeholder="좌석금액 입력">원
													</span>
												</div>
											</div>
										</div>
									</div>
								</dd>
							</div>
							<div class="inpRow">
								<dd>
									<div class="inpRow cols">
										<div class="inpRow">
											<div class="colGrp">
												<div class="colCell w_280">
													<span id="hallWidth" class="yesIpt b_size ipt_wSizeF">
														<input id="seetClass4" name="seetClass4" type="text"
														class="inpwid" placeholder="좌석등급 입력">석
													</span>
												</div>
												<div class="colCell w_280">
													<span id="hallHeight" class="yesIpt b_size ipt_wSizeF">
														<input id="seetPrice4" name="seetPrice4" type="text"
														class="inpwid" placeholder="좌석금액 입력">원
													</span>
												</div>
											</div>
										</div>
									</div>
								</dd>
							</div>
						</dl>

						<!-- ==================== 카테고리 정보 영역 시작 ==================== -->
						<dl class="concertHall">
							<dt>
								<strong>카테고리</strong>
							</dt>
							<dd>
								<div class="inpRow cols">
									<span id="category">
										<div class="cateGrp">
											<input type="radio" name="category" value="뮤지컬">뮤지컬
										</div>
										<div class="cateGrp">
											<input type="radio" name="category" value="콘서트">콘서트
										</div>
										<div class="cateGrp">
											<input type="radio" name="category" value="연극">연극
										</div>
										<div class="cateGrp">
											<input type="radio" name="category" value="전시">전시
										</div>
										<div class="cateGrp">
											<input type="radio" name="category" value="클래식">클래식
										</div>
										<div class="cateGrp">
											<input type="radio" name="category" value="아동">아동
										</div>
									</span>
								</div>
							</dd>
						</dl>

						<div class="yesFormBtn">
							<div class="formBtn_btn">
								<a id="insertConcertHall" href="" onclick=""
									class="btnC xb_size btn_blue btn_wSizeH "> <span
									class="bWrap"><em id="emtxt" class="txt">등록</em></span>
								</a> <a id="cencleConcertHall" href="" onclick=""
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
		$('#editor').summernote({
			height : 300, // 에디터 높이
			minHeight : null, // 최소 높이
			maxHeight : null, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
			placeholder : "입력해라"
		});

		// 서머노트에 text 쓰기
		$('#summernote').summernote('insertText', '써머노트에 쓸 텍스트');
		// 서머노트 쓰기 비활성화
		$('#summernote').summernote('disable');
		// 서머노트 쓰기 활성화
		$('#summernote').summernote('enable');
		// 서머노트 리셋
		$('#summernote').summernote('reset');
		// 마지막으로 한 행동 취소 ( 뒤로가기 )
		$('#summernote').summernote('undo');
		// 앞으로가기
		$('#summernote').summernote('redo');
	});
</script>
</html>