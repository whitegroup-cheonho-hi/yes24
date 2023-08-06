<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>concert hall modify form</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/reset.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/joinForm.css" type="text/css">
<link rel="stylesheet"  href="${pageContext.request.contextPath }/assets/css/admin.css" type="text/css">
<link rel="stylesheet" type="text/css" href="https://image.yes24.com/sysimage/yesUI/yesUI.css?v=20230403" media="all">

<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet">

<!-- 제이쿼리 최신버전 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 우편번호 라이브러리 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
.concertHall .inpRow.cols .colGrp .colCell{ width: 282px;}
.btnC.b_size .bWrap{ width: 373px;}
.btnC.b_size .bWrap em.txt{ width: 100%;}
</style>
</head>
<body>
	<section>
		<!-- 헤더 -->
		<c:import url="/WEB-INF/views/includes/adminHeader.jsp"></c:import>
		<!-- //헤더 -->
		<section>
			<div id="ySContent">
				<form id="updateForm" method="post" action="${pageContext.request.contextPath}/concertHall/concertHallModify" >
					<div class="ySContRow w_900">
						<!-- ==================== 정보 입력 영역 시작 ==================== -->
						<div class="tm_grp">
							<h3 class="tmM_txt">
								<em class="tit_txt"><strong id="adminTit">공연장 정보 수정</strong></em>
							</h3>
						</div>

						<!-- ==================== 공연장 입력 영역 시작 ==================== -->
						<dl class="concertHall">
							<dt>
								<strong class="item_tit">공연장명</strong>
							</dt>
							<dd>
								<div class="inpRow">
									<span id="txtConHall" class="yesIpt b_size ipt_wSizeF chkVal">
										<input name="concertHallSq" type="hidden"
										value="${concertHall.concertHallSq}">
										<input id="txtConHall" name="concertHallName" type="text"
										value="${concertHall.concertHallName}">
									
									</span>
								</div>
							</dd>
						</dl>

						<!-- ==================== 좌석 입력 영역 시작 ==================== -->
						<dl class="concertHall">
							<dt>
								<strong class="item_tit">좌석입력</strong>
							</dt>
							<dd>
								<div class="inpRow cols">
									<div class="inpRow">
										<div class="colGrp">
											<div class="colCell w_280">
												<span id="admWidth" class="yesIpt b_size ipt_wSizeF">
													<input id="hallWidth" name="concertHallWidth" size="3"
													type="number" value="${concertHall.concertHallWidth}">
												</span>
											</div>
											<div class="colCell w_280">
												<span class="yesIpt b_size ipt_wSizeF"> <input
													id="hallHeight" name="concertHallHeight" size="3" type="number"
													 value="${concertHall.concertHallHeight}">
												</span>
											</div>
										</div>
									</div>

									<div class="inpRow">
										<button type="button" id="seetbtn"
											class="btnC xb_size btn_ist btn_wSizeF">
											<span class="bWrap"><em class="txt">좌석생성</em></span>
										</button>
									</div>
									<div class="admRow">
										<span class="admSpan">
											<span class="container"></span>
										</span>
									</div>
								</div>

							</dd>
						</dl>


						<!-- (((((((((((((((((((( 주소정보 영역 시작 )))))))))))))))))))) -->
						<dl class="concertHall">
							<dt>
								<strong class="item_tit">주소입력</strong>
							</dt>
							<dd>
								<div class="inpRow cols">
									<div class="colGrp">
										<div class="colCell w_280">
											<span id=""
												class="yesIpt b_size ipt_wSizeF"> <input id="addr1"
												name="concertHallPost" size="5" type="text" readonly="readonly"
												value="${concertHall.concertHallPost}">
											</span>
										</div>
										<div class="colCell pal10">
											<a id="aSelectPostalCode" href="javascript:void(0);"
												class="btnC b_size w_90"><span class="bWrap"><em
													class="txt">주소찾기</em></span></a>
										</div>
									</div>
								</div>								
								<div class="inpRow">
									<span id="spanCertifyIpt_Addr1"
										class="yesIpt b_size ipt_wSizeF"> <input
										id="addr2" name="concertHallRoadAddr" type="text"
										readonly="readonly" value="${concertHall.concertHallRoadAddr}">
									</span>
								</div>
								<div class="inpRow">
								<span id="spanCertifyIpt_Addr2" class="yesIpt b_size ipt_wSizeF">
									<input id="addr3" name="concertHallJibunAddr" type="text" readonly="readonly" value="${concertHall.concertHallJibunAddr}">
								</span>
								</div>								
							</dd>
						</dl>

						<div class="yesFormBtn">
							<div class="formBtn_btn">
								<a id="updateConcertHall" href="#none" 
									class="btnC xb_size btn_blue btn_wSizeH"> <span
									class="bWrap"><em id="emtxt" class="txt">수정</em></span>
								</a> <a id="deleteConcertHall" href="${pageContext.request.contextPath}/concertHall/concertHallDelete/${concertHall.concertHallSq}" 
									class="btnC xb_size btn_blue btn_wSizeH"> <span
									class="bWrap"><em id="emtxt" class="txt">삭제</em></span>
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
	// 로드되면서 좌석배치 보여주기
	$(document).ready(function() {
		$('#seetbtn').trigger('click');
	});
	
	//우편번호찾기
	$("#aSelectPostalCode").on("click", function() {
		console.log("우편번호");
		new daum.Postcode({
			oncomplete : function(data) {
			console.log(data);		
	 		$("#addr1").val(data.zonecode);
	 		$("#addr2").val(data.address);				
	 		$("#addr3").val(data.jibunAddress+data.autoJibunAddress);				
			}
		}).open();
	});
	//좌석배치 미리보기
	$("#seetbtn").on("click", function(){
			console.log('click');
			var num1 = parseInt($("input[name='concertHallWidth']").val()) + 65;
			var num2 = parseInt($("input[name='concertHallHeight']").val());
			var container = $('.container'); // .container 요소를 변수에 저장
			container.empty(); // .container 내부를 비움
			container.css({ 'grid-template-columns': 'repeat(' + num2 + ', 30px)', 'display' : 'grid', 'width' : + num2 * 30 + 'px' });// display 속성을 grid로 설정
			for(var i=65; i<num1; i++){
				for(var j=1; j<=num2; j++){
					var item = $('<span>').addClass('item').text(String.fromCharCode(i)+j);
					container.append(item);
				}
			}
			container.show();
		}); 
	//극장수정
	$("#updateConcertHall").on("click",function(){
		console.log("수정");
		$("#updateForm").submit();
	});
</script>

</html>