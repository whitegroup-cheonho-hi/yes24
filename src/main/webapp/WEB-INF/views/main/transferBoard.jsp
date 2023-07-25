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

<style>
#ySContent{ margin: 120px auto; }
.listItem { width: 1200px; display: grid; grid-template-columns: repeat(5, 200px); justify-content: space-around; justify-items: center; }
.listItem .listItemdiv { display: inline-block; width: 200px; height: 300px; margin: 0 15px; vertical-align: top; }
.listItem img {width: 100%;}
.listItemTxt { display: flex; align-items: center; flex-wrap: wrap; justify-content: center;}
.listItemTxt button { margin: auto; width: 70px; height: 35px; font-size: 14px; font-weight: bold; 
	background-color: #196ab3; color: white; border: none; border-radius: 5px;}
.listItemTxt p { width: 200px; height: 40px; margin-bottom: 10px; }
section{width: 1200px; margin: 0 auto; padding-top: 120px;}
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
</style>
</head>
<body>

	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- //헤더 -->

	<div class="wrapper"></div>

	<section>
		<div id="ySContent">
			<div id="show"></div>
			<!-- ==================== 정보 입력 영역 시작 ==================== -->
			<div class="">
				<div class="listItem">
				
					<section>
						<ul id="nav2">
							<li id=l1 ><a id="a1"
								href="#none">최신순</a></li>
							<li id=l2 ><a id="a2" href="#none">금액낮은순</a></li>
							<li id=l3><a id="a3" href="#none">공연임박순</a></li>
							<li>
								<!--키워드 검색 폼-->
								<form
									action="${pageContext.request.contextPath}/transferBoardForm"
									method="get">
									<table>
										<tr>
											<td><input type="text" id="searchKeyword" name="keyword2"
												value="${pageMaker.cri.keyword2}" />
												<button type="submit" class="btn btn-secondary" id="Search">Search</button>
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
				
		
	});
</script>

</html>