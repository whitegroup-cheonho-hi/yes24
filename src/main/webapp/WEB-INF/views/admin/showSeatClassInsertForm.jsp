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
<!-- 드레그 -->
<script type="text/javascript"
	src="http://www.google-analytics.com/ga.js"></script>
<script src="http://threedubmedia.com/inc/js/jquery-1.7.2.js"></script>
<script src="http://threedubmedia.com/inc/js/jquery.event.drag-2.2.js"></script>
<script
	src="http://threedubmedia.com/inc/js/jquery.event.drag.live-2.2.js"></script>
<script src="http://threedubmedia.com/inc/js/jquery.event.drop-2.2.js"></script>
<script
	src="http://threedubmedia.com/inc/js/jquery.event.drop.live-2.2.js"></script>
<script src="http://threedubmedia.com/inc/js/excanvas.min.js"></script>

<style>
#ySContent {width: 1200px;}
#ySContent .ySContRow {width: 900px;}
#ySContent .yesIpt {margin-right: 10px;margin-top: 10px;}
#category {width: 890px;}
#seatClass {height: 50px;}
#imgCol2 {margin-bottom: 10px;}
.admRow .admSpan .container {border-top: solid 1px rgb(0, 0, 0);border-left: solid 1px rgb(0, 0, 0);
	align-items: center;display: none;}
/* 드레그 */
.selection {position: absolute;	border: 1px solid #89B;	background: #BCE;background-color: #BEC;
	border-color: #8B9;}
.size2 {height: 118px;line-height: 118px;}
.size3 {height: 178px;line-height: 178px;}
.drop {float: left;background: #EEE;text-align: center;}
.dropped {background-color: #EBC;border-color: #B89;}
.active {background-color: #CEB;border-color: #9B8;}
.color1 {background-color: #e24647;}
.color2 {background-color: #dfa5ff;}
.color3 {background-color: #8fbfee;}
.color4 {background-color: #a5ea7b;}

#resetButton{    
    width: 70px;
    height: 35px;
    font-size: 14px;
    font-weight: bold;
    background-color:  #f43142;
    color: white;
    border: none;
    border-radius: 5px;
    margin-bottom: 5px;
    cursor: pointer;}
  #imgCol2{    display: flex;
    justify-content: space-between;}
 #seatClass button{width: 40px; height: 26px; font-size: 14px; cursor: pointer; border-radius: 5px; border: solid 1px gray;} 
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
					action="${pageContext.request.contextPath}/show/insertShowSeatClass"
					id="insertShowSeatClass">
					<div class="ySContRow w_900">
						<!-- ==================== 정보 입력 영역 시작 ==================== -->
						<div class="tm_grp">
							<h3 class="tmM_txt">
								<em class="tit_txt"><strong id="adminTit">공연 등록&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp; 공연 좌석클래스 등록</strong></em>
							</h3>
						</div>

						<!-- ==================== 공연금액 입력 영역 시작 ==================== -->
						<div class="concertHall">
							<div class="imgCol">
								<strong>좌석설정</strong>
							</div>
							<div class="inpRow">
								<div>
									<div class="inpRow cols">
										<div class="inpRow">
											<div class="colGrp">
												<div class="colCell w_280">
													<span class="yesIpt b_size ipt_wSizeF hallWidth"> <input
														id="seatClass1" name="seatClass" type="text"
														class="seatClass inpwid" placeholder="좌석등급 입력">석
													</span>
												</div>
												<div class="colCell w_280">
													<span class="yesIpt b_size ipt_wSizeF hallWidth"> <input
														id="seatPrice1" name="seatPrice" type="number"
														class="inpwid" placeholder="좌석금액 입력">원
													</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="inpRow">
								<div>
									<div class="inpRow cols">
										<div class="inpRow">
											<div class="colGrp">
												<div class="colCell w_280">
													<span class="yesIpt b_size ipt_wSizeF hallWidth"> <input
														id="seatClass2" name="seatClass" type="text"
														class="seatClass inpwid" placeholder="좌석등급 입력">석
													</span>
												</div>
												<div class="colCell w_280">
													<span class="yesIpt b_size ipt_wSizeF hallWidth"> <input
														id="seatPrice2" name="seatPrice" type="number"
														class="inpwid" placeholder="좌석금액 입력">원
													</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="inpRow">
								<div>
									<div class="inpRow cols">
										<div class="inpRow">
											<div class="colGrp">
												<div class="colCell w_280">
													<span class="yesIpt b_size ipt_wSizeF hallWidth"> <input
														id="seatClass3" name="seatClass" type="text"
														class="seatClass inpwid" placeholder="좌석등급 입력">석
													</span>
												</div>
												<div class="colCell w_280">
													<span class="yesIpt b_size ipt_wSizeF hallWidth"> <input
														id="seatPrice3" name="seatPrice" type="number"
														class="inpwid" placeholder="좌석금액 입력">원
													</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="inpRow">
								<div>
									<div class="inpRow cols">
										<div class="inpRow">
											<div class="colGrp">
												<div class="colCell w_280">
													<span class="yesIpt b_size ipt_wSizeF hallWidth"> <input
														id="seatClass4" name="seatClass" type="text"
														class="seatClass inpwid" placeholder="좌석등급 입력">석
													</span>
												</div>
												<div class="colCell w_280">
													<span class="yesIpt b_size ipt_wSizeF hallWidth"> <input
														id="seatPrice4" name="seatPrice" type="number"
														class="seatClass inpwid" placeholder="좌석금액 입력">원
													</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="admRow" id="dragForm">
							<div class="imgCol" id="imgCol2">
								<strong id="seatClass">등급선택 : </strong>
								<button type="button" id="resetButton">리셋</button>
							</div>
							<span class="admSpan"> <span class="container"></span>
							</span>
						</div>


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

		var showSq = "${show.showSq}";
		console.log(showSq);
		var concertHallSq = "${concertHall.concertHallSq}";
		var values = []; // 값을 저장할 배열
		var seatClassArry1 = []; // 좌석1번배열
		var seatClassArry2 = []; // 좌석2번배열
		var seatClassArry3 = []; // 좌석3번배열
		var seatClassArry4 = []; // 좌석4번배열
		var color = ['color1','color2','color3','color4']; // 색 클래스 부여	
		
		//좌석정보등록
		$("#seatClass4").on("change",function(){
			var seatClass1 = $("#seatClass1").val();
			var seatClass2 = $("#seatClass2").val();
			var seatClass3 = $("#seatClass3").val();
			var seatClass4 = $("#seatClass4").val();
			
			var seatClass = [seatClass1,seatClass2,seatClass3,seatClass4]; 
		
			var isAllDifferent = seatClass.every(function(value, index, array) {
				  return array.indexOf(value) === index; // 배열의 모든 요소가 중복되지 않는지 확인하는 함수
				});

				if (isAllDifferent) { // 모든 값이 중복되지 않는 경우
				
					//입력받은 좌석 클래스 반복문으로 버튼만들기
					for(var i = 0; i<seatClass.length; i++){
					
					var item = '&nbsp;<button type="button" class="'+color[i]+'" id='+seatClass[i]+'>'+seatClass[i]+'</button>';
					$("#seatClass").append(item);
				
					}
					//첫번째 버튼 클릭시
					$("#" + seatClass1).on("click", function() {
					  // values를 사용하여 seatClass1의 업데이트된 class를 적용	
					  updateSeatClass(values, "color1 seat1");
									
					  // seatClassArry2,3,4에서 values에 해당하는 텍스트를 포함하지 않는 요소들로 필터링
					  seatClassArry2 = seatClassArry2.filter(element => !values.includes($("#" + element).text()));
					  seatClassArry3 = seatClassArry3.filter(element => !values.includes($("#" + element).text()));
					  seatClassArry4 = seatClassArry4.filter(element => !values.includes($("#" + element).text()));
					
					  seatClassArry1 = $(".container span.seat1").map(function() {
					    return $(this).text();
					  }).get();					
					});
					
						//두번째 버튼 클릭시
					$("#" + seatClass2).on("click", function() {
					  updateSeatClass(values, "color2 seat2");
					
					  seatClassArry1 = seatClassArry1.filter(element => !values.includes($("#" + element).text()));
					  seatClassArry3 = seatClassArry3.filter(element => !values.includes($("#" + element).text()));
					  seatClassArry4 = seatClassArry4.filter(element => !values.includes($("#" + element).text()));
					
					  seatClassArry2 = $(".container span.seat2").map(function() {
					    return $(this).text();
					  }).get();					
					});
														
					//세번째 버튼 클릭시
					$("#" + seatClass3).on("click", function() {
					  updateSeatClass(values, "color3 seat3");
										
					  seatClassArry1 = seatClassArry1.filter(element => !values.includes($("#" + element).text()));
					  seatClassArry2 = seatClassArry2.filter(element => !values.includes($("#" + element).text()));
					  seatClassArry4 = seatClassArry4.filter(element => !values.includes($("#" + element).text()));
					
					  seatClassArry3 = $(".container span.seat3").map(function() {
					    return $(this).text();
					  }).get();
					});
					
					//네번째 버튼 클릭시
					$("#" + seatClass4).on("click", function() {
					  updateSeatClass(values, "color4 seat4");
										  
					  seatClassArry1 = seatClassArry1.filter(element => !values.includes($("#" + element).text()));
					  seatClassArry2 = seatClassArry2.filter(element => !values.includes($("#" + element).text()));
					  seatClassArry3 = seatClassArry3.filter(element => !values.includes($("#" + element).text()));
					
					  seatClassArry4 = $(".container span.seat4").map(function() {
					    return $(this).text();
					  }).get();					
					});

					// 좌석 클래스 업데이트 함수
					function updateSeatClass(seatClassArry, classs) {
					  for (let i = 0; i < seatClassArry.length; i++) {
					    var id = seatClassArry[i];
					    $("#" + id).removeClass("dropped").addClass(classs);
					  }
					}						
				
				} else { // 중복된 값이 존재하는 경우
					
				  alert("중복된 값이 존재합니다.");
				
				}				
		});	
		
	
		//좌석배치 미리보기
		var num1 = 65 + Number('${concertHall.concertHallWidth}');		
		var num2 = '${concertHall.concertHallHeight}';
		
		var container = $('.container'); // .container 요소를 변수에 저장
		container.empty(); // .container 내부를 비움
		container.css({ 'grid-template-columns': 'repeat(' + num2 + ', 30px)', 'display' : 'grid', 'width' : + num2 * 30 + 'px' });// display 속성을 grid로 설정
		
		for (var i = 65; i < num1; i++) {
			  for (var j = 1; j <= num2; j++) {
			    var seatNo = String.fromCharCode(i) + j;
			    var item = $('<span>').addClass('item drop').text(seatNo).attr("id",seatNo);
			    container.append(item);		
			  }
			}
		container.show();
			
			
		//좌석 등급 등록
		$("#insertButton").on("click", function() {			
			console.log("등록");
			
			var seatClassList = [
				//1번째 클래스정보
			    { seatPrice: $("#seatPrice1").val(), seatClass: $("#seatClass1").val(),
			      seatClassList: seatClassArry1, showSq: showSq, concertHallSq: concertHallSq },
				//2번째 클래스정보
			    { seatPrice: $("#seatPrice2").val(), seatClass: $("#seatClass2").val(),
			      seatClassList: seatClassArry2, showSq: showSq, concertHallSq: concertHallSq },
				//3번째 클래스정보
			    { seatPrice: $("#seatPrice3").val(), seatClass: $("#seatClass3").val(),
			      seatClassList: seatClassArry3, showSq: showSq, concertHallSq: concertHallSq },
				//4번째 클래스정보
			    { seatPrice: $("#seatPrice4").val(), seatClass: $("#seatClass4").val(),
			      seatClassList: seatClassArry4, showSq: showSq, concertHallSq: concertHallSq }   
			  ];
			
				console.log(seatClassList);
			 // 공연클래스 좌석 등록 ajax						
			  $.ajax({
				
				url : "${pageContext.request.contextPath}/show/insertSeatClass",		
				type : "post",
				contentType : "application/json",
				data : JSON.stringify(seatClassList),
			
				dataType : "json",
				success : function(result){
					
			    window.location.href = '${pageContext.request.contextPath}/showing/showingInsertForm/'+showSq;
			
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});   
 
		});
		
		
		// 드래그 시작 시에 처리할 내용
		$("#dragForm")
		  .on('dragstart', function(ev, dd) {
		    return $('<div class="selection" />')
		      .css('opacity', 0.65)
		      .appendTo(document.body);
		  })
		  .on('drag', function(ev, dd) {
		    $(dd.proxy).css({
		      top: Math.min(ev.pageY, dd.startY),
		      left: Math.min(ev.pageX, dd.startX),
		      height: Math.abs(ev.pageY - dd.startY),
		      width: Math.abs(ev.pageX - dd.startX)
		    });
		  })
		  .on('dragend', function(ev, dd) {
		    $(dd.proxy).remove();
		    console.log('drag');
		    
		    values = []; // 배열초기화
		
		    $(".dropped").each(function(index) {
		      var text = $(this).text();
		      var hasClass = $(this).hasClass("dropped");
		
		      // "dropped" 클래스가 있는 경우에만 추가
		      if (hasClass && !values.includes(text)) {
		        values.push(text);
		       
		      } else if (!hasClass && values.includes(text)) {
		    	
		        values.splice(values.indexOf(text), 1);
		      }
		    });		
		    
		  });
		$('.drop')
		  .on('dropstart', function() {
		    $(this).addClass('active'); // 드롭 시작 시 활성화 클래스 추가
		  })
		  .on('drop', function(ev, dd) {	
		    $(this).toggleClass('dropped'); // 드롭 시 드롭된 요소에 드롭 클래스 토글
		  })
		  .on('dropend', function() {		 
		    $(this).removeClass('active color1 color2 color3 color4 seat1 seat2 seat3 seat4'); // 드롭 종료 시 활성화 클래스 제거

		  });
		
		$.drop({ multi: true }); // 다중 드롭 설정
	
		// 리셋버튼
		$("#resetButton").on("click",function(){
			console.log("리셋");
			
			$(".item").removeClass("dropped color1 seat1 color2 seat2 color3 seat3 color4 seat4");
			
		});
	
	});
</script>
</html>