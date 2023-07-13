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
<script type="text/javascript" src="http://www.google-analytics.com/ga.js"></script><script src="http://threedubmedia.com/inc/js/jquery-1.7.2.js"></script>
<script src="http://threedubmedia.com/inc/js/jquery.event.drag-2.2.js"></script>
<script src="http://threedubmedia.com/inc/js/jquery.event.drag.live-2.2.js"></script>
<script src="http://threedubmedia.com/inc/js/jquery.event.drop-2.2.js"></script>
<script src="http://threedubmedia.com/inc/js/jquery.event.drop.live-2.2.js"></script>
<script src="http://threedubmedia.com/inc/js/excanvas.min.js"></script>

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
#seatClass{height:50px;}
#imgCol2{margin-bottom: 10px;}
/* 드레그 */
.selection {
    position: absolute;
    border: 1px solid #89B;
    background: #BCE;
    background-color: #BEC;
    border-color: #8B9;
    }
.size2 {
    height: 118px;
    line-height: 118px;
    }
.size3 {
    height: 178px;
    line-height: 178px;
    }
.drop {
    float: left;   
    background: #EEE;
    text-align: center;    

    }
.dropped {
    background-color: #EBC;
    border-color: #B89;
    }	
.active {  
    background-color: #CEB;
    border-color: #9B8;
    }
.red {background-color: red;}
.blue {background-color: blue;}
.orange {background-color: orange;}
.green {background-color: green;}
        
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
								<em class="tit_txt"><strong id="adminTit">공연 좌석클래스
										등록</strong></em>
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
						<div class="admRow">
							<div class="imgCol" id="imgCol2">
								<strong id="seatClass">등급선택</strong>
							</div>
							<span class="admSpan" > <span class="container"></span>
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
		
		var values = []; // 값을 저장할 배열
		var seatClassArry1 = []; // 좌석1번배열
		var seatClassArry2 = []; // 좌석2번배열
		var seatClassArry3 = []; // 좌석3번배열
		var seatClassArry4 = []; // 좌석4번배열
			
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
					var color = ['red','blue','orange','green'];
					//입력받은 좌석 클래스 반복문으로 버튼만들기
					for(var i = 0; i<seatClass.length; i++){
					
					var item = '&nbsp;<button type="button" class="'+color[i]+'" id='+seatClass[i]+'>'+seatClass[i]+'</button>';
					$("#seatClass").append(item);
				
					}
				
					// 첫번째 좌석클래스버튼								
					$("#"+seatClass1).on("click",function() {
						console.log(seatClass1);
						seatClassArry1 = values;
						
						for (let i = 0; i < seatClassArry1.length; i++) {
							  var id = seatClassArry1[i];
							  console.log(id);						  
							  $("#"+id).addClass("red");
							  $("#"+id).removeClass("dropped");
							}
						
					});
					// 두번째 좌석클래스버튼
					$("#"+seatClass2).on("click",function() {
						console.log(seatClass2);
						seatClassArry2 = values;
						
						for (let i = 0; i < seatClassArry2.length; i++) {
							  var id = seatClassArry2[i];
							  console.log(id);
							  $("#"+id).removeClass("dropped");
							  $("#"+id).addClass("blue");
							}
						
					});
					// 세번째 좌석클래스버튼
					$("#"+seatClass3).on("click",function() {
						console.log(seatClass3);
						seatClassArry3 = values;	
						
						for (let i = 0; i < seatClassArry3.length; i++) {
							  var id = seatClassArry3[i];
							  console.log(id);
							  $("#"+id).removeClass("dropped");
							  $("#"+id).addClass("orange");
							}
					});
					// 네번째 좌석클래스버튼
					$("#"+seatClass4).on("click",function() {
						console.log(seatClass4);
						seatClassArry4 = values;
						
						for (let i = 0; i < seatClassArry4.length; i++) {
							  var id = seatClassArry4[i];
							  console.log(id);
							  $("#"+id).removeClass("dropped");
							  $("#"+id).addClass("green");
							}
					});		
										
				
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
			
			
		//공연등록
		$("#insertButton").on("click", function() {
			console.log("등록");
			$("#insertShowSeatClass").submit();
		});
		
		
		// 드래그 시작 시에 처리할 내용
		$(document)
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
		    values = [];
		
		    $(".dropped").each(function(index) {
		      var text = $(this).text();
		      var hasClass = $(this).hasClass("dropped");
		
		      // "dropped" 클래스가 있는 경우에만 추가
		      if (hasClass && !values.includes(text)) {
		        values.push(text);
		        console.log("data", values);
		      } else if (!hasClass && values.includes(text)) {
		    	console.log("data", "중복체크");
		        values.splice(values.indexOf(text), 1);
		      }
		    });
		
		    console.log(values.length);
		    console.log("type", typeof(values));
		  });
		$('.drop')
		  .on('dropstart', function() {
		    $(this).addClass('active'); // 드롭 시작 시 활성화 클래스 추가
		  })
		  .on('drop', function(ev, dd) {	
		    $(this).toggleClass('dropped'); // 드롭 시 드롭된 요소에 드롭 클래스 토글
		  })
		  .on('dropend', function() {
		    $(this).removeClass('active'); // 드롭 종료 시 활성화 클래스 제거
		    $(this).removeClass('red');
		    $(this).removeClass('blue');
		    $(this).removeClass('orange');
		    $(this).removeClass('green');
		    console.log('드롭 완료');
		  });
		
		$.drop({ multi: true }); // 다중 드롭 설정
	
		
	});
</script>
</html>