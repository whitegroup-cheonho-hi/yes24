<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/reset.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/sub.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/user.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/myPage.css"
	type="text/css">
<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap"
	rel="stylesheet">
<!-- 제이쿼리 최신버전 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
#warp {
	height: 530px;
}
.mypage_contain{ margin-bottom: 112px;} 
</style>
</head>
<body>
	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- //헤더 -->
	<section>
		<div id="warp">
			<!-- container -->
			<div id="container">
				<!-- 본문 -->
				<div class="cont_section">
					<!-- aside -->
					<c:import url="/WEB-INF/views/includes/userNav.jsp"></c:import>
					<!-- //aside -->
					<div class="date_list bg">
						<br> <b class="subtitle">나의 맟춤 설정</b>
						<div>
							<ul>
								<li class="sec"><span>알림일자별 조회</span> <input id="txtStart"
									type="text" class="date imedisable w70 hasDatepicker"
									style="width: 90px; z-index: 999;" autocomplete="off"><img
									class="ui-datepicker-trigger"
									src="https://stkfile.yes24.com/img/mypage/btn_cal.gif"
									alt="날짜를 선택하세요.
					
					<달력콘트롤>
					년(年)단위 이동: Ctrl + PgUp/PgDn 키
					월(月)단위 이동: PgUp/PgDn 키"
									title="날짜를 선택하세요.
					
					<달력콘트롤>
					년(年)단위 이동: Ctrl + PgUp/PgDn 키
					월(月)단위 이동: PgUp/PgDn 키">
									~ <input id="txtEnd" type="text"
									class="date imedisable w70 hasDatepicker"
									style="width: 90px; z-index: 999; position: relative;"
									autocomplete="off"><img class="ui-datepicker-trigger"
									src="https://stkfile.yes24.com/img/mypage/btn_cal.gif"
									alt="날짜를 선택하세요.
					
					<달력콘트롤>
					년(年)단위 이동: Ctrl + PgUp/PgDn 키
					월(月)단위 이동: PgUp/PgDn 키"
									title="날짜를 선택하세요.
					
					<달력콘트롤>
					년(年)단위 이동: Ctrl + PgUp/PgDn 키
					월(月)단위 이동: PgUp/PgDn 키">
									<a id="imgSearch" href="#"><img
										src="https://stkfile.yes24.com/img/mypage/btn_srch.gif"
										alt="조회"></a></li>
							</ul>
						</div>
					</div>

					<div class="mypage_contain">
						<div class="mycont">
							<h2 class="tit">
								&nbsp;<b class="subtitle">티켓 오픈 알람</b>
							</h2>
							<div id="divOrderList" style="">
								<table class="tmypage" summary="티켓 오픈 알람">
									<colgroup>
										<col width="12%">
										<col width="8%">
										<col width="*">
										<col width="10%">
										<col width="10%">
									</colgroup>
									<thead>
										<tr>
											<th scope="row" class="fst">예매일</th>
											<th scope="row">예매번호</th>
											<th scope="row">공연명</th>
											<th scope="row">관람일시</th>
											<th scope="row" class="end">예매상태</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="5" class="le ri">최근 예매내역이 없습니다.</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<!-- 양도표 알람 -->
					<div class="mypage_contain">
						<div class="mycont">
							<h2 class="tit">
								&nbsp;<b class="subtitle">양도 티켓 알람</b>
							</h2>
							<div id="divOrderList" style="">
								<table class="tmypage" summary="최근 예매내역 리스트">
									<colgroup>
										<col width="12%">
										<col width="8%">
										<col width="*">
										<col width="10%">
										<col width="10%">
									</colgroup>
									<thead>
										<tr>
											<th scope="row" class="fst">예매일</th>
											<th scope="row">예매번호</th>
											<th scope="row">공연명</th>
											<th scope="row">관람일시</th>
											<th scope="row" class="end">예매상태</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="5" class="le ri">최근 예매내역이 없습니다.</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- //본문 -->
			</div>
		</div>
	</section>
	<!-- Footer -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- //Footer -->

</body>
</html>