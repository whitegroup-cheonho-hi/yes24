<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>.
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>transferBoard</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/reset.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/sub.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/transferBoard.css" type="text/css">
<link rel="stylesheet" type="text/css" href="https://image.yes24.com/sysimage/yesUI/yesUI.css?v=20230403" media="all">
<!-- 슬릭슬라이더 css -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
<!-- 스와이퍼 css -->
<!-- <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" type="text/css"> -->

<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet">

<!-- 제이쿼리 최신버전 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 스와이퍼 js -->
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<!-- 슬릭슬라이더 js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>

<style>
</style>
</head>
<body>

	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- //헤더 -->

	<div class="wrapper"></div>
	
	<!-- 베스트셀러 -->
		<section id="best_seller">
			<h2 class="">양도 게시판</h2>
		
			<div id="best_seller_div">					
				 <c:forEach items="${imminentShowing}" var="imminentShowing"> 
				    <div class="cont">
				        
				        <a href="${pageContext.request.contextPath}/transferTicket/transferTicketDetail/${imminentShowing.transferBoardSq}">
				            
				            <img src="${pageContext.request.contextPath}/upload/${imminentShowing.subImage}" alt="">
				        </a>
				    </div>
				</c:forEach>
			</div>
		</section>
		<!-- /베스트셀러 -->

	<section>
		<div id="ySContent">
			<div id="show"></div>
			<!-- ==================== 정보 입력 영역 시작 ==================== -->
			<div class="">
				<div class="listItem">
				
					<section>						
						<ul id="nav2">
							<li id="l1" ><a id="a1"
								href="#none">최신순</a></li>
							<li id="l2" ><a id="a2" href="#none">금액 낮은순</a></li>
							<li id="l3"><a id="a3" href="#none">공연 임박순</a></li>
							<li></li>
							<li></li>
							<li></li>
							<li></li>
							<li></li>
							<li id="l0" ><button type="button" id="alarm">알람신청</button></li>
						</ul>						
						<ul>
							<c:forEach items="${transferBoardList}" var="transferBoard">
								<c:choose>
								    <c:when test="${transferBoard.transferStat == 'Y'}">
								        <li>
								            <a href="${pageContext.request.contextPath}/transferTicket/transferTicketDetail/${transferBoard.transferBoardSq}">
								                <img src="${pageContext.request.contextPath}/upload/${transferBoard.subImage}">
								                <span class="gray">${transferBoard.showName}&nbsp;&nbsp;${transferBoard.ticketSeat}석</span>
								                <span class="orange price jb">
								                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${transferBoard.hopePrice}" />원
								                </span>
								            </a>
								        </li>
								    </c:when>
								    <c:otherwise>
								        <li>
								            <a href="#none">
								                <img class="buyTransferTicket" src="${pageContext.request.contextPath}/upload/${transferBoard.subImage}">
								                <span class="gray">${transferBoard.showName}&nbsp;&nbsp;${transferBoard.ticketSeat}석</span>
								                <span ><strong class="soldout">판매완료</strong></span>
								            </a>
								        </li>
								    </c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
					</section>
				</div>
			</div>

			<!-- ==================== 정보 입력 영역 끝 ==================== -->
			<!-- 페이징 -->
			<c:if test="${empty keyword}">
				<ul class="paging pageInfo">
					<c:if test="${pageMaker.prev}">
						<li class="pageInfo_btn previous"><a
							href="${pageMaker.startPage - 1}">◀</a></li>
					</c:if>
					<!-- 각 번호 페이지 버튼 -->
					<c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}">
						<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }">
							<a class="anum" href="${num}">${num}</a>
						</li>
					</c:forEach>
					<!-- 다음페이지 버튼 -->
					<c:if test="${pageMaker.next}">
						<li class="pageInfo_btn next"><a
							href="${pageMaker.endPage + 1}">▶</a></li>
					</c:if>
				</ul>
			</c:if>
			<form id="moveForm"
				action="${pageContext.request.contextPath}/transferBoardForm/?#nav2" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" id="keyword" name="keyword" value="${pageMaker.cri.keyword}">
				<input type="hidden" id="keyword2" name="keyword2" value="${pageMaker.cri.keyword2}">
			</form>
		</div>
	</section>


	<!-- Footer -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- //Footer -->
	
		<!--키워드 검색 폼-->
		<form id="keywordForm" style="display: none;"
			action="${pageContext.request.contextPath}/transferBoardForm"
			method="get">
			<input type="text" id="searchKeyword2" name="keyword2" value="${pageMaker.cri.keyword2}" />						
		</form>
	
	<!-- 양도 등록 -->
   <section id="inquiry_popup" class="inquiry_popup"
      style="display: none;">
      <a href="#none" class="inquiry_close"><img
         src="images/ver02/close.png" alt=""></a>
      <div class="inquiry_write">
         <h3>알림 신청</h3>
         <form id="moveForm1" action="${pageContext.request.contextPath}/alarm/insertAlarm" method="POST" >
            <table>
               <colgroup>
                  <col width="20%">
                  <col width="80%">
               </colgroup>
               <tr>
                  <th><label for="">제목</label></th>
                  <td>
                     <span><input id="showName" name="showName" type="text" autocomplete="off">
                     <input id="showSq" name="showSq" type="hidden" value="0" ></span>                     
                     <span><input type="checkbox" id="noneShowName"> <label for="noneShowName">조건없음</label></span>
                  </td>                 
               </tr>
               <tr>
                  <th><label for="">날짜</label></th>
                  <td><input id="startDate" name="startDate" type="date" required="required">&nbsp;&nbsp;~&nbsp;&nbsp;<input id="endDate" name="endDate" type="date" required="required"></td>
               </tr>
               <tr>
                  <th><label>좌석</label></th>
                  <td>
                     <input type="checkbox" id="seatClass1" name="seatClass" value="ALL"> <label for="seatClass1"></label>
                     <input type="checkbox" id="seatClass2" name="seatClass" value="ALL"> <label for="seatClass2"></label>
                     <input type="checkbox" id="seatClass3" name="seatClass" value="ALL"> <label for="seatClass3"></label>
                     <input type="checkbox" id="seatClass4" name="seatClass" value="ALL"> <label for="seatClass4"></label>
                     <input type="checkbox" id="noneSeatClass" > <label for="noneSeatClass">조건없음</label>
                  </td>
               </tr>

               <tr>
				    <th><label for="price">금액</label></th>
				    <td> 
				        <span><input id="price" name="price" type="number" min="20000" step="1000"></span>                     
				        <span><input type="checkbox" id="nonePrice"> <label for="nonePrice">조건없음</label></span>               
				    </td>
				</tr>
            </table>
            
            <div class="btn_wrap">
               <a id="insertAlarm" href="#none" class="order_btn">알림신청</a> <a
                  href="#none" class="shopping_btn">취소</a>
            </div>
         </form>
          <div id="searchShowName" style="display: none;"> </div>
      </div>
   </section>

</body>

<script>
	$(document).on('ready', function(e) {
		
		var authUser = '${sessionScope.authUser}'+'';
		
		// 판매티켓 알림
		$(".buyTransferTicket").on("click",function(){
			e.preventDefault();
			alert("이미 판매된 티켓입니다");
			
		});
		
		// 포커스
		var category = '${category}';
		$("#l5").addClass("on");
		
		// 알림신청
		$("#insertAlarm").on("click", function() {
		    var price = $("#price").val();
		    var nonePriceChecked = $("#nonePrice").prop("checked");
		    var startDate = $("#startDate").val();
		    var endDate = $("#endDate").val();
		    
		    if ((nonePriceChecked || price !== "") && startDate !== "" && endDate !== "") {
		        $("#moveForm1").submit();
		    } else {
		        alert("금액을 입력하거나 '조건없음'을 체크하고 시작일과 종료일을 입력해주세요.");
		    }
		});
		
		// 제목 조건없음 눌렀을때
		$("#noneShowName").on("change", function() {
		    if ($(this).prop("checked")) {
		        $("#showName").val("").prop("readonly", true);
		    } else {
		        $("#showName").prop("readonly", false);
		    }
		});
		
		// 좌석 조건 없음 눌렀을때ㅑ
		$("#noneSeatClass").on("change", function() {
		    var isChecked = $(this).prop("checked");
		    $("#seatClass1, #seatClass2, #seatClass3, #seatClass4").prop("checked", isChecked);
		});
		
		// 제목 조건없음 눌렀을때
		$("#nonePrice").on("change", function() {
		    if ($(this).prop("checked")) {
		        $("#price").val("0").prop("readonly", true);
		        
		    } else {
		        $("#price").val("").prop("readonly", false);
		    }
		});
		
		// 알림신청 제목검색
		// 타이머 변수 초기화
		var debounceTimer;
		
		$("#showName").on("keyup", function() {
		    var showName = $(this).val();
		    console.log(showName);
		
		    // 이전에 등록된 타이머가 있다면 취소
		    clearTimeout(debounceTimer);
		
		    if (showName.length >= 2) {
		        debounceTimer = setTimeout(function() {
		            $.ajax({
		                url: "${pageContext.request.contextPath}/alarm/getShowName",
		                type: "post",
		                data: { showName: showName },
		                dataType: "json",
		                success: function(result) {
		                	
		                    if (result.data != null) {
		                        console.log(result.data);
		                        var searchShowName = $("#searchShowName");
		                        searchShowName.empty(); // 이전 검색 결과 제거
		                    	
		                        // 검색 옵션 반복 그리기
		                        for (var i = 0; i < result.data.length; i++) {
		                            var item = result.data[i];
		                            var showName = '<span class="showName" data-showsq ="'+item.showSq +'">' + item.showName + '</span>';
		                            searchShowName.append(showName);
		                        }
								
		                        // 검색된 제목 눌렀을때 값 넣어주기
		                        $(".showName").on("click", function() {
		                            let showName = $(this).text();
		                            let showSq = $(this).data("showsq");
		                            $("#showName").val(showName);
		                            $("#showSq").val(showSq);
		                            
		                             $.ajax({
		        		                url: "${pageContext.request.contextPath}/alarm/getShowSeatClass",
		        		                type: "post",
		        		                data: { showSq: showSq },
		        		                dataType: "json",
		        		                success: function(result) {
		        		                	
		        		                	console.log(result.data);
		        		                	
		        		                	for (var i = 0; i < result.data.length; i++) {
		        		                	    $("#seatClass" + (i + 1)).val(result.data[i].seatClass);
		        		                	    $("label[for='seatClass"+(i + 1)+"']").text(result.data[i].seatClass);
		        		                	   
		        		                	}
		        		                	
		        		                			                            
		        		                },
		        		                error: function(XHR, status, error) {
		        		                    console.error(status + " : " + error);
		        		                },
		        		            }); 
		                       
		
		                            searchShowName.hide();
		                        });
		
		                        searchShowName.show();
		                		
		                    }
		                },
		                error: function(XHR, status, error) {
		                    console.error(status + " : " + error);
		                },
		            });
		        }, 100); // 500ms의 디바운싱 시간 설정 (조절 가능)
		    } else {
		        // 검색어가 없는 경우 검색 결과 제거
		        $("#searchShowName").empty();
		    }
		});
				
				
		// 검색기능
		$("#searchButton").on("click",function(e){
				e.preventDefault();
				console.log("검색버튼");
				var keyword = $("#searchKeyword").val();
				console.log(keyword);
				
				if(keyword != ""){
				
					$("#searchKeyword2").val(keyword);
					var k = $("#searchKeyword").val();
					console.log(k);
					
					$("#keywordForm").submit();
				}else{
					alert("검색어를 입력해주세요");
				}
		});

		//  알림신청폼
		$("#alarm").on("click", function() {
			// 로그인 안되면 로그인 페이지로
			if(authUser == ''){
				alert("로그인이 필요합니다.");
				window.location.href = '${pageContext.request.contextPath}/user/loginForm';
				
			}else{		
				$("#inquiry_popup").show();
			}
			
		});
		
		// 알림신청 취소버튼
		$(".btn_wrap .shopping_btn").on("click", function() {
			console.log("취소");
			
			// 초기값 설정 및 입력 필드 초기화
			$("#showName").val("").prop("readonly", false);
			$("#startDate, #endDate").val("");
			$("#seatClass1, #seatClass2, #seatClass3, #seatClass4, #noneShowName, #noneSeatClass, #nonePrice").prop("checked", false);
			$("#price").val("").prop("readonly", false);
			$("#showSq").val("");

			// 요소 숨기기
			$("#searchShowName, #inquiry_popup").hide();
			
			
		});	
		
		//페이징 버튼 클릭
		$(".pageInfo a").on("click", function(e) {
			e.preventDefault();
			var pageNum = $(this).attr("href");
			$("#moveForm input[name='pageNum']").val(pageNum);
			$("#moveForm").submit();
		});
		
		 // 클릭 이벤트 처리 함수	
		 function handleSortClick(keyword) {
			    $("#keyword").val(keyword);
			    $("#moveForm").submit();
			  }

		$("#a1").on("click", function(e) {
	      e.preventDefault();
	      handleSortClick("1"); // 최신순
	    });
	
	    $("#a2").on("click", function(e) {
	      e.preventDefault();
	      handleSortClick("2"); // 금액낮은순
	    });
	
	    $("#a3").on("click", function(e) {
	      e.preventDefault();
	      handleSortClick("3"); // 공연임박순
	    });
		
		//on 이벤트
	 	let keyword = $("#keyword").val()+'';
	 	$("#nav2 .nav2-link").removeClass("on");	 
		if (keyword === '1') {
		  $("#nav2 #l1").addClass("on");
		} else if (keyword === '2') {
		  $("#nav2 #l2").addClass("on");
		} else if (keyword === '3') {
		  $("#nav2 #l3").addClass("on");
		}
				

		 //양도 임박 롤링
	    $('#best_seller_div').slick({
	      slide: 'div',        //슬라이드 되어야 할 태그 ex) div, li 
	      infinite : true,     //무한 반복 옵션     
	      slidesToShow : 4,        // 한 화면에 보여질 컨텐츠 개수
	      slidesToScroll : 1,        //스크롤 한번에 움직일 컨텐츠 개수
	      speed : 100,     // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
	      arrows : true,         // 옆으로 이동하는 화살표 표시 여부
	      dots : false,         // 스크롤바 아래 점으로 페이지네이션 여부
	      autoplay : true,            // 자동 스크롤 사용 여부
	      autoplaySpeed : 3000,         // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
	      pauseOnHover : true,        // 슬라이드 이동    시 마우스 호버하면 슬라이더 멈추게 설정
	      vertical : false,        // 세로 방향 슬라이드 옵션
	      prevArrow : "<button type='button' class='slick-prev'>Previous</button>",        // 이전 화살표 모양 설정
	      nextArrow : "<button type='button' class='slick-next'>Next</button>",        // 다음 화살표 모양 설정
	      dotsClass : "slick-dots",     //아래 나오는 페이지네이션(점) css class 지정
	      draggable : true,     //드래그 가능 여부 
	      
	      responsive: [ // 반응형 웹 구현 옵션
	          {  
	              breakpoint: 960, //화면 사이즈 960px
	              settings: {
	                  //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
	                  slidesToShow:3 
	              } 
	          },
	          { 
	              breakpoint: 768, //화면 사이즈 768px
	              settings: {    
	                  //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
	                  slidesToShow:2 
	              } 
	          }
	      ]
	    
	    });
});
</script>

</html>