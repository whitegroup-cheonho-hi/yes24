<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/reset.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/joinForm.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/admin.css" type="text/css">
<!-- 부트스트랩 -->
<link href="${pageContext.request.contextPath }/assets/css/bootstrap.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="https://image.yes24.com/sysimage/yesUI/yesUI.css?v=20230403" media="all">
<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet">
<!-- 제이쿼리 최신버전 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 부트스트랩js -->
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
<!-- 풀켈린더js -->
<script type="text/javascript" src='${pageContext.request.contextPath }/assets/js/index.global.min.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
</head>
<body>
	<section>
		<!-- 헤더 -->
		<c:import url="/WEB-INF/views/includes/adminHeader.jsp"></c:import>
		<!-- //헤더 -->
	</section>

	<section>
		<div id="ySContent">
			<form name="" method="post" action="" id="">
				<!-- <div class="ySContRow w_900"> -->
				<!-- ==================== 정보 입력 영역 시작 ==================== -->
				<div class="tm_grp">
					<h3 class="tmM_txt">
						<em class="tit_txt"><strong id="adminTit" style="margin-left: 20px;">회차 등록</strong></em>
					</h3>
				</div>

				<!-- ==================== 이미지 입력 영역 시작 ==================== -->
				<dl class="concertHall">
					<div class="inpRow">
						<dl class="concertHall">
							<dt class="imgCol" style="text-align: left; margin-left: 20px;"><strong>회차정보</strong></dt>
							<div class="position">
								<div id='calendar' class="calendar">1</div>
								<div id='dayList' class="calendar">2</div>
							</div>
						</dl>
					</div>
				</dl>

				<div class="yesFormBtn">
					<div class="formBtn_btn">
						<a id="insertConcertHall" href="" onclick="" class="btnC xb_size btn_blue btn_wSizeH ">
							<span class="bWrap"><em id="emtxt" class="txt">등록</em></span>
						</a>
						<a id="cencleConcertHall" href="" onclick="" class="btnC xb_size btn_blue btn_wSizeH ">
							<span class="bWrap"><em id="emtxt" class="txt">취소</em></span>
						</a>
					</div>
				</div>
				<!-- </div> -->
			</form>
		</div>
	</section>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">회차추가 모달</h4>
				</div>
				<div class="modal-body">
					<table class="fc-list-table">
						<div class="fc-list-day-cushion fc-cell-shaded">화요일</div>
						<thead>
							<tr class="modalhr">
								<th scope="col">공연명</th>
								<th scope="col">공연시간</th>
							</tr>
						</thead>
						<tbody>
							<tr data-date="" class="">
							</tr>
							<tr class="">
								<td><input type="text" id="title" class="showingInput" placeholder="공연명을 입력해주세요."></td>
								<td><input type="time" id="startTime" class="showingInput"> ~ <input type="time"
										id="endTime" class="showingInput"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button id="btnInsert" type="button" class="btn btn-primary">등록</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>