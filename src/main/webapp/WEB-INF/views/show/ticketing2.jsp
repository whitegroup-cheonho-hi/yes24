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
.f_header {margin-top: 70px;margin-left: 10px;}
#br {margin-bottom: 5px;}
.minimap_m>* {padding: 5px;}
.ulLegend{height: 150px;border: solid 1px #ddd; width: 239px;}
.gnb li{float:left;  background: url("${pageContext.request.contextPath}/assets/images/예매순서.png"); height:52px; width:120px;}
.admRow{margin-top: 10px; height: 530px; }
.admSpan{display: flex; justify-content: center; box-sizing: border-box; border: solid 1px #ebebeb; 
background-color: #fff;padding: 9px 14px 11px; line-height: 28px; display: flex; text-align: center;}
#container{ border-top: solid 1px rgb(0, 0, 0); border-left: solid 1px rgb(0, 0, 0);align-items: center; display: none; }
.item{ width: 30px; height: 30px; background-color:#efdfdf; border-right: solid 1px rgb(0, 0, 0); 
border-bottom: solid 1px rgb(0, 0, 0); text-align: center; font-size: 17px; box-sizing: border-box; }
#cover{margin-top: 46px;}
.check{background-color:red;}
</style>
</head>
<body>
	<div id="header" class="header">
		<h1>
			<img src="${pageContext.request.contextPath}/assets/images/로고.png"
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
							<option selected="">날짜선택</option>
							<c:forEach items="${showingList}" var="showing">
								<option value="${showing.showingDate}">${showing.showingDate}</option>
							</c:forEach>
					</select>
				</span></li>
				<li><em><img class="img"
						src="http://tkfile.yes24.com/img/perfsale/h3_tit_seat02.gif"
						alt="회차변경"></em> <span> <select id="selFlashTime"	style="width: 200px;">
						<option selected="" value="0">회차 선택</option>						
						</select>
				</span></li>
			</ul>
		</div>
		<div id="ContentsArea" class="container" style="display: block;">
			<!-- 제 1 단계 : 관람일/회차 -->
			<div id="step01"></div>
			<div id=cover>
				<div class="admRow">
					<span class="admSpan">
						<span id="container"></span>
					</span>
				</div>
			</div>
			<!-- //제 1 단계 : 관람일/회차 -->
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
					<h4>좌석등급/가격</h4>
					<ul id="ulLegend" class="ulLegend">						
					</ul>
					<!--  //좌석 등급/가격 -->
					<!--  선택좌석 -->
					<br>
					<h4>선택좌석</h4>
					<ul id="ulLegend2" class="ulLegend">						
					</ul>
					<!--  //선택좌석 -->
					<div class="btn"></div>
					<div>
						<p id="br">
							<a id="prevButton" href="#none"><img
								src="http://tkfile.yes24.com/images/ticket_new/btn_pre.gif"
								alt="이전화면"></a> <a href="javascript:ChoiceReset();"><img
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
	// 날짜 선택
	$("#selFlashDateAll").on("change",function(){
		var selFlashTime = $("#selFlashTime");
		selFlashTime.empty();
		var date = $(this).val();
				
		ShowingVO = {
			showingDate:date,
			showSq: showSq
		}
		console.log(ShowingVO);
		
		 $.ajax({
			    url: "${pageContext.request.contextPath}/showing/getShowingList",
			    type: "post",
			    //contentType: "application/json",
			    data: ShowingVO,
			    
			    dataType: "json",
			    success: function(result) {		          	     
			         console.log(result);
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
		
	});
	
	// 회차 선택
	$("#selFlashTime").on("change",function(){
		var showingSq = $(this).val();
		console.log(showingSq);
		var ulLegend = $("#ulLegend");
		
		var ShowingVO = {showingSq : showingSq};
		// 잔여좌석 가지고오기
		$.ajax({
		    url: "${pageContext.request.contextPath}/showing/remainingSeats",
		    type: "post",
		    //contentType: "application/json",
		    data: ShowingVO,
		    
		    dataType: "json",
		    success: function(result) {		          	     
		               	  console.log(result);
			   
			    for (let index in result.data) {
			        if (result.data.hasOwnProperty(index)) {
			            //금액 포맷
			        	var seatPriceFormatted = new Intl.NumberFormat('ko-KR').format(result.data[index].seatPrice);

			            var item = '<li style="margin-bottom: 5px;">' + result.data[index].seatClass +'석'			            
			            	item += '&nbsp;&nbsp;';
			            	item += seatPriceFormatted  +'원';
			            	item += '&nbsp;&nbsp;';
			            	item += '<span style="color: orange"> 잔여 : ('+result.data[index].seatEa +'석)</span>';
			            	item +='</li>';
			            	ulLegend.append(item);
			        }
			    }
			    
			    $.ajax({
				    url: "${pageContext.request.contextPath}/showing/getShowSeatList",
				    type: "post",
				    //contentType: "application/json",
				    data: {showSq : showSq},
				    
				    dataType: "json",
				    success: function(result) {		          	     
				               	  console.log(result);
					  
				
				    },
				    error: function(XHR, status, error) {
				      console.error(status + " : " + error);
				    }
			 	});		
			    
			    
			    
			    
			    
			    
			    
			    
			    
			    
			    
			    
			    
			    
			    
			    
			    
			    
			    
			  /*   var width = parseInt('${concertHall.concertHallWidth}');
			    var height = parseInt('${concertHall.concertHallHeight}');
				var container = $('#container');			
				container.empty();
				container.css({
				  'grid-template-columns': 'repeat(' + width + ', 30px)',
				  'display': 'grid',
				  'width': width * 30 + 'px'
				});

				for (let i = 65; i < 65 + width; i++) {
				  for (let j = 1; j <= height; j++) {
					var seat = String.fromCharCode(i) + j;
				    var item = $('<button type="button">').attr('id',seat).addClass('item').val(seat).text(seat);
				    container.append(item);
				  
				  }
				} */
				
		    },
		    error: function(XHR, status, error) {
		      console.error(status + " : " + error);
		    }
	 	});		
	});
	
	// 좌석 선택
	$("#container").on("click", "button", function() {
	  var seat = $(this).val();
	  
	  $("#"+seat).addClass('check');
	  	  
	  
	  console.log(seat);
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

	//좌석선택완료 결제로
	$("#clearButton").on("click",function(e) {
		e.preventDefault();
		console.log("결제");

		// showSq 값을 가져와서 URL 생성
		var showSq = "${show.showSq}"; // 이 부분은 JavaScript 변수로 대체해야 합니다.
		var url = "${pageContext.request.contextPath}/order/orderForm3/"
				+ showSq;

		// 페이지 이동
		location.href = url;

		// 추가 로직 작성
	});
});	
</script>

</html>