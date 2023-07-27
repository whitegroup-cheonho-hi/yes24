<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ticketing</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/reset.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/ticketing.css"
	type="text/css">
<!-- 제이쿼리 최신 버전 -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
#guideview {margin-left: 25px;}
.f_header {margin-top: 70px;margin-left: 10px;height: 34px;}
#br {margin-bottom: 5px;margin-left: 25px;}
#header{background-color: #363636;}
.result{background-color: #363636; color : #fff;}
#ptitle a{color: #FFFFFF; font-size: 15px;}
#brup{padding: 0;}
.minimap_m h2{font-size: 15px;}
.minimap_m>* {padding: 5px;}
.ulLegend {height: 150px;width: 239px;}
.gnb li {float: left;background:url("${pageContext.request.contextPath}/assets/images/예매순서.png");height: 52px;width: 120px;}
.admRow {margin-top: 10px;height: 530px;}
.admSpan {display: flex;justify-content: center;box-sizing: border-box;background-color: #fff;padding: 9px 14px 11px;line-height: 28px;display: flex;text-align: center;}
#container {align-items: center;display: none;}
#container .item {color: black;}
.item {width: 23px;height: 23px;background-color: #efdfdf;border-radius: 8px 8px 0 0;border: solid 1px #fff;text-align: center;font-size: 17px;box-sizing: border-box;}
#cover {margin-top: 46px;background-color: lightgray;}
#cover .admRow .admSpan{background-color: lightgray; margin-top: 40px;}
.red {background-color: #e24647;}
.pink {background-color: #dfa5ff;}
.blue {background-color: #8fbfee;}
.green {background-color: #a5ea7b;}
.gray {background-color: gray;  pointer-events: none;}
.check {
  background-image: url("${pageContext.request.contextPath}/assets/images/체크버튼.PNG"); 
  background-size: cover; 
  background-position: center center; 
}
#selFlashDateAll, #selFlashTime {font-size: 15px;}
#ulLegend, #ulLegend2 {font-size: 14px;	color: #fff;margin: auto; border: solid 1px #ec7d2c;}
#screen{width: 690px;height: 50px;}
#clearButton img{width: 240px; height: 37px; margin-left: 10px;}
.btn{height:29px;}
</style>
</head>
<body>
	<div id="header" class="header">
		<h1>
			<img src="${pageContext.request.contextPath}/assets/images/로고2.PNG"
				alt="YES24.com">
		</h1>
		<ul class="gnb">
			<li class="m01"><span>관람일/회차</span></li>
			<li class="m02 on"><span>좌석선택</span></li>
			<li class="m03"><span>결제방법</span></li>
		</ul>
	</div>
	<section>
		<div class="f_header">
			<ul>
				<li><em><img class="img"
						src="http://tkfile.yes24.com/img/perfsale/h3_tit_seat01.gif"
						alt="관람일변경"></em> <span> 
						<select id="selFlashDateAll" style="width: 200px;">
							<option>날짜선택</option>
							<c:forEach items="${showingList}" var="showing">			
							<option <c:out value="${showing.showingDate eq date ? 'selected':'' }"/>>${showing.showingDate}</option>
							</c:forEach>
					</select>
				</span></li>
				<li><em><img class="img"
						src="http://tkfile.yes24.com/img/perfsale/h3_tit_seat02.gif"
						alt="회차변경"></em> <span> <select id="selFlashTime"
						style="width: 200px;">							
					</select>
				</span></li>
			</ul>
		</div>
		<div id="ContentsArea" class="container" style="display: block;">
			<!-- 제 1 단계 : 관람일/회차 -->
			<div id="step01"></div>
			<div id=cover>
				<div class="admRow">
					<img id="screen" src="${pageContext.request.contextPath}/assets/images/screen.png">
					<span class="admSpan"> <span id="container"></span>
					</span>
				</div>
			</div>
			<!-- //제 1 단계 : 관람일/회차 -->
		</div>
		<div id="formdiv" style="display: none;">
			<form id="insertform" action="${pageContext.request.contextPath}/order/orderForm3" method="POST">
			<input type="hidden" id="inputShowingSq" name="showingSq" value="">
			<input type="hidden" id="showingSq" name="showSq" value="${show.showSq}">
			<div id="insertformDiv">
			
			</div>
			</form>
		</div>
		<div class="result">
			<div class="seatinfo">
				<div id="perfboard" class="title">
					<p>
						<img
							src="${pageContext.request.contextPath}/upload/${show.subImage}"
							width="79" height="98" alt="">
					</p>
					<span id="ptitle" class="tit"><a title="${show.showName}">${show.showName}</a></span><span
						class="date">${show.startDate} ~ ${show.endDate}</span><span
						id="ptheatername" class="date"><a
						title="${show.concertHallName}">${show.concertHallName}</a></span><input
						id="hiddenGenreId" type="hidden" value="15457"><input
						id="hiddenDisplayRemainSeat" type="hidden" value="0">
				</div>
				<div class="minimap_m">
					<br>
					<h2>&nbsp;좌석등급/가격</h2>
					<ul id="ulLegend" class="ulLegend">
					</ul>
					<!--  //좌석 등급/가격 -->
					<!--  선택좌석 -->
					<br>
					<h2>&nbsp;선택좌석</h2>
					<ul id="ulLegend2" class="ulLegend">
					</ul>
					<!--  //선택좌석 -->
					<div class="btn"></div>
					<div id="brup">
						<p id="br">
							<a id="prevButton" href="#none"><img
								src="http://tkfile.yes24.com/images/ticket_new/btn_pre.gif"
								alt="이전화면"></a> <a id="reset" href="#none"><img
								src="http://tkfile.yes24.com/images/ticket_new/btn_refresh.gif"
								alt="좌석선택다시"></a>
						</p>

						<p>
							<a id="clearButton" href="#none"><img
								src="http://tkfile.yes24.com/images/ticket_new/btn_booking.gif"
								alt="좌석선택완료" class="booking"></a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>

<script>
$(document).ready(function() {
	var showSq = '${showingList[0].showSq}';	
	var selFlashTime = $("#selFlashTime");		
	var selectionDate = $("#selFlashDateAll").val();
	
	//넘어온 날짜로 회차가져오기
	dateajax(selectionDate);
	
	
	// 날짜 선택
	$("#selFlashDateAll").on("change",function(){
		var date = $(this).val();
		selFlashTime.empty();
		// 좌석 지우기
		$("#container").empty();
		// 태그 비우기		
		empty();
	
		dateajax(date);
		
	});
	
	// 회차 선택
	$("#selFlashTime").on("change",function(){
		var showingSq = $(this).val();
		console.log(showingSq);
		showingajax(showingSq);	
		
	});
	// 좌석 선택
	$("#container").on("click", "button", function() {
	  var seat = $(this).val();
	  var insertform = $("#insertformDiv");
	  var $seat = $("#" + seat);
	  
	  if ($seat.hasClass('check')) {
	    $seat.removeClass('check');		
	    
	    var seatClass = $seat.data("seatclass");
	    var seatNo = $seat.data("seatno");
	    var seatText = '좌석번호 : ' + seatClass + '석  ' + seatNo;

	    $("#ulLegend2").find('div:contains("' + seatText + '")').remove();
	    
	    // 해당 좌석 데이터를 가진 input 요소 삭제
	    insertform.find('input[data-seat="' + seat + '"]').remove();
	  } else {
	    $seat.addClass('check');   
	    
	    var seatClass = $seat.data("seatclass");
	    var seatNo = $seat.data("seatno");
	    var addSeat = '<div>좌석번호 : ' + seatClass + '석  ' + seatNo + '</div>';

	    $("#ulLegend2").append(addSeat);

	    // form에 hidden으로 추가
	    var inputseatClass = '<input type="hidden" name="seatClass" value="' + seatClass + '" data-seat="' + seat + '">';
	    var inputseatNo = '<input type="hidden" name="seatNo" value="' + seatNo + '" data-seat="' + seat + '">';
	    var price = $("#" + seatClass + "-2").data("price");
	    
	    console.log(seatClass);
	    console.log(price);
	    var inputseatPrice = '<input type="hidden" name="seatPrice" value="' + price + '" data-seat="' + seat + '">';

	    insertform.append(inputseatClass);
	    insertform.append(inputseatNo);
	    insertform.append(inputseatPrice);
	  }
	});
	
	//이전단계
	$("#prevButton").on("click",function(e) {
		e.preventDefault();
		console.log("이전");

		var url = "${pageContext.request.contextPath}/order/orderForm/"+ showSq;

		// 페이지 이동
		location.href = url;

		// 추가 로직 작성
	});
	
	// 좌석 리셋
	$("#reset").on("click", function() {
	  console.log("리셋");
	  $("#container button").removeClass("check");
	  $("#ulLegend2").empty();
	  $("#insertformDiv").empty();
	});
	

	//좌석선택완료 결제로
	$("#clearButton").on("click", function(e) {
	  e.preventDefault();
	  console.log("결제");
	
	  // 좌석 선택 여부 확인
	  if ($("#ulLegend2").children().length > 0) {
	    // 좌석 선택이 있을 경우 폼 제출
	    insertform.submit();
	  } else {
	    // 좌석 선택이 없을 경우 알림 출력
	    alert("좌석을 선택해주세요.");
	  }
	});
		
	
	// 날짜 선택시 ajax
	function dateajax(date){
		selFlashTime.empty();
		// 태그들 비우기
		empty();
		
		
		ShowingVO = { showingDate:date,	showSq: showSq }
	
		 $.ajax({
			    url: "${pageContext.request.contextPath}/showing/getShowingList",
			    type: "post",
			    //contentType: "application/json",
			    data: ShowingVO,
			    
			    dataType: "json",
			    success: function(result) {		          	     
			         
			         var item0 = '<option selected="" value="0">회차 선택</option>';
			         selFlashTime.append(item0);
			    	 for (let index in result.data) {
					        if (result.data.hasOwnProperty(index)) {
					           	var i = parseInt(index) + 1;
					            var item = '<option value='+result.data[index].showingSq+'>';
					            item += i+' 회차 : '+result.data[index].startTime;
					            item += '</option>';			            
					            	
					            selFlashTime.append(item);
					        }
					    }			    	
			    				    	
			  },
			    error: function(XHR, status, error) {
			      console.error(status + " : " + error);
			  }
		  });	
	};
	
	// 회차 선택시 ajax
	function showingajax(showingSq){
		var ulLegend = $("#ulLegend");
		// 태그들 비우기
		empty();
		
		var ShowingVO = {showingSq : showingSq};
		// form input태그
		var inputShowingSq = $("#inputShowingSq");
		inputShowingSq.val(showingSq);
		// 잔여좌석 가지고오기
		$.ajax({
		    url: "${pageContext.request.contextPath}/showing/remainingSeats",
		    type: "post",
		    //contentType: "application/json",
		    data: ShowingVO,
		    
		    dataType: "json",
		    success: function(result) {		          	     
		               
			   
			    for (let index in result.data) {
			        if (result.data.hasOwnProperty(index)) {
			            //금액 포맷
			        	var seatPriceFormatted = new Intl.NumberFormat('ko-KR').format(result.data[index].seatPrice);
	
			            var item = '<li id="'+result.data[index].seatClass;
		           			item +='-2" data-price="'+result.data[index].seatPrice;
		           			item +='"style="margin-bottom: 5px;">' + result.data[index].seatClass +'석'			            
			            	item += '&nbsp;&nbsp;';
			            	item += seatPriceFormatted  +'원';
			            	item += '&nbsp;&nbsp;';
			            	item += '<span style="color: orange"> 잔여 : ('+result.data[index].seatEa +'석)</span>';
			            	item +='</li>';
			            	ulLegend.append(item);
			        }
			    }
			     // 좌석그리기 ajax 호출
			   	 getShowSeatList(showingSq);			  
		    },
		    error: function(XHR, status, error) {
		      console.error(status + " : " + error);
		    }
	 	});
	};
	
	// 좌석그리기 ajax
	function getShowSeatList(showingSq) {
		
		ShowingVO={ showSq : showSq, showingSq : showingSq}
		  $.ajax({
		    url: "${pageContext.request.contextPath}/showing/getShowSeatList",
		    type: "post",
		    //contentType: "application/json",
		    data: ShowingVO,
		    dataType: "json",
		    success: function(result) {
		      console.log(result);
		      // 공연의 좌석 리스트
		      var seatClassList = result.data.seatClassList;
		      // 예매된 좌석 리스트
		      var showingSeatList = result.data.showingSeatList;
		      // 공연장 가로좌석크기		      
		      var width = parseInt('${concertHall.concertHallWidth}');
		      // 공연장 세로 좌석 크기
		      var height = parseInt('${concertHall.concertHallHeight}');
		      var container = $('#container');
		      container.empty();
		      container.css({
		        'grid-template-columns': 'repeat(' + width + ', 23px)',
		        'display': 'grid',
		        'width': width * 23 + 'px'
		      });
		      var index = 0;
		      var seatClassSq; // 좌석클래스 시퀀스
		      var seatClass; // 좌석클래스 명
		      var seatNo; // 좌석 번호
		      const set = new Set(); // 중복제거를 위한 셋 선언
		      for (var i = 0; i < width; i++) {
		        for (var j = 0; j < height; j++) {
		          seatClassSq = seatClassList[index].seatClassSq;
		          seatClass = seatClassList[index].seatClass;
		          seatNo = seatClassList[index].seatNo;		      
		          index++; // 좌석 갯수 만큼 인덱스 증가
		          set.add(seatClass);
	
		          var item = $('<button type="button" data-seatclasssq="' + seatClassSq + '" data-seatno="' + seatNo + '" data-seatclass="'+seatClass+'">')
		            .attr('id', seatNo)
		            .addClass('item')
		            .addClass(seatClass)
		            .val(seatNo);
		            //.text(seatNo);
	
		          container.append(item);
		        }
		      }
		      // 클래스 명 배열에 저장
		      var cssarr = ['red', 'pink', 'blue', 'green'];
		      var index2 = 0; // 클래스배열에서 사용할 인덱스
		      for (let index of set) {
		        $("." + index).addClass(cssarr[index2]);
		        index2++;
		      }
		      
		      for (let seat of showingSeatList) {
		    	  var showingSeatNo = seat.showingSeatNo;
		    	  $("#"+showingSeatNo).addClass('gray');
		    	}
		      
		      
		    },
		    error: function(XHR, status, error) {
		      console.error(status + " : " + error);
		    }
	  });
	}
	
	function empty(){
		// 좌석등급/가격지우기		
		$("#ulLegend").empty();
		// 선택좌석 지우기
		$("#ulLegend2").empty();
		// 폼비우기
		$("#insertformDiv").empty();
	};
	
});	
</script>

</html>