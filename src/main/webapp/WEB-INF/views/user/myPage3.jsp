<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
#warp {
	height: 530px;
}

.mypage_contain {
	margin-bottom: 112px;
}
.arlarmCancelButton {
    background-color: #f43142;
    color: #fff;
    width: 50px;
    height: 21px;
    border: none;
    cursor: pointer;
}
#aLink a{text-decoration: none;}
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
								&nbsp;<b class="subtitle">알림 신청 내역 </b>
							</h2>
							<div id="divOrderList" style="">
								<table class="tmypage" summary="티켓 오픈 알람">
									<colgroup>
										<col width="30%">
										<col width="*%">
										<col width="20%">
										<col width="15%">
										<col width="10%">
									</colgroup>
									<thead>
										<tr>
											<th scope="row" class="fst">공연명</th>
											<th scope="row">선택 기간</th>
											<th scope="row">좌석</th>
											<th scope="row">금액</th>
											<th scope="row" class="end">비고</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${alarmList}" var="alarm">
											<tr>
												<td>${alarm.showName}</td>
												<td>${alarm.startDate}&nbsp;&nbsp;~&nbsp;&nbsp;${alarm.endDate}</td>
												<td>${alarm.seatClasss}</td>
												<td scope="row"><fmt:formatNumber type="number"
														maxFractionDigits="3" value="${alarm.price}" />원</td>
												<td scope="row">
												<button class="arlarmCancelButton" type="button" data-transferalarmsq="${alarm.transferAlarmSq}">취소</button></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<!-- 양도표 알람 -->
					<div class="mypage_contain">
						<div class="mycont">
							<h2 class="tit">
								&nbsp;<b class="subtitle">알림함</b>
							</h2>
							<div id="divOrderList" style="">
								<table class="tmypage" summary="최근 예매내역 리스트">
									<colgroup>
										<col width="25%">
										<col width="20%">
										<col width="*">									
									</colgroup>
									<thead>
										<tr>
											<th scope="row" class="fst">알림날짜</th>
											<th scope="row">제목</th>
											<th scope="row">게시글보기</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${notificationList}" var="notification">
										<tr>
											<td>${notification.recipientsRegDate}</td>
											<td>${notification.recipientsTitle}</td>
											<td id="aLink">${notification.recipientsContent}</td>
											
										</tr>
									</c:forEach>
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
<script>

 //알림신청 취소
$(".arlarmCancelButton").on("click",function(){
	
	var result = confirm("정말 취소 하시겠습니까?");
	if (result) {
		
		var transferAlarmSq = $(this).data("transferalarmsq");
				
		$.ajax({
		    url: "${pageContext.request.contextPath}/alarm/arlarmCance",
		    type: "post",
		    //contentType: "application/json", 				    
		    data: {transferAlarmSq : transferAlarmSq} ,
		    
		    dataType: "json",				    
		    success: function(result) {
		    	console.log(result);
		    
		    	location.reload();
		    },
		    error: function(XHR, status, error) {
		      console.error(status + " : " + error);
		    }
	 	});
		
	}else{
		
		
	}
	
}); 

</script>
</html>