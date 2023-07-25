<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>.
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>transferBoard</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/reset.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/sub.css"
	type="text/css">
<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap"
	rel="stylesheet">
<!-- 제이쿼리 최신버전 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<!-- 스와이퍼 js -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<!-- 슬릭슬라이더 js -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper@8/swiper-bundle.min.css" type="text/css">
<!-- 스와이퍼 css -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
<!-- 슬릭슬라이더 css -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
<!-- 슬릭슬라이더 css -->

<style>
#ySContent{ margin: 0px auto; }
.listItem { width: 1200px; display: grid; grid-template-columns: repeat(5, 200px); justify-content: space-around; justify-items: center; }
.listItem .listItemdiv { display: inline-block; width: 200px; height: 300px; margin: 0 15px; vertical-align: top; }
.listItem img {width: 100%;}
.listItemTxt { display: flex; align-items: center; flex-wrap: wrap; justify-content: center;}
.listItemTxt button { margin: auto; width: 70px; height: 35px; font-size: 14px; font-weight: bold; 
	background-color: #196ab3; color: white; border: none; border-radius: 5px;}
.listItemTxt p { width: 200px; height: 40px; margin-bottom: 10px; }
section{width: 1200px; margin: 0 auto;     text-align: center;}
section ul {  display: flex;  justify-content: flex-start; flex-direction: row; flex-wrap: wrap; margin: 0 -15px; }
section ul li{ width: calc(25% - 92px); margin: 0 15px; margin-bottom: 70px;}
section ul li a img{width: 100%;}
section ul li a span{display: block; text-align: center; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;}
section ul li a span.tit{font-size: 14px; margin-top:15px;}
section ul li a span.price{font-weight: 600; font-size: 17px; margin-top: 2px;}

.paging{width: 1000px; margin: 20px auto; display: flex; justify-content: center;}
.paging li{margin: 0 10px; width: 14px;}
.paging li a{font-size: 18px; height: 100%;}
.paging li.on a{color: #4982cf;}
.paging li.first{width: 14px; margin-right: 0; background: url('https://flyairseoul.com/CW/public/images/icons/common-s57efedab2d.png') no-repeat; background-position: 0 -6983px;}
.paging li.pre{width: 9px; background: url('https://flyairseoul.com/CW/public/images/icons/common-s57efedab2d.png') no-repeat; background-position: 0 -7151px;}
.paging li.next{width: 9px; background: url('https://flyairseoul.com/CW/public/images/icons/common-s57efedab2d.png') no-repeat; background-position: 0 -7095px;}
.paging li.last{width: 14px;margin-left: 0; background: url('https://flyairseoul.com/CW/public/images/icons/common-s57efedab2d.png') no-repeat; background-position: 0 -7039px;}
.paging-area{width:1100px; margin: 0 auto;margin-left: 16%;}
.active .anum {color: #4982cf; font-weight: bold; font-size: 19px;}

/* 베스트셀러 */
#best_seller .best_kv{width: 100%; height: 280px; display: flex; justify-content: center; align-items: center; flex-direction:column;}
#best_seller .best_kv h3{font-size: 30px; margin-bottom: 20px; font-weight: 500;}
#best_seller .best_kv h3 span{color:#4982cf}
#best_seller .best_kv p{text-align: center; line-height: 1.3; font-size: 20px; font-weight: 400;}
#best_seller #best_seller_div{margin: 0 -10px; margin-top: 20px;}
#best_seller #best_seller_div div.slick-slide{margin: 0 10px;}
#best_seller #best_seller_div div.cont img{width: 100%;}
#best_seller #best_seller_div div.cont .tit{display: block; font-size: 14px; margin-top: 15px; text-align: center; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;}
#best_seller #best_seller_div div.cont .price{display: block; font-size: 17px; font-weight: 600;  margin-top: 2px; text-align: center;}
.slick-slide{height: 30%;}
section > h2{margin-top: 80px;    margin-bottom: 75px;}
#l0{width: 1230px; text-align: right;}
#alarm{cursor: pointer; width: 160px; height: 35px; background: #f43142; color: #fff; font-size: 22px; border: none;}
#nav2 li{width: 98px;    font-size: 20px;}
#nav2 #l4{width: 300px;}
#nav2 #l4 #searchKeyword{margin-left: 58px; outline:none; width: 190px; border: none; border-bottom: 2px solid #000;  color: #333;}
#Search{background-color: #196ab3; color: #fff; width: 46px; height: 27px;  border: none; font-size: 17px;}

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
						<ul >
							<li id="l0" ><button type="button" id="alarm">알람신청</button></li>					
						</ul>	
						<ul id="nav2">
							<li id="l1" ><a id="a1"
								href="#none">최신순</a></li>
							<li id="l2" ><a id="a2" href="#none">금액 낮은순</a></li>
							<li id="l3"><a id="a3" href="#none">공연 임박순</a></li>		
							<li></li>
							<li></li>
							<li></li>
							<li></li>
							<li id="l4">
								<!--키워드 검색 폼-->
								<form
									action="${pageContext.request.contextPath}/transferBoardForm"
									method="get">
									<table>
										<tr>
											<td><input type="text" id="searchKeyword" name="keyword2"  
												value="${pageMaker.cri.keyword2}" />
												<button type="submit" class="btn btn-secondary" id="Search">검색</button>
											</td>											
										</tr>
									</table>
								</form>							
							</li>
							
						</ul>						
						<ul>
							<c:forEach items="${transferBoardList}" var="transferBoard">
								<li><span>${transferBoard.transferBoardSq}</span> <a
									href="${pageContext.request.contextPath}/transferTicket/transferTicketDetail/${transferBoard.transferBoardSq}"> <img
										src="${pageContext.request.contextPath}/upload/${transferBoard.subImage}">
										<span>${transferBoard.showName}&nbsp;&nbsp;${transferBoard.ticketSeat}석</span>
										<span class="price jb"> <fmt:formatNumber type="number"
												maxFractionDigits="3" value="${transferBoard.hopePrice}" />원
									</span>
								</a></li>
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
				action="${pageContext.request.contextPath}/transferBoardForm" method="get">
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

</body>

<script>
	$(document).on('ready', function() {
		//페이징 버튼 클릭
	
		$(".pageInfo a").on("click", function(e) {
			e.preventDefault();
			var pageNum = $(this).attr("href");
			$("#moveForm input[name='pageNum']").val(pageNum);
			$("#moveForm").submit();
		});
				
		// 최신순
		 $("#a1").on("click",function(e){
			e.preventDefault();			
			$("#keyword").val("1");
			$("#moveForm").submit();
		 });
		// 금액낮은순
		 $("#a2").on("click",function(e){
			e.preventDefault();			
			$("#keyword").val("2");
			$("#moveForm").submit();
		 });  
		// 공연임박순
		 $("#a3").on("click",function(e){
			e.preventDefault();			
			$("#keyword").val("3");
			$("#moveForm").submit();
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
				

		 //베스트셀러 롤링
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